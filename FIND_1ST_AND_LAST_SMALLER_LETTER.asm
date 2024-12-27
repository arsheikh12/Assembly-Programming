ORG 100H
.DATA        
STRINGS DB 'WE aRE DUET STuDeNTs', 0Dh, 0Ah, '$'  
NoSmaller DB 'No Small letters', '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 9
    LEA DX, STRINGS
    INT 21h
    XOR BX, BX
    MOV CX, 20
    MOV SI, 0
    
    FIRST_LOWER: 
        CMP STRINGS[SI], ' '
        JE SKIP1
        CMP STRINGS[SI], 'a'
        JGE DISPLAY_FIRST
        SKIP1:
            INC SI
            LOOP FIRST_LOWER
    
    DISPLAY_FIRST:
        MOV DL, STRINGS[SI]
        MOV AH, 2
        INT 21h
        MOV AH, 2
        MOV DL,0Dh
        INT 21h
        MOV DL,0Ah
        INT 21h
        MOV SI, 20
        MOV CX, 20
        
    LAST_LOWER:
        CMP STRINGS[SI], ' '
        JE SKIP2
        CMP STRINGS[SI], 'a'
        JGE DISPLAY_LAST
        SKIP2:
            DEC SI
            LOOP LAST_LOWER
            CMP CX,0
            JE NO_LOWERCASE
    DISPLAY_LAST:
        MOV DL, STRINGS[SI]
        MOV AH, 2
        INT 21h
        JMP END_PROGRAM
    
    NO_LOWERCASE:
        MOV AH, 2
        LEA DX, NoSmaller
        INT 21h   
    END_PROGRAM:
        MOV AH, 4Ch
        INT 21h
MAIN ENDP
END MAIN