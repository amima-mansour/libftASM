; ----------------------------------------------------------------------------------------
;
; FT_BZERO
; 
; 
; ----------------------------------------------------------------------------------------

global _ft_bzero
_ft_bzero:
    push rbp
    mov rbp, rsp
.loop:
    cmp rsi, 0
    je .leave
    mov byte [rdi], 0
    inc rdi
    dec rsi
    jmp .loop
.leave:
    mov rsp, rbp
    pop rbp
    ret