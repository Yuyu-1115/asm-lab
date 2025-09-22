TITLE lab3
INCLUDE Irvine32.inc

main EQU start@0

.data
    Result byte 9 DUP(?)
.code
Main PROC
    mov ecx, 9; length of Result is 9, hence we need to loop 9 times
    mov esi, 0; initialize the index to 0
    mov al, 9; initialize al

L1: mov Result[esi], al; copy the value from al to memory
    add al, 9; accumulating the value 9, 18, 27, ...
    inc esi ; incrementing the index
    loop L1 ; looping

    exit
main ENDP
END main
