# JMJ

        .globl          custom_stack
        .type           custom_stack,           @function

        .equ            STACK_SIZE,             16 * 1024 * 8


        .section        .data

        .align          16
stack0_end:
        .rept           STACK_SIZE
        .byte           0
        .endr
stack0:

        .align          16
stack1_end:
        .rept           STACK_SIZE
        .byte           0
        .endr
stack1:

orig_stack:
        .quad           0

my_msg:
        .ascii          "My Lord and my God!\0"


        .section        .text

custom_stack:

        pushq           %rbp
        movq            %rsp,           %rbp

        # save the original stack
        movq            %rsp,           orig_stack

        # set the new stack
        leaq            stack0,         %rsp
        leaq            my_msg,         %rdi
        call            puts

        movq            orig_stack,     %rsp
        leave
        ret




