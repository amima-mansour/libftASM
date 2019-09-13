; ----------------------------------------------------------------------------------------
;
; FT_ISPRINT
;
;
; ----------------------------------------------------------------------------------------

segment .text
    global _ft_isprint

_ft_isprint:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov rax, 1
    cmp edi, 32
    jl no
    cmp edi, 126
    jg no
    jmp leave

no:
  mov rax, 0
	jmp leave

leave:
  mov rsp, rbp
  pop rbp
  ret