TARGET = yeahconsole
CC = gcc
#CC = cc
INSTALL = install

PREFIX = /usr/local

LIBS = -lX11 -lXrandr
INCLUDES = -I/usr/include/X11
LIB_DIRS = -L/usr/lib/X11
FLAGS = -Os -Wall -g

OBJECTS := yeahconsole.o
SOURCES := yeahconsole.c

$(TARGET): $(OBJECTS)
	$(CC) $(DEFINES) $(INCLUDES) $(LIB_DIRS) -o $@ $< $(LIBS)
	# strip $@

$(OBJECTS): $(SOURCES)
	$(CC) $(FLAGS)  $(DEFINES) $(INCLUDES) $(LIB_DIRS) -c -o $@ $<

clean:
	rm -rf $(TARGET) $(OBJECTS)

reindent: $(SOURCES)
	indent -ts4 -i4 --braces-on-if-line -l120 --no-space-after-function-call-names $?

install: $(TARGET) $(MAN)
	$(INSTALL) -m 0755 $(TARGET) $(PREFIX)/bin

uninstall:
	rm -f $(PREFIX)/bin/$(TARGET)
