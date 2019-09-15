; ----------------------------------------------------------------------------------------
; 
; FT_ATOI
; int atoi( const char * theString );
;
; ----------------------------------------------------------------------------------------

global _ft_atoi
extern _malloc

_ft_atoi:
    push rbp
    mov rbp, rsp
    sub rsp, 16
loop:
leave:
    mov rsp, rbp
    pop rbp
    ret