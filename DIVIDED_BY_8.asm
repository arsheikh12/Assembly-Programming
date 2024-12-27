;Q-2.Write a program to divide AX by 8 using Shift instructions. You should not use the DIV
;instruction. Assume AX is a multiple of 8.

ORG 100H
.CODE 
MAIN PROC
    
    MOV AX,16
    XOR DX, DX          
    
    MOV BX, AX         
    SHR BX, 3
    
MAIN ENDP
END MAIN
RET