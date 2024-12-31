# JMJ

        .globl          _start
        .section        .text

exit_program:
        movq    $60,    %rax
        syscall

_start:
        movw    $0b0000000100000010, %bx        # 0x0102
        addb    %bh,    %bl
        movb    $0,     %bh
        movq    %rbx,   %rdi                    # rdi == 3
        jmp     exit_program
