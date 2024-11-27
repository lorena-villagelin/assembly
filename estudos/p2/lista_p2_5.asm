;Faça um programa que imprima a soma da diagonal principal de uma matriz 3X3
TITLE exercicio5
.MODEL SMALL
.STACK 100H
.DATA
    matriz DB 3 DUP(?)     ;declara o tamanho da matriz
           DB 3 DUP(?)
           DB 3 DUP(?)
    soma   DB 'soma: $'
.CODE
MAIN PROC

            MOV AX, @DATA              ;chama dados
            MOV DS, AX

            MOV AH, 01H                ;função de leitura de matriz
            XOR BX, BX                 ;zera BX, que fara a contagem de linhas
            XOR SI, SI                 ;zera SI, que fará a contagem de colunas
            XOR CL, CL                 ;zera CL, onde será armazenada soma

    leitura:
            INT 21H                    ;executa a leitura
            MOV matriz[BX][SI], AL     ;passa o valor lido para a posição indicada por BX e SI
            AND matriz[BX][SI], 0FH    ;transforma o valor lido em binario
            ADD CL, matriz[BX][SI]     ;soma o valor lido com o que está armazenado em CL
            ADD BX, 3                  ;soma 3 em BX, para passar para a próxima linha
            INC SI                     ;incrementa SI, passando para a próxima coluna
            CMP SI, 3                  ;compara SI, com 3, que é o valor máximo de colunas
            JL  leitura                ;enquanto for menor, repete

            MOV AH, 02H                ;função de impressão de caracter
            XOR BX, BX                 ;zera BX para a contagem de linhas
        
            MOV DL, 10                 ;pula a linha
            INT 21H
        
    linha:  
            XOR SI, SI                 ;zera SI para a contagem de colunas, tem que estar dentro do loop para reiniciar a cada linha
    coluna: 
            OR  matriz[BX][SI], 30H    ;transforma o valor apontado em decimal
            MOV DL, matriz[BX][SI]     ;imprime o valor apontado
            INT 21H
            MOV DL, ' '                ;imprime um espaço
            INT 21H
            INC SI                     ;incrementa SI, passando para a próxima coluna
            CMP SI, 3                  ;compara SI com 3, que é o número máximo de colunas
            JL  coluna                 ;enquanto for menor, repete

            ADD BX, 3                  ;soma 3 em BX, passando para a próxima linha
            MOV DL, 10                 ;pula de linha
            INT 21H
            MOV DL, 13
            INT 21H
            CMP BX, 9                  ;compara BX com 9, que é o valor máximo de linhas, já que cada linha vale 3
            JL  linha                  ;enquanto for menor, repete
        
            MOV AH, 09H                ;função de impressão de cadeia de caracteres
            LEA DX, soma               ;imprime 'soma'
            INT 21H

            MOV AH, 02H                ;função de impressão de caracter
            OR  CL, 30H                ;tranforma valor salvo em CL, a soma, em decimal
            MOV DL, CL                 ;passa o valor em CL para DL para a impressão
            INT 21H

            MOV AH, 4CH                ;volta para o DOS
            INT 21H
MAIN ENDP
END MAIN