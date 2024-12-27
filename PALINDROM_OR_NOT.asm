; Program to check if a byte is a palindrome using rotate instructions.
; If the byte is a palindrome, move 0xAA into BL, otherwise move 0x00 into BL.

org 100h               
MAIN PROC
    mov al, 11011011B 
    mov ah, al        
    rol al, 8                     
  
    cmp al, ah          
    je palindrome      

    mov bl, 00h
    jmp end_program

  palindrome:
    
    mov bl, 0AAh

  end_program:
    nop                
MAIN ENDP
END MAIN
RET

