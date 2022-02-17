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
    mov rcx, rdx
    dec rcx
loopbwd:
    mov r10b, byte [rsi + rcx]
    mov byte [rdi + rcx], r10b
    cmp rcx, 0
    je end
    dec rcx
    jmp loopbwd
end:
    mov rax, rdi
    ret
