# JMJ
# Program showing basic arithmetic instructions

        .globl          _start
        .section        .text
_start:
        movq    $3,     %rdi    # rdi == 3
        movq    %rdi,   %rax    # rax == 3
        addq    %rdi,   %rax    # rax == 6
        mulq    %rdi            # rax == (6 * 3) == 18
        movq    $2,     %rdi    # rdi == 2
        addq    %rdi,   %rax    # rax == 20
        movq    $4,     %rdi    # rdi == 4
        mulq    %rdi            # rax == 80
        movq    %rax,   %rdi    # rdi == 80

        # Set the exit syscall number
        movq    $60,    %rax
        syscall
