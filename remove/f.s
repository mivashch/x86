section	.text
global f

f:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    push ebx
    push edx
    mov edx, eax
    mov ch, 0       ; number of upercase

count_loop:
    mov bl, [eax]
    inc eax

    test bl, bl
    jz next

    cmp bl, 'A'
    jl count_loop

    cmp bl, 'Z'
    jb count_loop

    inc ch
    jmp count_loop

next:
    mov eax, [ebp+8]
    mov cl, 0
    test ch, 1
    jz even
    jmp odd

even:
    mov bl, [eax]
    inc eax
    inc cl

    test bl, bl
    jz end

    cmp cl, 5
    je even_save

    mov [edx], bl
    inc edx
    jmp even

even_save:
    sub bl, 2 ;0x02
    mov cl, 0
    mov [edx], bl
    inc edx
    jmp even


odd:
    mov bl, [eax]
    inc eax
    inc cl

    test bl, bl
    jz end

    cmp cl, 5
    je odd_save

    mov [edx], bl
    inc edx
    jmp odd


odd_save:
    mov bl, '*'
    mov cl, 0
    mov [edx], bl
    inc edx
    jmp odd
    
end:
    mov eax, [ebp+8]
    pop edx
    pop ebx
    pop ebp
    ret