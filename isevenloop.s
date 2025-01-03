# JMJ
# Determine if number in %rax is even

        .globl          _start
        .section        .text
_start:
        movq    $11,    %rax    # check if %rax is even
        movq    $1,     %rbx
        movq    $0,     %rcx

mainloop:
        cmpq    $0,     %rax    # check if zero (even)
        cmoveq  %rbx,   %rdi
        je      exit
        cmpq    $1,     %rax    # check if one  (odd)
        cmoveq  %rcx,   %rdi
        je      exit
        subq    $2,     %rax
        jmp     mainloop
exit:
        movq    $60,    %rax
        syscall
