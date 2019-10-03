; ----------------------------------------------------------------------------------------
;
; FT_TOLOWER
; int tolower ( int character );
;
; ----------------------------------------------------------------------------------------

segment .text
    global _ft_tolower

_ft_tolower:
    push rbp
    mov rbp, rsp
    
    cmp rdi, 'A'
    jl leave
    cmp rdi, 'Z'
    jg leave
    sub rdi, 'A'
    add rdi, 'a'
leave:
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret