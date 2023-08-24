# Makefile for the NSGif Project
# MinGW compiler

CC = clang
CFLAGS = -Iinclude
AR = ar
SRC = $(wildcard src/*.c)
OBJ = $(SRC:.c=.o)
BUILD_DIR = build
STATIC_LIB = $(BUILD_DIR)/libnsgif.lib

all: $(BUILD_DIR) $(STATIC_LIB)

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

$(STATIC_LIB): $(OBJ)
	$(AR) rcs $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf *.o $(BUILD_DIR)\*.lib

.PHONY: all clean
