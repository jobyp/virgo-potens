# JMJ

        .globl          _start


        .section        .data

array:
        .quad           5, 20, 33, 80, 52, 10, 1, 2

array_len:
        .quad           8


        .section        .text

_start:
        movq            array_len,      %rcx
        cmpq            $0,             %rcx
        je              exit

        # load rdi with first element of array
        movq            array,          %rdi
        leaq            array-8,        %rbx

mainloop:

        movq            (%rbx, %rcx, 8),        %rax
        cmpq            %rdi,           %rax
        jae             loopcontrol
        movq            %rax,           %rdi

loopcontrol:
        loopq           mainloop

exit:
        movq            $60,            %rax
        syscall
