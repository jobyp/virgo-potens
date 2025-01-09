#JMJ

	.globl 		_start
	.section	.text

_start:

	movq 		$2, 		%rdi
	movq 		$3, 		%rsi
	call 		exponent

	movq 		%rax, 		%rdi
	movq 		$60, 		%rax
	syscall
