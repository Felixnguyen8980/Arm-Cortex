
				INCLUDE stm32l1xx_constants.s		; Load Constant Definitions
				INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
				LDR		r0,=a
				LDR 	r0,[r0]
				LDR 	r1,=b
				LDR		r1,[r1]
				LDR 	r2,=c
				LDR		r2,[r2]
				MUL		r1,r1,r1
				MUL		r0,r0,r2
				MOV 	r2,#4
				MUL		r0,r0,r2
				CMP		r1,r0
				BLT		Complex
				MOV		r3,#0
				B 		stop
Complex			MOV 	r3,#-1
stop 			B 		stop     					; dead loop & program hangs here

				ENDP
				ALIGN			

				AREA    myData, DATA, READWRITE
				ALIGN
a				DCD   	4
b 				DCD  	0
c				DCD		5
				END
