ORG 0100h
.DATA 
 a db ?
MX DB 'INPUT VALUE $'                          
.CODE  
MAIN PROC
    MOV AX, @DATA   
    MOV DS, AX
    
    MOV AH,9      ;DISPLAY MX
    LEA DX,MX
    INT 21H 
    ; Input a character
    MOV AH, 01h
    INT 21h 
    MOV a, AL
    MOV BL, AL

    ; Check if lowercase or uppercase and convert to uppercase if necessary
    CMP BL, 'a'
    JB PROCESS
    CMP BL, 'z'
    JA NOT_LOWER
    SUB BL, 32        ;Convert lowercase to uppercase

NOT_LOWER:
PROCESS:
    ; Print newline
    MOV AH, 2 
    MOV DL, 0DH 
    INT 21h
    MOV DL, 0AH 
    INT 21h

    ; Forward print (5 characters)
    MOV CX, 5
FORWARD_LOOP:
    CMP BL, 'Z'
    JLE NO_RESET_FORWARD
    MOV BL,'A'
NO_RESET_FORWARD:
    INC BL
    MOV DL, BL
    MOV AH, 2
    INT 21h
    LOOP FORWARD_LOOP

    ; Print newline
    MOV DL, 0DH 
    MOV AH, 2 
    INT 21h
    MOV DL, 0AH 
    INT 21h

    ; Backward print (5 characters)
    MOV BL, a
    CMP BL, 'A'
    JB ADJUST_BACK
    CMP BL, 'Z'
    JA ADJUST_BACK
    ADD BL, 32        ; Convert uppercase to lowercase if needed

ADJUST_BACK:
    MOV CX, 5
BACKWARD_LOOP:
    CMP BL, 'A'
    JGE NO_RESET_BACKWARD
    MOV BL, 'Z' + 1
NO_RESET_BACKWARD:
    DEC BL
    MOV DL, BL
    MOV AH, 2
    INT 21h
    LOOP BACKWARD_LOOP

EXIT:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN
