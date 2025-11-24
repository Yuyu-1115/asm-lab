INCLUDE Irvine32.inc

BoxWidth = 7
BoxHeight = 5

.data
boxTop    BYTE 0dah, (BoxWidth - 2) DUP(0c4h), 0bfh
boxBody   BYTE 0b3h, (BoxWidth - 2) DUP(' '), 0b3h
boxBottom BYTE 0c0h, (BoxWidth - 2) DUP(0c4h), 0d9h

outputHandle DWORD 0
bytesWritten DWORD 0
count DWORD 0
xyPosition COORD <10,5>

cellsWritten DWORD ?
attributes0 WORD BoxWidth DUP(0bh)
attributes1 WORD (BoxWidth-1) DUP(0ah), 0eh
attributes2 WORD BoxWidth DUP(0ch)

.code
main EQU start@0
main PROC

	; Get the console ouput handle
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov outputHandle, eax	; save console handle
	call Clrscr
	
	; draw top of the box
	INVOKE WriteConsoleOutputAttribute,
	  outputHandle, 
	  ADDR attributes0,
	  boxWidth, 
	  xyPosition,
	  ADDR count

	INVOKE WriteConsoleOutputCharacter,
	   outputHandle,	; console output handle
	   ADDR boxTop,	; pointer to the top box line
	   boxWidth,	; size of box line
	   xyPosition,	; coordinates of first char
	   ADDR count	; output count

	inc xyPosition.y	; next line

	; draw body of the box
	mov ecx, BoxHeight	; number of lines in body
L1:	push ecx	; save counter

	INVOKE WriteConsoleOutputAttribute,
	  outputHandle, 
	  ADDR attributes1,
	  boxWidth, 
	  xyPosition,
	  ADDR count


	INVOKE WriteConsoleOutputCharacter,
	   outputHandle,	; console output handle
	   ADDR boxBody,	; pointer to the box body
	   boxWidth,	; size of box line
	   xyPosition,	; coordinates of first char
	   ADDR count	; output count

	inc xyPosition.y	; next line
	pop ecx	; restore counter
	loop L1

	; draw bottom of the box
	INVOKE WriteConsoleOutputAttribute,
	  outputHandle, 
	  ADDR attributes2,
	  boxWidth, 
	  xyPosition,
	  ADDR count
	  	
	INVOKE WriteConsoleOutputCharacter,
	   outputHandle,	; console output handle
	   ADDR boxBottom,	; pointer to the bottom of the box
	   boxWidth,	; size of box line
	   xyPosition,	; coordinates of first char
	   ADDR count	; output count

	   call WaitMsg
	   call Clrscr
	exit
main ENDP
END main
