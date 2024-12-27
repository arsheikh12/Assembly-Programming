
.DATA
    N DB ?                           
.CODE
MAIN PROC
    MOV AX, @DATA   
    MOV DS, AX

    
    MOV AH, 01h            
    INT 21h               
    SUB AL, '0'            
    MOV N, AL             

    
    MOV CL,N              ;
    XOR BX, BX             
    MOV BL, 1              

SUM_LOOP:
    ADD BH, BL             
    INC BL                 
    LOOP SUM_LOOP          

      

 
    MOV AH, 4Ch           
    INT 21h

MAIN ENDP
END MAIN
