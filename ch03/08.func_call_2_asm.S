	.globl asm_func_test

asm_func_test:
	stmfd	sp!,{lr}		@ push

	mov	r0, #0x77
	bl	print_hex
	mov	r0, #'\n'
	bl	putchar

	mov	r0, #0x23
	bl	print_hex
	mov	r0, #'\n'
	bl	putchar

	mov	r0, #44
	ldmfd	sp!,{pc}		@ pop


/*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                
;;;;;     print_hex Function                                                                       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
*/
/* Subroutine to send a hex word (in r0) over the serial port */

        .global    print_hex        
print_hex:
        stmfd   sp!,{r4 - r5, lr}         @ push
        
        mov        r4, r0
        mov        r5, #0x08        // count
        mov        r0, #0x30        // 0을 화면에 표시함
        bl         putchar
        mov        r0, #0x78        // x를 화면에 표시함
@        mov        r0, #'x'
        bl         putchar
prh1:
        and        r0, r4, #0xF0000000    // 상위 4비트 마스크
        mov        r0, r0, lsr #28        // 상위 4비트 추출
        add        r0, r0, #0x30          // ascii 코드 숫자영역 표시(0~9)
        cmp        r0, #0x3A
        addge      r0, r0, #0x07        // ascii 코드 영문영역 표시(a~f)
        bl         putchar
        mov        r4, r4, lsl #4         // 

        subs       r5, r5, #0x01        
        bne        prh1

        ldmfd   sp!,{r4 - r5, pc}         @ pop 
       
