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
    mov rax, 1
    cmp edi, 32
    jl .no
    cmp edi, 126
    jg .no
    jmp .leave

.no:
  mov rax, 0

.leave:
  mov rsp, rbp
  pop rbp
  ret
