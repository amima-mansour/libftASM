; ----------------------------------------------------------------------------------------
;
; FT_ABS
; int	ft_abs(int n)
;
; ----------------------------------------------------------------------------------------

global _ft_abs

_ft_abs:
    push rbp
    mov rbp, rsp
    mov rax, rdi
    sar rax, 31
    cmp rax, 1
    je neg
    jmp leave
neg:
    neg rdi
leave:
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret