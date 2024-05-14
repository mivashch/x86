section .text
global f

f:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    push ebx

func:
    mov bl, [eax]
    mov edx, eax
    inc eax

    test bl, bl
    je end

    mov bh, [eax]

    test bh, bh
    je end

    mov [eax], bl
    mov[edx], bh

    inc eax
    jmp func

end:
    mov eax, [ebp+8]
    pop ebx
    pop ebp
    ret