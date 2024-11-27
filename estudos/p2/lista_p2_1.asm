;Faça um programa que conte quantas letras “A” tem em um nome guardado num vetor de tamanho 20
TITLE exercicio1
.MODEL SMALL
.STACK 100H
.DATA
    digite DB 'Digite seu nome: $'
    vetor  DB 20 DUP (?)                             ;salva 20 bits para o vetor
    qtd    DB 10, 13, 'Quantidade de letras A: $'
.CODE
MAIN PROC
            MOV  AX, @DATA        ;chama dados
            MOV  DS, AX

            MOV  AH, 09H          ;impressão de 'digite'
            LEA  DX, digite
            INT  21H

            MOV  AH, 01H          ;instrução para leitura de caracter
            XOR  SI, SI           ;zera contador SI, que indicará as posições onde serão inseridos os valores lidos
            XOR  BX, BX           ;zera BX, que será contador de letras 'a'
            MOV  CX, 20           ;contador que confere que a quantidade de valores digitados seja do mesmo tamanho do vetor


    leitura:
            INT  21H              ;executa instrução de leitura de caracter
            MOV  vetor[SI], AL    ;coloca o valor digitado na posição de SI
            CMP  AL, 0DH          ;confere se o vslor é CR
            JE   imprime          ;se for igual, encerra a leitura e pula para a impressão
            CMP  AL, 'a'          ;confere se o caracter é 'A'
            JE   conta            ;se o valor for 'A' entra para o contador
            INC  SI               ;passa para a próxima casa do vetor
            JMP  volta            ;se o caracter não for igual a 'A', volta para o loop
    conta:  
            INC  BX               ;como o caracter é 'A', incrementa BX
    volta:  
            LOOP leitura          ;enquanto CX não for zero repete o loop
        

    imprime:
            MOV  AH, 09H          ;impressão de string 'qtd'
            LEA  DX, qtd
            INT  21H
            MOV  DX, BX           ;passa BX para DX para impressão
            OR   DL, 30H          ;tranforma valor em caracter

            MOV  AH, 02H          ;impressão de caracter
            INT  21H

            MOV  AH, 4CH          ;finaliza
            INT  21H

MAIN ENDP
END MAIN