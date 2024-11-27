TITLE atividade9_1a
.MODEL SMALL
.DATA
    vetor DB 1, 1, 1, 2, 2, 2    ;declaração do vetor
.CODE
MAIN PROC
           MOV  AX, @DATA    ;chamada de dados
           MOV  DS, AX
           XOR  DL, DL       ;inicialização de DL
           MOV  CX, 6        ;contador de 6 posições
           LEA  BX, vetor    ;chama vetor para BX, deixando-o na posição 0

           CALL MODULO       ;chama procedimento modulo
        
           MOV  AH, 4CH      ;finalização
           INT  21H
MAIN ENDP

MODULO PROC
    VOLTA: 
           MOV  DL, [BX]     ;imprime a posição salva em BX
           INC  BX           ;incrementa BX
           ADD  DL, 30H      ;transforma em caracter
           MOV  AH, 02H      ;instrução de impressão
           INT  21H
           LOOP volta        ;repete até CX zerar
           RET               ;volta para o MAIN
MODULO ENDP
END MAIN