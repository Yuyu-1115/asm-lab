TITLE HW2 Procedure
INCLUDE Irvine32.inc

main EQU start@0

.data
    MyID DWORD 7

.code

fact PROC
    mov ecx, ebx; used for conditional jump
    mov edx, eax; temp value for multiplicand
    jecxz TER; if ecx == 0, the recursion temrinates
    jmp MP; if ecx > 0, keep factorial going
MP:
    mov eax, ebx
    mul edx; eax = eax * edx
    dec ebx; decrementing ebx for fact(x - 1)
    call fact 
TER:
    ret
fact ENDP

main PROC
    mov eax, 1; initializing
    mov ebx, MyID
    call fact
main ENDP
END main
