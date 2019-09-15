; ----------------------------------------------------------------------------------------
; 
; FT_CAT
; A checker le sujet : il y a une remarque
; void ft_cat(int fd)
; ----------------------------------------------------------------------------------------

%define STDOUT 1
%define BUFFER_SIZE 5

section .bss
    buffer resb BUFFER_SIZE
section .text
    global _ft_cat
    extern  _ft_puts
_ft_cat:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    
    mov rbx, rdi
    lea rsi, [rel buffer]
loop_read:
    mov rax, 0x2000003
    mov rdx, BUFFER_SIZE
    syscall
    cmp rax, 0
    jle leave
    mov rdx, rax
write:
    mov rax, 0x2000004
    mov	rdi, STDOUT
    syscall
    mov rdi, rbx
    jmp loop_read
leave:
    mov rax, rdx
    mov rsp, rbp
    pop rbp
    ret
