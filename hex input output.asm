.model small
.stack 100h
.data
msg db 'Enter hex number: $'
msg1 db 0dh, 0ah, 'result: $'
.code
main proc
    
    mov ax,@data
    mov ds,ax
     
    mov ah,09h
    lea dx,msg
    int 21h 

mov bx,0
mov cl,4
mov ah,1

input:
int 21h
cmp al,0DH
je output
cmp al,41h
jge letter 

sub al, 48
jmp shift


letter:
sub al,37h

shift:

shl bx,cl
or bl,al
jmp input


output:
        mov ah,09h
        lea dx,msg1
        int 21h
        mov cx, 4
        mov ah,2


shift2:

mov dl,bh
shr dl,4
rol bx,4
cmp dl,10
jge letter2

add dl,48
int 21h
jmp exit

letter2:
add dl,55
int 21h

exit:
loop shift2

 mov ah,4ch
 int 21h  
 main endp
end main 