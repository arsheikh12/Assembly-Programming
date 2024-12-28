.MODEL SMALL
.STACK 100h

.DATA 

NL DB 0Ah,0Dh,"$"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CL,0
    INPUT:
        MOV AH,1
        INT 21h
        CMP AL,0Ah
        JE END_INPUT
        CMP AL, 0Dh
        JE END_INPUT
        
        MOV BL,AL
        MOV AL,CL
        MOV DL,10
        MUL DL
        ADD AL,BL
        MOV CL,AL
        LOOP INPUT
    
    END_INPUT:
    MOV AH,9
    LEA DX,NL
    INT 21h
    
    CMP CL,90
    JGE AP
    CMP CL,80
    JGE A
    CMP CL,70
    JGE B
    CMP CL,60
    JGE C
    CMP CL,50
    JGE D
    JMP F
    
    
    AP:
        MOV AH,2
        MOV DL,'A'
        INT 21h
        MOV DL,'+'
        INT 21h
        JMP EXIT
    A:
        MOV AH,2
        MOV DL,'A'
        INT 21h
        JMP EXIT
    
    B:
        MOV AH,2
        MOV DL,'B'
        INT 21h
        JMP EXIT
    C:
        MOV AH,2
        MOV DL,'C'
        INT 21h
        JMP EXIT
    D:
        MOV AH,2
        MOV DL,'D'
        INT 21h
        JMP EXIT
    F:
        MOV AH,2
        MOV DL,'F'
        INT 21h
        JMP EXIT
        
    EXIT:
ENDP
END MAIN
RET
