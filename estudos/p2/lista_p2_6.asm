;Faça um programa que calcule a soma dos 8 elementos de um vetor
TITLE exercicio6 ;titulo
.MODEL SMALL ;modelo
.STACK 100H ;tamanho da pilha
.DATA                                            ;declaração de variaveis
    vetor  DB 8 DUP(?)                           ;tamanho do vetor
    digite DB 'insira o vetor: $'
    soma   DB 10, 13, 'soma dos elementos: $'
.CODE
MAIN PROC                         ;inicio do main

            MOV  AX, @DATA        ;chama dados
            MOV  DS, AX

            MOV  AH, 09H          ;função impressão de variável
            LEA  DX, digite       ;imprime 'digite'
            INT  21H

            MOV  AH, 01H          ;função leitura da caracter
            MOV  CX, 8            ;CX recebe o tamanho do vetor
            XOR  BX, BX           ;zera BX para somador
            XOR  SI, SI           ;zera SI para contador

    leitura:
            INT  21H              ;executa leitura
            AND  AL, 0FH          ;tranforma valor lido em binario
            MOV  vetor[SI], AL    ;passa valor para a posição do vetor indicada em SI
            ADD  BL, AL           ;soma o valor em BX
            LOOP leitura          ;repete até CX zerar
    
            MOV  AH, 09H          ;função impressão de variável
            LEA  DX, soma
            INT  21H

            MOV  AH, 02H          ;função impressão de caracter
            MOV  DX, BX           ;passa o a soma lido para DX
            CMP  BX, 0AH          ;compara a soma 10
            JGE  pre              ;se for maior vai para conversão de decimal
        
            OR   DL, 30H          ;tranforma em hexadecimal
            INT  21H
            JMP  fim              ;finaliza

    pre:                          ;caso o numero seja maior que 10
            MOV  AX, 10           ;coloca 10 em AX
            XCHG BX, AX           ;troca o valor em AX com BX, valor lido com divisor
            XOR  CX, CX           ;zera CX, contador

    conta:  
            XOR  DX, DX           ;zera DX, onde será armazenado o resto
            DIV  BX               ;divide AX por BX e armazena o resto em DX
            PUSH DX               ;o resto vai para a pilha
            INC  CX               ;incrementa CX
            OR   AX, AX           ;confere se AX zerou
            JE   imprime          ; se sim pula para a impressão
            JMP  conta            ;repete até AX zerar
            
    imprime:
            MOV  AH, 02H          ;função de impressão de caracter
            POP  DX               ;busca ultimo valor armazenado na pilha e passa para DX
            OR   DX, 30H          ;tranforma em hexa
            INT  21H              ;imprime
            LOOP imprime          ;repete até zerar CX, que foi estabelecido na conversão

    fim:    
            MOV  AH, 4CH          ;volta para o DOS
            INT  21H
MAIN ENDP
END MAIN