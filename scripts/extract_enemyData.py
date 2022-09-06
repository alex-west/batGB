# Script by Alex W
# Thanks to PJ for the lambda functions

gb2hex = lambda gb: gb >> 2 & ~0x3FFF | gb & 0x3FFF
hex2gb = lambda hex: hex << 2 & ~0xFFFF | hex & 0x3FFF | 0x4000
romRead = lambda n: sum([ord(rom.read(1)) << i*8 for i in range(n)])
readLongPointer = lambda: (romRead(1) << 16) | romRead(2)

rom = open("../bat.gb", "rb")
enemyPointersBegin = gb2hex(0x064000)
numEnemyPointers = 15

enemyDataBegin = gb2hex(0x06418A)
enemyDataEnd = gb2hex(0x064CD9)

#Read enemy pointers and give each a name
enemyPointers = []
rom.seek(enemyPointersBegin)
for n in range(0, numEnemyPointers):
    gbAddr = romRead(2)
    hexAddr = gb2hex(0x060000+gbAddr)
    enemyPointers.append( (hexAddr, "enemyData_{:04X}".format(gbAddr)) )

#Write the enemyPointerTable with label names
print("Enemy Data Pointers (Bank 6)")
for d in enemyPointers:    
    print("    dw "+d[1])

# Read the enemy data
print("\n\n; Enemy Data in Bank 6")
rom.seek(enemyDataBegin)
while rom.tell() <= enemyDataEnd:
    for d in enemyPointers:
        if rom.tell() == d[0]:
            print(d[1]+":")
    
    token = romRead(1)
    if token == 0:
        print("    db $00", end="")
        for x in range(0,2):
            print(", ${:02X}".format(romRead(1)), end="")
    elif (token == 1) | (token == 2):
        print("    db ${:02X}".format(token), end="")
        for x in range(0,6):
            print(", ${:02X}".format(romRead(1)), end="")
        print()
    else:
        print("    db ${:02X}\n\n".format(token), end="")
    print()

# EoF