# Makefile for the NSGif Project
# gcc compiler

CC = gcc
CFLAGS = -Iinclude
AR = ar
SRC = $(wildcard src/*.c)
OBJ = $(SRC:.c=.o)
BUILD_DIR = build
STATIC_LIB = $(BUILD_DIR)/libnsgif.lib
SHARED_LIB = $(BUILD_DIR)/libnsgif.dll
LINUX_LIB = $(BUILD_DIR)/libnsgif.so

all: $(BUILD_DIR) $(STATIC_LIB) $(SHARED_LIB) $(LINUX_LIB)

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

$(STATIC_LIB): $(OBJ)
	$(AR) rcs $@ $^

$(SHARED_LIB): $(OBJ)
	$(CC) -shared -o $@ $^

$(LINUX_LIB): $(OBJ)
	$(CC) -shared -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	del /Q /F *.o $(BUILD_DIR)\*.lib $(BUILD_DIR)\*.dll

.PHONY: all clean
