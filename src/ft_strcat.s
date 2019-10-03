; ----------------------------------------------------------------------------------------
;
; FT_STRCAT
; char *strcat(char *dest, const char *src);
; 
; ----------------------------------------------------------------------------------------
section .text
    extern _ft_strlen
    global _ft_strcat:
_ft_strcat:
    push rbp
    mov rbp, rsp

    call _ft_strlen
loop:
    cmp byte[rsi], 0
    je leave
    mov dh, byte [rsi]
    mov byte [rdi + rax], dh 
    inc rsi
    inc rax
    jmp loop
leave:
    mov byte [rdi + rax], 0
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret