TITLE exercicio1 ;titulo
.MODEL SMALL ;modelo
.STACK 100H ;tamanho da pilha
PULA_LINHA MACRO               ;macro pra pular linha
               PUSH AX         ;guarda valor anterior guardado em AX
               PUSH DX         ;guarda valor anterior guardado em DX
               MOV  AH, 02H    ;pula linha
               MOV  DL, 0AH
               INT  21H
               POP  DX         ;recupera valor de DX
               POP  AX         ;recupera valor de AX
ENDM
.DATA
    matriz DB '1', '2', '3', '4'    ;declaração da matriz
           DB '4', '3', '2', '1'
           DB '5', '6', '7', '8'
           DB '8', '7', '6', '5'
.CODE                                          ;inicio do código
MAIN PROC
              MOV        AX, @DATA             ;chama dados
              MOV        DS, AX
              CALL       impressao             ;chama procedimento de impressao
              MOV        AH, 4CH               ;volta para o DOS
              INT        21H
MAIN ENDP
impressao PROC                                 ;inicio do procedimento
              MOV        AH, 02                ;função de impressão
              XOR        SI, SI                ;zera contador de linhas
    linha:    
              XOR        BX, BX                ;zera contador de colunas
              MOV        CX, 4
    coluna:   
              MOV        DL, matriz[SI][BX]    ;passa o valor apontado para DL
              INT        21H                   ;imprime
              MOV        DL, ' '
              INT        21H
              INC        BX                    ;passa para a próxima coluna
              LOOP       coluna                ;repete até acabarem as colunas dessa linha
              PULA_LINHA                       ;macro pula_linha
              ADD        SI, 4                 ;passa para a próxima linha
              CMP        SI, 16                ;confere se já foram lidas todas as linhas
              JL         linha                 ;enquanto for menor, volta
              RET                              ;volta para o main
impressao ENDP                                 ;fim do procedimento
END MAIN