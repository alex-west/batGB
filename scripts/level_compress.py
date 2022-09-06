# Script by Alex W
# Level compression tool for Bat GB

import argparse
from pathlib import Path
import glob

# Takes an array, outputs an array
def level_compress(level):
    packed = bytearray()
    level_count = 0
    cur = 0
    prev = 0
    
    for screen in range(0,0x14):
        for row in range(0,8):
            chunk = bytearray()
            prev = level[level_count]
            chunk.append(prev)
            level_count += 1
            rep = 0
            for b in range(0,7):
                cur = level[level_count]
                if(cur != prev):
                    rep |= 0x80 >> (b)
                    chunk.append(cur)
                level_count += 1
                prev = cur
            rep |= 1
            packed.append(rep)
            for byte in chunk:
                packed.append(byte)
    
    return packed
    
    
def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('-v', '--verbose', action="store_true", help='display compression stats')
    ap.add_argument('--out', dest='folderout')
    ap.add_argument('unpacked_files', nargs='*')

    args = ap.parse_args()

    if args.folderout == None:
        args.folderout = '.\\'

    for path in args.unpacked_files:
        for levelfile in glob.glob(path):
            f_in = open(levelfile, "rb")
            raw = f_in.read(-1)
            f_out = open(args.folderout+Path(levelfile).stem+".bin", 'wb')
            packed = level_compress(raw)
            f_out.write(packed)
            if args.verbose:
                print("Packed {} from {} to {}".format(levelfile, len(raw), len(packed)))
    
    
if __name__ == "__main__":
    main()