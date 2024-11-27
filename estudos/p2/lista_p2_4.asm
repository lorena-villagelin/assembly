;Faça um programa que conte quantas vogais tem em um vetor nome de tamanho 20
TITLE exercicio4
.MODEL SMALL
.STACK 100H
.DATA
    vetor  DB 20 DUP(?)      ;salva 20 bits para vetor
    vogais DB 'Vogais: $'
.CODE
MAIN PROC
              MOV  AX, @DATA        ;chama dados
              MOV  DS, AX

              MOV  AH, 01H          ;função de leitura
              XOR  BX, BX           ;zera BX
              MOV  CX, 20           ;inicializa o contador CX com o tamanho do vetor
              XOR  SI, SI           ;zera SI
        
    leitura:  
              INT  21H              ;executa a leitura de caracter
              CMP  AL, 0DH          ;compara o caracter lido com CR
              JE   impressao        ;se for igual para a leitura e passa para impressão
              MOV  vetor[BX], AL    ;passa o valor lido para o endereço de BX
              INC  BX               ;incrementa BX
              CMP  AL, 'a'          ;compara com a vogal 'a'
              JE   soma             ;se for igual pula para 'soma'
              CMP  AL, 'e'          ;compara com a vogal 'e'
              JE   soma             ;se for igual pula para 'soma'
              CMP  AL, 'i'          ;compara com a vogal 'i'
              JE   soma             ;se for igual pula para 'soma'
              CMP  AL, 'o'          ;compara com a vogal 'o'
              JE   soma             ;se for igual pula para 'soma'
              CMP  AL, 'u'          ;compara com a vogal 'u'
              JE   soma             ;se for igual pula para 'soma'
              JMP  segue            ;se não for igual a nenhuma das vogais pula para 'segue'
    soma:     
              INC  SI               ;toda vez que uma vogal é lida, pula para 'soma' e incrementa o contador BX
    segue:    
              LOOP leitura          ;repete o processo até CR ou até CX zerar
        
        
        
    impressao:
              MOV  AH, 09H          ;instrução de impressão de string
              LEA  DX, vogais       ;imprime 'vogais'
              INT  21H

              MOV  AH, 02H          ;instrução de impressão de caracter
              MOV  DX, SI           ;passa o numero de vogais lidas para DX
              OR   DL, 30H          ;transforma o valor lido em caracter
              INT  21H              ;executa impressão
        
              MOV  AH, 4CH          ;volta para o DOS
              INT  21H

MAIN ENDP
END MAIN