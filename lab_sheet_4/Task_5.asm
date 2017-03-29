.model tiny
.data
filename 	db	'test.txt', 0
dat1		db	20
dat2		db 	?
dat3		db	20 dup(?)
.code
.startup
	mov 	ah,3dh
	mov 	al,02h
	lea		dx,filename
	int 	21h
	
	mov 	bx,ax
	
	mov		ah,0ah
	lea 	dx,dat1
	int 	21h
	
	mov 	ch,00h
	mov 	cl,dat2
	mov 	ah,40h
	lea		dx,dat3
	int 	21h
	
	mov 	ah,3eh
	int 	21h
.exit
end