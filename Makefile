# Object files are part of standalone executable
# so they don't contain _start symbol
OBJS:=persondata exponentfunc hello

# progs are the final executable, consisting of one or
# more object files.
PROGS:=$(filter-out $(OBJS),$(patsubst %.s,%,$(wildcard *.s)))
PROGS+=runexponent_c hello_c

CC:=musl-gcc -static

CFLAGS:=-pedantic -Werror -Wextra -Og -g3 -Wall -std=gnu18 \
	-Wconversion -Warith-conversion -Wdouble-promotion \
	-Wuninitialized -Wformat=2

LDFLAGS:=-lm


.PHONY: all
all: $(PROGS)
	@:

# Additional dependencies
browncount tallest: persondata.o
runexponent_c runexponent: exponentfunc.o
hello_c: hello.o

# -Wl,-z,noexecstack
%_c: %_c.o
	$(CC) -o $@ $^ $(LDFLAGS)

% : %.s

%.o : %.c
	indent --linux-style $^
	rm -vf $(patsubst %,%~,$^)
	$(CC) -c $(CFLAGS) -o $@ $<

%.o : %.s
	as -g --noexecstack -a=$*.list -o $@ $<

% : %.o
	ld -o $@ $^


.PHONY: clean
clean:
	rm -vf *.o *.list $(PROGS) *~
