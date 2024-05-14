section	.text
global  remlastnum

remlastnum:
    ; SETUP
    push ebp
    mov	ebp, esp
    push ecx            ; pointer to last number
    push ebx
    mov	eax, [ebp+8]    ; string
    mov edx, eax
    mov bh, 0           ; length of number

; FIND POINTER TO THE FIRST ELEMENT OF THE LAST NUMBER

s_first:
    mov bl, [eax]       ; load char
    inc eax

    test bl, bl         ; test if end of string
    jz print

    cmp bl, 0x30        ; check if char less than 0
    jl s_first

    cmp bl, 0x39        ; check if char bigger than 9
    jg s_first

    dec eax
    mov ecx, eax        ; set pointer to begining of that number
    inc eax
    mov bh, 1

s_next:
    mov bl, [eax]       ; load next char
    inc eax

    test bl, bl         ; test if end of string
    jz print

    cmp bl, 0x30        ; check if char less than 0
    jl s_first

    cmp bl, 0x39        ; check if char bigger than 9
    jg s_first

    inc bh
    jmp s_next

print:
    test bh, bh         ; if end, return
    jz end

    mov bl, [ecx]
    mov [edx], bl
    inc ecx
    inc edx
    dec bh

    jmp print


end:
    mov byte [edx], 0
    mov	eax, [ebp+8]
	pop ebx
    pop ecx
    pop	ebp
	ret