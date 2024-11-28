;Dada uma matriz 2x2 na memória, calcule e exiba a sua matriz transposta.
title exercicio3
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
    matriz db 0, 0
           db 0, 0
    original db 1, 2
             db 3, 4
    s_original db 10, 13, 'matriz original: $'
    s_transposta db 10, 13, 'matriz transposta: $'
    linha db 2
    total db 4
.code
    main proc 
        mov ax, @data 
        mov ds, ax
        mov es, ax

        mov ah, 09h
        lea dx, s_original
        int 21h
        pula

        xor cx, cx 
        mov cl, total
        lea si, original
        lea di, matriz
        call troca

        xor cx, cx
        mov cl, total
        lea si, matriz
        call imprime

        xor cx, cx 
        mov cl, linha
        lea si, original
        call transpondo   

        pula
        pula

        mov ah, 09h
        lea dx, s_transposta
        int 21h
        pula

        xor cx, cx 
        mov cl, total 
        lea si, matriz
        call imprime

        mov ah, 4ch
        int 21h
    main endp

    troca proc
        push ax 
        push dx 
        cld
        rep movsb
        pop dx 
        pop ax 
        ret
    troca endp

    imprime proc
        push ax
        push dx
        cld
        mov ah, 02h
        xor bx, bx
        impressao:
            lodsb
            mov dl, al
            or dl, 30h
            int 21h
            espaco
            inc bx
            cmp bl, linha
            je pulando
            jmp segue
            pulando:
                pula
            segue:
                loop impressao
        pop ax
        pop dx 
        ret
    imprime endp

    transpondo proc 
        push ax 
        xor si, si
        xor bx, bx
        mov dx, cx
        transp:
            inc bx
            mov al, matriz[si][bx]
            add si, dx
            dec bx
            xchg matriz[si], al
            sub si, dx
            inc bx
            mov matriz[si][bx], al
            loop transp 
        pop ax 
        ret
    transpondo endp
end main