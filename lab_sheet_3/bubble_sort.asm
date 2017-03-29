.model tiny
.486
.data
	max1  	db	10
	count1	db 	?
	arr		db	11 dup('$')
	nextline	db	0ah,0dh,'$'
.code
.startup
		lea 	si,arr
		mov 	cx,0ah
		lea 	dx,max1
		mov		ah,0ah
		int		21h

		mov		cx,0ah
red:	lea 	si,arr
		mov		dx,0ah
itr:	mov		bl,byte ptr[si]
		cmp		bl,byte ptr[si + 1]
		jb		incr
		mov 	al,byte ptr[si + 1]
		mov		byte ptr[si],al
		mov		byte ptr[si + 1],bl
incr:	dec		dx
		cmp		dx,01h
		je		outer
		inc 	si
		jmp 	itr
outer:	loop red

		lea		dx,nextline
		mov		ah,09h
		int 	21h
		lea		dx,arr
		mov		ah,09h
		int		21h
.exit
end