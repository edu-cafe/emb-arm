	.globl asm_inst_pseudo

#ifdef TEST1

asm_inst_pseudo:
	ldr	r0, =MSG
	mov	pc, lr

#ifndef TEST3
MSG:	.byte	'h', 'e', 'l', 'l', 'o' , 0, '!', '!'
//MSG:	.byte	'h', 'e', 'l', 'l', 'o'
//MSG1:	.byte	'1', '2', '3', '4', '5', 0
#else
MSG:	.byte	'h', 'e', 'l', 'l', 'o' , 0
#endif

#endif


#ifdef TEST2

//.equ	DATA, 0x206cc
.equ	DATA, 0x207f8
//.equ	DATA, 0x10000			//Segmentation Fault
asm_inst_pseudo:
	stmfd	sp!,{lr}		@ push

	ldr	r0, =MSG1
	bl	printf

	ldr	r0, =DATA
	bl	gets

	ldr	r0, =MSG2
	bl	printf

	ldr	r0, =DATA
	bl	puts

	ldr	r0, =DATA
	ldmfd	sp!,{pc}		@ pop


MSG1:	.string	"\n\nInput Name => "
MSG2:	.string	"\n\nYour Name : "

#endif


#ifndef TEST3
	.ltorg
#endif

	.global	asm_inst_pseudo2
asm_inst_pseudo2:
	adr	r0, asm_sum_1_10
	mov	pc, lr


	.global	asm_sum_1_10
asm_sum_1_10:
	stmfd	sp!, {r5-r6, lr}

//	int i, sum;
//	for(i=1, sum=0; i<=10; i++) sum += i;
	mov	r5, #1		// r5(i)
	mov	r6, #0		// r6(sum)
sum_loop:
	cmp	r5, #10
	bgt	end_sum_loop
	add	r6, r6, r5	// sum += i

	add	r5, r5, #1	// i++
	b	sum_loop
	
end_sum_loop:	
	mov	r0, r6

	ldmfd	sp!, {r5-r6, pc}



