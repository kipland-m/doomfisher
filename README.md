 # Doomfisher - Project Setup Guide

 A 3D first-person camera demo using raylib in C.

 ## Prerequisites

 - macOS (this guide is Mac-specific)
 - Homebrew package manager
 - Basic terminal knowledge
 - A text editor (Neovim recommended, but any will work)

 ## Getting Started

 ### 1. Install Homebrew (if not already installed)

 Check if you have Homebrew:bash
 brew --version
 If not installed, run:bash
 /bin/bash -c "$(curl -fsSL
 https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
 ### 2. Install Raylibbash
 brew install raylib
 Verify installation location:bash
 brew --prefix raylib
 Should output: `/opt/homebrew/opt/raylib`

 ### 3. Install Build Tools

 Install Bear (for LSP support):bash
 brew install bear
 ### 4. Clone the Projectbash
 git clone <your-repo-url>
 cd doomfisher
 ### 5. Download rcamera.h

 The `rcamera.h` header isn't included in the Homebrew raylib package, so download
  it:bash
 curl -o rcamera.h
 https://raw.githubusercontent.com/raysan5/raylib/master/src/rcamera.h
 ### 6. Build the Project

 The project includes a Makefile for easy compilation:bash
 make
 ### 7. Run the Demobash
 make run
 Or directly:bash
 ./doomfisher
 ## Project Structure
 doomfisher/
 ├── main.c                  # Main source code
 ├── rcamera.h              # Camera utility header
 ├── Makefile               # Build configuration
 ├── README.md              # This file
 └── .gitignore            # Git ignore rules
 ## Makefile Commands

 - `make` or `make all` - Compile the project
 - `make run` - Compile and run
 - `make clean` - Remove build artifacts
 - `make rebuild` - Clean and rebuild from scratch
 - `make compile_commands` - Generate LSP compile database

 ## Controls (In-Game)

 ### Movement
 - **W, A, S, D** - Move forward, left, backward, right
 - **Space** - Move up
 - **Left Ctrl** - Move down
 - **Arrow keys or Mouse** - Look around

 ### Camera Modes
 - **1** - Free camera mode
 - **2** - First person mode
 - **3** - Third person mode
 - **4** - Orbital mode
 - **P** - Toggle projection (perspective/orthographic)

 ### Other
 - **Mouse Scroll** - Zoom in/out
 - **ESC** - Close window

 ## Setting Up LSP (for Neovim/IDE users)

 If you're using an LSP-enabled editor (Neovim, VSCode, etc.), generate the
 compile commands database:bash
 make compile_commands
 This creates `compile_commands.json` which tells your LSP how to understand the
 project.

 ### For Neovim Users

 After generating `compile_commands.json`:
 1. Open the project in Neovim
 2. Restart LSP: `:LspRestart`
 3. Check status: `:LspInfo`

 You should now have:
 - ✅ Autocomplete for raylib functions
 - ✅ Go to definition
 - ✅ No false error warnings
 - ✅ Hover documentation

 ## Troubleshooting

 ### "raylib.h not found" error

 Make sure raylib is installed:bash
 brew list raylib
 If installed but still not found, check the include path in the Makefile matches
 your installation:bash
 brew --prefix raylib
 ### "rcamera.h not found" error

 Download the header manually:bash
 curl -o rcamera.h
 https://raw.githubusercontent.com/raysan5/raylib/master/src/rcamera.h
 ### LSP not working

 Regenerate the compile commands:bash
 make compilecommands
 ```

 Then restart your editor/LSP.

 ### Build artifacts showing in git

 Make sure `.gitignore` is present and contains:
 ```
 doomfisher
 *.o
 compilecommands.json
 .DS_Store
 ## Learning Resources

 - [Raylib Cheatsheet](https://www.raylib.com/cheatsheet/cheatsheet.html)
 - [Raylib Examples](https://www.raylib.com/examples.html)
 - [C Programming Documentation](https://en.cppreference.com/w/c)

 ## Contributing

 When adding new features:
 1. Write your code
 2. Test with `make run`
 3. Update this README if needed
 4. Commit with clear messages
