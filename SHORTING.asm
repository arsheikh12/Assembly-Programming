ORG 100H
.DATA                      
A DB 0,3,6,1,5,2,4,7,9,8                    
I DB ?
J DB ?             
.CODE 
MAIN PROC
                           
    MOV AX, @DATA
    MOV DS, AX
    
    
    MOV CX,10
    MOV SI,0
    CONVERT_TO_DIGIT:
        
        OR A[SI],48
        INC SI
        LOOP CONVERT_TO_DIGIT 
             
    MOV CX,10
    MOV SI,0    
        
    PRINT:
        
        MOV AH,2
        
        MOV DL,A[SI]
        INT 21h
        INC SI 
        LOOP PRINT
    
    MOV AH,2
    MOV DL,0Dh
    INT 21h
    MOV DL,0Ah
    INT 21h
    
    MOV I,-1 
    
    OUTER_LOOP:
        INC I
        CMP I,9
        JE EXIT
        ; J= I
        MOV BH,I
        MOV J,BH
        INNER_LOOP:
            
            CMP J,9
            JE OUTER_LOOP
            INC J
           
            MOV CL,I
            XOR CH,CH
            MOV SI,CX
            
            MOV DH, A[SI]   
            
           
            MOV CL,J
            XOR CH,CH
            MOV SI,CX
            
            MOV DL,A[SI]  
            CMP DH, DL     
            JGE SWAP
            JMP INNER_LOOP
    SWAP:
        MOV A[SI],DH    
        MOV CL,I
        XOR CH,CH
        MOV SI,CX
        MOV A[SI],DL    
        JMP INNER_LOOP
    
    EXIT:
    MOV CX,10
    MOV SI,0
    PRINT2:
        
        MOV AH,2
        
        MOV DL,A[SI]
        INT 21h
        INC SI
        
        LOOP PRINT2   
ENDP
END MAIN
RET