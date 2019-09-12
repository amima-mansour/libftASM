segment .text
    global _ft_islower

_ft_islower:
    mov eax, 1
    cmp rdi, 97 
    jl _return
    cmp rdi, 122 
    jg _return
    ret
    _return:
    mov eax, 0
    ret