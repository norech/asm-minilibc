bits 64
global strncmp
global __my_strncmp


section .text

; rax(int) my_strncmp(char *rdi, char *rsi, int rdx)

__my_strncmp:
strncmp:
    mov rcx, 0
    mov r10, 0
    mov rax, 0
loop:
    cmp byte [rdi + rcx], 0
    je end
    cmp byte [rsi + rcx], 0
    je end
    cmp rcx, rdx
    jnl equals
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
equals:
    ret
