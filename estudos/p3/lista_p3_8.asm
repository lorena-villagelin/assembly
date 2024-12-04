; Considerando uma matriz 4x4 armazenada na memória, faça um
; programa que troque a 1ª linha com a 4ª coluna dessa matriz

title exercicio8
.model small
.stack 0100h 
pula macro
    push ax 
    push dx 
    mov ah, 02h 
    mov dl, 0ah
    int 21h
    pop dx
    pop ax
endm
espaco macro
    push ax 
    push dx 
    mov ah, 02h 
    mov dl, ' '
    int 21h
    pop dx
    pop ax
endm
.data 
    matriz db 1, 1, 1, 1
           db 2, 2, 2, 2
           db 3, 3, 3, 3
           db 4, 4, 4, 4

    total dw 16
    linha dw 4

.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax

        lea si, matriz
        call imprime
        pula

        xor si, si 
        mov di, 3
        xor bx, bx
        mov cx, linha
        trocando:
            mov al, matriz[bx][si]
            xchg al, matriz[di][bx]
            mov matriz[bx][si], al
            inc si 
            add di, 4
            loop trocando
        pula

        lea si, matriz
        call imprime

        mov ah, 4ch
        int 21h

    main endp
    imprime proc 
        push ax
        push bx
        push cx
        push dx
        mov cx, total
        cld
        mov ah, 02h
        imprimindo:
            lodsb
            mov dl, al
            or dl, 30h
            int 21h
            espaco
            inc bx
            cmp bx, linha 
            je pulando
            jmp segue
            pulando:
                pula
                xor bx, bx
            segue:
            loop imprimindo
        pop dx
        pop cx
        pop bx
        pop ax
        ret
    imprime endp
end main