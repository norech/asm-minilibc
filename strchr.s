bits 64
global strchr
global __my_strchr


section .text

; rax(char *) my_strchr(char *rdi, int rsi)

__my_strchr:
strchr:
    mov rcx, 0
loop:
    cmp byte [rdi + rcx], 0
    je notfound
    cmp byte [rdi + rcx], sil
    je found
    inc rcx
    jmp loop
notfound:
    mov rax, 0
    ret
found:
    mov rax, rdi
    add rax, rcx
    ret
