TITLE entrada_decimais
.MODEL SMALL
.STACK 100H
.DATA
    msg_erro DB 'Entrada invalida. Tente novamente.$'

.CODE
    MAIN PROC
        ; Salva os registradores usados
        PUSH BX
        PUSH CX
        PUSH DX

    codigo:
        ; Mostra o prompt de entrada
        MOV AH, 02H
        MOV DL, '?'
        INT 21H

        ; Inicializa BX para armazenar o número e CX para o sinal
        XOR BX, BX 
        XOR CX, CX
            
        ; Lê o primeiro caractere para verificar o sinal
        MOV AH, 01H
        INT 21H

        CMP AL, '-'
        JE negativo
        CMP AL, '+'
        JE positivo
        JMP verifica_digito ; Se não é um sinal, verifica o dígito

    negativo:
        MOV CX, 1        ; Define sinal negativo
        JMP segue

    positivo:
        MOV CX, 0        ; Define sinal positivo
        JMP segue

    verifica_digito:
        CMP AL, '0'
        JL invalido       ; Verifica se é menor que '0' (inválido)
        CMP AL, '9'
        JG invalido       ; Verifica se é maior que '9' (inválido)

    segue:
        ; Converte o caractere lido para valor numérico e acumula
        AND AL, 0FH       ; Converte caractere para valor numérico
        MOV AH, 0
        PUSH AX           ; Armazena o dígito na pilha

        MOV AX, 10
        MUL BX            ; Multiplica BX por 10 (posição decimal)
        POP AX
        ADD BX, AX        ; Adiciona o dígito a BX
            
    proximo_digito:
        ; Lê o próximo caractere
        MOV AH, 01H
        INT 21H
        CMP AL, 0DH       ; Verifica se é Enter (fim da entrada)
        JE converte_final

        ; Verifica se o caractere é um dígito
        CMP AL, '0'
        JL invalido       ; Se menor que '0', é inválido
        CMP AL, '9'
        JG invalido       ; Se maior que '9', é inválido

        ; Converte caractere para valor numérico e continua acumulando
        AND AL, 0FH
        MOV AH, 0
        PUSH AX

        MOV AX, 10
        MUL BX
        POP AX
        ADD BX, AX        ; Adiciona o dígito a BX
        JMP proximo_digito

    converte_final:
        ; Se o número era negativo, inverte BX
        OR CX, CX
        JE fim            ; Se CX é zero, número é positivo
        NEG BX            ; Inverte para negativo se necessário

    fim:
        ; Restaura os registradores e retorna
        POP DX
        POP CX
        POP BX
        RET

    invalido:
        ; Mostra mensagem de erro e reinicia o processo
        MOV AH, 09H
        LEA DX, msg_erro
        INT 21H
        JMP codigo

    MAIN ENDP
END MAIN
