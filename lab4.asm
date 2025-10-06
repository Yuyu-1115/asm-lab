TITLE Lab4
INCLUDE  Irvine32.inc
main EQU start@0
.data
    myID byte "113502023",0
    myID2 byte "113502023",0
    size_ID Dword 9 

.Code
main PROC
    mov eax,9999h
    mov ebx,9999h
    mov ecx,9999h
    mov edx,9999h
    mov esi,OFFSET myID; Get the memory address of myID
    mov ecx,size_ID; Set the loop counter to 9
    call Convert; call the procedure with USES macro

    mov esi,OFFSET myID2; update the pointer
    mov ecx,size_ID; redundant
    call Convert2; call the procedure withour USES macro
    
exit
main ENDP

Convert PROC USES eax ebx ecx edx	;
L1:	mov al,[esi]; Copy the data from memory to register
    sub al,'0';; Get the numerical value of character
    add al,'A';; Map 0-A, 1-B, and so on...
    mov [esi],al; Send the value back to registers
    inc esi; Increment the index or the pointer
    loop L1
    ret
Convert ENDP

Convert2 PROC		;Convert2 do the same thing as ConvertL1:
L1: mov al,[esi];
    sub al,'0'
    add al,'A'
    mov [esi],al
    inc esi
    loop L1
    ret
Convert2 ENDP
END main
