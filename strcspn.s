bits 64
global strcspn
global __my_strcspn


section .text

; rax(size_t) my_strcspn(char *rdi, char *rsi)
; r11 = subloop counter

__my_strcspn:
strcspn:
    mov rcx, 0
loop:
    mov r11, 0
subloop:
    mov r12b, byte [rsi + r11]
    cmp r12b, 0
    je loop_end
    cmp byte [rdi + rcx], r12b
    je end
    inc r11
    jmp subloop
loop_end:
    cmp byte [rdi + rcx], 0
    je end
    inc rcx
    jmp loop
end:
    mov rax, rcx
    ret
