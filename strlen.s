bits 64
global strlen
global __my_strlen


section .text

; rax(int) my_strlen(char *rdi)

__my_strlen:
strlen:
    mov rcx, 0
loop:
    cmp byte [rdi + rcx], 0
    je end
    inc rcx
    jmp loop
end:
    mov rax, rcx
    ret
