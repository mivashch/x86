section	.text
global  f

f:
    ; SETUP
    push ebp
    mov	ebp, esp
    push ecx
    push ebx
    mov	eax, [ebp+8]    ; string
    mov edx, eax

sel_char:
    mov bh, [eax]       ; current char to leave
    inc eax
    mov ecx, eax

    test bh, bh         ; test end of checking
    jz end

    mov [edx], bh       ; save first occurance of char
    inc edx

rem_char:
    mov bl, [eax]       ; iter
    inc eax

    test bl, bl         ; test if end of iter
    jz return

    cmp bh, bl          ; check if chars are equal
    jz rem_char         ; if 0 (the same) next char

    mov [edx], bl       ; save if not equal
    inc edx
    jmp rem_char

return:
    mov byte [edx], 0   ; terminating rest of the string
    mov eax, ecx        ; setting up checking for next char
    mov edx, ecx        ; setting up save
    jmp sel_char

end:
    mov	eax, [ebp+8]
	pop ebx
    pop ecx
    pop	ebp
	ret