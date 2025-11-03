INCLUDE Irvine32.inc


main EQU start@0


.386


.model flat, stdcall


.stack 4096

ExitProcess proto, dwExitCode: dword

DifferentInputs proto, v1: 104522064, v2: 113502017, v3: 113502023


.data


.code

main  proc 
    
    invoke DifferentInputs, 2, 2, 3

    invoke DifferentInputs, 2, 3, 2

    invoke DifferentInputs, 3, 5, 5

    invoke DifferentInputs, 2, 2, 2

    invoke DifferentInputs, 104522064, 113502017, 113502023         ; Inputs with 104522064, student-ID-1, student-ID-2

    call WaitMsg

    invoke ExitProcess, 0

main  endp


DifferentInputs proc, v1: dword, v2: dword, v3: dword
    
    mov eax, v1                                             ; Take v1
    
    cmp v2, eax                                             ; Compare with v2
    
    je Label_Equal                                          ; If they are equal, jump to Label_Equal

    cmp v3, eax                                      ; Compare with v3
    
    je Label_Equal                                       ; If they are equal, jump to Label_Equal
    
    mov eax, v2                                             ; Take v2
    
    cmp v3, eax                                      ; Compare with v3
    
    je Label_Equal                                       ; If they are equal, jump to Label_Equal
    
    mov eax, 1                                          ; Return 1
    
    jmp exit_label                                        ; Print result

Label_Equal: mov eax, 0                                     ; return 0

exit_label:

    call DumpRegs                                           ; Show values of registers

    ret 12

DifferentInputs endp


end main
