;Implementar um programa em assembly que leia n caracteres enquanto for
;diferente de CR. Contar o número de caracteres e imprimir tantos “*” quanto for este número

TITLE atividade6_a
.MODEL SMALL
.STACK 100H 
.DATA
    digite DB 'Digite um caracter: $'
.CODE
    MAIN PROC 
        MOV AX, @DATA
        MOV DS, AX 
        XOR CL, CL

        leitura:

            MOV AH, 9
            LEA DX, digite
            INT 21H 

            MOV AH, 1
            INT 21H 
            MOV BH, AL

            MOV AH, 2
            MOV DL, 10
            INT 21H
            
            INC CL

            CMP BH, 13
            JNE leitura
            
        MOV AH, 2
        MOV DH, CL
        MOV DL, '*'
        
        impressao:
            DEC DH
            INT 21H
            JNE impressao
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN




