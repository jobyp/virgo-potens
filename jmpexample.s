# JMJ

        .globl          _start
        .section        .text
_start:
        movq    $7,     %rdi
        jmp     next_place

        # These two instructions are skipped
        movq    $8,     %rbx
        addq    %rbx,   %rdi

next_place:
        movq    $60,    %rax
        syscall
