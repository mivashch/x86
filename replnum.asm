;==========================================================
; replnum - changes all num chains to sign
; Andrzej Pultyn
;==========================================================
section	.text
global  replnum

replnum:
    ; SETUP
    push ebp
    mov	ebp, esp
    push esi
    mov	esi, [ebp+8]    ; start string
    push edx
    mov edx, esi        ; to print
    push ecx
    mov cl, [ebp+12]    ; char to put in place of numbers
    push ebx

ck_first:
    mov bl, [esi]       ; load char
    inc esi

    test bl, bl         ; test if end of string
    jz end

    cmp bl, '0'         ; check if number
    jl save_char
    cmp bl, '9'
    jg save_char

    mov [edx], cl       ; write substituting char
    inc edx

skip_num:
    mov bl, [esi]       ; load next char
    inc esi

    test bl, bl         ; test if end of string
    jz end

    cmp bl, '0'         ; check if number
    jl save_char
    cmp bl, '9'
    jg save_char

    jmp skip_num

save_char:
    mov [edx], bl       ; save char if not number
    inc edx

    jmp ck_first

end:
    mov [edx], byte 0   ; null-terminate string in case of num at the end
    pop ebx
    pop ecx
    pop edx
    pop esi
    pop	ebp
	ret