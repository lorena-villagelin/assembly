TITLE entrada_hexa
.MODEL SMALL
.STACK 100h
.CODE
    MAIN PROC
        MOV AH, 01H 
        INT 21H

        XOR BX, BX

        leitura:

            CMP AL, 0DH
            JE fim

            CMP AL, 39H
            JG letra 

            AND AL, 0FH
            JMP segue

            letra:
                SUB AL, 37H 

            segue:
                SHL BX, 4
                OR BL, AL
                JMP leitura
        
        fim:
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP 
END MAIN