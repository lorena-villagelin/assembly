TITLE entra e sai decimal
.MODEL SMALL
.STACK 100H
.CODE 
    MAIN PROC
        XOR BX, BX
        
        leitura:
            MOV AX, 10
            MUL BX 
            PUSH AX

            MOV AH, 01H
            INT 21H

            AND AL, 0FH
            CMP AL, 0DH
            JE segue

            XOR AH, AH
            
            POP BX
            ADD BX, AX
            JMP leitura

        segue:

            MOV AX, 10
            XCHG BX, AX
            XOR CX, CX
            conta:
                DIV BX
                PUSH DX
                INC CX
                OR AX, AX
                JE impressao
                XOR DX, DX
                JMP conta

        impressao:
            MOV AH, 02H
            POP DX
            OR DL, 30H
            INT 21H
           LOOP impressao
        
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN