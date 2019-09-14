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
    sub rsp, 16
    xor rcx, rcx
loop:
    cmp rcx, rdx 
    jge leave
    mov byte[rdi + rcx], sil
    inc rcx
    jmp loop
leave:
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret