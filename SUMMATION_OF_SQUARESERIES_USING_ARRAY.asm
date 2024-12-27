ORG 100H
.DATA                      
A DB 9 DUP(0)                    
MASSAGE DB 'ENTER THE VALUE OF N:$'              
.CODE 
MAIN PROC
                           
    MOV AX, @DATA
    MOV DS, AX
    MOV AH,9
    LEA DX,MASSAGE
    INT 21h
    
    MOV AH,1
    INT 21h
    
    SUB AL,'0'        
    MOV AH,0
    MOV CX,AX
    MOV BX,AX
    MOV DL,1
    XOR SI,SI
    ARRAY:
    MOV A[SI],DL
    INC DL
    INC SI
    LOOP ARRAY      
    MOV CX,BX 
    XOR DX,DX
    XOR SI,SI
    SUMATION:
    MOV AL, A[SI]
    MUL AL
    ADD DX,AX
    INC SI
    LOOP SUMATION
MAIN ENDP
END MAIN
RET