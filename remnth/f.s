
section	.text
global  f

f:
	push ebp
	mov	ebp, esp
	push ebx
	push esi
	mov	esi, [ebp+8]	; address of character buffer to esi
	push ecx
	mov ecx, [ebp+12]	; iter
	push edx
	mov edx, esi		; write

rem_loop:
	mov bl, [esi]
	inc esi
	dec ecx

	test bl, bl
	jz end

	mov [edx], bl
	inc edx

	cmp ecx, 1
	jg rem_loop

	mov ecx, [ebp+12]
	inc esi
	jmp rem_loop

end:
	mov [edx], byte 0
	mov	eax, [ebp+8]
	pop edx
	pop ecx
	pop esi
	pop ebx
    pop	ebp
	ret