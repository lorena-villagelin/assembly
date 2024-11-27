TITLE Desenha um X na tela, escrevendo direto na memória de vídeo
.MODEL SMALL
MOSTRA_PIXEL MACRO
MOV AL,ES:[DI] ; move byte para AL
AND AL,11110011B ; limpa o bit de posicao
OR AL,1000B ; escreve 10b na posicao 3 e 2
STOSB ; carrega na memoria
ENDM
.STACK 100H
.CODE
MAIN PROC
MOV AH,0
MOV AL,4h ; seleciona modo 4
INT 10h
MOV AX,0B800H ; segmento memoria video
MOV ES,AX ; ES aponta para a mem. video
MOV CX,0 ; inicializa CX
MOV DI,0000H ; inicializa DI
MOV SI,2000H ; inicializa SI
mostra: MOSTRA_PIXEL ; linha “zero” = B800:0000
MOV BX,DI ; linha “um” = B800:2000
MOV DI,SI ; linha “dois” = B800:0050
MOSTRA_PIXEL ; linha “tres” = B800:2050
MOV SI,DI
MOV DI,BX
ADD DI,4EH ; pula para proxima linha
ADD SI,50H
INC CX
CMP CX,80 ; escreve 80 pixels
JL mostra
MOV AH,0 ; espera o teclado
INT 16h
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
