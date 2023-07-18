.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER A HEX DIGIT: $'
MSG2 DB 'IN DECIMAL IS IT: $'
MSG3 DB 'DO YOU WANT TO DO IT AGAIN? $'
MSG4 DB 'IILEGAL CHARACTER: ENTER 0-9 OR A-F: $'
MSG5 DB 10,13,'$'
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    START1:
    MOV AH,9
    LEA DX,MSG1  ;PRINT MSG1
    INT 21H
    
    START2:
    MOV AH,1
    INT 21H      ;INPUT
    MOV BL,AL
    
    MOV AH,9
    LEA DX,MSG5  ;NEWLINE
    INT 21H
    
    
    CMP BL,"0"
    JB NO         ;SET NUMBER 0-9
    CMP BL,"9"
    JA PROGRAM    ;JUMP IF ABOVE
    
    JMP NUMBER
    
    
    PROGRAM:
    CMP BL,"A"
    JB NO         ;JUMP IF BELOW
    CMP BL,"F"
    JA NO
    JMP LETTER    ;JUMP LETTER
    
    
    NO:
    MOV AH,9
    LEA DX,MSG4   ;PRINT MSG4
    INT 21H
    JMP START2    ;JUMP START2
    
    
    NUMBER:       ;LOOP NUMBER
    MOV AH,9
    LEA DX,MSG2   ;PRINT MSG2
    INT 21H
    
    MOV AH,9
    LEA DX,MSG5   ;PRINT MSG5
    INT 21H
    
    JMP REPEAT    ;JUMP REPEAT
    
    
    REPEAT:       ; LOOP REPEAT
    
    MOV AH,9
    LEA DX,MSG3   ;PRINT MSG3
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV AH,9
    LEA DX,MSG5   ;NEWLINE
    INT 21H
    
    CMP BH,"Y"
    JE START1     ;IF PUT Y OR y THE PROGRAM WILL REPEATS
    CMP BH,"y"
    JE START1
    JMP EXIT      ;JUMP EXIT
    
    LETTER:       ;LOOP LETTER
    MOV AH,9
    LEA DX,MSG2   ;JUMP MSG2
    INT 21H
    
    MOV AH,2
    MOV DL,'1'
    INT 21H
    
    SUB BL,17
    MOV DL,BL
    INT 21H
    
    
    MOV AH,9
    LEA DX,MSG5    ;NEWLINE
    INT 21H
    JMP REPEAT     ;JUMP REPEAT
    
    
    EXIT:         ;LOOP EXIT
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    
    