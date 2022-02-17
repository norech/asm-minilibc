bits 64
global memmove
global __my_memmove


section .text

; rax(void *) memmove(void *rdi, char *rsi, int rdx)

__my_memmove:
memmove:
    mov rcx, 0
looppush:
    cmp rcx, rdx
    jnl looppop
    mov r10b, byte [rsi + rcx]
    push r10
    inc rcx
    jmp looppush
looppop:
    pop r10
    dec rcx
    mov byte [rdi + rcx], r10b
    cmp rcx, 0
    je end
    jmp looppop
end:
    mov rax, rdi
    ret
