.MODEL SMALL
.STACK 100h
.DATA
    Screen DB "Enter any Key: $"
    Error DB "Invalid Character : $"
    AgainMsg DB "Do You Want To Do It Again? (Y/N): $"
    Newline DB 0Ah, 0Dh, "$"
    Anycharter DB 0
    ChoiceYN DB 0
    A DB "10$"
    B DB "11$"
    C DB "12$"
    D DB "13$"
    E DB "14$"
    F DB "15$"
    Decimal DB "In Decimal value  $"
.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

.LOOP:
    MOV AH, 09h
    LEA DX, Screen
    INT 21h 

    MOV AH, 01h
    INT 21h
    MOV [Anycharter], AL 
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H

    MOV AL, [Anycharter]
    CMP AL, '0'
    JL inavalid
    CMP AL, '9'
    JG Check_Leters

valid_digit:
    SUB AL, '0'
    MOV BL, AL
    JMP displayDvalue

Check_Leters:
    CMP AL, 'A'
    JL inavalid
    CMP AL, 'F'
    JG inavalid
    SUB AL, 'A' - 10
    MOV BL, AL

    CMP AL, 10
    JE display_A
    CMP AL, 11
    JE display_B
    CMP AL, 12
    JE display_C
    CMP AL, 13
    JE display_D
    CMP AL, 14
    JE display_E
    CMP AL, 15
    JE display_F

    JMP displayDValue

inavalid:
    MOV AH, 09h
    LEA DX, Error
    INT 21h
    MOV AH, 09h
    LEA DX, Newline
    INT 21h
    JMP .LOOP

displayDValue:
    MOV AH, 09h
    LEA DX, Decimal
    INT 21h

    ADD BL, '0'
    MOV DL, BL
    MOV AH, 02h
    INT 21h

    MOV AH, 09h
    LEA DX, Newline
    INT 21h
    JMP Print

display_A:
    MOV AH, 09h
    LEA DX, A
    INT 21h
    JMP Printe_newline

display_B:
    MOV AH, 09h
    LEA DX, B
    INT 21h
    JMP Printe_newline

display_C:
    MOV AH, 09h
    LEA DX, C
    INT 21h
    JMP Printe_newline

display_D:
    MOV AH, 09h
    LEA DX, D
    INT 21h
    JMP Printe_newline

display_E:
    MOV AH, 09h
    LEA DX, E
    INT 21h
    JMP Printe_newline

display_F:
    MOV AH, 09h
    LEA DX, F
    INT 21h

Printe_newline:
    MOV AH, 09h
    LEA DX, Newline
    INT 21h

Print:
    MOV AH, 09h
    LEA DX, AgainMsg
    INT 21h

    MOV AH, 01h
    INT 21h
    MOV [ ChoiceYN], AL

    MOV AL, [ChoiceYN]
    CMP AL, 'y'
    JE .LOOP
    CMP AL, 'Y'
    JE .LOOP

    MOV AH, 4Ch
    INT 21h

END MAIN
