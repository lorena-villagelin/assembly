;Faça um programa que percorra um vetor de 10 posições e conte quantos números pares e ímpares o vetor possui.
TITLE exercicio8
.MODEL SMALL
.STACK 100H 
.DATA
    vetor DB 10 DUP(?)       ;declara tamanho do vetor
    par   DB 'pares: $'      ;string 'pares'
    impar DB 'impares: $'    ;string 'impares'
.CODE
MAIN PROC
                  MOV  AX, @DATA        ;chama dados
                  MOV  DS, AX

                  CALL LEITURA_VETOR    ;chama procedimento 'leitura_vetor'
                  CALL IMPRIME          ;chama procedimento 'imprime'
        
                  MOV  AH, 4CH          ;volta para o DOS
                  INT  21H
MAIN ENDP
LEITURA_VETOR PROC                      ;inicio do procedimento
                  MOV  CX, 10           ;coloca o tamanho do vetor em CX
                  MOV  AH, 01H          ;função de impressão de caracter
                  XOR  BX, BX           ;zera BX, contador
                  XOR  SI, SI           ;zera SI, contador de posições

    leitura:      
                  INT  21H              ;executa leitura
                  AND  AL, 0FH          ;tranforma em binário
                  MOV  vetor[SI], AL    ;coloca valor lido na posição indicada pelo vetor
                  ROR  AL, 1            ;rotaciona al para a direita
                  JC   v_impar          ;se tiver carry, o valor é impar
                  INC  BH               ;incrementa contador de par
                  JMP  segue            ;pula para segue
    v_impar:      
                  INC  BL               ;incrementa contador de par
    segue:        
                  LOOP leitura          ;repete até acabarem os numeros guardados no vetor
                  RET                   ;volta para o main
LEITURA_VETOR ENDP                      ;encerra procedimento
IMPRIME PROC                            ;inicio do procedimento de impressão
                  MOV  AH, 02H          ;função de impressão de caracter
                  MOV  DL, 0AH          ;pula linha
                  INT  21H
        
                  MOV  AH, 09H          ;imprime variável 'par'
                  LEA  DX, par
                  INT  21H
        
                  MOV  AH, 02H          ;função impressão de caracter
                  OR   BH, 30H          ;transforma o contador em hexadecimal
                  MOV  DL, BH           ;passa para DL para impressão
                  INT  21H

                  MOV  DL, 0AH          ;pula linha
                  INT  21H

                  MOV  AH, 09H          ;imprime string 'impar'
                  LEA  DX, impar
                  INT  21H

                  MOV  AH, 02H          ;função impressão de caracter
                  OR   BL, 30H          ;transforma contador em hexadecimal
                  MOV  DL, BL           ;passa para DL para impressão
                  INT  21H

                  RET                   ;volta para o main
IMPRIME ENDP                            ;encerra procedimento
END MAIN