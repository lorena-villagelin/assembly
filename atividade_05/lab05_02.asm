title for ;titulo
.model small ;modelo
.stack 100h;
.code ;inicio do codigo
main proc
    mov ah, 2
    mov dl, '*'
    mov cx, 50
    mov bh, 10
    
    ;imprime uma linha com 50 '*'
    linha:
        int 21H
        loop linha

    ;espera que o usuário digite algo para continuar
    mov ah,1
    int 21h
    mov ah,2

    ;inicializa cx com 50 novamente
    mov cx, 50

    ;imprime um coluna com 50 '*'
    coluna:
        xchg dl, bh 
        int 21H
        xchg dl, bh
        int 21h
        loop coluna

    ;finaliza
    mov ah,4ch
    int 21h 
main endp
end main 

