TITLE exercicio2 ;titulo
.MODEL SMALL  ;modelo
.STACK 100H ;tamanho da pilha
PULA_LINHA MACRO               ;macro para pular linha
               PUSH AX         ;guarda valor anterior de AX
               PUSH DX         ;guarda valor anterior de DX
               MOV  AH, 02H    ;pula linha
               MOV  DL, 0AH
               INT  21H
               POP  DX         ;recupera valor de DX
               POP  AX         ;recupera valor de AX
ENDM
ESPACO MACRO               ;macro de espaço entre colunas
           PUSH AX         ;guarda valor anterior de AX
           PUSH DX         ;guarda valor anterior de DX
           MOV  AH, 02H
           MOV  DL, ' '
           INT  21H
           POP  DX         ;recupera valor de DX
           POP  AX         ;recupera valor de AX
ENDM
.DATA
    matriz         DB 4 DUP(?)          ;declaração do tamanho da matriz
                   DB 4 DUP(?)
                   DB 4 DUP(?)
                   DB 4 DUP(?)
    leitura_data   DB 'leitura: $'
    impressao_data DB 'impressao: $'
    soma_data      DB 'soma: $'
.CODE
MAIN PROC
                   MOV        AX, @DATA             ;chama dados
                   MOV        DS, AX
                   CALL       LEITURA               ;chama procedimento de leitura
                   CALL       SOMA                  ;chama procediemnto de soma
                   CALL       IMPRESSAO             ;chama procedimento de impressão
                   MOV        AH, 4CH               ;volta para o DOS
                   INT        21H
    
MAIN ENDP
LEITURA PROC                                        ;inicio do procedimento de leitura
                   PULA_LINHA                       ;macro pula_linha
                   MOV        AH, 09H               ;impressão de 'leitura_data'
                   LEA        DX, leitura_data
                   INT        21H
                   PULA_LINHA                       ;macro pula_linha
                   XOR        BX, BX                ;zera contador de linhas
    linha_le:      
                   MOV        CX, 4                 ;inicializa contador de colunas
                   XOR        SI, SI                ;zera contador de colunas
    coluna_le:     
                   MOV        AH, 01                ;função de leitura
                   INT        21H
                   AND        AL, 0FH               ;tranforma em binario
                   CMP        AL, 00H               ;compara com zero
                   JL         coluna_le             ;se for menor volta para leitura
                   CMP        AL, 06H               ;compara com 6
                   JA         coluna_le             ;se for maior volta para leitura
                   MOV        matriz[BX][SI], AL    ;passa o valor lido para a posição indicada na matriz
                   INC        SI                    ;incrementa coluna
                   ESPACO                           ;macro de espaço entre colunas
                   LOOP       coluna_le             ;repete a leitura até acabarem as colunas da linha indicada
                   PULA_LINHA                       ;macro pula_linha
                   ADD        BX, 4                 ;pula para a próxima linha dentro da matriz
                   CMP        BX, 16                ;confere se ainda está dentro da matriz
                   JL         linha_le              ;repete enquanto estiver dentro da matriz
                   RET                              ;volta para o main
LEITURA ENDP                                        ;fim do procedimento de leitura
SOMA PROC                                           ;inicio do procedimento de soma
                   XOR        BX, BX                ;zera contador de linhas
                   XOR        AX, AX                ;zera AX, a soma será guardada em AL
    linha_soma:    
                   XOR        SI, SI                ;zera contador de colunas
                   MOV        CX, 4                 ;inicializa contador de colunas
    coluna_soma:   
                   ADD        AL, matriz[BX][SI]    ;soma valor apontado em AL
                   INC        SI                    ;passa para a próxima colunas
                   LOOP       coluna_soma           ;repete até acabarem as colunas
                   ADD        BX, 4                 ;pula para a próxima linha da matriz
                   CMP        BX, 16                ;confere se está dentro da matriz
                   JL         linha_soma            ;repete soma enquanto estiver
                   RET                              ;volta para o main
SOMA ENDP                                           ;fim do procedimento de soma
IMPRESSAO PROC                                      ;inicio do procedimento de impressão
                   PULA_LINHA                       ;macro pula_linha
                   XCHG       AX, DI                ;troca o valor de AX com DI, que seria perdido quando é usada a função de impressão
                   MOV        AH, 09H               ;função de impressão de variável
                   LEA        DX, impressao_data
                   INT        21H
                   PULA_LINHA                       ;macro de pula linha
                   MOV        AH, 02H               ;função de impressão de caracter
                   XOR        BX, BX                ;zera contador de linhas
    linha_imprime: 
                   MOV        CX, 4                 ;contador de colunas
                   XOR        SI, SI                ;zera contador de colunas
    coluna_imprime:
                   MOV        DL, matriz[BX][SI]    ;passa o valor indicado para DL
                   OR         DL, 30H               ;tranforma em hexa
                   INT        21H                   ;imprime
                   ESPACO                           ;macro de espaço
                   INC        SI                    ;passa para a próxima coluna
                   LOOP       coluna_imprime        ;repete até acabarem as colunas
                   PULA_LINHA                       ;macro pula_linha
                   ADD        BX, 4                 ;passa para a próxima linha da matriz
                   CMP        BX, 16                ;confere se ainda está dentro da matriz
                   JL         linha_imprime         ;se estiver repete
                   PULA_LINHA                       ;macro de pula_linha
                   MOV        AH, 09H               ;função de impressão de variável
                   LEA        DX, soma_data
                   INT        21H
                   MOV        BX, 10                ;passa 10 para BX para a divisão
                   XCHG       AX, DI                ;retorna valor da soma para AX
    decimal:       
                   XOR        DX, DX                ;zera DX, onde será guardado o resto
                   DIV        BX                    ;faz a divisão
                   PUSH       DX                    ;valor do resto vai para DX e é armazenado na pilha
                   INC        CX                    ;incrementa CX, contador de divisões
                   CMP        AX, 00H               ;compara AX com zero
                   JE         imprime_dec           ;quando for, vai para impressão
                   JMP        decimal               ;enquanto não for, volta para a divisão
    imprime_dec:   
                   MOV        AH, 02H               ;impressão
                   POP        DX                    ;pula valor na pilha para DX
                   OR         DL, 30H               ;tranforma valor em hexa
                   INT        21H
                   LOOP       imprime_dec           ;repete até zerar o contado de divisões
                   RET                              ;volta para o main
IMPRESSAO ENDP                                      ;fim do procedimento de impressão
END MAIN