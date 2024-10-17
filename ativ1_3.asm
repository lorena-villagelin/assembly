title atividade1
.model small ;modelo
.data ;declaração
    insira db "Digite um caractere: $"
    imprima db "Caractere digitado: $"

.code ;inicio do codigo
    main proc 

    ;acesso ás variaveis
    mov ax, @data
    mov ds, ax 

    ;exibe 'insira'
    mov ah, 9
    lea dx, insira
    int 21h 

    ;le o caracter
    mov ah,1
    int 21h 

    ;copia o caracter lido para bl
    mov bl, al

    ;desce o cursor para o proxima linha
    mov ah,2
    mov dl,10
    int 21h 

    ;move o cursor para o canto esquerdo da tela
    mov ah,2
    mov dl,13
    int 21h 

    ;exibe 'imprima'
    mov ah, 9
    lea dx, imprima
    int 21h 

    ;exibe caracter lido
    mov ah,2
    mov dl,bl
    int 21h 

    ;finalizar
    mov ah, 4ch
    int 21h 
main endp 
end main