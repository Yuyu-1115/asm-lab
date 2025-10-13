TITLE Lab5
INCLUDE  Irvine32.inc
main EQU start@0
.data
    myID byte "13502017" ,0
    myID2 byte "13502023" ,0
    size_ID dword 8
    result byte 8 DUP(?)

.Code
main PROC
    mov esi, 0; initialize pointer index
    mov ecx, size_ID; initialize loop iterator

L1: mov al, myID[esi]; prevent memory-to-memory comparison
    cmp al, myID2[esi]; comparison
    jb CB; jump to below if myID[esi] < myID2[esi]
    je CE; jump to below if myID[esi] = myID2[esi]
    ja CA; jump to below if myID[esi] > myID2[esi]

CB:
    mov result[esi], 'C'
    jmp NEXT; skip the rest
CE:
    mov result[esi], 'A'
    jmp NEXT; skip the rest
CA:
    mov result[esi], 'B'
    jmp NEXT; skip the rest
NEXT:
    inc esi; increment index
    loop L1;
    exit
main ENDP
END main
