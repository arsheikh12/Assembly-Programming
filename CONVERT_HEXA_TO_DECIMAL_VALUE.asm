.MODEL SMALL            
.STACK 100h
.DATA

MSG1 DB 0Dh,0Ah, "ENTER A HEXADECIMAL VALUE: ","$"
MSG2 DB 0Dh,0Ah, "IN DECIMAL IT IS: ","$" 
MSG3 DB 0DH,0AH, "ILLEGAL CHARACTER 0..9 OR A..F ","$"
MSG4 DB 0DH,0AH, " DO YOU WANT TO DO IT AGAIN?" ,"$"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEVEL:

        MOV AH,9
        LEA DX, MSG1
        INT 21h
       
        MOV AH,1
        INT 21h
        MOV BL,AL
         
        CMP BL,'A'
        JGE UPPER_THAN_10
        
        MOV AH,9
        LEA DX, MSG2
        INT 21h
        MOV AH,2
        MOV DL,BL
        INT 21h
        
        JMP ASK
   
        UPPER_THAN_10:
            
            CMP BL,'F'
            JG ILLEGAL
            
            MOV AH,9
            LEA DX, MSG2
            INT 21h
            
            SUB BL,17
            MOV AH,2
            MOV DL,'1'
            INT 21h
            MOV DL,BL
            INT 21h
               
        ASK:
            MOV AH,9
            LEA DX,MSG4
            INT 21h
            MOV AH,1
            INT 21h
            CMP AL,'Y'
            JE LEVEL
            CMP AL, 'y'
            JE LEVEL
            JMP EXIT
        
        ILLEGAL:
            MOV AH,9
            LEA DX,MSG3
            INT 21h
            JMP LEVEL
        EXIT:            
ENDP
END MAIN
