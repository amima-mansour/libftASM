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
    
    xor rcx, rcx
    dec rcx
loop:
    inc rcx
    cmp byte[rdi + rcx], 0
    jne loop
    mov rax, rcx
leave:    
    mov rsp, rbp
    pop rbp
    ret