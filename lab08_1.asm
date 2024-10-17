TITLE exercicio1
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC

            MOV  CX, 16     ;contador de dígitos
            MOV  AH, 01H    ;função de leitura
            XOR  BX, BX     ; limpa BX para o resultado

    confere:
            INT  21H
            CMP  AL, 0DH    ;compara com CR
            JE   fim        ;se for igual pula para o fim
            AND  AL, 0FH    ;transforma em caracter

            SHL  BX, 1      ;abre um espaço
            OR   BL, AL     ;passa o número para o bit menos significativo
            LOOP confere
        
    fim:    
            MOV  AH, 4CH
            INT  21H
MAIN ENDP
END MAIN


