; ----------------------------------------------------------------------------------------
; 
; FT_ATOI
; int atoi( const char * theString );
;
; ----------------------------------------------------------------------------------------

global _ft_atoi
extern _ft_isdigit
_ft_atoi:
    push rbp
    mov rbp, rsp
    sub rsp, 16
blanks:
    cmp byte [rdi], 7
    jl resolve
    cmp byte [rdi], 32
    jg resolve
    cmp byte [rdi], 32
    je increment
    cmp byte [rdi], 13
    jg resolve
    jmp increment
increment:
    inc rdi
    jmp blanks

resolve:
    mov rsi, rdi
    mov rdx, 0
    mov rbx, 1
    cmp byte [rsi], '-'
    je neg
    cmp byte [rsi], '+'
    je pos
loop:
    cmp byte [rsi], 0
    je leave
    movzx rdi, byte [rsi]
    call _ft_isdigit
    cmp rax, 0
    je leave
    imul rdx, 10
    movzx rax, byte [rsi]
    sub rax, '0'
    add rdx, rax
    inc rsi
    jmp loop
neg:
    mov rbx, -1
    inc rsi
    jmp loop
pos:
    inc rsi
    jmp loop
leave:
    mov rax, rdx
    mul rbx
    mov rsp, rbp
    pop rbp
    ret