
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, 03h
mov bx, 02h
mov cx, 05h
cmp ax, bx

jl if
jmp else
jmp if_if
jmp if_else 

if:
mov ax, 30h
jmp exit


else:
cmp bx, cx
jl if_if
jmp if_else

if_if:
mov bx, 30h
jmp exit 

if_else: 
mov cx, 30h
jmp exit

exit:
mov ah, 4ch
int 21h
ret





