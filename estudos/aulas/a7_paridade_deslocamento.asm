;Fazer um programa que leia um número de um digito decimal e
;verifique se este número tem paridade impar ou par. (imprimir o
;resultado – usar deslocamento)

TITLE paridade_desl
.MODEL SMALL
.STACK 100H 
.DATA
    digite DB 10,13,'Digite um valor: $'
    par    DB 10,13,'O valor e par. $'
    impar  DB 10,13,'O valor e impar. $'

.CODE
MAIN PROC
           MOV  AX,@DATA
           MOV  DS,AX
           LEA  DX, digite
           MOV  AH,09
           INT  21H
           MOV  AH,1h         ;função DOS para entrada pelo teclado
           INT  21h           ;entra, caracter está no AL
           AND  AL,0Fh        ;TRANSFORMA EM NUMERO
    
           SHL  AL,1
           JC  jimpar
           
           LEA  DX, par
           MOV  AH,09
           INT  21H
           JMP  FIM
    jimpar:
           LEA  DX, impar
           MOV  AH,09
           INT  21H
    FIM:   
           MOV  AH,4CH
           INT  21H
MAIN ENDP
END MAIN

