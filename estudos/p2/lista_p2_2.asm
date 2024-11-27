;Faça um programa que leia a diagonal principal de uma matriz 4X4 tamanho DB
TITLE exercicio2
.MODEL SMALL 
.STACK 100H 
.DATA
    matriz DB 4 DUP (0)    ;declaração da matriz
           DB 4 DUP (0)
           DB 4 DUP (0)
           DB 4 DUP (0)
.CODE
MAIN PROC
            MOV  AX, @DATA             ;chama dados
            MOV  DS, AX

            XOR  BX, BX                ;zera BX, que conta as linhas
            XOR  SI, SI                ;zera SI, que conta as colunas
            MOV  CX, 4                 ;inicializa o contador CX
            MOV  AH, 01H               ;função de leitura

    leitura:
            INT  21H                   ;executa leitura
            MOV  matriz[BX][SI], AL    ;coloca o valor lido na posição da diagonal
            ADD  BX, 4                 ;soma 4 em BX, para passar para a próxima linha
            INC  SI                    ;incrementa SI, para passar para a próxima coluna
            LOOP leitura               ;repete ate CX zerar
        
            MOV  AH, 02H               ;intrução de impressão de caracter
            XOR  BX, BX                ;zera BX, que apontará para a posição da coluna
            MOV  CX, 4                 ;contador CX, que fará quatro impressões

            MOV  DL, 10                ; passa para a próxima linha, para começar a impressão da diagonal
            INT  21H

    linha:  
            XOR  SI, SI                ;zera contador SI, que contará as colunas
    coluna: 
            MOV  DL, matriz[BX][SI]    ;passa para DL a posição sendo lida
            INT  21H                   ;imprime o valor em DL
            INC  SI                    ;incrementa SI
            CMP  SI, 4                 ;compara SI com 4, se não for igual repete
            JL   coluna                ;volta para o começo

            MOV  DL, 10                ;pula para imprimir próxima linha
            INT  21H
            MOV  DL, 13
            INT  21H
            ADD  BX, 4                 ;soma 4 em BX, para a próxima linha
            LOOP linha                 ;repete até CX ser zero

            MOV  AH, 4CH               ;volta para o DOS
            INT  21H
MAIN ENDP
END MAIN 