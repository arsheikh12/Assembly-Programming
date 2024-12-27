.DATA
    N DB ?               ; Variable to store user input
    RESULT DW 0          ; Variable to store the sum of squares

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Input a number from the user
    MOV AH, 01h          ; Function to input a character
    INT 21h              ; Read character
    SUB AL, 48           ; Convert ASCII to decimal
    MOV N, AL            ; Store the number in N

    ; Initialize RESULT to 0
    MOV RESULT, 0

    ; Initialize registers for the loop
    MOV CL, N            ; Set loop counter to N
    XOR AX, AX           ; Clear AX
    XOR BX, BX           ; Clear BX (used for sum)

SUM_LOOP:
    INC BX               ; Increment BX (current number in sequence)
    MOV DX, BX           ; Copy BX to DX (for squaring)
    MUL DX               ; AX = BX * BX (square of the number)
    ADD RESULT, AX       ; Add the square to RESULT
    LOOP SUM_LOOP        ; Decrement CL and repeat if not zero

    ; Exit the program
    MOV AH, 4Ch          ; Terminate program
    INT 21h

MAIN ENDP
END MAIN
