TITLE saida_binario
.MODEL SMALL
.STACK 100H 
.CODE
    MAIN PROC 
        MOV BX, 2 ;numero atribuido
        MOV AH, 02H ;função impressão
        MOV CX, 16 ;contador

        p1: 
            ROL BX, 1 ;rotaciona para esquerda
            JNC p2 ;se o carry for 0, pula para impressão de '0'
            MOV DL,'1' ;se nao for 0 imprime 1
            INT 21H ;executa impressão
            JMP p3 
        
        p2:
            MOV DL,'0' ;carry é zero
            INT 21H 
        
        p3: 
            LOOP p1 ;enquanto CX não ofr 0, retorna o loop
            MOV AH, 4CH 
            INT 21H 
    MAIN ENDP 
END MAIN
