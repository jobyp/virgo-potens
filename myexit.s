# JMJ

# My first program, which simply calls exit system call.
# In case of bash shell we can read the exit status from
# the shell with echo $?

        .globl          _start
        .globl          joby
        .section        .text
_start:
        movq    $60,    %rax    # exit syscall
        movq    $13,    %rdi    # exit status
        addq    %rax,   %rdi    # %rdi == 73
        subq    $50,    %rdi    # %rdi == 23
        incq    %rdi            # %rdi == 24
        decq    %rdi            # %rdi == 23
        decq    %rdi            # %rdi == 22
        movq    $4,     %rax
        mulq    %rdi            # %rax == 88
        movq    %rax,   %rdi

        # Setting rdx to non-zero, so that we can see
        # it getting set to 0 after xor
        movq    $10,    %rdx
        xorq    %rdx,   %rdx    # set rdx to 0 before divq

        movq    $60,    %rax    # setting up dividend
        movq    $7,     %rbx    # setting up divisor
        divq    %rbx            # rax == 8, rdx == 4
        # Quotient is rax, remainder is rdx
        # Let us inspect registers (break at joby)
joby:
        movq    $60,    %rax    # exit syscall
        movq    %rdx,   %rdi    # rdi == 4
        syscall
