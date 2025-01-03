# JMJ

        .globl          _start

        .section        .data

# How many elements do we have?
mynumbers_len:
        .quad           7

# The data elements themselves
mynumbers:
        .quad           5, 20, 33, 80, 52, 10, 1

# This program will find the largest value in the array.

        .section        .text
_start:
        # Initialize registers
        movq            mynumbers_len,  %rcx

        # Put the address of the first element in %rbx
        leaq            mynumbers,      %rbx

        # Use %rdi to hold the current high value
        movq            $0,             %rdi

        # If there are no numbers, stop
        cmpq            $0,             %rcx
        je              endloop

        ### main loop ###
myloop:
        # Get the next value (currently pointed by %rbx)
        movq            (%rbx),         %rax

        # If it is not bigger, go to the end of loop
        cmpq            %rdi,           %rax
        jbe             loopcontrol

        # Otherwise, store it as the biggest element
        # so far.
        movq            %rax,           %rdi

loopcontrol:
        addq            $8,             %rbx
        loopq           myloop

        ### cleanup and exit ###
endloop:
        # We're done -- exit
        movq            $60,            %rax
        syscall
