# JMJ

	.equ		WEIGHT_OFFSET,		0
	.equ		SHOE_OFFSET,		WEIGHT_OFFSET + 8
	.equ		HAIR_OFFSET,		SHOE_OFFSET + 8
	.equ		HEIGHT_OFFSET,		HAIR_OFFSET + 8
	.equ		AGE_OFFSET,		HEIGHT_OFFSET + 8
	
	.equ		PERSON_RECORD_SIZE,	40	# AGE_OFFSET + 8
	
	.globl		WEIGHT_OFFSET
	.globl		SHOE_OFFSET
	.globl		HAIR_OFFSET
	.globl		HEIGHT_OFFSET
	.globl		AGE_OFFSET
	.globl		PERSON_RECORD_SIZE
	
	.globl		people
	.globl		num_people


	.section	.data

people:
	# Array of people --  WEIGHT, SHOE, HAIR, HEIGHT, AGE

	.quad		200, 10, 2, 74, 20
	.quad		280, 12, 2, 72, 44
	.quad		150, 8,  1, 68, 30
	.quad		250, 14, 3, 75, 25
	.quad		250, 10, 2, 70, 11
	.quad		180, 11, 5, 69, 65

end_people:   # Mark the end for array of records

num_people:
	.quad		(end_people - people) / PERSON_RECORD_SIZE
