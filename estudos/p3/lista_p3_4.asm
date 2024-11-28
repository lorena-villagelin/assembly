;Faça um programa que rotacione um vetor de 5 elementos k vezes.

title exercicio4
.model small
.stack 0100h
.data
    vetor db 1, 2, 3, 4, 5
    tamanho db 5
    vezes db 3
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax

        xor cx, cx 
        mov cl, tamanho
        lea si, vetor
        call move

        xor cx, cx
        mov cl, tamanho
        lea si, vetor
        call impressao

        mov ah, 4ch
        int 21h
    main endp

    move proc
        cld
        lodsb
        mov bl, al
        xor di, di 

        rotacao:
            inc di
            mov vetor[di], al
            loop rotacao
        ret
    move endp

    impressao proc 
        push ax
        push dx
        cld
        mov ah, 02h
        imprimindo:
            lodsb
            mov dl, al
            or dl, 30h
            int 21h
            loop imprimindo
        pop dx
        pop ax
        ret
    impressao endp
end main