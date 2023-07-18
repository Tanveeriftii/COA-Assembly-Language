.model small
.stack 100h
.data
  msg1 db 'input hexa:$'
  msg2 db 0dh,0ah, 'output in binary:$'
.code
main proc
    
      mov ax, @data
      mov ds,ax
      
      
      mov bh,0h
      mov bl,0h
      mov ah,9
      lea dx,msg1
      int 21h
      mov ah,1
      int 21h
      mov bl,al
      int 21h
      mov bh,al 
      mov ah,9
      lea dx,msg2
      int 21h
      cmp bl,41h 
      mov cx,8
      jge op 
      jmp op1
      op:
      cmp bl,46h
      jle me
      jmp exit
      me:
      sub bl,37h
      cmp bh,41h
      jge mee
      jmp meee
      mee:
      cmp bh,46h
      jle meeee
      jmp exit
      meeee:
      sub bh,37h
      shl bl,4
      or bl,bh
      jmp l1
      meee:
      cmp bh,30h
      jge meeeee 
      jmp exit
      meeeee: 
      cmp bh,39h
      jle meeeeee
      jmp exit
      meeeeee:
      sub bh,30h
      shl bl,4
      or bl,bh
      jmp l1
      
      op1:
      cmp bl,39h
      jle te
      jmp exit
      
      te:
      sub bl,30h 
      cmp bh,41h
      jge tee
      jmp teee
      tee:
      cmp bh,46h
      jle teeee
      jmp exit
      teeee:
      sub bh,37h
      shl bl,4
      or bl ,bh
      jmp l1
      teee:
      cmp bh,30h
      jge teeeee 
      jmp exit
      teeeee: 
      cmp bh,39h
      jle meeeeee
      jmp exit
      teeeeee:
      sub bh,30h
      shl bl,4
      or bl,bh
      jmp l1
      
      
      
      
      
      
      l1:
      mov ah,2
      mov dl,bl
      int 21h
    
exit:
     mov ah,4ch
     int 21h
     
     
main endp
end main   