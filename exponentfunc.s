#JMJ

	.globl 		exponent
	.type 		exponent, 	@function

	.section 	.text

exponent:

	# %rdi has the base
	# %rsi has the exponent

	pushq 		%rbp
	movq 		%rsp, 		%rbp
	subq 		$16, 		%rsp

	# Save the current exponent on the stack
	movq 		%rsi, 		-8(%rbp)

	# Save the base
	movq 		%rdi, 		-16(%rbp)

	movq 		$1, 		%rax

	# check the base case (exponent == 0)
	cmpq 		$0, 		%rsi
	je 		complete

	# recursive case (exponent > 0)
	decq 		%rsi
	call 		exponent
	movq 		-16(%rbp), 	%rdi
	mulq 		%rdi

complete:
	leave
	ret	
