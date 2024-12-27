org 0100h
.data 
array db 1,8,5,6,3,2,9
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,7
    mov si,0 
    convert:
    add array[si],48 
    inc si
    loop convert 
    mov cx,7
    mov si,0
    print:
    mov ah,2
    mov dl,array[si]
    int 21h
    inc si 
    loop print
    
    
main endp
end main 
ret
    




