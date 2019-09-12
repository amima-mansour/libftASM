global _ft_bzero
_ft_bzero:
    call _loop
    ret
_loop:
    ; rsi--
    dec rsi
    ; if (rsi < 0) return
    cmp rsi, 0
    jl _ret
    ; rdi[rsi] = 0
    mov byte [rdi+rsi], 0
    jmp _loop
_ret:
    ret