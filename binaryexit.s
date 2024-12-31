# JMJ

        .globl          _start
        .section        .text
_start:
        movq    $0b1101,        %rdi
        movq    $0x3c,          %rax    # 60 exit syscall
        syscall
