  Run these commands in your terminal:

  # Update package list
  sudo apt update

  # Install build tools
  sudo apt install build-essential git cmake

  # Install raylib dependencies
  sudo apt install libasound2-dev libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libglu1-mesa-dev libxcursor-dev
  libxinerama-dev

  # Install raylib (easiest method)
  sudo apt install libraylib-dev

  Step 2: Create your main.c file

  Create a file called main.c in your current directory and paste the raylib first-person camera example code I showed you
  earlier.

  Step 3: Create a Makefile

  Create a file called Makefile with this content:

  CC = gcc
  CFLAGS = -Wall -Wextra -std=c99
  LIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

  # Default target
  all: game

  # Build the game
  game: main.c
        $(CC) $(CFLAGS) -o game main.c $(LIBS)

  # Clean build files
  clean:
        rm -f game

  # Run the game
  run: game
        ./game

  .PHONY: all clean run

  Step 4: Test compilation

  Try compiling with:
  make

  If that doesn't work, try the direct command:
  gcc -Wall -Wextra -std=c99 -o game main.c -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

  Step 5: Run your game

  ./game

  Alternative: Build raylib from source (if package version doesn't work)

  If the package version gives you issues, you can build from source:

  # Clone raylib
  git clone --depth 1 https://github.com/raysan5/raylib.git raylib-source
  cd raylib-source/src

  # Build raylib
  make PLATFORM=PLATFORM_DESKTOP

  # Install system-wide (optional)
  sudo make install

  # Go back to your project
  cd ../..

  Then compile with:
  gcc -Wall -Wextra -std=c99 -o game main.c -L./raylib-source/src -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

  Game Controls:
  - WASD/Arrow Keys: Move camera
  - Mouse: Look around
  - 1-4: Switch camera modes
  - P: Switch between perspective and orthographic
  - Space/Ctrl: Move up/down
  - ESC: Exit
