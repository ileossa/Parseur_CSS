DEBUG=yes
CC=gcc

ifeq ($(DEBUG),yes)
	CFLAGS=-W -Wall -ansi -pedantic -g
	LDFLAGS=
else
	CFLAGS=-W -Wall -ansi -pedantic
	LDFLAGS=
endif
CFLAGS=-W -Wall -ansi -pedantic
LDFLAGS=
EXEC=hello


all: $(EXEC)
ifeq ($(DEBUG),yes)
	@echo "Génération en mode debug"
else
	@echo "Génération en mode release"
endif


fonctions: fonctions.o main.o
	$(CC) -o fonctions fonctions.o main.o $(LDFLAGS)

fonctions.o: fonctions.c
	$(CC) -o fonctions.o -c fonctions.c -W $(CFLAGS)

main.o: main.c fonctions.h
	$(CC) -o main.o -c main.c -W $(CFLAGS)


clean:
	rm -rf *.o

mrproper: clean
	rm -rf $(EXEC)