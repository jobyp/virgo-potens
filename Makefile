PROGS:=$(patsubst %.s,%,$(wildcard *.s))

.PHONY: all
all: $(PROGS)
	@:

% : %.s

%.o : %.s
	as -g -a=$*.list -o $@ $<

% : %.o
	ld -o $@ $<

.PHONY: clean
clean:
	rm -vf *.o *.list $(PROGS) *~
