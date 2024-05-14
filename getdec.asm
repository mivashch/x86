;==========================================================
; getdec - loads first decimal number from the string
; and returns it as unsigned int
; Andrzej Pultyn
;==========================================================
section	.text
global getdec

getdec:
    ; SETUP
    push ebp
    mov	ebp, esp

    mov eax, 0
    push esi
    mov esi, [ebp+8]
    push ecx
    mov ecx, 0
    push edx
    push ebx
    mov ebx, 0

find_first:
    mov bl, [esi]
    inc esi

    test bl, bl
    jz end

    cmp bl, '0'
    jl find_first

    cmp bl, '9'
    jg find_first

add_num:
    mov edx, 0xA
    sub bl, '0'
    mov eax, ecx

    mul edx         ; multiplication: EAX = EAX * EDX
    mov ecx, eax

    add ecx, ebx


find_next:
    mov bl, [esi]
    inc esi

    test bl, bl
    jz end

    cmp bl, '0'
    jl end

    cmp bl, '9'
    jg end

    jmp add_num

end:
    mov eax, ecx
    pop ebx
    pop edx
    pop ecx
    pop esi
    pop	ebp
	ret