ORG 0100H
.DATA
I DW 1
RESULT DW ?

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,1
    INT 21h   
      
    SUB AL,'0'
    MOV AH, 0
    MOV CX,AX
    
    MOV DX,0
    
    SUM:    
        SUB DX,I
        SUB CX,1
        CMP CX,0
        JE EXIT
        INC I
        ADD DX,I
        INC I
        LOOP SUM
    
    EXIT:
    
    MOV RESULT,DX
ENDP
END MAIN