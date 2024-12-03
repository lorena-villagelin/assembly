; Considere dois vetores V1 e V2 na memória, ambos de 7 elementos
; (numéricos), faça um programa que informe quantos E quais elementos
; V1 e V2 tem em comum.
 
title exercicio6
.model small
.stack 0100h
.data
    v1 db 1, 4, 5, 3, 2, 0, 9
    v2 db 7, 8, 0, 9, 3, 4, 1
    v db 7 dup (?)
    quantos db 10, 13, 'quantidade de elementos em comum: $'
    comum db 10, 13, 'elementos em comum: $'
    tamanho dw 7
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax
        mov ah, 09h
        lea dx, comum
        int 21h
        xor bx, bx
        xor dx, dx
        mov cx, tamanho
        confere:
            lea di, v1
            call passa
            lea di, v2
            call procura
            inc cx 
            inc bx 
            cmp bx, tamanho
            jne confere
        xchg dx, bx
        mov ah, 09h
        lea dx, quantos
        int 21h
        xchg bx, dx
        mov ah, 02h
        or dx, 30h  
        int 21h
        mov ah, 4ch
        int 21h  
    main endp
    passa proc
        xor ax, ax
        cld
        lodsb      
        ret
    passa endp
    procura proc 
        push cx
        mov cx, tamanho
        cld
        compara:
                scasb
                jz sim 
                jmp segue
                sim:
                    inc dx
                    push dx 
                    mov ah, 02h
                    mov dl, al 
                    or dl, 30h 
                    int 21h
                    pop dx
                segue:
                    loop compara
        pop cx 
        ret
    procura endp
end main