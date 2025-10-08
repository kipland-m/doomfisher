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


 # WINDOWS

 # Doomfisher - Project Setup Guide (Windows)

 A 3D first-person camera demo using raylib in C.

 ## Prerequisites

 - Windows 10/11
 - Git for Windows
 - A C compiler (MinGW-w64 recommended)
 - A text editor (VSCode, Neovim, or any IDE)

 ## Getting Started

 ### 1. Install MinGW-w64 (GCC Compiler)

 **Option A: Using MSYS2 (Recommended)**

 1. Download and install MSYS2 from [msys2.org](https://www.msys2.org/)
 2. Open MSYS2 terminal and run:bash
 pacman -Syu
 pacman -S mingw-w64-x8664-gcc mingw-w64-x8664-make mingw-w64-x8664-raylib

 ### 3. Add MinGW to your PATH:
    - Search "Environment Variables" in Windows
    - Edit "Path" under System Variables
    - Add: `C:\msys64\mingw64\bin`
    - Click OK

 **Option B: Standalone MinGW-w64**

 Download from [winlibs.com](https://winlibs.com/) and extract to `C:\mingw64`,
 then add to PATH.

 ### 2. Install Git for Windows

 Download from [git-scm.com](https://git-scm.com/download/win)

 During installation, select:
 - Git from the command line and 3rd-party software
 - Use bundled OpenSSH
 - Checkout Windows-style, commit Unix-style line endings

 ### 3. Install Raylib

 **If using MSYS2** (already done in step 1):
 pacman -S mingw-w64-x8664-raylib
 **If using standalone MinGW:**

 Download raylib from
 [github.com/raysan5/raylib/releases](https://github.com/raysan5/raylib/releases)
 - Get `raylib-<version>_win64_mingw-w64.zip`
 - Extract to `C:\raylib`

 ### 4. Clone the Project

 Open Git Bash or PowerShell:bash
 git clone <your-repo-url>
 cd doomfisher
 ### 5. Download rcamera.h

 In Git Bash:bash
 curl -o rcamera.h
 https://raw.githubusercontent.com/raysan5/raylib/master/src/rcamera.h
 Or in PowerShell:powershell
 Invoke-WebRequest -Uri
 "https://raw.githubusercontent.com/raysan5/raylib/master/src/rcamera.h" -OutFile
 "rcamera.h"
 ### 6. Configure the Makefile

 The project includes a Windows Makefile. You may need to adjust paths:

 **If using MSYS2:**
 Raylib is at: `C:/msys64/mingw64/include` and `C:/msys64/mingw64/lib`

 **If using standalone installation:**
 Update the Makefile paths to match your installation (e.g., `C:/raylib/include`)

 ### 7. Build the Project

 In Git Bash or MSYS2 terminal:bash
 make
 Or using mingw32-make:bash
 mingw32-make
 ### 8. Run the Demobash
 make run
 Or directly:bash
 ./doomfisher.exe
 Or in PowerShell:powershell
 .\doomfisher.exe
 ## Windows Makefile

 Create `Makefile.windows` or modify the existing Makefile:makefile
 Compiler
 CC = gcc

 Compiler flags
 CFLAGS = -Wall -Wextra -std=c99

 Include paths (adjust if needed)
 INCLUDES = -IC:/msys64/mingw64/include

 Library paths (adjust if needed)
 LDFLAGS = -LC:/msys64/mingw64/lib

 Libraries to link
 LIBS = -lraylib -lopengl32 -lgdi32 -lwinmm

 Target executable name
 TARGET = doomfisher.exe

 Source files
 SRCS = main.c

 Object files
 OBJS = $(SRCS:.c=.o)

 Default target
 all: $(TARGET)

 Build the executable
 $(TARGET): $(OBJS)
 	$(CC) $(OBJS) $(LDFLAGS) $(LIBS) -o $(TARGET)

 Compile source files to object files
 %.o: %.c
 	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

 Clean build artifacts
 clean:
 	del /Q $(OBJS) $(TARGET) 2>nul

 Run the program
 run: $(TARGET)
 	$(TARGET)

 Rebuild from scratch
 rebuild: clean all

 .PHONY: all clean run rebuild
 ## Project Structure
 doomfisher/
 ├── main.c                  # Main source code
 ├── rcamera.h              # Camera utility header
 ├── Makefile               # Build configuration
 ├── README.md              # This file
 └── .gitignore            # Git ignore rules
 ## Make Commands

 In Git Bash or MSYS2 terminal:
 - `make` or `make all` - Compile the project
 - `make run` - Compile and run
 - `make clean` - Remove build artifacts
 - `make rebuild` - Clean and rebuild from scratch

 If using `mingw32-make`, replace `make` with `mingw32-make` in all commands.

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

 ## Setting Up LSP (for VSCode/IDE users)

 ### For VSCode

 1. Install the C/C++ extension from Microsoft
 2. Create `.vscode/c_cpp_properties.json`:json
 {
     "configurations": [
         {
             "name": "Win32",
             "includePath": [
                 "${workspaceFolder}/**",
                 "C:/msys64/mingw64/include"
             ],
             "defines": [],
             "compilerPath": "C:/msys64/mingw64/bin/gcc.exe",
             "cStandard": "c99",
             "intelliSenseMode": "windows-gcc-x64"
         }
     ],
     "version": 4
 }
 3. Adjust paths to match your installation

 ### For clangd Users

 Install clangd and create `.clangd` in project root:yaml
 CompileFlags:
   Add:
     - -IC:/msys64/mingw64/include
     - -std=c99
 ## .gitignore for Windowsgitignore
 Executable
 doomfisher.exe

 Object files
 *.o
 *.obj

 Compiled Dynamic libraries
 *.so
 *.dylib
 *.dll

 Compiled Static libraries
 *.a
 *.lib

 LSP/Editor files
 compile_commands.json
 .vscode/
 .vs/

 Windows
 Thumbs.db
 Desktop.ini

 Debug files
 *.pdb
 *.ilk
 ## Troubleshooting

 ### "raylib.h not found" error

 Check your include path in the Makefile matches your raylib installation:
 - MSYS2: `C:/msys64/mingw64/include`
 - Standalone: Wherever you extracted raylib

 ### "undefined reference to WinMain" error

 Make sure you're linking the correct libraries: `-lraylib -lopengl32 -lgdi32
 -lwinmm`

 ### "rcamera.h not found" error

 Download the header manually (see step 5 above).

 ### Command not found errors

 Make sure MinGW bin directory is in your PATH:bash
 echo $PATH    # Git Bash
 $env:Path     # PowerShell
 Should include `C:\msys64\mingw64\bin` or your MinGW installation path.

 ### DLL errors when running

 If you get missing DLL errors, copy required DLLs from `C:\msys64\mingw64\bin` to
  your project folder, or add that directory to your PATH.

 ## Learning Resources

 - [Raylib Cheatsheet](https://www.raylib.com/cheatsheet/cheatsheet.html)
 - [Raylib Examples](https://www.raylib.com/examples.html)
 - [C Programming Documentation](https://en.cppreference.com/w/c)
 - [MSYS2 Documentation](https://www.msys2.org/docs/what-is-msys2/)

 ## Contributing

 When adding new features:
 1. Write your code
 2. Test with `make run`
 3. Update this README if needed
 4. Commit with clear messages
 5. Make sure line endings are consistent (Git should handle this)

