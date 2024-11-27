; calcule a somatória da diagonal principal de uma matriz 4x4 e armazene o valor em AX
TITLE exercicio11
.MODEL SMALL
.STACK 100H
.DATA
    matriz DW 4 DUP(?)
           DW 4 DUP(?)
           DW 4 DUP(?)
           DW 4 DUP(?)

.CODE 
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

        MOV CX, 4
        XOR BX, BX
        XOR SI, SI
        

        leitura:
            MOV AH, 01H
            INT 21H
            AND AL, 0FH
            xor ah, ah
            MOV matriz[BX][SI], AX
            
            ADD BX, 8
            ADD SI, 2
            LOOP leitura

        MOV CX, 4
        XOR BX, BX
        XOR SI, SI
        xor ax, ax
        
        pensando:
            ADD AX, matriz[BX][SI]
            ADD BX, 8
            ADD SI, 2
            LOOP pensando

        xchg ax, cx
        MOV AH, 02H
        mov dl, 10 
        int 21h
            MOV DX, cx
            OR DX, 30H
            INT 21H
        
        MOV AH, 4CH
        INT 21H

    MAIN ENDP
END MAIN
            
