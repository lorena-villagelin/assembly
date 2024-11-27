;Fazer um programa que permita a entrada e qualquer uma das bases e a saída em qualquer uma
;das bases. O programa deverá perguntar em que base será a entrada do número e em que base
;será a saída do número. Usar procedimentos e macros. 

TITLE atividade11 ;titulo
.MODEL SMALL ;modelo
.STACK 100 ;tamanho da pilha

PULA_LINHA MACRO               ;macro pula_linha
               PUSH DX         ;guarda valor anterior de DX
               PUSH AX         ;guarda valor anterior de AX
               MOV  AH, 02H    ;instrução de impressão de caracter
               MOV  DL, 0AH    ;caracter para pular linha
               INT  21H        ;executa
               POP  AX         ;retorna valor anterior de AX
               POP  DX         ;retorna valor anterior de DX
ENDM

DIGITE_VALOR MACRO                  ;para chamar string 'digite'
                 PUSH DX            ;guarda o valor anterior de DX
                 PUSH AX            ;guarda o valor anterior de AX
                 MOV  AH, 09H       ;chama instruç~so de impressão de cadeia de caracteres
                 LEA  DX, digite    ;chama 'digite'
                 INT  21H           ;imprime
                 POP  AX            ;retorna valor anterior de AX
                 POP  DX            ;retorna valor anterior de DX
ENDM

.DATA                                                        ;declaração de variaveis
    menu    DB 10, 13, '--- MENU ---$'
    op1     DB 10, 13, '[1] Decimal$'
    op2     DB 10, 13, '[2] Hexadecimal$'
    op3     DB 10, 13, '[3] Binario$'
    entrada DB 10, 13, 'Qual a forma de entrada? $'
    saida   DB 10, 13, 'Qual a forma de saida? $'
    digite  DB 10, 13, 'Digite o valor para conversao: $'

.CODE
MAIN PROC
                          MOV          AX, @DATA                ;chama variaveis
                          MOV          DS, AX

    ;impressão do menu
                          MOV          AH, 09
                          LEA          DX, menu
                          INT          21H

                          LEA          DX, op1
                          INT          21H

                          LEA          DX, op2
                          INT          21H

                          LEA          DX, op3
                          INT          21H

                          PULA_LINHA

                          LEA          DX, entrada
                          INT          21H

    ;leitura da opção selecionada no menu para entrada
                          MOV          AH, 01H
                          INT          21H
                          AND          AL, 0FH

                          PULA_LINHA

    ;confere qual das opções foi selecionada
                          CMP          AL, 1
                          JE           entra_d
                          CMP          AL, 2
                          JE           entra_h
                          CMP          AL, 3
                          JE           entra_b

    ;caso a entrada seja em decimal, chama o procedimento entrada_decimal
    entra_d:              
                          DIGITE_VALOR
                          CALL         ENTRADA_DECIMAL
                          JMP          saida_le
    ;caso a entrada seja em decimal, chama o procedimento entrada_hexa
    entra_h:              
                          DIGITE_VALOR
                          CALL         ENTRADA_HEXA
                          JMP          saida_le
    ;caso a entrada seja em decimal, chama o procedimento entrada_binario
    entra_b:              
                          DIGITE_VALOR
                          CALL         ENTRADA_BINARIO
        
    saida_le:             
                          MOV          AH, 09
                          LEA          DX, saida
                          INT          21H

    ;leitura da opção selecionada no menu para saida
                          MOV          AH, 01
                          INT          21H
                          AND          AL, 0FH

    ;confere qual das opções foi selecionada
                          CMP          AL, 1
                          JE           sai_d
                          CMP          AL, 2
                          JE           sai_h
                          CMP          AL, 3
                          JE           sai_b

    ;caso a entrada seja em decimal, chama o procedimento saida_decimal
    sai_d:                
                          PULA_LINHA
                          CALL         SAIDA_DECIMAL
                          JMP          fim_main
        
    ;caso a entrada seja em decimal, chama o procedimento saida_hexa
    sai_h:                
                          PULA_LINHA
                          CALL         SAIDA_HEXA
                          JMP          fim_main
        
    ;caso a entrada seja em decimal, chama o procedimento saida_binario
    sai_b:                
                          PULA_LINHA
                          CALL         SAIDA_BINARIO

    fim_main:             
                          MOV          AH, 4CH
                          INT          21H

MAIN ENDP

