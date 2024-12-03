;Dada uma matriz 4x4 efetue um procedimento que retorne a soma de
;cada linha da matriz (se quiser exercitar mais recomendo a soma da
;linha E coluna).

title exercicio5
.model small
.stack 0100h
.data       ; 12 15 12 12
    matriz db 3, 8, 5, 5 ;18
           db 3, 4, 4, 4 ;15
           db 3, 2, 2, 2 ;9
           db 3, 1, 1, 1 ;6
    linha dw 4
    total dw 16

    linhas db 10, 13, '*** soma das linhas ***$'
    l1 db 10, 13, 'primeira: $'
    l2 db 10, 13, 'segunda:  $'
    l3 db 10, 13, 'terceira: $'
    l4 db 10, 13, 'quarta:   $'

    colunas db 10, 13, 10, 13, '*** soma das colunas ***$'
    c1 db 10, 13, 'primeira: $'
    c2 db 10, 13, 'segunda:  $'
    c3 db 10, 13, 'terceira: $'
    c4 db 10, 13, 'quarta:   $'

.code
    main proc
        mov ax, @data
        mov ds, ax 
        mov es, ax 

        mov ah, 09h
        lea dx, linhas
        int 21h

        lea dx, l1
        int 21h
        mov cx, linha
        lea si, matriz
        call soma_linha
        call imprime

        lea dx, l2
        int 21h
        mov cx, linha        
        lea si, matriz+4
        call soma_linha
        call imprime

        lea dx, l3
        int 21h
        mov cx, linha        
        lea si, matriz+8
        call soma_linha
        call imprime

        lea dx, l4
        int 21h
        mov cx, linha        
        lea si, matriz+12
        call soma_linha
        call imprime

        mov ah, 09h
        lea dx, colunas
        int 21h

        lea dx, c1
        int 21h      
        lea si, matriz
        call soma_coluna
        call imprime

        lea dx, c2
        int 21h      
        lea si, matriz+1
        call soma_coluna
        call imprime

        lea dx, c3
        int 21h      
        lea si, matriz+2
        call soma_coluna
        call imprime

        lea dx, c4
        int 21h      
        lea si, matriz+3
        call soma_coluna
        call imprime

        mov ah, 4ch
        int 21h
    main endp

    soma_linha proc
        push ax
        xor ax, ax
        xor bx, bx
        cld
        somando_linha:
            lodsb
            add bx, ax
            loop somando_linha
        pop ax
        ret
    soma_linha endp

    soma_coluna proc
        push ax 
        push dx
        push cx
        xor ax, ax
        xor bx, bx
        xor cx, cx
        cld 
        somando_coluna:
            lodsb
            dec si
            add bx, ax
            add cx, linha
            add si, linha
            cmp cx, total
            jne somando_coluna
        pop cx
        pop dx
        pop ax
        ret
    soma_coluna endp

    imprime proc
        push ax
        push dx
        mov ax, 10
        xchg ax, bx
        xor cx, cx
        decimal:
            xor dx, dx
            div bx 
            push dx 
            inc cx
            cmp ax, 00h 
            jne decimal

        mov ah, 02h
        imprimindo:
            pop dx
            or dx, 30h
            int 21h
            loop imprimindo
        pop dx
        pop ax 
        ret
    imprime endp
end main