ORG 0100H                      
.DATA
N DW ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    XOR BX, BX
    INPUT_LOOP:
        MOV AH, 1
        INT 21H 
        CMP AL, 0Dh        
        JE END_INPUT_LOOP
        CMP AL, 0Ah 
        JE END_INPUT_LOOP    
        SUB AL,'0'
        MOV AH,0      
        MOV CX, AX
        MOV AX, 10
        MUL BX
        ADD AX, CX
        MOV BX, AX
        JMP INPUT_LOOP

    END_INPUT_LOOP:
        MOV N,BX  
    MOV AH,2
    MOV DL,0Dh
    INT 21h
    MOV DL,0Ah
    INT 21h
    
    CMP N,50
    JL DISPLAY_F
    
    CMP N,60
    JL DISPLAY_D
    
    CMP N,70
    JL DISPLAY_C
    
    CMP N,80
    JL  DISPLAY_B
    
    CMP N,90
    JL  DISPLAY_A
    
    JMP DISPLAY_A_PLUS   
    
    DISPLAY_A_PLUS:
    
        MOV DL,'A'
        INT 21h
        MOV DL,'+'
        INT 21h
        JMP EXIT
    DISPLAY_A: 
        MOV DL,'A'
        INT 21h
        JMP EXIT
    DISPLAY_B:  
        MOV DL,'B'
        INT 21h
        JMP EXIT
    DISPLAY_C:  
        MOV DL,'C'
        INT 21h
        JMP EXIT
    DISPLAY_D:  
        MOV DL,'D'
        INT 21h
        JMP EXIT
    DISPLAY_F:  
        MOV DL,'F'
        INT 21h
        JMP EXIT
    EXIT:
    

MAIN ENDP
END MAIN
RET