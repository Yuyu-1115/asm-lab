INCLUDE Irvine32.inc

main EQU start@0

.stack 4096

ExitProcess proto,dwExitCode:dword

FindLargest proto, aPtr : SDWORD , arraySize : DWORD   ;宣告FindLargest procedure 的prototype

.data

Ex1Array sdword 105522063 , 113502017 , 113502023          ;陣列初始為105522063, 組員學號1 ,組員學號2

Ex2Array sdword -105522063 , -113502017 , -113502023     ;陣列初始為-105522063, 組員學號1加負號 ,組員學號2加負號

.code

main proc

    invoke FindLargest, OFFSET Ex1Array , LENGTHOF Ex1Array

    invoke FindLargest, OFFSET Ex2Array , LENGTH Ex2Array

    ;呼叫FindLargest procedure


    call WaitMsg

    invoke ExitProcess,0

main endp


FindLargest proc,    aPtr : SDWORD ,  arraySize : DWORD

    push esi

    push ecx

    mov  eax,  80000000h      ; smallest possible 32bit signed integer

    mov  esi, aPtr     ; point to the first element

    mov  ecx, arraySize     ; set iteration times

 

L1: cmp eax , [esi]      ; compare the current value and current maximum

	jge	L2          ; smaller than max,jump to L2

    mov  eax, [esi]     ; update max value

 

L2: add  esi,4       

    loop L1

    call WriteInt

    call Crlf

   

    pop ecx

    pop esi

    ret               ; Return from subroutine

FindLargest endp

 

end main