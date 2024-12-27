.DATA
    NUM DB ?
    MSG DB 'THANK YOU $'              
.CODE
MAIN PROC
    MOV AX, @DATA   
    MOV DS, AX
     
    MOV AH, 1h    ;INPUT FROM KEYBOARD    
    INT 21h              
    MOV NUM, AL           

    MOV AH, 2 
    MOV DL, 0DH 
    INT 21h
    MOV DL, 0AH 
    INT 21h
    
    MOV AH,2H
    INT 21H
    MOV DL,NUM
    INT 21H
    
    MOV AH, 2H 
    MOV DL, 0DH 
    INT 21h
    MOV DL, 0AH 
    INT 21h
    
    MOV AH,9H
    LEA DX,MSG
    INT 21H

MAIN ENDP
END MAIN