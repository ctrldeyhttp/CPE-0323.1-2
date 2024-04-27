dosseg
.model small
.stack 100h
.data
	prompt1 db 13,10,"Hello, What's your name:$"
	prompt2 db 13,10,"Hello, $"
	congratsmessage db 13,10,"Congratulations! Your first program is working!$"
	buff db 26
		db ?
		db 26 dup (0)
.code
start:
main proc
	mov ax,@data
	mov ds, ax

	lea dx, prompt1
	mov ah,09h
	int 21h

	mov ah, 0Ah
	mov dx, offset buff
	int 21h

	mov si, offset buff + 1
	mov cl, [ si ]
	mov ch, 0
	inc cx
	add si, cx
	mov al, '$'
	mov [ si ], al

	lea dx, prompt2
	mov ah,09h
	int 21h

	mov ah, 9
	mov dx, offset buff + 2
	int 21h

	lea dx, congratsmessage
	mov ah,09h
	int 21h

	mov ah,4ch
	int 21h
main endp
end start