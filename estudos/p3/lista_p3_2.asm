;Faça uma busca em uma matriz 4x4 (DW) e retorne o seu maior e menor valor.

TITLE  exercicio2
.MODEL SMALL
.STACK 100H
.DATA 
    matriz DW 1, 1, 2, 3
           DW 4, 5, 6, 7
           DW 8, 9, 4, 5
           DW 9, 3, 1, 8
    
    maior DB 10, 13, 'Maior valor: $'
    menor DB 10, 13, 'Menor valor: $'

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 

        CLD
        LEA DI, matriz
        MOV CX, 16
        XOR BX, BX
        compara_maior:
            LODSW 
            CMP AX, BX
            JG r_maior
            JMP volta_maior
            r_maior:
                MOV BX, AX
            volta_maior:
                LOOP compara_maior

        MOV AH, 09H
        LEA DX, maior
        INT 21H

        MOV AH, 02H
        MOV DX, BX
        OR DX, 30H
        INT 21H
        
        CLD
        LEA SI, matriz
        MOV CX, 16
        compara_menor:
            LODSW
            CMP AX, BX
            JL r_menor
            JMP volta_menor
            r_menor:
                MOV BX, AX
            volta_menor:
                LOOP compara_menor

        
        MOV AH, 09H
        LEA DX, menor
        INT 21H
        MOV AH, 02H
        MOV DX, BX
        OR DX, 30H
        INT 21H
        
        MOV AH, 4CH
        INT 21H       

    MAIN ENDP
END MAIN