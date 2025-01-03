# JMJ

        .globl          _start

        .section        .data

mynumbers_len:
        .quad           7

mynumbers:
        .quad           5, 20, 33, 80, 52, 10, 1


        .section        .text
_start:
        movq            mynumbers_len,  %rcx
        movq            $0,             %rbx
        movq            $0,             %rdi

        cmpq            $0,             %rcx
        je              endloop

mainloop:
        movq            mynumbers(,%rbx,8),     %rax
        cmpq            %rdi,           %rax
        jbe             loopcontrol
        movq            %rax,           %rdi

loopcontrol:
        incq            %rbx
        loopq           mainloop

endloop:
        movq            $60,            %rax
        syscall

