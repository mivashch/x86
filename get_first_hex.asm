section	.text
global  get_first_hex

get_first_hex:
;	eax - wskaznik czytający
;	ecx - akumulator liczby
;	dl - odczytany char

	push	ebp
	mov	ebp, esp

	mov	eax, [ebp+8]
	mov	ecx, 0
	mov	edx, 0

look_for_num_loop:
	mov	dl, [eax]
	inc	eax
	test	dl, dl	
	jz	fin	; test czy 0 kończace string

	cmp	dl, '0'	; szukamy dalej pierwszej liczby
	jb	look_for_num_loop

	cmp	dl, '9'	; tu także
	ja	look_for_num_loop

read_num:
	sub	dl, '0' ; zamiana cyfry w ascii na liczbe

num_loop:
	shl	ecx, 4	; mnozenie x16 tego co mamy w akumulatorze (bo hex)
	add	ecx, edx	; dodanie liczby do akumulatora

	mov	dl, [eax]
	inc	eax

	cmp	dl, '0'
	jb	fin	; sie liczba skonczyla

	cmp	dl, '9'	
	jbe	read_num	; mamy cyfre kolejna

	cmp	dl, 'A'
	jb	fin	; sie liczba skonczyla znowu

	cmp	dl, 'F'	
	ja	fin	; i tu także

	sub	dl, 55	; jezeli tu jestesmy to mamy cyfre A-F w hexie, zamianka na liczbe
	jmp	num_loop

fin:
	mov	eax, ecx

	pop	ebp
	ret


