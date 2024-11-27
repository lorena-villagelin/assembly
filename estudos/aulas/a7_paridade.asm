;Fazer um programa que leia um número de um digito decimal e
;verifique se é par o ímpar (imprimir o resultado)

TITLE paridade
.MODEL SMALL
.STACK 100h 
.DATA
    digite DB 10,13,'Digite um valor: $'
    par    DB 10,13,'O valor digitado e par. $'
    impar  DB 10,13,'O valor digitado e impar. $'

.CODE
MAIN PROC
           MOV  AX, @DATA
           MOV  DS, AX

    ;impressão 'digite'
           MOV  AH, 09H
           LEA  DX, digite
           INT  21H

    ;leitura do numero
           MOV  AH, 01H
           INT  21H

           AND  AL, 0FH       ;transforma em binario
           TEST AL, 01H       ;compara com 01h, se o valor for par, vai zerar
           JNZ  jimpar
        
    ;imprime que o valor é par
           MOV  AH, 09H
           LEA  DX, par
           INT  21H

           JMP  FIM

    ;imprime que o valor é impar
    jimpar:
           MOV  AH, 09H
           LEA  DX, impar
           INT  21H
        
    FIM:   
           MOV  AH, 4CH
           INT  21H
MAIN ENDP
END MAIN