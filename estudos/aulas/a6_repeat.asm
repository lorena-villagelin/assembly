;Ler caracteres ASCII do teclado, contando sua quantidade, até
;que o caractere Carriage Return (CR) apareça.

TITLE repeat 
.MODEL SMALL
.STACK 100H
.CODE 
    MAIN PROC 

        MOV DH, 0
        MOV AH, 1

        leitura:
            INT 21H
            INC DH
            CMP AL, 0DH
            JNE leitura 

        MOV AH, 2
        MOV DL, DH
        INT 21H
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN

