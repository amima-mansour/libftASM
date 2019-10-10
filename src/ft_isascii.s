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
    mov rax, 1
    cmp edi, 0
    jl .no
    cmp edi, 127
    jg .no
    jmp .leave

.no:
  mov rax, 0

.leave:
  mov rsp, rbp
  pop rbp
  ret
