CFLAGS=-Wall -Wextra -g -std=c++0x

ifeq "$(CC)" "clang"
CFLAGS += -Weverything -std=c++11 -Wno-c++98-compat -Wno-padded -Wno-exit-time-destructors
endif

all: bin/mm

tests: test valgrind

bin:
	mkdir -p $@

bin/mm: main.cpp mm.h | bin
	$(CC) $(CFLAGS) -o $@ main.cpp -lstdc++

test: bin/mm
	bin/mm

valgrind: bin/mm
	valgrind bin/mm

clean:
	rm -rf bin
