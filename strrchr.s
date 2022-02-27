bits 64
global strrchr
global __my_strrchr

extern strlen

section .text

; rax(char *) my_strrchr(char *rdi, int rsi)

__my_strrchr:
strrchr:
    call strlen WRT ..plt
    mov rcx, rax
loop:
    cmp byte [rdi + rcx], sil
    je found
    cmp byte [rdi + rcx], 0
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
