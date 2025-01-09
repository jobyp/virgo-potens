# JMJ

	.globl		_start


	.section	.data

value:
	.quad		5


	.section	.text

_start:

	# push a sentinel value
	pushq		$0

	# grab the value
	movq		value,		%rax

	# push all the values from 1 to the current value,
	# to the stack
	
pushvalues:
	pushq		%rax
	decq		%rax
	jnz		pushvalues

	# prepare for multiplying

	movq		$1,		%rax

multiply:

	# get the next value from the stack

	popq		%rcx

	# if it's the sentinel, we are done

	cmpq		$0,		%rcx
	je		complete

	# multiply by what we have accumulated so far

	mulq		%rcx

	# do it again

	jmp multiply
	
	
complete:

	movq		%rax,		%rdi
	movq		$60,		%rax
	syscall

	
