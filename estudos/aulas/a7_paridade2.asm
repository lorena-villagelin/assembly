TITLE paridade
.MODEL SMALL
.STACK 100H 
.DATA
    digite DB 10, 13, 'Digite um valor: $'
    par DB 10, 13, 'O valor digitado e par.$'
    impar DB 10, 13, 'O valor digitado e impar.$'
.CODE
    MAIN PROC
        ;chama dados 
        MOV AX, @DATA 
        MOV DS, AX 

        ;instrução de impressão
        MOV AH, 09H 
        LEA DX, digite
        INT 21H 

        ;instrução de leitura
        MOV AH, 01H 
        INT 21H 

        ;transforma em binario
        AND AL, 0FH

        ;compara com 01h, se so valor for '00000000' é par, se for '00000001' é impar
        TEST AL, 01H 
        JNZ jimpar 

        ;impressão para par
        MOV AH, 09H 
        LEA DX, par 
        INT 21H 
        JMP fim 

        ;impssão para impar
        jimpar:
            MOV AH, 09H
            LEA DX, impar 
            INT 21H

        ;finaliza
        fim:
            MOV AH, 4CH 
            INT 21H 
    MAIN ENDP 
END MAIN