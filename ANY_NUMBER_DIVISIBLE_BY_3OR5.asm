 org 0100h
.DATA
    N DB 0              
    DIV3 DB ' is divisible by 3$', 0 
    DIV5 DB ' is divisible by 5$', 0
    NOTDIV DB 'not divisible by 3 or 5$', 0   
.CODE
MAIN PROC
    MOV AX, @DATA    
    MOV DS, AX 
    
    MOV ah,1h
    INT 21h
    SUB al,'0' 
    MOV cl,al    
   
    MOV bl,3
    MOV ah,0
    
    DIV bl
    CMP ah,0
    JE LEVEL1
              
              
    MOV AL,CL
    MOV bl,5
    MOV ah,0
        
    DIV bl
        
    CMP ah,0
    JE LEVEL2
    
     MOV DX, OFFSET NOTDIV 
     MOV AH, 9h             
     INT 21h
     JMP EXIT 
    
    LEVEL2:
    
    MOV DX, OFFSET DIV5 
    MOV AH, 9h             
    INT 21h
    JMP EXIT 
    
    LEVEL1:
    
    MOV DX, OFFSET DIV3 
    MOV AH, 9h             
    INT 21h
    JMP EXIT 
   EXIT:   