.model small
.stack 100h
.data 
.code


main proc
    mov ah,2
    mov cx,4
    mov bx, 0123h
    l1:
    
    mov dl,bh
    
    
    ror dl,4
    
    
    and dl,0fh
    
     mov dh,dl
     cmp dh,0Ah 
     jge l2
     
     
    or dl,30h
    int 21h
    
    shl bx,4
    
    loop l1
    jmp exit
    l2:
    
    ;xor dl,40h
    ;sub dl,09h
    ;int 21h
    ;shl bx,4
    ADD DL,37H
    INT 21H
    SHL BX,4
    loop l1 
    

    
    exit:
    mov ah,4ch
    int 21h
