section	.text
global  f

f:
    ; SETUP
    push ebp
    mov	ebp, esp
    push ebx
    mov	eax, [ebp+8]    ; string
    mov cl, [ebp+12]    ; n number
    mov ch, [ebp+8]

go_end:
    mov bl, [eax]
    inc eax
    test bl, bl
    jnz go_end
    sub eax, 2
    mov edx, eax

check:
    mov bl, [eax]
    dec eax
    cmp bl, ch
    jl end

    cmp cl, 0
    jle skip

    cmp bl, '0'
    jl skip

    cmp bl, '9'
    jg skip

    dec cl
    mov [edx], bl
    dec edx

    jmp check

skip:
    cmp bl, ch
    jl end
    mov bl, ' '
    mov [edx], bl
    dec edx
    jmp check

end:
    mov	eax, [ebp+8]
	pop ebx
    pop	ebp
	ret
