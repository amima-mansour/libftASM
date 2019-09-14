; ----------------------------------------------------------------------------------------
;
; FT_STRLEN
; 
;
; ----------------------------------------------------------------------------------------

segment .text
    global _ft_strlen

_ft_strlen:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    
    xor rcx, rcx
    xor rax, rax
    dec rcx
    .loop:
    inc rcx
    cmp byte[rdi + rcx], 0
    jne .loop
    mov rax, rcx
    mov rsp, rbp
    pop rbp
    ret