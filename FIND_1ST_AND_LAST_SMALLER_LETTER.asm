INCLUDE 'EMU8086.INC'
.MODEL SMALL
 .STACK 100H

.DATA
        
MASSAGE DB 'WE aRE DUET STuDeNTs', 0Dh, 0Ah, '$'  ;WE ARE DUET STUDENTS
NOSMALL DB 'No small letters','$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MASSAGE
    INT 21h
    
    MOV AH,2
    MOV DL,0Dh
    INT 21h
    MOV DL, 0Ah
    INT 21h        
    XOR SI,SI
    MOV CX,20
    
    FIRST_SMALL: 
        CMP MASSAGE[SI],' '
        JE NEXT
        CMP MASSAGE[SI],'a'
        JGE PRINTFIRST_SMALL
        
        NEXT:
        INC SI
        LOOP FIRST_SMALL
    
    
    PRINTFIRST_SMALL:
        MOV DL,MASSAGE[SI]
        MOV AH,2
        INT 21h
        MOV DL,0Dh
        INT 21h
        MOV DL,0Ah
        INT 21h
    

    
    
        MOV SI,20
        MOV CX,20
        
        LAST_SMALL:
            CMP MASSAGE[SI],' '
            JE NEXT1
            CMP MASSAGE[SI],'a'
            JGE PRINTLAST_SMALL
            
            NEXT1:
            DEC SI
            LOOP LAST_SMALL
    CMP CX,0
    JE PRINT_NO_SMALL_LETTERS
            
        PRINTLAST_SMALL:
            MOV DL,MASSAGE[SI]
            MOV AH,2
            INT 21h
            JMP EXIT
    
    
    PRINT_NO_SMALL_LETTERS:
        MOV AH,9
        LEA DX,NOSMALL
        INT 21h
        
    EXIT:
        

ENDP
END MAIN    
