.MODEL SMALL
.STACK
.DATA
MSG1 DB 'ENTER 1ST CAPITAL LETTER: $'
MSG2 DB 'ENTER 2ND CAPITAL LETTER: $'
MSG3 DB 'ALPHABETICAL ORDER IS: $'

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9
    LEA DX,MSG1    ;PRINT MSG1
    INT 21H
    
    MOV AH,1
    INT 21H        ;TAKE INPUT
    MOV BL,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H        ;NEWLINE
    MOV DL,13
    INT 21H
    
    MOV AH,9
    LEA DX,MSG2    ;PRINT MSG2
    INT 21H
    
    
    MOV AH,1
    INT 21H        ;TAKE 2ND INPUT
    MOV CL,AL 
    
    MOV AH,2
    MOV DL,10
    INT 21H        ;NEWLINE
    MOV DL,13
    INT 21H
    
    CMP BL,CL      ;COMPARE BL & CL
    JGE N1         ;JUMP IF GREATER THAN OR EQUAL
    JMP N2         ;JUMP N2
    
    
    N1:
    MOV AH,9
    LEA DX,MSG3    ;N1 LOOP
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H        ;NEWLINE
    MOV DL,BL
    INT 21H
    JMP EXIT       ;JUMP EXIT
    
    N2:
    MOV AH,9
    LEA DX,MSG3    ;N2 LOOP
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H        ;NEWLINE
    MOV DL,CL
    INT 21H
    JMP EXIT       ;JUMP EXIT
    
    EXIT:
    MOV AH,4CH
    INT 21H        ;EXIT LOOP
    MAIN ENDP
END MAIN
    
    
    
