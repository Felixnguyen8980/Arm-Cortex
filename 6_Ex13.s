; i^2 = 1^2 + 2^2 + n^2

				INCLUDE stm32l1xx_constants.s		; Load Constant Definitions
				INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
				MOV	R0,#1							;i=1
				MOV	R1,#0							;Sum=0
				LDR R2,=N							;R2=&N
				LDR R3,[R2]							;R3=N
loop			CMP	R0,R3							;CMP i vs N
				BGT endloop							;i=>N then out loop
				
				MUL R4,R0,R0						;R4=R2*R2=i*i
				ADD R1,R4							;R1+=R4
				ADD R0,#1							;i++
				B loop 
				
endloop
				LDR R5,=Sum
				STR R1,[R5]
				
								
stop 			B 		stop     					; dead loop & program hangs here

				ENDP
				ALIGN			

				AREA    myData, DATA, READWRITE
				ALIGN
N				DCD 3
Sum				DCD 0
				END
