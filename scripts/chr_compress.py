# Script by Alex W
# Graphics compression tool for Bat GB

import argparse
from pathlib import Path
import glob

# Takes an array, outputs an array
def chr_compress(chr):
    packed = bytearray()
    chr_count = 0
    cur = 0
    prev = 0
    for part in range(0, len(chr)//8):
        rep = 0
        chunk = bytearray()
        
        for b in range(0,8):
            cur = chr[chr_count]
            if(cur != prev)|(b == 0):
                rep |= 0x80 >> b
                chunk.append(cur)
            chr_count += 1
            prev = cur
        packed.append(rep)
        for byte in chunk:
            packed.append(byte)
    
    packed.append(0x00)
#    print("Packed from {} to {}".format(len(chr), len(packed)))
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
        for chrfile in glob.glob(path):
            f_in = open(chrfile, "rb")
            f_out = open(args.folderout+Path(chrfile).stem+".bin", 'wb')
            raw = f_in.read(-1)
            packed = chr_compress(raw)
            f_out.write(packed)
            if args.verbose:
                print("Packed {} from {} to {}".format(chrfile, len(raw), len(packed)))
    
    
if __name__ == "__main__":
    main()