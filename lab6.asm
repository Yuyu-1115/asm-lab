TITLE Lab6
INCLUDE  Irvine32.inc
main EQU start@0
.data
    result byte 81 DUP(?)

.Code
main PROC
    mov esi, 0; initialize pointer index
    mov bh, 0; mulitplicand
    mov bl, 0; multiplier

L1:
    inc bh; increment the multiplicand
    mov bl, 1; reset the multiplier
    mov ecx, 9;
L2:
    mov al, bh; move the multiplicand to al for preparation
    mul bl; ax = al * bl = bh * bl
    mov result[esi], al; 1~81 < 127, so it's safe to copy al over

    inc bl; increment the multiplier
    inc esi; increment the index

    loop L2; loop from 1 to 9
    mov ecx, 10
    movzx edx, bh; align with register size
    sub ecx, edx; ecx = 10 - bh
    loop L1
RES:
    exit
main ENDP
END main
