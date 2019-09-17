; ----------------------------------------------------------------------------------------
;
; FT_STRCPY
; char	*ft_strcpy(char *dest, char const *src)
;
; ----------------------------------------------------------------------------------------

global _ft_strcpy
_ft_strcpy:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    xor rcx, rcx
loop:
    cmp byte[rsi], 0
    je leave
    mov bl, byte [rsi]
    mov byte [rdi + rcx], bl
    inc rcx
    inc rsi
    jmp loop
leave:
    mov byte [rdi + rcx], 0
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret