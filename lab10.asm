INCLUDE Irvine32.inc

 

Str_copyN PROTO, 
    source:PTR BYTE,   ; source string address
    target:PTR BYTE,   ; target string address
    maxChars:DWORD      ; maximum number of characters to copy


main          EQU start@0

.data

string_1 BYTE "113502017",0    ; student ID1

string_2 BYTE "113502023",0    ; student ID2

.code

main PROC 

    INVOKE Str_copyN,        ; copy string_1 to string_2
      OFFSET string_1,        
      OFFSET string_2 + SIZEOF string_2 - 1,     
      (SIZEOF string_1) - 1  ; save space for null byte

 

; Display the destination string

    mov  edx, OFFSET string_2

    call WriteString

    call Crlf

    call WaitMsg

    exit

main ENDP

 

Str_copyN PROC USES eax ecx esi edi,
    source:PTR BYTE,     ; source string
    target:PTR BYTE,     ; target string
    maxChars:DWORD       ; max chars to copy

; Copy a string from source to target, limiting the number

; of characters to copy by macChars.

; The value in maxChars does not include the null byte.

 

    mov ecx, maxChars       ; set counter for REP

    mov esi, source       ; assign source

    mov edi, target         ; assign target

    cld                 ; clear direction flag (direction = forward)

    rep movsb           ; copy the string

    mov al, 0            ; set null byte to register

    stosb               ; append null byte

    ret             ; clear data in stack

Str_copyN ENDP

 

END main
