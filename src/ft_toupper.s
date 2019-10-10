; ----------------------------------------------------------------------------------------
;
; FT_TOUPPER
; int toupper( int character );
;
; ----------------------------------------------------------------------------------------

segment .text
    global _ft_toupper

_ft_toupper:
    push rbp
    mov rbp, rsp
    
    cmp rdi, 'a'
    jl .leave
    cmp rdi, 'z'
    jg .leave
    add rdi, 'A'
    sub rdi, 'a'
.leave:
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret