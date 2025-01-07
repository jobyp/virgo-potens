# Object files are part of standalone executable
# so they don't contain _start symbol
OBJS:=persondata

# progs are the final executable, consisting of one or
# more object files.
PROGS:=$(filter-out $(OBJS),$(patsubst %.s,%,$(wildcard *.s)))

.PHONY: all
all: $(PROGS)
	@:

# Additional dependencies
browncount tallest: persondata.o

% : %.s

%.o : %.s
	as -g -a=$*.list -o $@ $<

% : %.o
	ld -o $@ $^

.PHONY: clean
clean:
	rm -vf *.o *.list $(PROGS) *~
