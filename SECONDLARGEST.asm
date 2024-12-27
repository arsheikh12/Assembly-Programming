include 'emu8086.inc'
.model small
.stack 100h
.data
.code
main proc
    ; Input first number
    mov ah, 1
    int 21h
    sub al, '0'      ; Convert ASCII to integer
    mov bl, al       ; Store in BL (first input)
    
    ; Input second number
    mov ah, 1
    int 21h
    sub al, '0'      ; Convert ASCII to integer
    mov bh, al       ; Store in BH (second input)
    
    ; Input third number
    mov ah, 1
    int 21h
    sub al, '0'      ; Convert ASCII to integer
    mov cl, al       ; Store in CL (third input)

    ; Sort the numbers in BL (largest), BH (second largest), CL (smallest)
    cmp bl, bh
    jge skip_swap1
    xchg bl, bh      ; Swap BL and BH if BH > BL
skip_swap1:
    cmp bl, cl
    jge skip_swap2
    xchg bl, cl      ; Swap BL and CL if CL > BL
skip_swap2:
    cmp bh, cl
    jge skip_swap3
    xchg bh, cl      ; Swap BH and CL if CL > BH
skip_swap3:

    ; At this point:
    ; BL = largest
    ; BH = second largest
    ; CL = smallest

    ; Output the second largest number (BH)
    add bh, '0'      ; Convert integer to ASCII
    mov ah, 2
    mov dl, bh
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
