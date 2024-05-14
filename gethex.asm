;==========================================================
; gethex - loads first hexadecimal number from the string
; and returns it as unsigned int
; Andrzej Pultyn
;==========================================================
section	.text
global gethex

gethex:
    ; SETUP
    push ebp
    mov	ebp, esp

    mov eax, [ebp+8]
    push ecx
    mov ecx, 0
    push edx

find_first:
    mov dl, [eax]
    inc eax

    test dl, dl
    jz end

    cmp dl, '0'
    jl find_first

    cmp dl, 'F'
    jg find_first

    cmp dl, '9'
    jle add_reg

    cmp dl, 'A'
    jge add_hex

    jmp find_first

add_reg:
    sub dl, '0'

    shl ecx, 4
    add ecx, edx

    jmp find_next

add_hex:
    sub dl, '7'

    shl ecx, 4
    add ecx, edx

find_next:
    mov dl, [eax]
    inc eax

    test dl, dl
    jz end

    cmp dl, '0'
    jl end

    cmp dl, 'F'
    jg end

    cmp dl, '9'
    jle add_reg

    cmp dl, 'A'
    jge add_hex

end:
    mov eax, ecx
    pop edx
    pop ecx
    pop	ebp
	ret