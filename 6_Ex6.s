;E=MC^2 but overflow
				INCLUDE stm32l1xx_constants.s		; Load Constant Definitions
				INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
				MOV R0,#15
				LDR R1,=C
				LDR R1,[R1]
				MUL R1,R1,R1
				MUL R2,R0,R1
								
stop 			B 		stop     					; dead loop & program hangs here

				ENDP
				ALIGN			

				AREA    myData, DATA, READWRITE
				ALIGN
C				DCD   299792458
				END