ENTRADA_DECIMAL PROC
                          XOR          BX, BX                   ;zera BX
    leitura_decimal:      
    ;multiplica o valor inserido por 10 e armazena
                          MOV          AX, 10
                          MUL          BX
                          PUSH         AX

                          MOV          AH, 01H                  ;leitura do valor
                          INT          21H

                          AND          AL, 0FH                  ;tranforma em binario
                          CMP          AL, 0DH                  ;confere se é CR
                          JE           fim_leitura_decimal      ;se for, finaliza leitura

                          XOR          AH, AH                   ;zera AH para multiplicação

                          POP          BX                       ;puxa valor de BX
                          ADD          BX, AX                   ;soma em AX
                          JMP          leitura_decimal          ;volta

    fim_leitura_decimal:  
                          RET                                   ;volta para o main

ENTRADA_DECIMAL ENDP

ENTRADA_HEXA PROC
                          MOV          AH, 01H                  ;leitura do valor
                          INT          21H

                          XOR          BX, BX                   ;zera BX

    leitura_hexa:         
                          CMP          AL, 0DH                  ;confere se não é CR
                          JE           fim_leitura_hexa

                          CMP          AL, 39H                  ;faz a comparação para ver se é letra ou numero
                          JG           letra_entra_hexa

                          AND          AL, 0FH                  ;tranforma em binario
                          JMP          segue_leitura_hexa

    letra_entra_hexa:     
                          SUB          AL, 37H                  ;tranforma em letra

    segue_leitura_hexa:   
                          SHL          BX, 4                    ;desloca quatro casas para a esquerda
                          OR           BL, AL                   ;coloca o valor lido em BL
                          JMP          leitura_hexa

    fim_leitura_hexa:     
                          RET
ENTRADA_HEXA ENDP

ENTRADA_BINARIO PROC
                          MOV          CX, 16                   ;contador
                          XOR          BX, BX                   ;zera BX
                          MOV          AH, 01H                  ;função de leitura

    leitura_binario:      
                          INT          21h                      ;executa leitura
                          CMP          AL, 0DH                  ;compara c CR
                          JE           fim_leitura_binario      ;se igual pula para o fim
                          AND          AL, 0FH                  ;tranforma em numero
                          SHL          BX, 1                    ;pula um para esquerda, abrindo espaço
                          OR           BL, AL                   ;coloca no LSB
                          LOOP         leitura_binario          ;enquando CX não for zero, repete
        
    fim_leitura_binario:  
                          RET
ENTRADA_BINARIO ENDP

SAIDA_DECIMAL PROC
                          PULA_LINHA
                          MOV          AX, 10
                          XCHG         BX, AX
                          XOR          CX, CX

    conta_decimal:        
                          DIV          BX                       ;divide BX por 10
                          PUSH         DX                       ;guarda o resto
                          INC          CX                       ;incrementa contador
                          OR           AX, AX                   ;confere AX
                          JE           impressao_decimal        ;pula para impressão
                          XOR          DX, DX                   ;zera DX, onde fica o resto
                          JMP          conta_decimal

    impressao_decimal:    
                          MOV          AH, 02H                  ;impressão
                          POP          DX                       ;puxa valor armazenado na pilha
                          OR           DL, 30H                  ;tranforma em hexa
                          INT          21H
                          LOOP         impressao_decimal

                          RET
SAIDA_DECIMAL ENDP

SAIDA_HEXA PROC
                          PULA_LINHA
                          MOV          CX, 4
                          MOV          AH, 02H

    impressao_hexa:       
                          MOV          DL, BH                   ;passa valor para impressão
                          SHR          DL, 4                    ;descloca 4 para direita

                          CMP          DL, 0AH                  ;confere se é letra
                          JAE          letra_sai_hexa

                          ADD          DL, 30H                  ;tranforma em numero hexa
                          JMP          segue_impressao_hexa

    letra_sai_hexa:       
                          ADD          DL, 37H                  ;tranforma em letra
            
    segue_impressao_hexa: 
                          INT          21H                      ;imprime
                          ROL          BX, 4                    ;rola 4 para a esquerda
                          LOOP         impressao_hexa
        
                          RET
SAIDA_HEXA ENDP

SAIDA_BINARIO PROC
                          PULA_LINHA
                          MOV          AH, 02H                  ;função impressão
                          MOV          CX, 16                   ;contador

    impressao_binario:    
                          ROL          BX, 1                    ;rotaciona para esquerda
                          JNC          caso0                    ;se o carry for 0, pula para impressão de '0'
                          MOV          DL, '1'                  ;se nao for 0 imprime 1
                          INT          21                       ;executa impressão
                          JMP          fim_impressao_binario

    caso0:                
                          MOV          DL, '0'                  ;carry é zero
                          INT          21H

    fim_impressao_binario:
                          LOOP         impressao_binario        ;enquanto CX não for 0, retorna o loop
                          RET
SAIDA_BINARIO ENDP
END MAIN