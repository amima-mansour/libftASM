; ----------------------------------------------------------------------------------------
; 
; FT_ISALPHA
;
; 
; ----------------------------------------------------------------------------------------

global _ft_isalpha

_ft_isalpha:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    cmp rdi, 'A'
    jl no
    cmp rdi, 'z'
    jg no
    cmp rdi, 'Z'
    jl yes
    cmp rdi, 'a'
    jl no
    jmp yes
yes:
    mov rax, 1
    jmp leave
no:
    mov rax, 0
    jmp leave
leave:
    mov rsp, rbp
    pop rbp
    ret