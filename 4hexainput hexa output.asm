.model small
.stack 100h
.data
msg1 db 0dh,0ah,'input 4 digit hexa value:$'
msg2 db 0dh,0ah,'output:$' 
.code


main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h 
    
    mov bx,0000h 
    ;bx=0000000000000000b
     mov ah,1
     mov cx,2
     ll:
     int 21h
     ;al=32h 
     cmp al,39h
     jle ll1
     cmp al,41h
     jge ll2
     ll1:
     ;bh=00001010
     shl bh,4
     ;bh=10100000
     ;al=32h
     sub al,30h 
     ;al=02h
     ;al=00000010
     or bh,al
     ;bh=10100010
     
      
     loop ll
     ;cx=0
     jmp lll 
     
     ll2: 
     ;bh=00000000b
     shl bh,4 
     ;bh=00000000b
     sub al,37h
     ;al=Ah   d=10
     ;0001010
     or bh,al
     ;bh=00001010
      
     loop ll
     ;cx=1
     
      
     lll: 
     mov cx,2
      lll3:
     
     int 21h 
     ;al=33h
     cmp al,39h
     jle lll1
     cmp al,41h
     jge lll2
     lll1: 
     ;bl=00001011b
     shl bl,4
     ;bl=10110000b 
     ;al=33h
     sub al,30h 
     ;al=03h
     ;al=00000011b
     or bl,al
     ;bl=10110011
      
     loop lll3
     ;cx=0
     jmp llll 
     lll2:
     ;bl=00000000b
     shl bl,4
     ;bl=00000000b
     ;al=42h 
     sub al,37h 
     ;al=B
     ;al=00001011b
     or bl,al
     ;bl=00001011b
     
     loop lll3
     ;cx=1
    
    
     

    
    
    
    llll:
    mov ax,@data
    mov ds,ax 
     
    mov ah,9
    lea dx,msg2 
    int 21h 
    
    mov ah,2
    mov cx,4
    
    l1:
     ;bh=0011000b
     ;dl=00000000b
    mov dl,bh
    ;dl=00110000b
    
    
    
    ror dl,4
    ;dl=00000011b
    
    
    and dl,0fh
    ;0f=00001111b
    ;dl=00000011b
    
     mov dh,dl
     ;dh=00000011b 
     ;dh=03h
     cmp dh,0Ah 
     jge l2
     
     
    or dl,30h
    ;dl=33h
    int 21h
     ;bx=3000h
    shl bx,4
    ;bx=0000H
    
    loop l1
    ;cx=0
    jmp exit
    l2:
     ;dl=00001011b
    ;40h=01000000b
    xor dl,40h
    ;dl=01001011b
    ;dl=4Bh
    sub dl,09h
    ;dl=42h
    int 21h
    ;print B
    ;bx=B300h;
    shl bx,4  
    ;bx=3000h
    
    loop l1 
    ;cx=1
    

    
    exit:
    mov ah,4ch
    int 21h
