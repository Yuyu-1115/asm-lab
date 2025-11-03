INCLUDE Irvine32.inc


main EQU start@0


Str_remove proto,
	pStart: PTR BYTE,
	nChars: DWORD


.data

target1 BYTE "113502017", 0							; Initialize string with student-ID-1

target2 BYTE "113502023", 0							; Initialize string with student-ID-2

target3 BYTE "999999999", 0
  

.code

main PROC

	INVOKE Str_remove, OFFSET target1, 5		; Remove 5 char

	mov edx, OFFSET target1

	call WriteString

	call Crlf

	INVOKE Str_remove, OFFSET target2, 2 		; Remove 2 char

	mov edx, OFFSET target2

	call WriteString

	call Crlf

	INVOKE Str_remove, OFFSET [target2 + 1], 15	; remove the length over the target2
	
	mov edx, OFFSET target2
	
	call WriteString
	
	call Crlf
	
	call WaitMsg
	
	exit

main ENDP


Str_remove PROC,
	pStart: PTR BYTE,   						; Points to first character to delete
	nChars: DWORD       						; The amount of characters that have to be deleted.

	INVOKE Str_length, pStart					; Get the string length

	mov	ecx, eax								; The length save in ecx, it will be used by loop

	.IF nChars <= ecx							; Check whether nChars exceeds the string size

		sub ecx, nChars							; If no exceed, then ecx = ecx - nChars

	.ENDIF

	mov	esi, pStart							; Set the begining of the copy source 

	add	esi, nChars								; Move the starting to the correct location

	mov	edi, pStart							; Set the destination position 

	cld										; Clear direction flag (forward)

	rep	movsb								; Move characters

	mov	BYTE PTR [edi], 0						; Insert new null byte

Exit_proc:

	ret 8

Str_remove ENDP


END main
