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
    ; save rdi
    push rdi
    ; *al = '\0'
    xor al, al
    ; clear rcx
    xor rcx, rcx
    ; *rcx = ~*rcx
    not rcx
    ; while (*al /* '\0' */ != *rdi) ++rdi, --*rcx;
    cld ; clear direction flag 
    repne scasb
    ; *rcx = ~*rcx
    not rcx
    dec rcx
    mov rax, rcx
    pop rdi
.leave:    
    mov rsp, rbp
    pop rbp
    ret