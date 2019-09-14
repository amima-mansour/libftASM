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
    
    mov rbx, rdi
    call _ft_strlen
    mov rdx, rax
    mov rdi, rsi
    call _ft_strlen
    mov r8, rax
    mov rax, rbx
    sub rcx, rcx
loop:
    cmp rcx, r8
    jge leave
    mov dl, byte [rdi + rcx]
    mov byte [rax + rdx], dl 
    inc rcx
    inc rdx
    jmp loop
leave:
    mov rsp, rbp
    pop rbp
    ret