;Faça um programa que inverta um vetor (sem usar vetor auxiliar)
TITLE exercicio7
.MODEL SMALL
.STACK 100H
.DATA 
    vetor DB 200 DUP(?)
.CODE 
    MAIN PROC

        MOV AX, @DATA
        MOV DS, AX

        MOV AH, 01H 
        XOR CX, CX
        XOR BX, BX
    
        leitura:
            INT 21H
            CMP AL, 0DH
            JE inverte
            AND AL, 0FH
            MOV vetor[BX], AL
            INC CX 
            JMP leitura 

        
        inverte:
            
