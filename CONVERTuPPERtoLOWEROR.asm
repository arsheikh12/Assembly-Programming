.STACK 100h
.DATA


.CODE
MAIN PROC

    ;input
   
    MOV AH,1
    INT 21h
    MOV BL,AL
    
    ;new line
    MOV AH,2
    MOV DL, 0Dh
    INT 21h
    MOV DL,0Ah
    INT 21H
    
    CMP BL,'a'
    JGE PRINT_CAPITAL
    
    PRINT_SMALL:
        ADD BL,32
        MOV AH,2
        MOV DL, BL
        INT 21h
        JMP EXIT
    PRINT_CAPITAL:
        
        SUB BL,32
        MOV AH,2
        MOV DL, BL
        INT 21h
        JMP EXIT
    EXIT:
ENDP
END MAIN
RET
