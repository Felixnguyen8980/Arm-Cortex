;Find mininus
				INCLUDE stm32l1xx_constants.s		; Load Constant Definitions
				INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
				LDR		R0,=x	
				LDR		R1,=y
				LDR 	R3,=z
				LDR		R0,[R0]
				LDR		R1,[R1]
				LDR		R3,[R3]
				CMP		R0,R1
				BLT		xmin					;(x<y)
				B		ymin					;(y<=x)
				
xmin			CMP		R0,R3	
				BLT		minx						;(x<y && x<z)
				B 		minz						;(x<y && z<x)
				
ymin			CMP		R1,R3
				BLT 	miny						;(y<=x && y<z)					
				B		minz						;(y<=x && y>=z)
					
minx			
				MOV R4,R0
				B stop
miny
				MOV R4,R1
				B stop
minz
				MOV R4,R3
				B stop
				
								
stop 			B 		stop     					; dead loop & program hangs here

				ENDP
				ALIGN			

				AREA    myData, DATA, READWRITE
				ALIGN
x				DCD	1
y				DCD	1
z				DCD	3

				END
