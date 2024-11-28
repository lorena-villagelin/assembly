;Faça uma busca em uma matriz 4X4 (DW) e retorne o seu maior valor e seu menor valor.

title exercicio2
.model small 
.stack 0100h
.data
    matriz dw 3, 2, 6, 1
           dw 0, 4, 1, 7
           dw 9, 4, 2, 7
           dw 1, 6, 3, 0
    maior db 10, 13, 'maior valor: $'
    menor db 10, 13, 'menor valor: $'
.code
    main proc
        mov ax, @data 
        mov ds, ax
        mov es, ax

        mov ah, 09h
        lea dx, maior
        int 21h
        mov cx, 16
        xor bl, bl
        lea si, matriz
        call p_maior
    main endp

    p_maior proc
        push ax
        push dx 
        cld
        confere_maior:
            lodsw
            cmp al, bl
            jg passa_maior
            jmp segue_maior
            passa_maior:
                mov bl, al
            segue_maior:
                loop confere_maior
        mov ah, 02h
        mov dl, bl
        or dl, 30h
        int 21h
        pop dx 
        pop ax
        ret
    p_maior endp
end main