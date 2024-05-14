section	.text
global f

f:
	push ebp
	mov	ebp, esp
    push ebx
	mov	eax, [ebp+8]	; address of character buffer to eax
    mov edx, eax
	mov cl, [ebp+12]	; read low parameter
	mov ch, [ebp+16]	; read high parameter

remove_loop:
    mov bl, [eax]       ; read first character
    inc eax             ; eax++

    cmp bl, cl          ; comparing bl and cl
    jl save_char        ; if bl lower than cl jump to save_char

    cmp bl, ch          ; comparing again
    jle remove_loop     ; if bl

save_char:
    mov [edx], bl
    inc edx
    test bl, bl
    jnz remove_loop      ; jump if zero flag to remove_loop

	mov	eax, [ebp+8]	; return character buffer address
	pop ebx
    pop	ebp
	ret

