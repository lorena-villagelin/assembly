TITLE paridade_deslocamento
.MODEL SMALL
.STACK 100H 
.DATA
    digite DB 10,13, 'Digite um valor: $'
    par DB 10,13, 'O valor digitado e par. $'
    impar DB 10,13, 'O valor digitado e impar. $'

.CODE 
    MAIN PROC 
        ;chama dados
        MOV AX, @DATA
        MOV DS, AX 

        ;instrução impressão 'digita'
        MOV AH, 09H 
        LEA DX, digite
        INT 21H 

        ;instrução leitura
        MOV AH, 01H 
        INT 21H 

        ;transforma em binario
        AND AL, 0FH 

        ;rotação para direita
        SHR AL, 1

        ;valor do LSB vai para carry, se houver carry é impar
        JC jimpar 

        ;não havendo carry é par
        MOV AH, 09H 
        LEA DX, par 
        INT 21H 
        JMP fim

        ;caso tenha carry
        jimpar:
            MOV AH, 09H 
            LEA DX, impar 
            INT 21H 
        
        ;finalizando
        fim: 
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
END MAIN