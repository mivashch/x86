section .text
global f

f:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    push ebx
    mov edx, eax
   

check_first:
    mov bl, [eax]
    inc eax

    test bl, bl
    je end

    cmp bl, 'a'
    jl save_char

    cmp bl, 'z'
    jg save_char

    jmp cap

save_char:
    mov [edx], bl
    inc edx
    jmp find_space

find_space:
    mov bl, [eax]
    inc eax

    test bl, bl
    je end

    mov [edx], bl
    inc edx

    cmp bl, ' '
    jne find_space

    jmp check_first

cap:
    sub bl, 0x20
    mov [edx], bl
    inc edx
    jmp find_space

end:
    mov eax, [ebp+8]
    pop ebx
    pop ebp
    ret


