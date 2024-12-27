include 'emu8086.inc'
.model small
.stack 100h
.data
.code
main proc
    mov ah, 1        ; Input first character
    int 21h
    mov bl, al       ; Store in BL (first input)
    
    mov ah, 1        ; Input second character
    int 21h
    mov bh, al       ; Store in BH (second input)
    
    mov ah, 1        ; Input third character
    int 21h
    mov cl, al       ; Store in CL (third input)

    ; Compare BL (first input) with BH (second input)
    cmp bl, bh
    jge check_cl1    ; If BL >= BH, go to check with CL
    mov al, bh       ; Otherwise, AL = BH
    jmp check_cl2

check_cl1:
    mov al, bl       ; AL = BL

check_cl2:
    cmp al, cl
    jge output       ; If AL >= CL, AL holds the largest
    mov al, cl       ; Otherwise, AL = CL

output:
    mov ah, 2        ; Output the largest character
    mov dl, al
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
