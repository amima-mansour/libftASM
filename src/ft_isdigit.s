; ----------------------------------------------------------------------------------------
;
; FT_ISDIGIT
;
;
; ----------------------------------------------------------------------------------------

segment .text
    global _ft_isdigit

_ft_isdigit:
    push rbp
    mov rbp, rsp
    
    mov rax, 1
    cmp rdi, '0'
    jl no
    cmp rdi, '9'
    jg no
    jmp leave

no:
  mov rax, 0
	jmp leave

leave:
  mov rsp, rbp
  pop rbp
  ret
