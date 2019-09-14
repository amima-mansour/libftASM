; ----------------------------------------------------------------------------------------
;
; FT_MEMCPY
; void *memcpy(void *dest, const void *src, size_t n);
; La fonction memcpy() copie n octets depuis la zone mémoire src vers la zone mémoire dest.
; Les deux zones ne doivent pas se chevaucher.
; ----------------------------------------------------------------------------------------

global _ft_memcpy
_ft_memcpy:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    xor rcx, rcx
loop:
    cmp rcx, rdx
    je leave
    mov bl, byte [rsi + rcx]
    mov byte [rdi + rcx], bl
    inc rcx
    jmp loop
leave:
    mov byte [rdi + rcx], 0
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret