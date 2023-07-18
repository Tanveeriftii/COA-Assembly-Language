
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.data
msg: db 0Ah,0Dh,'Greater than 6$'
msg1: db 0Ah,0Dh,'Less than 6$'
msg2: db 0Ah,0Dh,'Equal to 6$'

.code        
mov ah,01
int 21h 
mov bl,al

mov cl,'6'
cmp bl,cl
jg gr
jl le 
je eq   
    
gr:
mov ah,09
mov dx,msg
int 21h          
jmp exit
      
le:
mov ah,09
mov dx,msg1
int 21h          
jmp exit
         
eq:
mov ah,09
mov dx, msg2
int 21h          
jmp exit

exit:
mov ah,4ch
int 21h 


ret




