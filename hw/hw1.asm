TITLE HW1 Arithmetics
INCLUDE Irvine32.inc

.data
    MyID DWORD ?
    Digit0 BYTE 2h
    Digit1 BYTE 0h
    Digit2 BYTE 1h
    Digit3 BYTE 7h

.code
main PROC
    movzx eax, Digit0; Moving the first digit to eax to fit DWORD
    shl eax, 24; Shift to the first 8 bit of eax
    movzx ebx, Digit1; Moving the second digit to ebx to fit DWORD
    shl ebx, 16; Shift to the second byte
    add eax, ebx; Add Digit1 to eax
    movzx ebx, Digit2; Moving the third digit to ebx to fit DWORD
    shl ebx, 8; Shift to the third byte
    add eax, ebx; Add Digit2 to eax
    movzx ebx, Digit3; Moving the last digit to ebx to fit DWORD
    add eax, ebx; Add Digit3 to eax
    mov MyID, eax; Copy the value back to the memory
    exit; prperly exit the program
main ENDP
END main
