# Basic Makefile for the tortoise package.
# from the Tutorial Introduction to Guile
# found at
# https://www.gnu.org/software/guile/docs/guile-tut/tutorial.html
#
# you need to have installed guile-dev
# guile-3.0-dev on my system.
#
CFLAGS = `guile-config compile`
LIBS = `guile-config link` -lm
#LIBS = -lm

.PHONY: clean build run

build: tortoise

clean:
	rm -f tortoise tortoise.o

run: tortoise
	./tortoise

tortoise: tortoise.o
	gcc $< -o $@ $(LIBS)

tortoise.o: tortoise.c
	gcc -c $< -o $@ $(CFLAGS)
