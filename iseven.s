# JMJ
# Check if number in %rax is even

        .globl          _start
        .section        .text
_start:
        movq    $10,    %rax    # is 10 even?
        movq    $2,     %rbx
        xorq    %rdx,   %rdx    # set rdx to 0 before divq
        movq    $0,     %rdi    # assume it's odd
        divq    %rbx
        movq    $1,     %rcx
        cmpq    $0,     %rdx
        # cannot move immediate number with cmov
        # value needs to be in a register (in our case %rcx)
        cmoveq  %rcx,   %rdi
        movq    $60,    %rax
        syscall
