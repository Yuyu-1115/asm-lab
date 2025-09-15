TITLE  lab2             

; This program locates the cursor and displays the
; system time. It uses two Win32 API structures.


INCLUDE Irvine32.inc

; Redefine external symbols for convenience
; Redifinition is necessary for using stdcall in .model directive 
; using "start" is because for linking to WinDbg.  added by Huang
 
main          EQU start@0

;Comment @
;Definitions copied from SmallWin.inc:

.data
Value1	SBYTE	03h
Value2	SBYTE	02h
Value3	SBYTE	8fh
Result	SDWORD	?
.code
main PROC
 
    movsx ax, Value1; assigning the value from memory to register
    movsx bx, Value2; where ax = v1, bx = v2, and cx = v3
    movsx cx, Value3; note: we use v1, v2, v3 to represent Value1, Value2, and Value3
    add ax, bx ; ax = v1 + v2
    shl ax, 1; ax = 2 * (v1 + v2)
    sub cx, ax ; cx = v3 - 2 * (v1 + v2)
    shl ax, 1; ax = 4 * (v1 + v2)
    sub cx, ax ; cx = v3 - 6 * (v1 + v2)
    shl ax, 1; ax = 8 * (v1 + v2)
    sub cx, ax ; cx = v3 - 14 * (v1 + v2)
    neg cx; cx = - (v3 - 14 * (v1 + v2))
    movsx ecx, cx;
    mov Result, ecx; move the result back to the memory
 
	exit
main ENDP
END main
