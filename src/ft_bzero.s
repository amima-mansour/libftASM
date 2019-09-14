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
    sub rsp, 16
loop:
    dec rsi
    cmp rsi, 0
    jl leave
    mov byte [rdi + rsi], 0
    jmp loop
leave:
    mov rsp, rbp
    pop rbp
    ret