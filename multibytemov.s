# JMJ

	.globl		_start


	.section	.data
mytext:
	.ascii		"This is a string of characters.\0"


	.section	.text
_start:

	# move a pointer to the string into %rbx
	leaq		mytext,		%rbx

	# count starts at 0
	xorq		%rdi,		%rdi

mainloop:

	# Get the next quad-word
	movq		(%rbx),		%rax

byte1:
	cmpb		$0,		%al
	je		finish

	cmpb		$'a',		%al
	jb		byte2

	cmpb		$'z',		%al
	ja		byte2

	incq		%rdi
	
byte2:
	cmpb		$0,		%ah
	je		finish

	cmpb		$'a',		%ah
	jb		byte3

	cmpb		$'z',		%ah
	ja		byte3

	incq		%rdi
	
byte3:
	# Shift next bytes into position
	rorq		$16,		%rax

	cmpb		$0,		%al
	je		finish

	cmpb		$'a',		%al
	jb		byte4

	cmpb		$'z',		%al
	ja		byte4

	incq		%rdi

byte4:
	cmpb		$0,		%ah
	je		finish

	cmpb		$'a',		%ah
	jb		byte5

	cmpb		$'z',		%ah
	ja		byte5

	incq		%rdi
	
byte5:
	rorq		$16,		%rax
	
	cmpb		$0,		%al
	je		finish

	cmpb		$'a',		%al
	jb		byte6

	cmpb		$'z',		%al
	ja		byte6

	incq		%rdi
	
byte6:
	cmpb		$0,		%ah
	je		finish

	cmpb		$'a',		%ah
	jb		byte7

	cmpb		$'z',		%ah
	ja		byte7

	incq		%rdi
	
byte7:
	rorq		$16,		%rax

	cmpb		$0,		%al
	je		finish

	cmpb		$'a',		%al
	jb		byte8

	cmpb		$'z',		%al
	ja		byte8

	incq		%rdi
	
byte8:
	cmpb		$0,		%ah
	je		finish

	cmpb		$'a',		%ah
	jb		mainloop_control

	cmpb		$'z',		%ah
	ja		mainloop_control

	incq		%rdi


mainloop_control:

	addq		$8,		%rbx
	jmp		mainloop

finish:
	movq		$60,		%rax
	syscall
