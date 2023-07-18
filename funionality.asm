;funcionality
.model small
.stack 100h
.data

m db "hello world$" ;m=variable name
.code
main proc ; procedure 
    ; 1--single key input
    ; 2--single char output 
    ; 3--chaaracter string output
    
    mov ax, @data ; data akta nam of segment
    mov ds, ax ; bcz of large data we choose ax, small hole al
    
    mov ah, 9
    lea dx, m
    int 21h
    
    mov ah,1 ; input nibe
    int 21h
    mov bl, al
    
     
    mov ah, 2
    int 21h
    mov dl,bl
    int 21h
    exit:
    mov ah, 4ch 
    int 21h
    main endp
end main
    
    
    