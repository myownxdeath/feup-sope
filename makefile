CC=gcc
ODIR=./obj
IDIR=./
CFLAGS=-I $(IDIR) -Wall -Wextra -pthread -lrt

default:all

SAUNA_OBJ=sauna.o
OBJS_PATH=$(patsubst %,$(ODIR)/%,(SAUNA_OBJ))

GENERATOR_OBJ=generator.o
GENERATOR_OBJ=$(patsubst %, $(ODIR)/%,(GENERATOR_OBJ))

sauna:sauna.c utils.h
	$(CC) -o $@ $< $(CFLAGS)

generator:generator.c utils.h
	$(CC) -o $@ $< $(CFLAGS)


all:sauna generator


clean:
	@rm -fr $(ODIR) sauna generator
