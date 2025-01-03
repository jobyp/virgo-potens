# JMJ

        .globl          _start


        .section        .data

# array of numbers
array:
        .quad           5, 20, 33, 80, 52, 10, 1

# length of array
array_len:
        .quad           7


        .section        .text
_start:
        # put array length in %rcx
        movq            array_len,      %rcx

        # use %rdi to hold the current high value
        movq            $0,             %rdi

        ### check pre-conditions ###
        cmpq            $0,             %rcx
        je              endloop

        ### main loop ###
mainloop:

        # Get the next value of array-8, indexed by rcx
        # rcx goes from 7 to 1
        movq            array-8(, %rcx, 8),        %rax

        cmpq            %rdi,           %rax
        jbe             loopcontrol

        movq            %rax,           %rdi

loopcontrol:

        # decrement rcx, keep going until rcx is 0
        loopq           mainloop

endloop:
        movq            $60,            %rax
        syscall
