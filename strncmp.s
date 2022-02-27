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
    cmp rdx, 0 ; loop while n > 0, or return 0 if n == 0
    jle equals
    dec rdx
    mov r10b, [rsi + rcx]
    cmp byte [rdi + rcx], r10b ; if rdi[i] != rsi[i], return difference
    jne different
    cmp byte [rdi + rcx], 0 ; if rdi[i] == '\0', return 0
    je equals
    inc rcx
    jmp loop
different:  ; returns rsi[i] - rdi[i]
    mov r10b, [rsi + rcx]
    mov al, [rdi + rcx]
    sub rax, r10
    ret
equals:  ; returns 0
    mov rax, 0
    ret
