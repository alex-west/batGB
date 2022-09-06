# Script by Alex W
# Thanks to PJ for the lambda functions

# Tool for decompressing level data in batGB

gb2hex = lambda gb: gb >> 2 & ~0x3FFF | gb & 0x3FFF
hex2gb = lambda hex: hex << 2 & ~0xFFFF | hex & 0x3FFF | 0x4000
romRead = lambda n: sum([ord(rom.read(1)) << i*8 for i in range(n)])
readLongPointer = lambda: (romRead(1) << 16) | romRead(2)

# Decompress level

def get_source_addr(bank, level):
    rom.seek(bank*0x4000+level*4+2)
    return gb2hex( (bank<<16)|romRead(2) )

def decompress_chr(source):
    cursor = source
    level = bytearray()

    for screen in range(0,0x14):
        for row in range(0,8):
            rom.seek(cursor)
            rep = int.from_bytes(rom.read(1), 'little')
            cursor += 1
            
            for n in range(0,8):
                rom.seek(cursor)
                level.append(int.from_bytes(rom.read(1), 'little'))
                if(rep & 0x80):
                    cursor += 1
                rep = rep << 1    
    return [level, cursor]
    

def printStats(name, decomp_size, comp_size):
    ratio = decomp_size/comp_size
    print("| {} | {} | {} | {:.2%} |".format(name, decomp_size, comp_size, ratio))

level_bank = 7
num_levels = 0x0D

def extractLevels():
    for level in range(0,num_levels):
        source = get_source_addr(level_bank, level)
        unpacked = decompress_chr(source)
        name = "level_{:02X}_0x{:06X}".format(level, source)
        with open("../out/level/"+name+".bin", "wb") as f:
            f.write(unpacked[0])
        #if args.verbose:
        printStats(name, len(unpacked[0]),unpacked[1]-source)
    
metatile_offsets = [# Start,    End, 'Name'
                    [0x4034, 0x4334, 'gotham_city'],
                    [0x4A70, 0x4E30, 'factory'    ],
                    [0x7228, 0x72F8, 'vs_jack'    ],
                    [0x561C, 0x59DC, 'museum'     ],
                    [0x6216, 0x6266, 'batwing'    ],
                    [0x64BB, 0x687B, 'cathedral'  ],
                    [0x7480, 0x74F8, 'vs_joker'   ],
                   ]

def metatilesToText(bank, start, end):
    rom.seek( gb2hex((bank<<16)|start) )
    numBytes = end - start
    perRow = 4
    for x in range(0, numBytes):
        if (x % perRow) == 0:
            print("\n    db ", end="")
        print("${:02X}".format(romRead(1)), end="")
        if (((x+1) % perRow) != 0)  & (x != numBytes-1):
            print(", ", end="")
    print("\n")
    
def allMetatilesToText():
    for entry in metatile_offsets:
        print(entry[2]+':')
        metatilesToText(level_bank, entry[0], entry[1])
        print()

def metatilesToBin(bank, start, end):
    rom.seek( gb2hex((bank<<16)|start) )
    return rom.read(end-start)

def allMetatilesToBin():
    for entry in metatile_offsets:
        with open("../out/level/metatiles_"+entry[2]+".bin", "wb") as f:
            f.write( metatilesToBin(level_bank, entry[0], entry[1]) )
        print("{} | {}".format(entry[2], entry[1]-entry[0]))

rom = open("../bat.gb", "rb")

extractLevels()
#allMetatilesToText()
allMetatilesToBin()
