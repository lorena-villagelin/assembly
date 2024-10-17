TITLE exercicio4_XLAT
.MODEL SMALL
.STACK 100H 
.DATA
    tabela DB 30h, 31h, 32h, 33h, 34h, 35h, 36h, 37h, 38h, 39h, 41h, 42h, 43h, 44h, 45h, 46h
.CODE
MAIN PROC
              MOV  AX, @DATA
              MOV  DS, AX

              MOV  BX, 10        ;numero atribuido em BX
              MOV  CH, 4         ;inicializa contador de caracteres
              MOV  CX, 4         ;inicialioza contador de deslocamentos
              MOV  AH, 02H       ;função de impressão

    impressao:
              MOV  DL, BH        ;le os oito bits mais significativos
              XCHG BX, SI        ;troca BX e SI, para BX funcionar com XLAT
              LEA  BX, tabela    ;BX recebe tabela
              SHR  DL, 4         ;ficam os 4 bits mais significativos
              MOV  AL, DL        ;XLAT só funciona com AL
              XLAT               ;é feita a conversão
              MOV  DL, AL        ;o valor volta para AL para impressão
              INT  21H           ;executa
              XCHG BX, SI        ;o valor da conversão volta para BX
              ROL  BX, 4         ;BX anda 4 casas para a direita
              LOOP impressao
              MOV  AH, 4CH
              INT  21H
MAIN ENDP
END MAIN