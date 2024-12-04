;Fazer um programa que calcula o valor médio dos elementos de um vetor.
title exercicio10
.model small
.stack 0100h 
.data 
    vetor db 1, 2, 3, 4, 5
    tamanho dw 5
.code 
    main proc 
        mov ax, @data
        mov ds, ax 
        mov es, ax

        xor ax, ax
        xor bx, bx
        mov cx, tamanho
        lea si, vetor 
        somando:
            lodsb
            add bx, ax
            loop somando
        mov ax, bx
        mov bx, tamanho
        div bx 
        mov dx, ax
        mov ah, 02h
        or dx, 30h
        int 21h

        mov ah, 4ch
        int 21h

    main endp
end main