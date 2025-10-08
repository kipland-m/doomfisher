# Compiler
CC = gcc

compile_commands:
	bear -- make clean all

# Compiler flags
CFLAGS = -Wall -Wextra -std=c99

# Include paths
INCLUDES = -I/opt/homebrew/opt/raylib/include

# Library paths
LDFLAGS = -L/opt/homebrew/opt/raylib/lib

# Libraries to link
LIBS = -lraylib -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo

# Target executable name
TARGET = doomfisher

# Source files
SRCS = main.c

# Object files
OBJS = $(SRCS:.c=.o)

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) $(LIBS) -o $(TARGET)

# Compile source files to object files
%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Clean build artifacts
clean:
	rm -f $(OBJS) $(TARGET)

# Run the program
run: $(TARGET)
	./$(TARGET)

# Rebuild from scratch
rebuild: clean all

.PHONY: all clean run rebuild
