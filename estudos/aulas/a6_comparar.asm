TITLE comparar
.MODEL small
.STACK 100H
.DATA
    maior_ax DB 'AX contem o maior valor $'
    maior_bx DB 'BX contem o maior valor $'

.CODE
    MAIN PROC 

        MOV AX, 7FFFH
        MOV BX, 8000H

        MOV CX, AX ;AX pressuposto ser o maior

        CMP AX, BX
        JG maior

        LEA DX, maior_bx
        MOV AH, 9
        INT 21H
        JMP sair

        MOV CX, BX

        maior:
            LEA DX, maior_ax
            MOV AH, 9
            INT 21H

        sair: 
            MOV AH, 4CH
            INT 21H
        
    MAIN ENDP
END MAIN

        