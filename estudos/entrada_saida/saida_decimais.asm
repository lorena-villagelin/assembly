TITLE saida_decimais
.MODEL SMALL
.STACK 100H
.DATA
    newline DB 0DH, 0AH, '$'  ; Nova linha para organização de saída

.CODE
MAIN PROC
    ; Exemplo: imprime o número decimal sinalizado em AX (número inicial em AX)
        MOV AX, 12         ; Número de exemplo (pode ser qualquer valor em AX)
    
    ; Salva os registradores usados
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX

    ; Verifica se o número é negativo
        OR AX, AX          ; AX < 0?
        JGE @END_IF1       ; Se não, pula a parte de número negativo
        ; Se for negativo:
        PUSH AX            ; Salva o número
        MOV DL, '-'        ; DL recebe '-'
        MOV AH, 2
        INT 21H            ; Imprime o sinal '-'
        POP AX             ; Restaura o número original
        NEG AX             ; Transforma em positivo

    ; Conversão dos dígitos decimais
@END_IF1:
        XOR CX, CX         ; Zera o contador de dígitos
        MOV BX, 10         ; Define o divisor como 10 para divisão decimal

@REP1:
        XOR DX, DX         ; Limpa DX para divisão
        DIV BX             ; AX = AX / 10, DX = resto (próximo dígito)
        PUSH DX            ; Empilha o dígito para impressão na ordem correta
        INC CX             ; Incrementa o contador de dígitos
        OR AX, AX          ; Verifica se o quociente é zero
        JNE @REP1          ; Se não for, continua

    ; Impressão dos dígitos
        MOV AH, 2          ; Função para imprimir caractere

@IMP_LOOP:
        POP DX             ; Recupera o dígito do topo da pilha
        ADD DL, 30H        ; Converte o dígito para caractere ASCII
        INT 21H            ; Imprime o dígito
        LOOP @IMP_LOOP     ; Repete para todos os dígitos

    ; Impressão da nova linha
        MOV AH, 09H
        LEA DX, newline
        INT 21H

    ; Restaura os registradores
        POP DX
        POP CX
        POP BX
        POP AX
        RET
MAIN ENDP
END MAIN
