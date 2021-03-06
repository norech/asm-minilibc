bits 64
global memmove
global __my_memmove


section .text

; rax(void *) memmove(void *rdi, char *rsi, int rdx)

__my_memmove:
memmove:
    cmp rdi, rsi
    jnl bwd
fwd:
    mov rcx, 0
loopfwd:
    cmp rcx, rdx
    jnl end
    mov r10b, byte [rsi + rcx]
    mov byte [rdi + rcx], r10b
    inc rcx
    jmp loopfwd
bwd:
loopbwd:
    cmp rdx, 0
    je end
    mov r10b, byte [rsi + rdx - 1]
    mov byte [rdi + rdx - 1], r10b
    dec rdx
    jmp loopbwd
end:
    mov rax, rdi
    ret
