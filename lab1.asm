TITLE Example of ASM              (helloword.ASM)

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


.Code
main PROC
mov al, 01100111b ; assign binary value 01100111 to the al register.
mov ah, 67 ;assign decimal value 67 into the ah register.
mov ax, 2067h ; assign hexadecimal value 2067h to the ax register.
mov dx, 0eeeah ; let the value of dx be eeea
sub dx,ax ; subtract the value of ax from the value of dx
main ENDP
END main
