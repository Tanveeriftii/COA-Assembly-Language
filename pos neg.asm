
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.data
msg: db 0Ah,0Dh,'Positive$'
msg1: db 0Ah,0Dh,'Negative$'
msg2: db 0Ah,0Dh,'Zero$'

.code
;mov ax,@data
;mov ds,ax

mov ah,01
int 21h 
mov bl,al
mov ah,01
int 21h

mov cl,30h
cmp bl,cl
jg pos
jl ne 
je ze   
    
pos:
mov ah,09
mov dx,msg
int 21h          
jmp exit
      
ne:
mov ah,09
mov dx,msg1
int 21h          
jmp exit
         
ze:
mov ah,09
mov dx, msg2
int 21h          
jmp exit

exit:
mov ah,4ch
int 21h 


ret




