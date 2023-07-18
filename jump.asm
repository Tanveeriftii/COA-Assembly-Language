;jump
.model small
.stack 100h
.data
a db 'jmp concept$'
b db 'bd is love$'
c db 'coa$' 

.code
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah,9
    lea dx, a
    int 21h
    
    mov ah, 2
    mov dl,10
    int 21h
    mov dl, 13
    int 21h
    
    level:
    mov ah,9
    lea dx,b
    int 21h
    jmp level2
    
      mov ah, 2
    mov dl,10
    int 21h
    mov dl, 13
    int 21h
    
    
    level2:
    
    mov ah,9
    lea dx,c
    int 21h
    jmp exit
     
     exit:
     mov ah, 4ch
     int 21h
     main endp
end main