bits 64
global strcmp
global __my_strcmp


section .text

; rax(int) my_strcmp(char *rdi, char *rsi)

__my_strcmp:
strcmp:
    mov rcx, 0
    mov r10, 0
    mov rax, 0
loop:
    cmp byte [rdi + rcx], 0
    je end
    cmp byte [rsi + rcx], 0
    je end
    mov r10b, [rsi + rcx]
    cmp byte [rdi + rcx], r10b
    jne different
    inc rcx
    jmp loop
end:
    cmp byte [rsi + rcx], 0
    jne different
    cmp byte [rdi + rcx], 0
    jne different
    ret
different:
    mov r10b, [rsi + rcx]
    mov al, [rdi + rcx]
    sub rax, r10
    ret
