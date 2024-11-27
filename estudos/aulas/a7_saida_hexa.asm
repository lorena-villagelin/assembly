TITLE saida_hexa
.MODEL SMALL
.STACK 100h
.CODE
    MAIN PROC 

        MOV BX, 10
        MOV CX, 4
        MOV AH, 02H 
        imprime:
            MOV DL, BH
            SHR DL, 4

            CMP DL, 0AH 
            JAE letra 

            ADD DL, 30H 
            JMP segue 
            
            letra:
                ADD DL, 37H 
            
            segue:
                INT 21H
                ROL BX, 4
                LOOP imprime 
                
         MOV AH, 4CH 
         INT 21H 
    MAIN ENDP
END MAIN