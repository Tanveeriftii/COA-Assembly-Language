.model small
.stack 100h
.data
a db ' upper form: $'
b db 0Ah, 0Dh, ' lower form: $' 
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, a
    int 21h
    mov ah,1
    int 21h
    mov bl, al 
    
    mov ah, 09h
    lea dx,b 
    int 21h
    
   mov ah, 2
   add bl,20h  ; bl= bl+32
   mov dl,bl
   int 21h
    