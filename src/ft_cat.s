; ----------------------------------------------------------------------------------------
; 
; FT_CAT
; A checker le sujet : il y a une remarque
; void ft_cat(int fd)
; ----------------------------------------------------------------------------------------

section .data
    size equ 1000
section .bss
    buffer resb 1000
section .text
    global _ft_cat
    extern  _ft_puts
_ft_cat:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov rbx, rdi
loop_read:
    mov rax, 0x2000003
    mov rsi, buffer; buffer
    mov rdx, size; buffer size
    syscall
    mov rdx, rax
    cmp rdx, 1
    jle leave
    jmp write
    jmp loop_read
    jmp leave
write:
    mov rax, 0x2000004  ; write
    mov	rdi, 1          ; file descriptor (stdout)
    lea rsi, [rel rdi]
    syscall
leave:
    mov rsp, rbp
    pop rbp
    ret
