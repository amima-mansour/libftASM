; ----------------------------------------------------------------------------------------
; 
; FT_STRCMP
; int	strcmp(char const *str1, char const *str2)
; 
; ----------------------------------------------------------------------------------------

global _ft_strcmp
_ft_strcmp:
    push rbp
    mov rbp, rsp
    sub rsp, 16
loop:
    movzx rax, byte[rdi]
    movzx rbx, byte[rsi]
    sub rax, rbx
    cmp byte[rdi], 0
    je leave
    cmp rbx, 0
    je leave
    cmp rax, 0
    jne leave
    inc rdi
    inc rsi
    jmp loop
leave:
    mov rsp, rbp
    pop rbp
    ret