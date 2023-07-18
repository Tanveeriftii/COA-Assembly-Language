.model small
.stack 100h
.data
msg db 'input: $' 
msg1 db 0dh, 0ah, 'output: $' 

.code
    main proc
        mov ax,@data
        mov ds,ax
        
       
       mov ah,09h
       lea dx,msg
       int 21h 
       
       mov bx,0
       mov cx,8
       
       lev1:
       mov ah ,01h
       int 21h
       cmp al,13
       
       je print
       
       
       and al,0Fh 
       shl bx,1  
       or bl,al  
       loop lev1
       
     print:
        mov ah,09h
        lea dx,msg1
        int 21h
       
        
        mov cx,8 
      
        show:
        shl bl,1
        
        jnc lev2
            mov dl,49
            mov ah,02h
            int 21h
            jmp display 
        
        lev2:
            mov dl,48
            mov ah,02h
            int 21h
            
             
        display:
            loop show
            
          mov ah,4ch
          int 21h
          main endp
    end main



