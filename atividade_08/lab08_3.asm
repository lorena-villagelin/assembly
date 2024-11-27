TITLE exercicio3
.MODEL SMALL
.STACK 100h
.CODE
MAIN PROC
        
            XOR BX, BX     ;limpa BX, onde será armazenado
            MOV CL, 4      ;inicializa contador
            MOV AH, 01H    ;função leitura
            INT 21H

    leitura:
            CMP AL, 0DH    ;compara com CR
            JE  fim        ;se igual pula para o fim
            CMP AL, 39H    ;confere se é letra, se for maior, sim
            JG  letra
            AND AL, 0FH    ;caractere é numero
            JMP anda
    letra:  
            SUB AL, 37H    ;converte letra para binario
    anda:   
            SHL BX, CL     ;BX anda 4 casas para esquerda
            OR  BL, AL     ;passa valor lido para BL
            INT 21H
            JMP leitura    ;loop até CR
    fim:    
            MOV AH, 4CH
            INT 21H
MAIN ENDP
END MAIN
