global _ft_isalpha

_ft_isalpha:
    mov eax, 1
    call ft_islower
    cmp eax, 0
    je ft_isupper
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
    mov eax, 0

isalpha:                                                                                                                                          

    mov eax, 1

    or al, 0x20
    sub al, 'a'
    cmp al, 'z'-'a'
    ja notalpha
    add al, 'a'

    push ecx
    push ebx
    push eax

    mov edx, 0x01
    mov ecx, esp
    mov ebx, 0x01
    mov eax, 0x04
    int 0x80

    pop eax
    pop ebx
    pop ecx

notalpha:

    inc ebx
    dec ecx
    jnz isalpha