section .text
global f

f:
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx
    push ecx
    mov esi, [ebp+8]
    mov edi, esi

find_end:
    cmp byte [edi], 0
    je reverse
    inc edi
    jmp find_end

reverse:
    dec edi
    mov ebx, esi
    mov ecx, edi

reverse_loop:
    mov dl, [ebx]

    cmp dl, 'A'
    jl not_letter_start

    cmp dl, 'z'
    jg not_letter_start

    cmp dl, 'Z'
    jg check_first

    jmp find_swap

check_first:
    cmp dl, 'a'
    jl not_letter_start

    jmp find_swap

find_swap:
    mov dh, [ecx]

    cmp dh, 'A'
    jl not_letter_end

    cmp dh, 'z'
    jg not_letter_end

    cmp dh, 'Z'
    jg check_second

    jmp swap

check_second:
    cmp dh, 'a'
    jl not_letter_end

    jmp swap

swap:
    mov [ebx], dh
    mov [ecx], dl

    inc ebx
    dec ecx

    cmp ebx, ecx
    jge end
    jmp reverse_loop

not_letter_start:
    inc ebx
    cmp ebx, ecx
    jl reverse_loop
    jmp end

not_letter_end:
    dec ecx
    cmp ebx, ecx
    jl find_swap
    jmp end

end:
    pop ecx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret

