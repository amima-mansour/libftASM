; ----------------------------------------------------------------------------------------
;
; FT_STRNEW
; char	*ft_strnew(size_t size)
;
; ----------------------------------------------------------------------------------------

section .text
  global _ft_strnew
  extern _malloc
  extern _ft_bzero

_ft_strnew:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    add rdi, 1
    mov [rsp], rdi
    call _malloc
    cmp rax, 0
    je .leave
    mov rsi, [rsp]
    mov rdi, rax
    call _ft_bzero
.leave:
  mov rsp, rbp
  pop rbp
  ret