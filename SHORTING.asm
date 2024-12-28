.DATA
 A DB 7,2,1,8,9,3,6,5
 .CODE
 MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,8
    MOV SI,0
    
    DIGIT_DECIMAL:
       OR A[SI],48
       INC SI
       LOOP DIGIT_DECIMAL
       
     MOV CX,8
     MOV SI,0
     PRINT_BEFORE:
        MOV AH,2
        MOV DL,A[SI]
        INT 21H 
        INC SI
        LOOP PRINT_BEFORE  
     MOV CX,8
     MOV SI,0
     MOV DH,-1
     OUTER_LOOP:
       INC DH
       CMP DH,7
       JGE EXIT
       MOV DL,DH
       INNER_LOOP:
          
          CMP DL,7   
          JGE  OUTER_LOOP
          INC DL  
          
          MOV CL,DL
          MOV CH,0
          MOV SI,CX
          MOV BL,A[SI] 
          
          MOV CL,DH
          MOV CH,0
          MOV SI,CX
          MOV BH,A[SI] 
          CMP BH,BL
          JGE SWAP
          JMP INNER_LOOP
       SWAP:
         MOV CL,DH
         MOV CH,0
         MOV SI,CX
         MOV A[SI],BL  
         
         MOV CL,DL
         MOV CH,0
         MOV SI,CX
         MOV A[SI],BH
         JMP INNER_LOOP
       EXIT:
          MOV AH,2H
          MOV DL,0AH
          INT 21H
          MOV DL,0DH
          INT 21H  
          
       MOV CX,8
      MOV SI,0
      PRINT_AFTER:

            MOV AH,2
            MOV DL,A[SI]
            INT 21h
            INC SI
            LOOP PRINT_AFTER
                    
          
MAIN ENDP
END MAIN
       
       
    
