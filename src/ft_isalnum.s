; ----------------------------------------------------------------------------------------
; 
; FT_ISALNUM
;
; 
; ----------------------------------------------------------------------------------------

global _ft_isalnum
extern _ft_isalpha
extern _ft_isdigit

_ft_isalnum:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    call _ft_isdigit
    cmp rax, 1
    jne no
    jmp leave
no:
    call _ft_isalpha
leave:
    mov rsp, rbp
    pop rbp
    ret