title atividade2
.model small ;modelo
.data ;declaração
    insira db "Digite uma letra minuscula:  $"
    imprima db "Letra maiuscula correspondente: $"

.code ;início do código
    main proc

    ;acesso ás variáveis
    mov ax, @data
    mov ds, ax

    ;exibe 'insira'
    mov ah, 9
    lea dx, insira
    int 21h

    ;le o caracter
    mov ah, 1
    int 21h

    ;copia o caracter para bl
    mov bl, al

    ;subtrai 20h (posição da misnuscula para maiuscula)
    sub bl, 20h 
    ; ou add bl, -20h 

    ;desce o cursor para a proxima linha
    mov ah, 2
    mov dl, 10
    int 21h

    ;move o cursor para o canto esquerdo da tela
    mov ah, 2 
    mov dl, 13 
    int 21h

    ;exibe 'imprima'
    mov ah, 9 
    lea dx, imprima
    int 21h

    ;exibe carecter maiusculo
    mov ah, 2 
    mov dl, bl 
    int 21h 

    ;finalizar
    mov ah, 4ch
    int 21h
main endp
end main