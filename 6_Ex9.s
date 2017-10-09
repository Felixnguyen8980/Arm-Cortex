
				INCLUDE stm32l1xx_constants.s		; Load Constant Definitions
				INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
				LDR		r0,=x						; r0 = &x
				LDR 	r0,[r0]						; r0 = x
				CMP		r0,#0						
				BEQ		compare						; if r0 == 0
				BLT		lower						; if r0 < 0
				mov		r1,#1						; if r0 > 0
				B 		stop
compare			mov		r1,#0
				B 		stop
lower			mov 	r1,#-1
stop 			B 		stop     					; dead loop & program hangs here

				ENDP
				ALIGN			

				AREA    myData, DATA, READWRITE
				ALIGN
x				DCD   	-2

				END
