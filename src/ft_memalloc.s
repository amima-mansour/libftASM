; ----------------------------------------------------------------------------------------
;
; FT_MEMALLOC
; void	*ft_memalloc(size_t size)
;
; ----------------------------------------------------------------------------------------


global _ft_memalloc
extern _malloc
extern _ft_memset
_ft_memalloc:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov [rsp], rdi
    call _malloc
    cmp rax, 0
    je .leave
    mov rsi, 0
    mov rdi, rax
    mov rdx, [rsp]
    call _ft_memset
.leave:
  mov rsp, rbp
  pop rbp
  ret
