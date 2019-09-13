; ----------------------------------------------------------------------------------------
;
; FT_PUTS
; puts() écrit la chaîne de caractères s et un retour-chariot final sur stdout.
; renvoi un nombre non négatif si elle réussit et EOF si elle échoue.
; ----------------------------------------------------------------------------------------

segment .text
    global _ft_ft_puts

_ft_puts:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    mov rsi, [rdi]
    mov	rax, 4   ; syscall number (sys_write)
    mov	ebx, 1   ; file descriptor (stdout)
    mov	edx, 4   ; message length
    mov	ecx, rsi ; message to write
    jmp leave

leave:
  mov rsp, rbp
  pop rbp
  ret
