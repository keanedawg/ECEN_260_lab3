	.text
	.align 2
	.global main























	.cdecls C, LIST, "msp.h"
main:
	bl	pwr
eloop: 	b	eloop		; infinite loop


pwr:
; r0 return value
; r1 = value
; r2 = pow
		cmps	r2,		#0 	; compare r2 with 0 and set flags
		beq		pwreq0		    ; branch if 0
		b		pwrne0    
pwreq0:
		mov		r0		#1
		bx		lr
	
pwrne0:	
		cmps 	r2, 	#1
		beq		pwreql
		b		pwrnel
	
pwreq1:
		mov		r0,		r1
		bx		lr
	
pwrne1:
		mov		r0, 	r1

powloop:
		mul		r0, 	r1
		subs	r2,		#1
		cmps	r2,		#1
		beq		powloopdone		;
		b		powloop			; not finished, do it again

powloopdone:
		bx		lr