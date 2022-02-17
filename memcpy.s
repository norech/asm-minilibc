bits 64
global memcpy
global __my_memcpy


section .text

; rax(void *) memcpy(void *rdi, char *rsi, int rdx)

__my_memcpy:
memcpy:
    mov rcx, 0
loop:
    cmp rcx, rdx
    jnl end
    mov r10b, byte [rsi + rcx]
    mov byte [rdi + rcx], r10b
    inc rcx
    jmp loop
end:
    mov rax, rdi
    ret
