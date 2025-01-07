# JMJ

	.globl		_start

	.section	.text
_start:
	# Pointer to the first record
	leaq		people,		%rbx

	# Number of people
	movq		num_people,	%rcx

	# Tallest value found
	movq		$0,		%rdi

	# Check preconditions
	cmpq		$0,		%rcx
	jz		exit
	
mainloop:
	movq		HEIGHT_OFFSET(%rbx),	%rax
	cmpq		%rdi,		%rax
	jbe		loop_control
	movq		%rax,		%rdi

loop_control:
	addq		$PERSON_RECORD_SIZE,	%rbx
	loopq		mainloop
	
	
exit:
	movq		$60,		%rax
	syscall
	
	
