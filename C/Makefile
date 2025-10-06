PROGS=$(patsubst %.c,%,$(wildcard *.c))

#CC:=musl-gcc -static
CC:=gcc

# -Wdouble-promotion
CFLAGS:=-pedantic -Wall -Wextra -Werror -Og -g3  -W -std=gnu18 \
	-Wconversion -Warith-conversion \
	-Wuninitialized -Wformat=2 -fanalyzer

#LDFLAGS:=-lm
LDFLAGS:=


.PHONY: all
all: $(PROGS)
	@:
# Cancel the defaullt rule
%: %.c

%: %.o
	$(CC) -o $@ $^ $(LDFLAGS)

%.o : %.c
	$(CC) -c $(CFLAGS) -o $@ $<

.PHONY: tidy_up
tidy_up: $(wildcard *.c *.h)
	indent --linux-style $^
	rm -vf $(patsubst %,%~,$^)


.PHONY: clean
clean:
	rm -vf *.o $(PROGS) *~
