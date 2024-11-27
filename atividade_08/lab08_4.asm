TITLE exercicio4
.MODEL SMALL
.STACK 100H 
.CODE
MAIN PROC
              MOV BX, 75       ;numero atribuido em BX
              MOV CH, 4        ;inicializa contador de caracteres
              MOV CL, 4        ;inicialioza contador de deslocamentos
              MOV AH, 02H      ;função de impressão

    impressao:
              MOV DL, BH       ;le os oito bits mais significativos
              SHR DL, CL       ;ficam os 4 bits mais significativos
              CMP DL, 0AH      ;compara para ver se é letra ou número
              JAE letra
              ADD DL, 30H      ;é numero, soma 30h
              JMP executa
                
    letra:    
              ADD DL, 37H      ;soma 37h, colocando no padrão ASCII

    executa:  
              INT 21H
              ROL BX, CL       ;BX anda 4 casas para a direita
              DEC CH
              JNZ impressao
              MOV AH, 4CH
              INT 21H
MAIN ENDP
END MAIN