TITLE atividade9_1b
.MODEL SMALL
.DATA
    vetor DB 1, 1, 1, 2, 2, 2    ;declaração do vetor
.CODE
MAIN PROC
           MOV  AX, @DATA        ;chamada de dados
           MOV  DS, AX
           XOR  DL, DL           ;inicialização de DL
           MOV  CX, 6            ;contador de 6 posições
           XOR  BX, BX           ;zera BX, que será a posição inicial do vetor

           CALL MODULO           ;chama procedimento modulo
        
           MOV  AH, 4CH          ;finalização
           INT  21H
MAIN ENDP

MODULO PROC
    VOLTA: 
           MOV  DL, vetor[BX]    ;imprime a posição em BX
           INC  BX               ;incrementa BX
           ADD  DL, 30H          ;transforma em caracter
           MOV  AH, 02H          ;instrução de impressão
           INT  21H
           LOOP volta            ;repete até CX zerar
           RET                   ;volta para o MAIN
MODULO ENDP
END MAIN