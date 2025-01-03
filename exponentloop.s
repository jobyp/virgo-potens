# JMJ
# Calculate 2^5 == 2 * 2 * 2 * 2 * 2
# rbx == 2 (base), rcx == 5 (exponent)

        .globl          _start
        .section        .text
_start:
        movq    $1,     %rax
        movq    $2,     %rbx
        movq    $5,     %rcx

        cmpq    $0,     %rcx    # We are done
        je     exit

mainloop:
        mulq    %rbx
        # decrement %rcx, go back to mainloop
        # if %rcx is not yet zero
        loopq   mainloop

exit:
        movq    %rax,   %rdi
        movq    $60,    %rax
        syscall

