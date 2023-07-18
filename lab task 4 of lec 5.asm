
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, 33h
mov bx, 35h
mov cx, 37h
cmp ax, bx

jl if
mov dl, 30h
mov ah, 2
int 21h 
jmp exit

if: 
cmp bx, cx
mov dl, 31h
mov ah, 2
int 21h
jmp exit

exit:
mov ah, 4ch
int 21h

ret




