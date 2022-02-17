bits 64
global strrchr
global __my_strrchr

extern strchr

section .text

; rax(char *) my_strrchr(char *rdi, int rsi)

__my_strrchr:
strrchr:
    mov rax, 0
loop:
    mov r10, rax
    call strchr WRT ..plt
    cmp rax, 0
    je end
    mov rdi, rax
    inc rdi
    jmp loop
end:
    mov rax, r10
    ret
