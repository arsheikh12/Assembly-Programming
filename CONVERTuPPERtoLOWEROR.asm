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
    MOV X,AL
                
    CMP X,97
    JGE LOWER 
    
    CMP X,90
    JLE UPPER
    
    LOWER: 
    
    MOV AL,X 
    SUB AL,32D
    MOV Z,AL
    
    MOV AH,2         ;NEW LINE 
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
            
    
    MOV AH,9      ;DISPLAY MZ
    LEA DX,MZ
    INT 21H 
    
    MOV AH,2         ;OUTPUT
    MOV DL,Z
    INT 21H   
             
    UPPER: 
    
    MOV AL,X 
    ADD AL,32D
    MOV Z,AL
     
    MOV AH,2         ;NEW LINE 
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
            
    MOV AH,9      ;DISPLAY MZ
    LEA DX,MZ
    INT 21H 
    
    MOV AH,2         ;OUTPUT
    MOV DL,Z
    INT 21H    
    
    MAIN ENDP
END MAIN
 
