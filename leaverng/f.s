section .text
global f

f:
    push ebp
	mov	ebp, esp
    push ebx
	mov	eax, [ebp+8]	; address of character buffer to eax
    mov edx, eax
	mov cl, [ebp+12]	; read low parameter
	mov ch, [ebp+16]  


string_loop:
    mov bl, [eax]
    inc eax

    test bl, bl
    jz pre_space

    cmp bl, cl
    jl string_loop

    cmp bl, ch
    jg string_loop

    jmp write

write:
    mov [edx], bl
    inc edx
    jmp string_loop
pre_space:
    dec eax
space:
    cmp edx, eax
    jge end
    mov bl, ' '
    mov [edx], bl
    inc edx
    jmp space

end:
    mov	eax, [ebp+8]
	pop ebx
    pop	ebp
	ret

