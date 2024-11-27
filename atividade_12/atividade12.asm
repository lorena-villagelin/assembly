;Fazer um programa que (um procedimento para cada):
;1. leia um string e armazene na memória e imprima o string lido
;2. copie este sting em outro
;3. compara o string lido com um já armazenado na memória e diga se são iguais ou não.
;4. verifique quantas letras ‘a’ tem o string

TITLE atividade12
.MODEL SMALL
.STACK 100H
.DATA
    digite     DB 10, 13, 'digite uma string: $'
    digitada   DB 'string digitada: $'
    v_origem   DB 10 DUP (?)                                ;vetor para armazenar string
    v_destino  DB 10 DUP (?)                                ;vetor onde sera copiada a string
    armazenada DB 10, 13, 'string armazenada: $'
    v_armaz    DB 'pannain'                                 ;string armazenada para comparação
    iguais     DB 10, 13, 'as strings sao iguais. $'
    diferentes DB 10, 13, 'as strings sao diferentes. $'
    tamanho    DB 10                                        ;tamanho maximo para a string digitada
    quantidade DB 10, 13, 'letras "a" na string: $'
    t          DB 7                                         ;tamanho da string armazenada
.CODE
MAIN PROC
                  MOV   AX, @DATA         ;chama dados
                  MOV   DS, AX
                  MOV   ES, AX            ;inicializa ES

    ;1. leia um string e armazene na memória e imprima o string lido
                  XOR   DI, DI            ;zera DI
                  MOV   AH, 09H
                  LEA   DX, digite
                  INT   21H
                  MOV   CL, tamanho       ;passa o tamanho maximo para CL
                  LEA   DI, v_origem      ;aponta para o vetor onde será armazenado
                  CALL  p_leitura         ;chama o procedimento de leitura

                  MOV   AH, 09H
                  LEA   DX, digitada
                  INT   21H
                  XOR   SI, SI            ;zera SI
                  XOR   CX, CX            ;zera CX
                  MOV   CL, tamanho       ;passa o tamanho da string para CL
                  LEA   SI, v_origem      ;aponta para o vetor que será impresso
                  CALL  p_impressao       ;chama o procedimento de impressão

    ;2. copie este sting em outro
                  LEA   SI, v_origem      ;aponta para a string que será copiada
                  LEA   DI, v_destino     ;aponta para onde a string será colada
                  XOR   CX, CX
                  MOV   CL, tamanho       ;passa para CL o tamanho da string que será copiada
                  CALL  p_copia           ;chama o procedimento de copia

    ;3. compara o string lido com um já armazenado na memória e diga se são iguais ou não.
                  MOV   AH, 09H
                  LEA   DX, armazenada
                  INT   21H
                  XOR   SI, SI
                  XOR   CX, CX
                  MOV   CL, t             ;passa o tamanho da string armazenada para CL
                  LEA   SI, v_armaz       ;aponta para a string que sera comparada
                  CALL  p_impressao       ;chama o procedimento de comparação
        
                  LEA   SI, v_origem      ;aponta para a string digitada
                  LEA   DI, v_armaz       ;aponta para a string armazenada
                  XOR   CX, CX
                  MOV   CL, t             ;tamanho da string armazenada
                  CALL  p_compara         ;chama o procedimento de comparação

    ;4. verifique quantas letras ‘a’ tem o string
                  MOV   AH, 09H
                  LEA   DX, quantidade
                  INT   21H
                  MOV   CL, tamanho
                  MOV   AL, 'a'           ;caracter que será procurado
                  LEA   DI, v_origem      ;aponta para o string digitado
                  CALL  p_caracter        ;chama o procedimento de verificação
        

                  MOV   AH, 4CH
                  INT   21H
MAIN ENDP

p_leitura PROC
                  PUSH  AX                ;empilha o que estiver em AX
                  CLD                     ;zera DF
                  MOV   AH, 01H
    r_leitura:    
                  INT   21H               ;le o caracter
                  CMP   AL, 0DH           ;conpara com CR
                  JE    r_fim_leitura     ;se for igual termina a leitura
                  STOSB                   ;se não, armazena o caracter lido
                  LOOP  r_leitura         ;repete até zera CX
    r_fim_leitura:
                  SUB   CL, tamanho       ;salva o tamanho real da string
                  POP   AX                ;retorna o valor anterior de AX
                  RET                     ;volta para o main
p_leitura ENDP

p_impressao PROC
                  PUSH  AX
                  PUSH  DX
                  CLD                     ;zera DF
                  MOV   AH, 02H
    r_impressao:  
                  LODSB                   ;passa o caracter apontado para AL
                  MOV   DL, AL            ;passa AL para DL
                  INT   21H               ;imprime
                  LOOP  r_impressao       ;repete até acabarem os caracteres 9tamanho salvo em CL)
                  POP   DX
                  POP   AX
                  RET
p_impressao ENDP

p_copia PROC
                  PUSH  AX
                  PUSH  DX
                  CLD                     ;zera DF
                  MOVSB                   ;copia o string
                  POP   DX
                  POP   AX
                  RET
p_copia ENDP

p_compara PROC
                  PUSH  AX
                  PUSH  DX
                  XOR   DX, DX
                  CLD                     ;zera DF
                  REPE  CMPSB             ;compara as strings
                  JZ    r_iguais          ;se ZF=1 então as strings são iguais
                  LEA   DX, diferentes    ;se não, são diferentes
                  JMP   fim_compara
    r_iguais:     
                  LEA   DX, iguais
    fim_compara:  
                  MOV   AH, 09H
                  INT   21H
                  POP   DX
                  POP   AX
                  RET
p_compara ENDP

p_caracter PROC
                  PUSH  AX
                  PUSH  DX
                  XOR   BX, BX
                  CLD                     ;zera DF
    verifica:     
                  SCASB                   ;procura o caracter salvo em AL
                  JZ    contem            ;ZF=1, é igual, então tem
                  JMP   segue             ;se não pula
    contem:       
                  INC   BX                ;incrementa contador
    segue:        
                  LOOP  verifica          ;volta até acabar o string
                  MOV   AH, 02H
                  MOV   DX, BX
                  OR    DX, 30H
                  INT   21H               ;imprime quantidade de caracters
                  POP   DX
                  POP   AX
                  RET
p_caracter ENDP
END MAIN
