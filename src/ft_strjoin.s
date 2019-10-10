; ----------------------------------------------------------------------------------------
;
; FT_STRJOIN
; char	*ft_strjoin(const char *s1, const char *s2)
;
; ----------------------------------------------------------------------------------------


global _ft_strjoin
extern _malloc
extern _ft_memcpy
extern _ft_strnew
extern _ft_strlen
extern _ft_strcpy
extern _ft_strcat
_ft_strjoin:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    cmp rdi, 0
    je .leave
    cmp rsi, 0
    je .leave

    mov [rsp], rdi      ;push to the stack
	mov [rsp + 8], rsi  ; push to the stack
    
    call _ft_strlen
    mov rcx, rax
    mov rdi, rsi
    call _ft_strlen
    add rcx, rax
    
    mov rdi, rcx
    call _ft_strnew ; create a new string
    cmp rax, 0
    je .leave        ; malloc error => exit
    
    mov rdi, rax
    mov rsi, [rsp]
    call _ft_strcpy
    
    mov rdi, rax
    mov rsi, [rsp + 8]
    call _ft_strcat
.leave:
    mov rsp, rbp
    pop rbp
    ret