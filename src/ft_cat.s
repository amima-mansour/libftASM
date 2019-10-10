; ----------------------------------------------------------------------------------------
; 
; FT_CAT
; A checker le sujet : il y a une remarque
; void ft_cat(int fd)
; ----------------------------------------------------------------------------------------

%define STDOUT 1
%define BUFFER_SIZE 1000

section .bss
    buffer resb BUFFER_SIZE
section .text
    global _ft_cat

_ft_cat:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rsp], rdi
.loop_read:
    mov rdi, [rsp]
    lea rsi, [rel buffer]
    mov rdx, BUFFER_SIZE
    mov rax, 0x2000003
    syscall
    jc .leave						; exit Error (rax is neg, carry flag is set)
	cmp rax, 0						; check read EOF
    je .leave
.write:
    mov rdx, rax
    mov rax, 0x2000004
    mov	rdi, STDOUT
    lea rsi, [rel buffer]
    syscall
    jc .leave						; exit Error (rax is neg, carry flag is set)
    mov rdi, [rsp]
    jmp .loop_read
.leave:
    mov rsp, rbp
    pop rbp
    ret
