INCLUDE Irvine32.inc

main EQU start@0

.data
Av REAL8 6.0
Bv REAL8 4.0
Cv REAL8 2.0
Dv REAL8 5.0
Ev REAL8 3.0

.code
main PROC

	call Clrscr

	; Reverse polish: A B + C / D A - E + *
	fld		Av	; ( A + B )
	fadd	Bv
	fdiv	Cv	; ( A + B ) / C -> <1>
	
	fld		Dv	; ( D - A )
	fsub	Av
	fadd	Ev	; ( D - A ) + E -> <2>
	
	; ST(0) = <2>, and ST(1) = <1>
	call	ShowFPUStack	; Just for debugging

	fmul			; ST(1) * ST(0)
	call	WriteFloat	; Show ST(0)
	call	Crlf
	call	WaitMsg
	exit

main ENDP

END main
