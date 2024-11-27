; Ler o nome completo do usuário e exibir linha seguinte as iniciais do nome
TITLE exercicio10
.MODEL SMALL
.STACK 100H
.DATA
    nome DB 100 DUP(?)
.CODE
MAIN PROC
               MOV  AX, @DATA
               MOV  DS, AX

               CALL MODLEITURA
               CALL MODIMPRIME
    
MAIN ENDP

MODLEITURA PROC
               MOV  AH, 01H
               XOR  BX, BX
               XOR  CX, CX

    leitura:   
               INC  CX
               INT  21H
               CMP  AL, 0DH
               JE   segue
               MOV  nome[BX], AL
               INC  BX
               JMP  leitura
        
    segue:     
               RET
MODLEITURA ENDP

MODIMPRIME PROC
               MOV  AH, 02H
               XOR  BX, BX
               MOV  DL, nome[BX]
               INT  21H

    impressao: 
               INC  BX
               CMP  nome[BX], ' '
               JE   imprime
               JMP  segue2
            
    imprime:   
               INC  BX
               MOV  DL, nome[BX]
               INT  21H
               DEC  BX
    segue2:    
               LOOP impressao

               RET
MODIMPRIME ENDP
END MAIN