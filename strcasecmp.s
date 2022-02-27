bits 64
global strcasecmp
global __my_strcasecmp


section .text

; rax(int) my_strcasecmp(char *rdi, char *rsi)

__my_strcasecmp:
strcasecmp:
    mov rcx, 0
    mov r10, 0
    mov rax, 0
loop:
    cmp byte [rdi + rcx], 0
    je end
    cmp byte [rsi + rcx], 0
    je end
    mov r10b, [rsi + rcx]
    mov r11b, [rdi + rcx]
r10b_set_lower:
    cmp r10b, 'A'
    jl r11b_set_lower
    cmp r10b, 'Z'
    jg r11b_set_lower
    add r10b, 32
r11b_set_lower:
    cmp r11b, 'A'
    jl loop_end
    cmp r11b, 'Z'
    jg loop_end
    add r11b, 32
loop_end:
    cmp byte r11b, r10b
    jne different
    inc rcx
    jmp loop
end:
    cmp r11b, 0
    jne different
    cmp r10b, 0
    jne different
    ret
different:
    mov r10b, [rsi + rcx]
    mov al, [rdi + rcx]
    sub rax, r10
    ret
