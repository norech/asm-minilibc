bits 64
global strrchr
global __my_strrchr

extern strlen

section .text

; rax(char *) my_strrchr(char *rdi, int rsi)

__my_strrchr:
strrchr:
    mov rax, 0
    call strlen WRT ..plt
    mov rcx, rax
    mov rax, 0
loop:
    cmp byte [rdi + rcx], sil
    je found
    cmp rcx, 0
    je notfound
    dec rcx
    jmp loop
notfound:
    mov rax, 0
    ret
found:
    mov rax, rdi
    add rax, rcx
    ret
