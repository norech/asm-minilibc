bits 64
global strstr
global __my_strstr

extern strlen
extern strncmp

section .text

; rax(char *) my_strstr(char *rdi, char *rsi)

; rcx = loop counter
; r14 = subloop counter

__my_strstr:
strstr:
    mov rcx, 0
    mov r14, 0
    mov rax, 0
    cmp byte [rsi + rcx], 0
    je found
loop:
    cmp byte [rdi + rcx], 0
    je not_found
    mov r14, 0
subloop:
    cmp byte [rsi + r14], 0
    je found
    mov r11, rcx
    add r11, r14
    mov r10b, byte [rsi + r14]
    cmp byte [rdi + r11], r10b
    jne loop_end
    inc r14
    jmp subloop
loop_end:
    inc rcx
    jmp loop
not_found:
    mov rax, 0
    ret
found:
    mov rax, rdi
    add rax, rcx
    ret
