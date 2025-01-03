# JMJ

        .globl          _start


        .section        .data

array:
        .quad           5, 20, 33, 80, 52, 10, 1

array_len:
        .quad           7

look_for:
        .quad           10


        .section        .text

_start:

        movq            look_for,       %rdx
        movq            array_len,      %rcx
        leaq            array-8,        %rbx

        # precondition check
        cmpq            $0,             %rcx
        je              exit

mainloop:

        movq            (%rbx, %rcx, 8),        %rax
        cmpq            %rdx,           %rax
        je              found
        loopq           mainloop
        movq            $0,             %rdi    # not found
        jmp             exit

found:
        movq            $1,             %rdi

exit:
        movq            $60,            %rax
        syscall
