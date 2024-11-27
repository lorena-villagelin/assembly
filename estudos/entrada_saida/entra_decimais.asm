TITLE entrada_decimais 
.MODEL SMALL
.STACK 100
.CODE
    MAIN PROC
        XOR BX, BX 

        leitura:
        MOV AH, 01H
        INT 21H
        CMP AL, 0DH
        JE fim

        AND AL, 0FH
        MOV AH, 0
        PUSH AX

        MOV AX, 10
        MUL BX
        POP AX 
        ADD BX, AX 
        JMP leitura

    fim:
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN

