; Lê um caracter do teclado e exibe na linha seguinte a quantidade de bits 1
; existentes no código ASCII do caracter lido. O registrador que contém o caracter
; lido tem que ser zerado após a verificação

TITLE exercicio9 ;titulo
.MODEL SMALL ;modelo
.STACK 100H ;tamanho da pilha
.DATA                                            ;declaração de variáveis
    digite DB 10, 13, 'digite um caracter: $'
    bits   DB 10, 13, 'quantidade de bits: $'

.CODE
MAIN PROC                       ;inicio do main
             MOV  AX, @DATA     ;chama variáveis
             MOV  DS, AX

             CALL LEITURAP      ;chama procedimento de leitura
             CALL CONTAP        ;chama procedimento de conta
             CALL EXIBEP        ;chama procedimento de impressão

             MOV  AH, 4CH       ;volta para o DOS
             INT  21H

MAIN ENDP

LEITURAP PROC                   ;procedimento de leitura

             MOV  AH, 09H       ;imprime 'digite'
             LEA  DX, digite
             INT  21H

             MOV  AH, 01H       ;função leitura de caracter
             AND  AL, 0FH
             INT  21H

             RET                ;volta para o main

LEITURAP ENDP                   ;encerra procedimento de leitura

CONTAP PROC                     ;procedimento de contagem

             MOV  CX, 8         ;contador da quantidade de bits
             XOR  DL, DL        ;contador de bits '1'
    conta:   
             SHR  AL, 1         ;desloca um bit para direita
             JC   soma          ;se tiver carry pula para soma
             JMP  segue         ;se não tive pula para segue
    soma:    
             INC  DL            ;incrementa DL
    segue:   
             LOOP conta         ;repete até CX zerar
             RET                ;volta para o main

CONTAP ENDP

EXIBEP PROC                     ;procedimento de impressão

             MOV  AH, 09H       ;imprime 'bits'
             LEA  DX, bits
             INT  21H

             MOV  AH, 02H       ;imprime caracter
             OR   DL, 30H       ;transforma DL em hexadecimal
             INT  21H

             RET                ;volta para o main

EXIBEP ENDP                     ;encerra procedimento
END MAIN