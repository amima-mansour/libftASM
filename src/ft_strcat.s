; ----------------------------------------------------------------------------------------
;
; FT_STRCAT
; char *strcat(char *dest, const char *src);
; 
; ----------------------------------------------------------------------------------------

global _ft_strcat
extern _ft_strlen
_ft_strcat:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    
    call _ft_strlen
    mov rdx, rax
    mov rbx, rdi
    mov rdi, rsi
    call _ft_strlen
    mov r8, rax
    mov rdi, rbx
    sub rcx, rcx
loop:
    cmp rcx, r8
    je leave
    mov bl, byte [rsi + rcx]
    mov byte [rdi + rdx], bl 
    inc rcx
    inc rdx
    jmp loop
leave:
    mov byte [rdi + rdx], 0
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret