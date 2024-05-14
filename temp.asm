;==========================================================
; temp - template explanation
; Andrzej Pultyn
;==========================================================
section	.text
global  temp

temp:
    ; SETUP
    push ebp
    mov	ebp, esp
    push ecx
    push ebx
    mov	eax, [ebp+8]    ; string
    mov edx, eax

end:
    mov	eax, [ebp+8]
	pop ebx
    pop ecx
    pop	ebp
	ret