; ----------------------------------------------------------------------------------------
;
; FT_MEMSET
; void *memset (void *s, int c, size_t n);
; to check if n gretear than the length of the string s
; ----------------------------------------------------------------------------------------

global _ft_memset
_ft_memset:
    push rbp
    mov rbp, rsp
    push rdi
    mov al, sil
    mov rcx, rdx
    rep stosb
.leave:
    pop rax
    mov rsp, rbp
    pop rbp
    ret