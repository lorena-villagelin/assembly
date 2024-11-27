;Faça um programa que converta um número decimal para:
;a. HEXADECIMAL
;b. OCTAL
;c. BINÁRIO
;d. DECIMAL

TITLE exercicio3 ;titulo
.MODEL SMALL ;modelo
.STACK 100H ;tamanho da pilha
.DATA                                          ;declaração de variaveis
    digite DB 'Digite um numero decimal: $'    ;variavel digite

.CODE                                 ;inicio do código
MAIN PROC                             ;inicio do main

                 MOV  AX, @DATA       ;chama dados
                 MOV  DS, AX

                 MOV  AH, 09H         ;função de impressão 'digite'
                 LEA  DX, digite
                 INT  21H

                 XOR  BX, BX          ;zera BX, onde será armazenado o valor lido

    leitura:                          ;inicio do rótulo de leitura
                 MOV  AX, 10          ;passa 10 para AX
                 MUL  BX              ;multiplica BX por AX, cada vez que o loop roda
                 PUSH AX              ;armazena o resultado da multiplicação na pilha

                 MOV  AH, 01H         ;função de leitura
                 INT  21H

                 AND  AL, 0FH         ;tranforma em binario
                 CMP  AL, 0DH         ;compara com CR
                 JE   converte        ;se for igual para a leitura

                 XOR  AH, AH          ;zera AH, para não interferir na soma dos valores lidos e armazenados
                 POP  BX              ;busca o valor da multiplicação armazenado na pilha e coloca em BX
                 ADD  BX, AX          ;soma o valor lido com o que estava na pilha
                 JMP  leitura         ;retorna para a leitura
        
    converte:                         ;inicio da conversão do valor

    ;conversão hexadecimal

                 MOV  CX, 4           ;como hexa é divido em bytes de 4 bits, CX recebe 4
                 XOR  DX, DX          ;zera DL, para a impressão
                 MOV  AH, 02H         ;função de impressao

    hexa:        

                 MOV  DL, BH          ;passa os 8 primeiros bits de BX para DL
                 SHR  DL, 4           ;isola os 4 primeiros bits
                 CMP  DL, 0AH         ;compara com '10'
                 JAE  letra           ;se for maior é letra

                 OR   DL, 30H         ;como não é maior, transforma e número hexa
                 JMP  imprime_hexa    ;pula para impressão

    letra:       
                 ADD  DL, 37H         ;transforma em letra na tabela ASCII

    imprime_hexa:
                 INT  21H             ;executa impressão de DL
                 ROR  BX, 4           ;rotaciona BX 4x, pulando os bits já impressos
                 LOOP hexa            ;volta até CX ser 0

    ;conversão octal
            
                 MOV  AH, 02H         ;função impressão
                 MOV  DL, 0AH         ;pula linha
                 INT  21H
                 MOV  CX, 5           ;como octal tem 3 bits, 15 é o multiplo mais próximo de 16
            
    octa:        
                 MOV  DL, BL          ;passa o LSB de BX para DL
                 AND  DL, 07H         ;zera todos os bits de DL, menos os ultimos 3
                 OR   DL, 30H         ;transforma em hexadecimal
                 PUSH DX              ;armazena o valor em DX
                 ROR  BX, 3           ;rotaciona BX 3x, passando para a próxima sequencia de 3 bits
                 LOOP octa            ;repete até CX ser zero

                 MOV  CX, 5           ;CX volta a ser 5 para o loop de impressão
    imprime_octa:
                 POP  DX              ;resgata o ultimo valor armazenado
                 INT  21H             ;imprime
                 LOOP imprime_octa    ;repete 5x

                 ROR  BX, 1           ;rotaciona uma ultima vez para BX voltar ao seu valor original
    
    ;conversão binaria
                 MOV  AH, 02H         ;função impressão
                 MOV  DL, 0AH         ;pula linha
                 INT  21H
                 MOV  CX, 16          ;como o valor binário tem 16 bits, CX recebe 16, como contador
                 XOR  DH, DH          ;zera o MSB de DX para impressão

    binario:     
                 ROL  BX, 1           ;rotaciona BX uma vez
                 JNC  zero            ;se não tiver carry, pula para 'zero'
                 MOV  DL, '1'         ;se tiver carry, imprime '1'
                 INT  21H
                 JMP  segue_bi        ;pula modulo 'zero'
    zero:        
                 MOV  DL, '0'         ;imprime '0'
                 INT  21H
    segue_bi:    
                 LOOP binario         ;repete até CX zerar, dezesseis vezes

    ;conversão decimal
                 MOV  AH, 02H         ;função impressão
                 MOV  DL, 0AH         ;pula linha
                 INT  21H
            
                 MOV  AX, 10          ;passa 10 para AX, para a divisão
                 XCHG BX, AX          ;troca BX e AX, o número lido e o divisor
                 XOR  CX, CX          ;zera CX, para contagem
                 XOR  DX, DX          ;zera DX para armazenar o rest

    decimal:     
                 DIV  BX              ;divide o valor por 10
                 PUSH DX              ;armazena o resto
                 INC  CX              ;incrementa CX
                 OR   AX, AX          ;confere se AX ainda tem um valor armazenado
                 JE   imprime_dec     ;se não tiver pula para impressão
                 XOR  DX, DX          ;zera DX para armazenar o próximo resto
                 JMP  decimal         ;repete até AX zerar

    imprime_dec: 
                 MOV  AH, 02H         ;função impressão
                 POP  DX              ;regata o ultimo valor armazenado em DX
                 OR   DL, 30H         ;transforma em hexadecimal
                 INT  21H
                 LOOP imprime_dec     ;agora que CX contou quantas vezes foi feita a divisão, sabe quando parar a impressão

                 MOV  AH, 4CH         ;volta para DOS
                 INT  21H
MAIN ENDP
END MAIN 