.MODEL SMALL
.STACK 100h   
.DATA
N1 DB ?
N2 DB ?
PALINDROMEE db 0Ah,0Dh, "Palindrome" , "$"
NOTPALINDROME db 0Ah, 0Dh, "Not Palindrome", "$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV BH,10011001b
    MOV BL,BH
    MOV CH,8    
    LEVEL1:       
        CMP CH,0
        JE PALINDROME
        ROL BH,1
        JC SET_N1
        MOV N1,0
        JMP LEVEL2       
        SET_N1:
            MOV N1,1        
    LEVEL2:        
        ROR BL,1
        JC SET_N2
        MOV N2,0
        JMP CHECK       
        SET_N2:
            MOV N2,1           
        CHECK:
             MOV CL,N1
             CMP CL,N2
             JNE NOT_PALINDROME
             DEC CH
             JMP LEVEL1                               
    PALINDROME:
            MOV AH,9
            LEA DX,PALINDROMEE
            INT 21h
	    MOV DL,0AAh
            JMP EXIT               
    NOT_PALINDROME:
            MOV AH,9
            LEA DX,NOTPALINDROME
            INT 21h
	    MOV DL,00h
    EXIT:   
ENDP
END MAIN
