# JMJ

	.globl		_start

	.section	.data

mytext:
	.ascii 		"This is a string of characters.\0"



	.section	.text
_start:

	leaq		mytext,		%rbx
	movq		$0,		%rdi

mainloop:
	movb		(%rbx),		%al

	# quit if we hit the NULL terminator
	cmp		$0,		%al
	je		finish

	# go to the next byte if value isn't between 'a' and 'z'
	cmpb		$'a',		%al
	jb		loop_control

	cmpb		$'z',		%al
	ja		loop_control

	incq		%rdi

loop_control:	
	incq		%rbx
	jmp		mainloop

finish:
	movq		$60,		%rax
	syscall

	
