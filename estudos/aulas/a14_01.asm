TITLE Desenha linha CGA
; desenha linha horizontal em HD
; na linha 100 coluna 301 até coluna 600
.MODEL SMALL
.STACK 0100H
.CODE
MAIN PROC
MOV AX,6 ; modo 6, HD
INT 10H
; desenha linha
MOV AH, 0CH ; escreve pixel
MOV AL,1 ; branco
MOV CX,301 ; coluna inicio
MOV DX,100 ; linha
L1: INT 10H
INC CX
CMP CX,600
JLE L1
; le teclado
MOV AH,0
INT 16H
; seleciona modo texto
MOV AX,3
INT 10H
; retorno ao DOS
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
