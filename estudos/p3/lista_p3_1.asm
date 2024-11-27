;Em um vetor de números armazenado na memória, conte quantas
;ocorrências de números maiores que 15 e imprima a mensagem no terminal

TITLE exercicio1 ;titulo
.MODEL SMALL ;modelo
.STACK 100H ;tamanho da pilha

.DATA                                         ;declaração de strings e variaveis
    vetor   DB 0, 5, 10, 15, 20, 25           ;numeros armazenados no vetor
    numeros DB 'Numeros maiores que 15: $'    ;string
    tamanho DB 6                              ;tamanho do vetor

.CODE                            ;inicio do código
MAIN PROC                        ;procedimento principal
            MOV   AX, @DATA      ;chamada de dados
            MOV   DS, AX

            MOV   CL, tamanho    ;passa o tamanho do vetor para CL, que será usado no loop
            LEA   DI, vetor      ;aponta para o vetor atravez de DI
            CLD                  ;zera o flag de direção
            XOR   BL, BL         ;zera BL, que será o contador de '15'

    compara:                     ;loop de comparação
            LODSB                ;carrega a posição do vetor apontada em AL
            CMP   AL, 0FH        ;compara AL com '15'
            JG    maior          ;se for maior pula para 'maior'
            JMP   volta          ;se não pula para o retorno do loop
    maior:  
            INC   BL             ;incrementa BL, contador
    volta:  
            LOOP  compara        ;repete até CX zerar
            MOV   AH, 09H        ;imprime a mensagem
            LEA   DX, numeros
            INT   21H
            MOV   AH, 02H        ;imprime a quantidade de números
            MOV   DL, BL
            OR    DL, 30H
            INT   21H
            MOV   AH, 4CH        ;volta para o DOS
            INT   21H
MAIN ENDP                        ;fim do procedimento principal
END MAIN                         ;fim do codigo