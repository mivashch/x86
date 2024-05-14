section	.text
global f

f:
    ; SETUP
    push ebp
    mov	ebp, esp
    push ecx
    push ebx
    push edi
    push esi
    mov	esi, [ebp+8]    ; string
    mov edi, esi        ; end of the string

find_end:
    cmp byte [edi], 0   ; compare current with the end
    je reverse

    inc edi
    jmp find_end

reverse:
    dec edi             ; Now we have one pointer at the first char (esi), and one at the end (edi).
    mov ebx, edi        ; We need 2 more registers to iter, ecx is now start, ebx end.
    mov ecx, esi

reverse_loop:
    mov dl, byte [ecx]  ; get char

    cmp dl, '0'         ; check if number
    jl not_dig_start

    cmp dl, '9'
    jg not_dig_start

find_swap:
    mov dh, byte [ebx]

    cmp dh, '0'
    jl not_dig_end

    cmp dh, '9'
    jg not_dig_end

    mov [ecx], dh
    mov [ebx], dl

    inc ecx
    dec ebx
    cmp ecx, ebx
    jge end
    jmp reverse_loop


not_dig_start:
    inc ecx
    cmp ecx, ebx
    jl reverse_loop
    jmp end

not_dig_end:
    dec ebx
    cmp ecx, ebx
    jl find_swap
    jmp end

end:
    pop esi
    pop edi
    pop ebx
    pop ecx
    pop	ebp
	ret