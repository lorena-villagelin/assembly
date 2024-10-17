;Crie um programa em linguagem assembly que realize a divisão inteira entre dois números
;(de 0 a 9) por meio de subtrações sucessivas e exiba como resultado o quociente e o resto da
;divisão.

TITLE divisao ;titulo
.MODEL SMALL ;modelo
.STACK 100H ;tamanho da pilha
.DATA ;declaração de variáveis
    dividendo DB 10,13,'Dividendo: $'
    divisor DB 10,13,'Divisor: $'
    quociente DB 10,13,'Quociente: $'
    resto DB 10,13,'Resto: $'
.CODE 
    MAIN PROC 

        ;busca de variáveis
        MOV AX, @DATA
        MOV DS, AX

        ;imprime 'dividendo'
        MOV AH, 09H
        LEA DX, dividendo
        INT 21H

        ;le o valor do dividendo
        MOV AH, 01H
        INT 21H 
        MOV BL, AL
        AND BL, 0FH ;transforma caracter em hexa

        ;imprime 'divisor'
        MOV AH, 9
        LEA DX, divisor
        INT 21H 

        ;le o valor do divisor
        MOV AH, 01H
        INT 21H 
        MOV BH, AL
        AND BH,0FH ;transforma caracter em hexa

        ;zera o contador 
        XOR CL, CL

        subtracao:
            CMP BL, BH ;compara os valores lidos
            JL fim ;se dividendo for menor pula para 'fim'
            SUB BL, BH ;subtração
            INC CL ;incrementa somador
            JMP subtracao ;reinicia o loop

        fim:
            ;imprime 'quociente'
            MOV AH, 09H
            LEA DX, quociente
            INT 21H 

            ;converte de hexa para caracter
            OR CL, 30H

            ;imprime o valor do quociente, quantas vezes o contador foi incrementado
            MOV AH, 02H 
            MOV DL, CL
            INT 21H

            ;imprime 'resto'
            MOV AH, 09H
            LEA DX, resto 
            INT 21H 

            ;converte de hexa para caracter
            OR BL, 30H

            ;imprime o resto da conta
            MOV AH, 02H
            MOV DL, BL
            INT 21H 

            ;volta para DOS
            MOV AH, 4CH 
            INT 21H 

    MAIN ENDP
END MAIN

