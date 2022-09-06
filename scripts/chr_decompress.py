# Script by Alex W
# Thanks to PJ for the lambda functions

# Tool for decompressing chr data in batGB

gb2hex = lambda gb: gb >> 2 & ~0x3FFF | gb & 0x3FFF
hex2gb = lambda hex: hex << 2 & ~0xFFFF | hex & 0x3FFF | 0x4000
romRead = lambda n: sum([ord(rom.read(1)) << i*8 for i in range(n)])
readLongPointer = lambda: (romRead(1) << 16) | romRead(2)

# Decompress graphics

def get_source_addr(bank, resource):
    rom.seek(bank*0x4000+resource*4+2)
    return gb2hex( (bank<<16)|romRead(2) )

def decompress_chr(source):
    cursor = source
    chr = bytearray()
    
    while(True):
        rom.seek(cursor)
        rep = int.from_bytes(rom.read(1), 'little')
        #print(rep)
        if(rep == 0x00):
            break
        for n in range(0,8):
            if(rep & 0x80):
                cursor += 1
            rep = rep << 1
            rom.seek(cursor)
            chr.append(int.from_bytes(rom.read(1), 'little'))
        cursor += 1
    
    return [chr, cursor+1]
    #with open("../out/chr/res_{0:}-{1:02X}_0x{2:06X}.chr".format(bank, resource, source), "wb") as f:
    

def printStats(name, decomp_size, comp_size):
    ratio = decomp_size/comp_size
    print("| {} | {} | {} | {:.2%} |".format(name, decomp_size, comp_size, ratio))

resource_list = [
                 [3, 0x14],
                 [4, 0x0B],
                 [5, 0x17],
                ]

def extractByBank():
    for bank in resource_list:
        for res in range(0,bank[1]):
            source = get_source_addr(bank[0], res)
            unpacked = decompress_chr(source)
            name = "res_{0:}-{1:02X}_0x{2:06X}".format(bank[0], res, source)
            with open("../out/chr/"+name+".chr", "wb") as f:
                f.write(unpacked[0])
            #if args.verbose:
            printStats(name, len(unpacked[0]),unpacked[1]-source)

offset_list = [
               [0x0C050,0x0FD38],
               [0x1002C,0x125B3],
               [0x1405C,0x1756A],
              ]

def extractByOffset():
    for bank in offset_list:
        source = bank[0]
        while source < bank[1]:
            unpacked = decompress_chr(source)
            name = "res_0x{:06X}".format(source)
            with open("../out/chr/"+name+".chr", "wb") as f:
                f.write(unpacked[0])
            #if args.verbose:
            printStats(name, len(unpacked[0]),unpacked[1]-source)
            source = unpacked[1]

rom = open("../bat.gb", "rb")

#extractByBank()
extractByOffset()


'''
    sla a
    sla a
    ld e, a
    ld d, $00
    ld hl, $4000
    add hl, de
    

    ; Load destination addr to BC
    ld a, [hl+]
    ld c, a
    ld a, [hl+]
    ld b, a
    ; Load source addr to DE
    ld a, [hl+]
    ld e, a
    ld a, [hl+]
    ld d, a
    ; HL = dest addr
    ld l, c
    ld h, b

    .loop_A:
        ; Exit if repeater byte == 0
        ld a, [de]
        and a
            jr z, .break
        ld c, a
        
        ; Loop through each bit of repeater byte
        ld b, $08    
        .loop_B:
            ; Repeat previous byte if next bit is 0
            sla c
            jr nc, .endIf_B
                inc de
            .endIf_B:
            ; Load byte, increment destination byte
            ld a, [de]
            ld [hl+], a
            dec b
        jr nz, .loop_B
        ; Increment to next repeater byte
        inc de
    jr .loop_A
    .break:
'''