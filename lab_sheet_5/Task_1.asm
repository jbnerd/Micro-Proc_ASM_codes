.model tiny
.data
display db "DOLL"
count	db	04h
.code
.startup
	mov 	ah, 00h
	mov 	al, 03h
	int		10h
	
	lea 	si, display
	
	mov 	dl,	24h
x:	mov 	ah, 02h
	mov		dh, 0bh
	mov 	bh, 00h
	int 	10h
	
	mov 	ah, 09h
	lodsb
	mov 	bh, 00h
	mov 	bl, 8fh
	mov 	cx, 01h
	int 	10h
	
	inc		dl
	dec		count
	jnz		x
	
.exit
end