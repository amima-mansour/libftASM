; ----------------------------------------------------------------------------------------
;
; FT_STRDUP
; char *strdup(const char *s);
; to use malloc
; ----------------------------------------------------------------------------------------

global _ft_strdup
extern _ft_strlen
extern _malloc

_ft_strdup:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    
    call _ft_strlen
    mov rsi, rdi
    mov rdi, rax
    add rdi, 1
    call _malloc
    xor rcx, rcx
    sub rdi, 1
loop:
    inc rcx
    cmp rcx, rdi
    jge leave
    mov bl, byte [rsi + rcx]
    mov byte [rax + rcx], bl 
    jmp loop
leave:
    mov byte [rax + rcx], 0
    mov rsp, rbp
    pop rbp
    ret