; Q-5.a. A = 5 * A - 7  

.MODEL SMALL
.STACK 100H

.DATA
    A DW 10                
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    MOV AX,A
    MOV CX,5      
    IMUL CX        
    SUB AX,7         
    MOV A,AX      

MAIN ENDP
END MAIN