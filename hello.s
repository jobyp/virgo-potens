# JMJ

	.globl		hello
	.type		hello,		@function


	.section	.data

hello_msg:
	.ascii		"My Lord and my God!\0"


	.section	.text
	
hello:
	pushq		%rbp
	movq		%rsp,		%rbp

	movq		$hello_msg,	%rdi
	call		puts

	leave
	ret

