section .text
global f
f:
    push ebp ;dodajemy do stosu
    mov ebp, esp ;do ebp adres stack pointer
    mov eax,[ebp+8] ;do eax to co na dwie komórki wyżej
begin:
    mov cl,[eax] ;transfer z pamieci do rejestru cl 8 bajtow
    cmp  cl, 0 ;compare with 0
    jz end ;jump if 0
    add cl, 1 ;inkrementacja
    mov [eax], cl ;tranfer do pamieci
    inc eax ;zinkrementuj wskaznik
    jmp begin
end:
    mov esp, ebp
    pop ebp
    ret