; ----------------------------------------------------------------------------------------
;
; FT_MEMCPY
; void *memcpy(void *dest, const void *src, size_t n);
; La fonction memcpy() copie n octets depuis la zone mémoire src vers la zone mémoire dest.
; Les deux zones ne doivent pas se chevaucher.
; ----------------------------------------------------------------------------------------
section .text
    global _ft_memcpy

_ft_memcpy:
    push rbp
    mov rbp, rsp
    sub rsp,16
    push rdi
    mov rcx, rdx
    cld
    rep movsb
.leave:
    pop rax
    mov rsp, rbp
    pop rbp
    ret