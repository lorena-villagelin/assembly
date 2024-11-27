TITLE atividade9_2a
.MODEL SMALL 
.DATA
    vetor DB 1, 1, 1, 2, 2, 2    ;declaração
.CODE
MAIN PROC
           MOV  AX, @DATA    ;chamada de dados
           MOV  DS, AX
           XOR  DL, DL       ;inicialização de DL
           MOV  CX, 6        ;contador de posições
           LEA  SI, vetor    ;chama o vetor para SI, deixando-o na posição 0

           CALL MODULO       ;chama procedimento modulo

           MOV  AH, 4CH      ;finalização
           INT  21H
MAIN ENDP

MODULO PROC
    VOLTA: 
           MOV  DL, [SI]     ;imprime a posição salva em SI
           INC  SI           ;incrementa SI
           ADD  DL, 30H      ;transforma em caracter
           MOV  AH, 02H      ;instrução de impressão caracter
           INT  21H
           LOOP VOLTA        ;repete ate CX zerar
           RET               ;volta para o MAIN
MODULO ENDP
        
END MAIN