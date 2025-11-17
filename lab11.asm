INCLUDE Irvine32.inc


.data
consoleHandle DWORD ?
xyInit  COORD <18, 18>	; starting coordinate
xyBound COORD <80, 25>
xyPos   COORD <?, ?>	; position of cursor


main EQU start@0


.code
main PROC

	; Get the Console standard output handle
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov consoleHandle, eax

	INITIAL:
		; set the starting position	
		mov ax, xyInit.x
		mov xyPos.x, ax
		mov ax, xyInit.y
		mov xyPos.y, ax

	START:
		call ClrScr
		INVOKE SetConsoleCursorPosition, consoleHandle, xyPos
		call ReadChar

		; Detect input char
		; UP ARROW, or W
		.IF ax == 1177h		
			sub xyPos.y, 1
		.ENDIF

		; DOWN ARROW, or S
		.IF ax == 1F73h
			add xyPos.y, 1
		.ENDIF

		; LEFT ARROW, or A
		.IF ax == 1E61h
			sub xyPos.x, 1
		.ENDIF

		; RIGHT ARROW, or D
		.IF ax == 2064h
			add xyPos.x, 1
		.ENDIF

		; ESC
		.IF ax == 011Bh
			jmp END_FUNC
		.ENDIF

		; Detect border
		; If over the border then stay at the original position
		; x lowerbound
		.IF xyPos.x == 0h
			mov xyPos.x, 1
		.ENDIF

		; x upperbound
		mov ax,xyBound.x
		.IF xyPos.x == ax
			mov xyPos.x, 79
		.ENDIF

		; y lowerbound
		.IF xyPos.y == 0h
			mov xyPos.y, 1
		.ENDIF

		; y upperbound
		mov ax,xyBound.y
		.IF xyPos.y == ax
			mov xyPos.y, 24
		.ENDIF
		
		jmp START
		
	END_FUNC:
		exit

main ENDP

END main 
