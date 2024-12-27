ORG 100H
.DATA
X DB ? 
Z DB ? 
MX DB 'INPUT VALUE $'
MZ DB 'OUTPUT = $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9      ;DISPLAY MX
    LEA DX,MX
    INT 21H 
    
    MOV AH,1    ;INPUT X
    INT 21H
    MOV BL,AL
    
    INT 21H
    MOV BH,AL
    
    INT 21H
    MOV CL,AL
                
    CMP BL,BH
    JGE BIG_A 
    
    CMP BH,CL
    JGE OUTPUT_B
     
    MOV AH,2         ;NEW LINE 
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
            
    
    MOV AH,9      ;DISPLAY MZ
    LEA DX,MZ
    INT 21H 
    
    MOV AH,2         ;OUTPUT
    MOV DL,CL
    INT 21H
    JMP EXIT
    
    
    BIG_A: 
    
     CMP BL,CL
     JGE OUTPUT_A 
     
    
   OUTPUT_A:
    MOV AH,2         ;NEW LINE 
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
            
    
    MOV AH,9      ;DISPLAY MZ
    LEA DX,MZ
    INT 21H 
    
    MOV AH,2         ;OUTPUT
    MOV DL,BL
    INT 21H
    JMP EXIT   
             
   OUTPUT_B:
    MOV AH,2         ;NEW LINE 
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
            
    
    MOV AH,9      ;DISPLAY MZ
    LEA DX,MZ
    INT 21H 
    
    MOV AH,2         ;OUTPUT
    MOV DL,BH
    INT 21H
    JMP EXIT 
        
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
 
