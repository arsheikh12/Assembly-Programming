;Q-1.Write a program to multiply AX by 27 using only Shift and Add instructions. 

ORG 100H
.CODE 
MAIN PROC
    MOV AX,10
    xor DX, DX           
    mov BX, AX         
    shl BX, 4           
    add DX, BX            
    mov BX, AX           
    shl BX, 3            
    add DX, BX              
    mov BX, AX          
    shl BX, 1            
    add DX, BX             
    add DX, AX
main endp
end main
ret       