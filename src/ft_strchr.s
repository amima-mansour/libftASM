; ----------------------------------------------------------------------------------------
; 
; FT_STRCHR
; char * strchr( const char * string, int searchedChar );
;
; ----------------------------------------------------------------------------------------

global _ft_strchr

_ft_strchr:
    push rbp
    mov rbp, rsp
    sub rsp, 16
loop:
    cmp byte[rdi], sil
    je leave
    cmp byte [rdi], 0
    je res_null
    inc rdi
    jmp loop
res_null :
    mov rdi, 0
leave:
    mov rax, rdi
    mov rsp, rbp
    pop rbp
    ret