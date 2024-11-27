.model small
.stack 100h
.code
    main proc

    ; MOV AH,0Bh ; função 0Bh
    ; MOV BH, 00H ; cor de fundo
    ; MOV BL,9 ; azul claro
    ; INT 10h
    ; MOV BH,1 ; seleciona paleta
    ; MOV BL,1 ; paleta 1
    ; INT 10H

    MOV AX,0B800H ; segmento memoria video
MOV ES,AX
MOV DI, 20A2h ; offset do byte
MOV AL,ES:[DI] ; move byte para AL
AND AL,11110011B ; limpa o bit de posicao
OR AL,1000B ; escreve 10b na posicao 3 e 2
STOSB


    main endp
end main
