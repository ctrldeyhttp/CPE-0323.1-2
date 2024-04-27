.model small
.stack
.data
prompt1 db 13,10,"Enter String:$"
prompt2 db 13,10,"$"
buff db 26 ;MAX NUMBERS OF CHARACTERS ALLOWED (25) '(n-1)'
db ? ;NUMBER OF CHARACTERS FROM THE STRING ENTERED BY THE USER
db 26 dup(0) ;STRING ENTERED BY THE USER.

.code
start:
main proc
mov ax,@data
mov ds,ax

;DISPLAY PROMPT1
lea dx,prompt1
mov ah,09h
int 21h

;CAPTURE INPUT STRING
mov ah, 0Ah ;SERVICE TO GET THE STRING
mov dx, offset buff
int 21h
mov si, offset buff + 1 ; NUMBER OF CHARACTERS ENTERED
mov cl, [ si ] ; MOV LENGTH NG STRING TO CL
mov ch, 0 ; CLEAR CH TO USE CX
inc cx ;INCREMENT TO REACH CHR(13)
add si, cx ; SI POINTS TO CHR(13)
mov al, '$'
mov [ si ], al ; REPLACE CHR(13) BY '$' TO END THE STRING


lea dx,prompt2
mov ah,09h
int 21h

;PRINT STRING INPUT FROM USER
mov cx, 2
loop1:
mov ah, 9 ;SERVICE TO DISPLAY THE STRING
mov dx, offset buff + 2 ; MUST END WITH '$'
int 21h
loop loop1

mov ah,4ch
int 21h
main endp
end start