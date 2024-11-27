TITLE inversao_vetor
.MODEL SMALL
.STACK 100H 
.DATA
    digite  DB 10, 13, 'Digite o vetor: $'
    imprime DB 10, 13, 'Vetor digitado: $'
    vetor   DB 7 DUP (?)                      ;declaração do vetor de 7 posições que será preenchido
.CODE
MAIN PROC

                 MOV  AX, @DATA
                 MOV  DS, AX

                 MOV  AH, 09H          ;função de impressão 'digite'
                 LEA  DX, digite
                 INT  21H

                 CALL modleitura       ;chama modulo para leitura
                 CALL modinversor      ;chama modulo para inverter
                 CALL modimpressor     ;chama modulo para imprimir

                 MOV  AH, 4CH
                 INT  21H
MAIN ENDP

modleitura PROC
                 MOV  CX, 7            ;contador de 7 posições
                 MOV  AH, 01H          ;função de leitura
                 XOR  BX, BX           ;inicialização de BX

    leitura:     
                 INT  21H              ;execução da função de leitura
                 MOV  vetor[BX], AL    ;coloca o valor lido no vetor
                 INC  BX               ;vai para a próxima casa do vetor
                 LOOP leitura          ;repete até CX ser zero
        
                 MOV  AH, 09H          ;função de impressão 'imprime'
                 LEA  DX, imprime
                 INT  21H
                 RET                   ;volta para o MAIN
modleitura ENDP

modinversor PROC
                 MOV  CX, 3            ;contador de 7 posições
                 MOV  SI, 6            ;contador para volta
                 XOR  BX, BX           ;zera BX

    inversor:    
                 MOV  AL, vetor[BX]    ;passa o que está guardado em BX para AL
                 XCHG AL, vetor[SI]    ;troca o que está em AL com o que está em SI
                 MOV  vetor[BX], AL    ;passa o que está em AL para BX
                 DEC  SI               ;decrementa SI
                 INC  BX               ;incrementa BX
                 LOOP inversor         ;repete ate CX zerar
                 RET                   ;volta para o MAIN
modinversor ENDP

modimpressor PROC
                 XOR  BX, BX           ;zera BX
                 MOV  CX, 7            ;contador de 7 posições
                 MOV  AH, 02H          ;instruções de impressão

    impressao:   
                 MOV  DL, vetor[BX]    ;lê a posição salva em BX, que é a ultima do vetor
                 OR   DL, 30H          ;transforma o valor lido em decimal
                 INC  BX
                 INT  21H              ;executa impressão
                 LOOP impressao        ;repete ate CX ser zero
                 RET                   ;volta para o MAIN
modimpressor ENDP
END MAIN