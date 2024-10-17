TITLE exercicio2
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
           MOV  CX, 16     ;inicializa contador
           MOV  AH, 02H    ;função de impressão
           MOV  BX, 99     ;número atribuido a BX
        
    parte1:
           ROL  BX, 01H    ;BX anda uma casa para esquerda
           JNC  parte2     ;se CF=0 pula para 'parte2'
           MOV  DL, 31h    ;como CF=1, imprime '1'
           INT  21H
           JMP  parte3
            
    parte2:
           MOV  DL, 30H    ;imprime '0'
           INT  21H

    parte3:
           LOOP parte1     ;reinicia o loop
           MOV  AH, 4CH
           INT  21H
MAIN ENDP
END MAIN