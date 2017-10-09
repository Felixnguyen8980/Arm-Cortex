; s = (a1 + a2 + a3 + a4... +an)/n
				INCLUDE stm32l1xx_constants.s		; Load Constant Definitions
				INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
				MOV		R0, #0						;i=0
				MOV		R1, #0						;sum=0
				LDR 	R2,=array					;R2=&array[0]
				LDR 	R4,=N						;R4=&N
				LDR		R3,[R4]						;R3=N
loop			CMP 	R0,R3						;CMP i va N
				BEQ 	endloop
				
				LDR 	R5,[R2]						;load a[i] vao R5 r[5] =a[i]
				ADD		R1,R5						;sum+=a[i]
				ADD		R0,#1						;i+=1
				ADD 	R2,#4						;R2 chua dia chi cua a[i]
				B		loop						;tiep tuc vong lap
				
endloop			
				UDIV 	R5,R1,R3					;mean=sumN (R5= R1/R3)
				LDR 	R4,=mean					;R4=&mean
				STR		R5,[R4]					
				
								
stop 			B 		stop     					; dead loop & program hangs here

				ENDP
				ALIGN			

				AREA    myData, DATA, READWRITE
				ALIGN
array			DCD		1, 2, 3, 4, 5, 6, 7, 8, 9, 10
N				DCD		10
mean			DCD		0
				END
