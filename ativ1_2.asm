title eco
.model small
.code
main proc
    ;exibe o caracter ? na tela
    mov ah,2
    mov dl,"?"
    int 21h 

    ;le um caracter do teclado e salva o caracter lido em al
    mov ah,1
    int 21h 

    ;copia o caracter lido para bl
    mov bl, al 

    ;desce o cursor para a linha seguinte
    mov ah,2
    mov dl,10
    int 21h 

    ;move o cursor para o canto esquerdo da tela
    mov ah,2
    mov dl,13
    int 21h 

    ;exibe o caracter lido (salvo em bl)
    mov ah,4ch 
    int 21h 
main endp 
end main