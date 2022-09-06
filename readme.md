# Batman GB Disassembly

A disassembly of one of my favorite Game Boy games -- still very much a work in progress at the moment. Feel free to contribute.

## Build Instructions

1. Install [rgbds](https://github.com/rednex/rgbds#1-installing-rgbds)
2. Either run `make all` or `build.bat`, depending on your preference.
3. The assembled game and a [BGB](http://bgb.bircd.org/) compatible `.sym` file will appear in the `out` folder.

The resultant file should have this hash: `md5: 03c6d84a951be6703b7458478f4277b9`

## How to Contribute

1. Make something better. Perhaps start by doing something like:
   - Giving a function or variable a (better) name.
   - Properly defining a RAM address (eg. labelName: ds 1).
   - Turning a raw pointer (eg. $4242) into a proper label (eg. magicSound).
   - Adding a missing label
   - Adding informative comments
   - etc.
2. Verify that your changes still result in a byte-for-byte identical game.
3. Submit a pull request.

At the current phase of this project, please refrain from moving any chunk of code into a separate file.

## Directory Structure

Subject to change.

- `docs` - Assorted notes regarding the game's formats and structure
- `packed` - Destination folder for graphics, etc. after compression
- `out` - Output directory for the build process
- `scripts` - Various scripts to extra data from the game
- `SRC` - Top level source code
- `SRC/gfx` - Uncompressed CHR and tilemap data
- `SRC/levels` - Uncompressed level map data, level enemy data, and metatile data (bin)

## Resources

- [mgbdis](https://github.com/mattcurrie/mgbdis) - The disassember used to create this project.
- [LA DX Disassembly](https://github.com/zladx/LADX-Disassembly) - A disassembly project of another game that also uses rgbds.
- [TCRF](https://tcrf.net/Batman:_The_Video_Game_(Game_Boy)) - Article on the Cutting Room Floor wiki concerning this game.
