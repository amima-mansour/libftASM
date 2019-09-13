; ----------------------------------------------------------------------------------------
;
; FT_ISASCII
;
;
; ----------------------------------------------------------------------------------------

segment .text
    global _ft_isascii

_ft_isascii:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov rax, 1
    cmp edi, 0
    jl no
    cmp edi, 127
    jg no
    jmp leave

no:
  mov rax, 0
	jmp leave

leave:
  mov rsp, rbp
  pop rbp
  ret
