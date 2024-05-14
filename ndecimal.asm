;==========================================================
; nnumber - returns n-th decimal number in string
; Andrzej Pultyn
;==========================================================
section	.text
global nnumber

nnumber:
    ; SETUP
    push ebp
    mov	ebp, esp
    push esi
    push ebx


    mov	esi, [ebp+8]    ; string
    mov edx, [ebp+12]   ; n number
    mov eax, 0          ; alu
    mov ebx, 0
    dec esi

find_dec:
    inc esi
    mov bl, [esi]       ; load char

    test bl, bl         ; test if end of string
    jz end

    cmp bl, '0'         ; test if number
    jl find_dec

    cmp bl, '9'
    jg find_dec

    dec edx             ; reduce number

    test edx, edx       ; test if print current number
    jz print

skip_cur:
    inc esi
    mov bl, [esi]       ; take next num

    test bl, bl         ; test if end of string
    jz end

    cmp bl, '0'         ; test if number
    jl find_dec

    cmp bl, '9'
    jg find_dec

    jmp skip_cur

ck_print:
    inc esi
    mov bl, [esi]

    test bl, bl         ; test if end of string
    jz end

    cmp bl, '0'         ; test if number
    jl end

    cmp bl, '9'
    jg end

print:
    sub ebx, '0'        ; make calcs on alu
    mov ecx, 0xA

    mul ecx

    add eax, ebx

    jmp ck_print

end:
    pop ebx
    pop esi

    pop	ebp
	ret