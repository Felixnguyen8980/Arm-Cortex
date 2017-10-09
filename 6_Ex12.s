;compare Two dates
				INCLUDE stm32l1xx_constants.s		; Load Constant Definitions
				INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
				LDR	R0,=date1						;R0=&date1
				LDR	R1,=date2						;R1=&date2
				
year								
				LDR	R4,[R0,#8]						; R4=R0[2]
				LDR	R5,[R1,#8]						; R5=R1[2]
				CMP R4,R5				
				BEQ	month							;if year1=year2
				BLT dayBefore						;if year1 < year2
				B next
				
month			
				LDR R4,[R0,#0]						;R4=R0[0]
				LDR R5,[R1,#0]						;R5=R1[0]
				BEQ	day								;if month1=month2
				BLT	dayBefore						;if month1 < month2
				B 	next
day
				LDR R4,[R0,#4]						;R4=R0[0]
				LDR R5,[R1,#4]						;R5=R1[0]
				BLT dayBefore						;if day1 < day2
				B	next

dayBefore		MOV R0,1
				B stop
next			MOV R0,-1
				B stop
				
stop 			B 		stop     					; dead loop & program hangs here

				ENDP
				ALIGN			

				AREA    myData, DATA, READWRITE
				ALIGN
date1			DCD	8, 31 ,2014		;month, day, year
date2			DCD	01, 20 ,2015		;month, day, year
				END
