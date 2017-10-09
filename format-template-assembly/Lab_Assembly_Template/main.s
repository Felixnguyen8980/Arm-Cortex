

				INCLUDE stm32l1xx_constants.s		; Load Constant Definitions
				INCLUDE stm32l1xx_tim_constants.s   ; TIM Constants

				AREA    main, CODE, READONLY
				EXPORT	__main						; make __main visible to linker
				ENTRY
				
__main			PROC
				LDR		R0,=array						;1st argument R0=&array
				MOV		R1,#0							;2nd argument i=0
				BL 		upcase							;recursive call
stop			B stop
				ENDP	


upcase			PROC
					PUSH	{lr}
	loop			MOV		R3,R0							;R3=&array	
					ADD		R3,R0,R1						;R3=&array[i]
					LDRB	R2,[R3]							;R2=array[0]  LOADBYE
					CMP		R2,#0									
					BEQ		exit
					CMP		R2,'a'							;R2 >='a'	
					BGE		next
					B		skip
	next			CMP		R2,'z'							;R2 <= 'z'
					BLE		next1
					B		skip
	next1			SUB		R2,#32							;Upcase
	skip			ADD		R1,R1,#1						;i++
					
					STRB	R2,[R3]							;STORE BYTE
					B		loop
	exit			POP		{PC}
				ENDP	
				AREA    myData, DATA, READWRITE
				ALIGN
array			DCB   "heelo",0
				END
