
org 0100h
.data 
message db 'WE aRe DueT STUDenTS','$'   
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,message
    int 21h
    mov ah, 2
    mov dl,0Dh
    int 21h
    mov dl,0Ah
    int 21h   
    
    mov cx,20
    xor si,si
    Forwar_travers:
        cmp message[si],' ' 
        je SpaceSkip 
        cmp  message[si], 'a'
        jge first_Small_letter
        SpaceSkip:
            inc si
            loop Forwar_travers 
        first_Small_letter:
        mov ah,2
        mov dl,message[si]
        int 21h 
        
        mov ah, 2
        mov dl,0Dh
        int 21h
        mov dl,0Ah
        int 21h  
        
        mov cx,20
        xor si,20
    Backwar_travers:
        cmp message[si],' ' 
        je SpaceSkip2 
        cmp  message[si], 'a'
        jge last_Small_letter
        SpaceSkip2:
            dec si
            loop Backwar_travers 
        last_Small_letter:
        mov ah,2
        mov dl,message[si]
        int 21h 
        
main endp
end main
ret