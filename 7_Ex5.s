;LEAP YEAR
				INCLUDE stm32l1xx_constants.s		; Load Constant Definitions
				INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
				LDR 		R0,=nam
				LDR			R0,[R0]				;R0=nam
				MOV 		R1,R0
				CMP			R0,#100
				BGE			last3number
last2number		
				MOV			R2,#100				;R2=100
				UDIV		R1,R2				;R1 = R1/10
				MUL			R1,R2				
				SUB			R1,R0,R1	
				B			div4
last3number		
				MOV			R2,#1000				;R2=1000
				UDIV		R1,R2				;R1 = R1/100
				MUL			R1,R2				
				SUB			R1,R0,R1
				
				MOV 		R3,#1
div400			MOV 		R2,#400
				MUL			R2,R3
				CMP			R2,R1
				ADD			R3,#1
				BLO			div400
				BEQ			leap
				
				MOV 		R3,#1
div100			MOV 		R2,#100
				MUL			R2,R3
				CMP			R2,R1
				ADD			R3,#1
				BLO			div100
				BEQ			normal
				
				MOV 		R3,#1
div4			MOV 		R2,#4
				MUL			R2,R3
				CMP			R2,R1
				ADD			R3,#1
				BLO			div4
				BEQ			leap
				
				
normal			mov 		R2,#0
				B stop
leap			mov 		R2,#1

				
			
stop 			B 		stop     					; dead loop & program hangs here

				ENDP
				ALIGN			

				AREA    myData, DATA, READWRITE
				ALIGN
nam				DCD 	2005
				END
