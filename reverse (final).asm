.model small
.stack 100h
.data
msg db 'normal form: $'
msg1 db 0dh,0ah, 'Reverse form: $'
.code

main proc
    mov ax,@data
    mov ds,ax   
    
    mov ah,09h
    lea dx,msg
    int 21h
    
    mov ah,1
    xor cx,cx
    
    input:
    int 21h
    cmp al,0dh
       
    je exit_input
    push ax
    inc cx
    jmp input
    
    exit_input:
    mov ah,09h
    lea dx,msg1
    int 21h
    
    mov ah,2
    
    output:
    pop dx
    int 21h
    loop output
    
     
    exit:
    mov ah,4ch
    int 21h
    main endp
end main




