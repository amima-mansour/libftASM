; ----------------------------------------------------------------------------------------
;
; FT_STRDUP
; char *strdup(const char *s);
; to use malloc
; ----------------------------------------------------------------------------------------
section .text
global _ft_strdup
extern _ft_strlen
extern _ft_strnew
extern _ft_strcpy

_ft_strdup:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    
    call _ft_strlen
    mov [rsp], rdi
    mov rdi, rax
    add rdi, 1
    call _ft_strnew
    cmp rax, 0
    je leave
    mov rdi, rax
    mov rsi, [rsp]
    call _ft_strcpy
leave:
    mov rsp, rbp
    pop rbp
    ret