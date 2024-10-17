title separador ;titulo
.model small ;modelo
.stack 100h ;reserva 100h bytes para a área de pilha
.data ;declaração
    digite db "Digite um caracter: $"
    cnumero db 10,13, "Caractere digitado: NUMERO. $"
    cletra db 10,13, "Caractere digitado: LETRA. $"
    cdesconhecido db 10,13, "Caractere digitado: CARACTERE DESCONHECIDO. $"

.code ;inicio do codigo
    main proc 

    ;acesso às variáveis
    mov ax, @data
    mov ds, ax

    ;exibe 'digite'
    mov ah, 9
    mov dx, offset digite 
    int 21h 

    ;le um caractere e salva em al
    mov ah, 1
    int 21h 

    ;copia o caractere para bl
    mov bl, al

    ;compara com 48 (0)
    cmp bl, 48

    ;se for menor que 48 (0) salta para DESCONHECIDO
    jb DESCONHECIDO 

    ;VERIFICAÇÃO DE NÚMERO
        ;compara com 57 (9)
        cmp bl, 57

        ;se for menor ou igual a 57 (9) salta para NUMERO
        jbe NUMERO 

    ;compara com 65 (A) 
    cmp bl, 65

    ;se for menor que 65 salta para DESCONHECIDO
    jb LETRA 

    ;VERIFICAÇÃO LETRA
        ;compara com 90 (Z)
        cmp bl, 90

        ;se for menor ou igual a 90 (Z) salta para LETRA
        jbe LETRA

        ;compara com 97 (a)
        cmp bl, 97

        ;se for menor que 97 (a) salta para DESCONHECIDO
        jb DESCONHECIDO

        ;compara com 122 (z)
        cmp bl, 122

        ;se for menor ou igual a 122 (z) salta para LETRA
        jbe LETRA

    ;rótulo desconhecido
    DESCONHECIDO:
        ;exibe 'cdesconhecido'
        mov ah, 9
        mov dx, offset cdesconhecido
        int 21h
        ;finaliza
        jmp fim

    ;rótulo NUMERO
    NUMERO: 
        ;exibe 'numero'
        mov ah, 9
        mov dx, offset cnumero
        int 21h 
        ;finaliza
        jmp fim

    ;rótulo LETRA
    LETRA: 
        ;exibe 'letra'
        mov ah, 9
        mov dx, offset cletra
        int 21h

    ;rótulo FIM
    FIM: 
    
    ;finaliza
    mov ah, 4ch
    int 21h

endp
end main