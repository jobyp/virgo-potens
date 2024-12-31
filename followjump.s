# JMJ

        .globl          _start
        .section        .text
_start:
        movq    $25,    %rax    # rax == 25
        jmp     thelabel

somewhere:
        movq    %rax,   %rdi    # rax == 11,  rdi == 11
        jmp     anotherlabel

label1:
        addq    %rbx,   %rax    # rbx == 30,  rax == rbx(30) + rax(25) == 55
        movq    $5,     %rbx    # rbx == 5
        jmp     here

labellabel:
        syscall

anotherlabel:
        movq    $60,    %rax
        jmp     labellabel

thelabel:
        movq    %rax,   %rbx    # rax == 25,  rbx == 25
        jmp     there

here:
        divq    %rbx            # rbx == 5, rax == 11, rdx == 0
        jmp     somewhere

there:
        addq    $5,     %rbx    # rax ==25, rbx == 30
        jmp     label1

anywhere:
        jmp     thelabel

