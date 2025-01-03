# JMJ
# Calculate 2^3 == 2 * 2 * 2
# rbx == 2 (base), rcx == 3 (exponent)

        .globl          _start
        .section        .text
_start:
        movq    $1,     %rax    # accumulator
        movq    $2,     %rbx
        movq    $3,     %rcx

mainloop:
        # if rcx (exponent) == 0, then we are done
        addq    $0,     %rcx
        jz      exit
        mulq    %rbx
        decq    %rcx
        jmp     mainloop

exit:
        movq    %rax,   %rdi
        movq    $60,    %rax
        syscall
