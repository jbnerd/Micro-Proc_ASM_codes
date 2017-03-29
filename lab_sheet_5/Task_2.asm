.model tiny
.data
space 	db	20h
char	db	00h
.code
.startup
	mov 	ah, 00h ;setting the video mode
	mov 	al, 03h
	int		10h
	
x:	mov 	ah, 02h ;cursor at the beggining
	mov 	bh, 00h
	mov 	dx, 00h
	int 	10h
	
	mov 	ah, 09h ;setting first screen
	mov		al, space
	mov 	bh, 00h
	mov 	bl, 1eh
	mov		cx, 12*80
	int 	10h
	
	mov 	ah, 02h ;cursor at next half
	mov		bh, 00h
	mov		dl, 00h
	mov 	dh, 0ch
	int 	10h
	
	mov 	ah, 09h ;setting next half
	mov 	al, space
	mov 	bh, 00h
	mov 	bl, 7ah
	mov		cx, 13*80
	int 	10h
	
	mov 	ah, 02h ;cursor at the beggining
	mov 	bh, 00h
	mov 	dx, 00h
	int 	10h
	
x1:	mov		ah, 07h
	int		21h
	cmp		al, '#'
	jnz 	x2
	cmp		char, '$'
	jz 		x4
	
x2: mov 	ah,09h ;writing entered char to first half
	mov		char, al
	mov		bl, 1eh
	mov 	bh, 00h
	mov 	cx, 01h
	int 	10h
	
	mov 	ah, 02h ;cursor at next half
	add		dh , 0ch
	mov 	bh, 00h
	int 	10h
	
	mov 	ah, 09h ;writing entered char to next half
	mov 	bh, 00h
	mov 	bl, 7ah
	mov 	cx, 01h
	int 	10h
	
	sub		dh, 0ch ;resetting cursor and checking boundary conditions
	inc 	dl
	cmp		dl, 80
	jnz		x3
	mov 	dl, 00h
	inc		dh
	cmp		dh, 0ch
	jz		x
x3:	mov 	ah, 02h
	int 	10h
	jmp		x1	; infinite loop until

x4:	mov 	ah,00h	;resetting the whole screen
	mov 	al, 03h
	int 	10h
	
.exit
end