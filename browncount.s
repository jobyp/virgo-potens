# JMJ

	.globl		_start

	.section	.text

_start:
	leaq		people,		%rbx
	movq		num_people,	%rcx

	# brown hair count
	movq		$0,		%rdi

	# check pre-conditions
	cmpq		$0,		%rcx
	je		finish

mainloop:
	# Is the hair colour brown?
	cmpq		$2,		HAIR_OFFSET(%rbx)
	jne		loop_control
	incq		%rdi

loop_control:

	# move %rbx to the next person record
	addq		$PERSON_RECORD_SIZE,	%rbx
	loopq		mainloop

finish:
	movq		$60,		%rax
	syscall
	
