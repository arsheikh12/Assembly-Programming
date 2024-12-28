ORG 0100h
.DATA
INPUT DB ?      ; To store the input character
PROMPT DB 'Input a letter: $'
NEWLINE DB 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,09H
    LEA DX,PROMPT
    INT 21H
    
    MOV AH,1H
    INT 21H
    MOV INPUT,AL 
    
    MOV AH,2
    MOV DL,0Ah
    INT 21h
    MOV DL,0Dh
    INT 21h
 
    MOV AL,INPUT
    CMP AL,'a' 
    JB UPPERCASE_INPUT
    CMP AL,'z'
    JA INVALID_INPUT
    JMP PROCESS_INPUT_LOWER
    
    UPPERCASE_INPUT:
       CMP AL,'A' 
       JB  INVALID_INPUT 
       CMP AL,'Z'
       JA INVALID_INPUT
       JMP PROCESS_INPUT_UPPER
       
    PROCESS_INPUT_LOWER:
        MOV BL,INPUT
        MOV CX,5
        FORWARD_LOOP_LOWER:
           INC BL
           CMP BL,'z'
           JLE STORE_FORWARD
           MOV BL,'a'
           STORE_FORWARD:
              MOV AL,BL
              SUB AL,32
              MOV DL,AL
              MOV AH,2H
              INT 21H
              LOOP FORWARD_LOOP_LOWER 
           MOV AH,09H
           LEA DX,NEWLINE
           INT 21H 
         MOV CX,5
         mov bl,input
         BACKWARD_LOOP_LOWER:
           DEC BL
           CMP BL,'a'
           JGE STORE_BACKWARD
           MOV BL,'z'
           STORE_BACKWARD:
              MOV AL,BL
              SUB AL,32
              MOV DL,AL
              MOV AH,2H
              INT 21H
              LOOP BACKWARD_LOOP_LOWER 
           MOV AH,9
           LEA DX,NEWLINE
           INT 21H
           JMP EXIT 
           
      PROCESS_INPUT_UPPER:
        MOV BL,INPUT
        MOV CX,5
        FORWARD_LOOP_UPPER:
           INC BL
           CMP BL,'Z'
           JLE STORE_FORWARD_UPPER
           MOV BL,'A'
           STORE_FORWARD_UPPER:
              MOV AL,BL
              ADD AL,32
              MOV DL,AL
              MOV AH,2H
              INT 21H
              LOOP FORWARD_LOOP_UPPER 
           MOV AH,09H
           LEA DX,NEWLINE
           INT 21H 
         MOV CX,5
         mov bl,input
         BACKWARD_LOOP_UPPER:
           DEC BL
           CMP BL,'A'
           JGE STORE_BACKWARD_UPPER
           MOV BL,'Z'
           STORE_BACKWARD_UPPER:
              MOV AL,BL
              ADD AL,32
              MOV DL,AL
              MOV AH,2H
              INT 21H
              LOOP BACKWARD_LOOP_UPPER 
           MOV AH,9
           LEA DX,NEWLINE
           INT 21H
           JMP EXIT
           
        
INVALID_INPUT:

    MOV AH, 4Ch
    INT 21h

EXIT:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN
