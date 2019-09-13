global _ft_isalpha

_ft_isalpha:
    mov ebx, 1
    call ft_islower
    cmp ebx, 0
    je ft_isupper
    mov eax, ebx
    ret
ft_islower:
    cmp rdi, 97 
    jl modify
    cmp rdi, 122 
    jg modify
ft_isupper:
    cmp rdi, 97 
    jl modify
    cmp rdi, 122 
    jg modify
modify:
    mov ebx, 0