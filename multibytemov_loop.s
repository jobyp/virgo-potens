# JMJ

	.globl		_start

	.section	.data

mytext:
	.ascii		"This is a string of characters.\0"


	.section	.text

_start:

	# load pointer to mytext into %rbx
	leaq		mytext,		%rbx

	# Set the counter (%rdi) to 0
	xorq		%rdi,		%rdi

mainloop:

	# read a quad-word into %rax

	movq		(%rbx),		%rax

	# We iterate through 8 bytes in a quad-word
	movq		$8,		%rcx

byte0:
	cmpb		$0,		%al
	je		finish

	cmpb		$'a',		%al
	jb		byte0_control

	cmpb		$'z',		%al
	ja		byte0_control

	incq		%rdi

byte0_control:
	shrq		$8,		%rax
	loopq		byte0

mainloop_control:
	addq		$8,		%rbx
	jmp		mainloop
	
finish:
	movq		$60,		%rax
	syscall
