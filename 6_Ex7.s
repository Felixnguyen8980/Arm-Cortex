; S= 7x^2 +9xy +3x/y +11x +13y+5
				INCLUDE stm32l1xx_constants.s		; Load Constant Definitions
				INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
				LDR 	R0,=x							;R0 = &x
				LDR 	R0,[R0]							;R0 = x
				LDR 	R1,=y							;R1 = &y
				LDR 	R1,[R1]							;R1 = y
				
				MUL 	R2,R0,R0
				MOV 	R3,#7
				MUL 	R3,R2,R3						;R3=7x^2
				ADD 	R4,R3							;R4+=R3
				
				MUL 	R2,R0,R1
				MOV 	R3,#9
				MUL 	R3,R2,R3
				ADD 	R4,R3							;R4+=R3
				
				UDIV	R2,R0,R1
				MOV 	R3,#3
				MUL 	R3,R3,R2
				ADD 	R4,R3
				
				MOV 	R3,#11
				MUL 	R3,R3,R0
				ADD 	R4,R3
				
				MOV 	R3,#13
				MUL 	R3,R3,R1
				ADD 	R4,R3
				
				ADD		R4,#5
								
stop 			B 		stop     					; dead loop & program hangs here

				ENDP
				ALIGN			

				AREA    myData, DATA, READWRITE
				ALIGN
x				DCD   	4
y 				DCD  	2
				END
