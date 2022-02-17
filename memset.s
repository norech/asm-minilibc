bits 64
global memset
global __my_memset


section .text

; rax(void *) memset(void *rdi, int rsi, int rdx)

__my_memset:
memset:
    mov rcx, 0
loop:
    cmp rcx, rdx
    jl end
    mov byte [rdi + rcx], sil
    inc rcx
    jmp loop
end:
    mov rax, rdi
    ret
