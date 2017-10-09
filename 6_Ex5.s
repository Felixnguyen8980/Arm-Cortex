
include stm3211xx_constant.s ;Load constant Definitions
include stm4322xx_tim_constants.s ; TIM constant 
AREA main, CODE, READONLY
EXPORT _main ;make _main visible to linker
ENTRY
_main		PROC
		LDR R1,=s			;R1=&s[0]
loop	LDRB R0,[R1] 		;load ki tu vao R0	dung LDRB de load 1 byte
		CBZ R0,endloop 		;neu ki tu Null thi thoat vong lap
		CMP R0,#'a'			;ss R0 vs a 
		BLO next
		CMP R0,#'z'
		BHI next
convert 
		SUB R0,#32			;Chuyen thuong->hoa va luu vao bo nho
		STRB R0,[R1]		;luu ky tu 1 byte
next
		ADD R1,#1			;tro den ki tu tiep
		B loop				;tiep tuc lap
			
endloop


stop	B	stop; dead lood & program hangs here
		ENDP
	
		AREA myData, DATA, READWRITE
		ALIGN
S 		DCB "Arm-Coxtex M3",0 ;chuoi ky tu
	
		END