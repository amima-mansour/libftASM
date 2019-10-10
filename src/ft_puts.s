; ----------------------------------------------------------------------------------------
;
; FT_PUTS
; puts() écrit la chaîne de caractères s et un retour-chariot final sur stdout.
; renvoi un nombre non négatif si elle réussit et EOF si elle échoue.
; ----------------------------------------------------------------------------------------

segment .data
    new db 10
	null db "(null)", 0


segment .text
    global _ft_puts
    extern _ft_strlen

_ft_puts:
    push rbp
    mov rbp, rsp

    cmp rdi, 0
    je .add_null
    jmp .write
.add_null:
    lea rdi, [rel null]
.write:
    mov rsi, rdi
    call _ft_strlen
    mov rdx, rax
    mov	rax, 0x2000004   ; syscall number (sys_write)
    mov	rdi, 1           ; file descriptor (stdout)
    syscall
    mov rdx, 1
	mov rax, 0x2000004
    lea rsi, [rel new]
    syscall
.leave:
    mov rsp, rbp
    pop rbp
    ret