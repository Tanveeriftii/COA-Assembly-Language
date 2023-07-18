
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ah, 34h
mov bh, 32h
mov ch, 39h
cmp ah, bh

jge if
cmp bh, ch
mov dx, 30h
mov ah, 2
int 21h
jmp exit

if: 
mov dx, 31h
mov ah, 2
int 21h 
jmp exit

exit:
mov ah, 4ch
int 21h

ret







