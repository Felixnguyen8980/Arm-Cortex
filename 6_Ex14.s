
; s=n(n-1)(n-2)..1
				INCLUDE stm32l1xx_constants.s		; Load Constant Definitions
				INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
				LDR  	R0,=N						;R0=&N
				LDR		R1,[R0]						;i=N
				MOV		R2,#1						;Sum=1
loop			CMP 	R1,#1						;CMP R1 vs 1 
				BEQ		endloop
				
				MOV 	R4,R2						;R4=R2
				MUL		R2,R1,R4					;R2=R2*R4
				SUB		R1,#1						;R1-=1
				B		loop
endloop			
				LDR		R3,=Result					;R3=&Result
				STR		R2,[R3]						;Result=R2
								
stop 			B 		stop     					; dead loop & program hangs here

				ENDP
				ALIGN			

				AREA    myData, DATA, READWRITE
				ALIGN
N				DCD   5
Result			DCD   0
				END
