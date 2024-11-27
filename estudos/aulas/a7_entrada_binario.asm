TITLE entrada_binario
.MODEL SMALL
.STACK 100H 
.DATA 
    digite DB 'Digite o valor binario: $'

.CODE
    MAIN PROC 
        ;chama dado
        MOV AX, @DATA
        MOV DS, AX 

        ;instrução impressão 'digite'
        MOV AH, 09H 
        LEA DX, digite
        INT 21H

        ;inicializa bx
        XOR BX,BX
        ;inicializa contador CX para 16 posições
        MOV CX, 16
        ;instrução leitura
        MOV AH, 01H

        leitura:
            INT 21H
            ;verifica se o valor digitado é CR
            CMP AL, 0DH
            ;se for, finaliza
            JE fim
            ;transforma em binario
            AND AL, 0FH 
            ;pula um para esqueda, abre espaço para mais um bit
            SHL BX, 1
            ;passa o valor para LSB
            OR BL, AL 
            LOOP leitura

        fim: 
            MOV AH, 4CH 
            INT 21H
    MAIN ENDP
END MAIN