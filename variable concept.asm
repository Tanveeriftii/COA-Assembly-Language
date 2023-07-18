;variable concept
;jodi kono initialize data deya thake & 
;user input niye kivabe kaaj korbe 

.model small
.stack 100h
.data
msg db 3
msg1 db ? ;dont know just taking unknown value
.code
main proc
    mov ax, @data ;initialize .data segment
    mov ds, ax 
    
    
    mov ah, 2
    add msg,48
    mov dl,msg
    int 21h
    
    ;if not initialize the msg then,
    
    
    mov ah, 1
    int 21h
    mov msg1,al
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13 
    int 21h
    
    mov ah, 2 
    mov dl, msg1
    int 21h