;Crie um programa em linguagem assembly que realize a multiplicação entre dois
;números (de 0 a 9) por meio de somas sucessivas e exiba o resultado da multiplicação.
;OBS – O programa deve ser comentado. Suponha que as entradas não gerarão um
;produto com 2 dígitos.

TITLE multiplicacao ;titulo
.MODEL SMALL ;modelo
.STACK 100H ;tamanho da pilha
.DATA ;declaração de variáveis
    multiplicando DB 10,13, 'Multiplicando: $'
    multiplicador DB 10, 13, 'Multiplicador: $'
    produto DB 10, 13, 'Produto: $'
.CODE
    MAIN PROC 

        ;busca de variáveis
        MOV AX, @DATA
        MOV DS, AX

        ;imprime 'multiplicando'
        MOV AH, 09H 
        LEA DX, multiplicando 
        INT 21H 

        ;le o valor do multiplicando
        MOV AH, 01H 
        INT 21H 
        MOV BH, AL
        AND BH, 0FH ;transforma caracter em hexa

        ;imprime 'multiplicador'
        MOV AH, 09H 
        LEA DX, multiplicador 
        INT 21H 

        ;le o valor do multiplicador
        MOV AH, 01H 
        INT 21H 
        MOV BL, AL
        AND BL, 0FH ;transforma caracter em hexa

        ;zera o contador 
        XOR CL, CL 

        ;se o multiplicador for zero pula para o fim
        CMP BL, 00H 
        JE fim

        soma:
            ADD CL, BH ;soma o multiplicando no contador
            DEC BL ;decremento multiplicando
            JNZ soma ;volta o loop
        
        fim: 
            
            ;imprime 'produto'
            MOV AH, 09H
            LEA DX, produto
            INT 21H

            ;converte de hexa para caracter
            OR CL, 30H

            ;imprime o resultado
            MOV AH, 02H 
            MOV DL, CL 
            INT 21H 

            ;volta para DOS
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP 
END MAIN
        
