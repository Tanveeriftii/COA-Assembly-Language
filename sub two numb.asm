;sub two number
.model small
.stack 100h
.data
a db 'input first digit $'
b db 10,13,  'input second digit $'
c db 10, 13, 'result $'
.code

main proc
    mov ax,@data
    mov ds , ax
    
    
    lea dx,a
    mov ah, 09h
    int 21h
    
    mov ah, 1
    int 21h
    mov bl,al
    
    
    lea dx,b
    mov ah,09h
    int 21h
    
    mov ah, 1
    int 21h
    mov cl,al
    
    mov ah,9
    lea dx,c
    int 21h  
    
   sub bl,bh ;bl=bl-bh
   
   add bl, 30h 
   mov ah, 2
   mov dl,bl
   int 21h
   
   exit:
   mov ah, 4ch
   int 21h
   main endp
end main