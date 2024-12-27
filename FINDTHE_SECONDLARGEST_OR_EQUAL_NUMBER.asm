ORG 100H
.DATA
3rdDigit DB ?
MESSAGE DB 0Ah,0Dh,'ALL NUMBERS ARE EQUAL','$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,1
    INT 21h 
    MOV CL,AL
    
    INT 21h
    MOV BL,AL
    
    INT 21h
    MOV 3rdDigit,AL 
    MOV AH,2
    MOV DL,0Dh
    INT 21h
    MOV DL,0Ah
    INT 21h 
    
    CMP 3rdDigit,BL
    JE LEVEL2
    
    CMP BL,CL
    JE  LEVEL2
    
    CMP 3rdDigit,CL
    JE LEVEL2    
     
    
    CMP 3rdDigit,BL
    JG LEVEL1
    
    CMP BL,CL
    JL DISPLAY_B
    
    CMP 3rdDigit,CL
    JG DISPLAY_A
    
    CMP CL,3rdDigit
    JG DISPLAY_C   
    
    LEVEL1:
        CMP 3rdDigit,CL
        JL DISPLAY_A
        CMP CL,BL
        JG DISPLAY_C
        JMP DISPLAY_B   
    LEVEL2:
        
        CMP CL,3rdDigit
        JL DISPLAY_C

        CMP 3rdDigit,BL
        JL DISPLAY_A
        
        CMP BL,3rdDigit
        JL DISPLAY_B
        
        CMP 3rdDigit,CL
        JE MESSAGEDISPLAY     
    
    DISPLAY_A:                
        MOV DL,3rdDigit
        MOV AH,2
        INT 21h
        JMP EXIT
    
    DISPLAY_B:
    
        MOV DL,BL
        MOV AH,2
        INT 21h
        JMP EXIT
    
    DISPLAY_C:
   
        MOV DL,CL
        MOV AH,2
        INT 21h
        JMP EXIT
            
    MESSAGEDISPLAY:
    MOV AH,9
	LEA DX,MESSAGE
	INT 21h
         
EXIT:
ENDP
END MAIN    