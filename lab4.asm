INCLUDE  Irvine32.inc ;
main EQU start@0
.data
    myID byte "113502023",0
    myID2 byte "113502023",0
    size_ID Dword 9 

.Code
main PROC
    mov eax,9999h;
    mov ebx,9999h;
    mov ecx,9999h;
    mov edx,9999h;
    mov esi,OFFSET myID;
    mov ecx,size_ID
    call Convert

    mov esi,OFFSET myID2
    mov ecx,size_ID
    call Convert2
    
exit
main ENDP

Convert PROC USES eax	;
L1:
	mov al,[esi];
    sub al,'0';
    add al,'A';
    mov [esi],al;
    inc esi;
    loop L1
    ret
Convert ENDP

Convert2 PROC		;Convert2 do the same thing as ConvertL1:
L1:	
    mov al,[esi];
    sub al,'0';
    add al,'A';
    mov [esi],al;
    inc esi;  	
    loop L1
    ret
Convert2 ENDP
END main
