TITLE HW3 CountMatches
INCLUDE Irvine32.inc

main EQU start@0

CountMatches PROTO,
	ary1: PTR SDWORD,
	ary2: PTR SDWORD,
	aSize: DWORD

CountMatchesExtra PROTO,
	ary1: PTR SDWORD,
	ary2: PTR SDWORD,
	aSize: DWORD

.data
	array1 SDWORD 10, 5, 4, -6, 2, 11, 12
	array2 SDWORD 10, 5, 3, 1, 4, 2, -6

	array1ex SDWORD 10, 5, 4, -6, 2, 11, 12
	array2ex SDWORD 10, 5, 3, 1, 4, 2, -6
.code

main PROC 
	invoke CountMatches, ADDR array1, ADDR array2, 7
	invoke CountMatchesExtra, ADDR array1ex, ADDR array2ex, 7
	exit
main ENDP

CountMatches PROC,
	ary1: PTR SDWORD,
	ary2: PTR SDWORD,
	aSize: DWORD

	xor eax, eax; initialize eax
	mov ecx, aSize; we need to loop {length} times
	mov esi, ary1
	mov edi, ary2

L1:
	mov ebx, [esi]
	cmp ebx, [edi]
	jne NOT_EQUAL
	inc eax

NOT_EQUAL:
	add esi, 4
	add edi, 4
	loop L1

	call DumpRegs; show the value of eax
	ret

CountMatches ENDP

CountMatchesExtra PROC,
	ary1: PTR SDWORD,
	ary2: PTR SDWORD,
	aSize: DWORD

	xor eax, eax; initialize eax
	mov ecx, aSize; we need to loop {length} times
	mov edx, aSize; for outer loop counter
	mov esi, ary1
	mov edi, ary2

OUTER:
	mov ecx, aSize; we need to loop {length} times for each element
	mov ebx, [esi]; 
	mov edi, ary2; reset edi
INNER:
	cmp ebx, [edi]
	jne NOT_EQUAL2
	inc eax
NOT_EQUAL2:
	add edi, 4
	loop INNER
	add esi, 4
	dec edx
	mov ecx, edx
	loop OUTER;

	call DumpRegs; show the value of eax
	ret
CountMatchesExtra ENDP

END main
