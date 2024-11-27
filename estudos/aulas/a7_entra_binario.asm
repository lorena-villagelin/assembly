TITLE entrada_binarios
.MODEL SMALL
.STACK 100H 
.CODE
    MAIN PROC 
        MOV CX, 16 ;contador
        XOR BX, BX ;zera BX
        MOV AH, 01H ;função de leitura

        leitura:
            INT 21h ;executa leitura
            CMP AL, 0DH ;compara c CR
            JE fim ;se igual pula para o fim
            AND AL, 0FH ;tranforma em numero
            SHL BX, 1 ;pula um para esquerda, abrindo espaço
            OR BL, AL ;coloca no LSB
            LOOP leitura ;enquando CX não for zero, repete
        
        fim:
            MOV AH, 4CH 
            INT 21H 
    MAIN ENDP
END MAIN