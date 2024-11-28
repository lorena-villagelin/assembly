TITLE saida decimal
.MODEL SMALL 
.STACK 100H
.CODE
    MAIN PROC

        MOV AX, 12345

        XOR CX, CX
        MOV BX, 10

        conta:
            XOR DX, DX
            DIV BX
            PUSH DX
            INC CX 
            OR AX, AX
            JNE conta

        MOV AH, 02H

        impressao:
            POP DX
            OR DX, 30H
            INT 21H
            LOOP impressao 

        MOV AH, 4CH
        INT 21H

    MAIN ENDP
END MAIN        