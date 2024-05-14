;==========================================================
; leavelongestnum - leaving the longest number from string
; Andrzej Pultyn
;==========================================================
section	.text
global  leavelongestnum

leavelongestnum:
    ; SETUP
    push ebp
    mov	ebp, esp
    mov	esi, [ebp+8]    ; string
    mov edx, esi        ; pointer to the start of the string
    mov ebx, 0          ; pointer to the end of the longest number
    mov ecx, 0          ; len of longest number
    mov ah, 0           ; len of current number


ck_num:
    mov ah, 0           ; len of current number
    mov al, [esi]       ; check char

    test al, al         ; test if end of string
    jz end

    cmp al, '0'         ; test if number
    jl ck_num
    cmp al, '9'
    jg ck_num

    inc ah

    cmp ah, ecx
    jg update


update:
    mov ecx, byte [ah]
    inc esi
    jmp ck_num


end:
    mov	esi, [ebp+8]
    pop ecx
    pop ebx
    pop edx
	ret
