bits 64
global strpbrk
global __my_strpbrk


section .text

; rax(char *) my_strpbrk(char *rdi, char *rsi)
; r11 = subloop counter

__my_strpbrk:
strpbrk:
    mov rcx, 0
loop:
    mov r11, 0
subloop:
    mov r12b, byte [rsi + r11]
    cmp r12b, 0
    je loop_end
    cmp byte [rdi + rcx], r12b
    je found
    inc r11
    jmp subloop
loop_end:
    cmp byte [rdi + rcx], 0
    je notfound
    inc rcx
    jmp loop
notfound:
    mov rax, 0
    ret
found:
    mov rax, rdi
    add rax, rcx
    ret
