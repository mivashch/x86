section	.text
global  leavelastndig

leavelastndig:
    ; SETUP
    push ebp
    mov	ebp, esp
    push ebx
    mov	eax, [ebp+8]    ; string
    mov cl, [ebp+12]    ; n number
    mov ch, 0

go_end:
    mov bl, [eax]
    inc eax
    test bl, bl
    jnz go_end
    dec eax
    mov edx, eax


ck_num:
    mov bl, [eax]
    dec eax

    cmp bl, 0x30
    jl ck_num

    cmp bl, 0x39
    jg ck_num

    mov [edx], bl
    dec edx
    inc ch

    cmp ch, cl
    jl ck_num


end:
    mov	eax, [ebp+8]
	pop ebx
    pop	ebp
	ret