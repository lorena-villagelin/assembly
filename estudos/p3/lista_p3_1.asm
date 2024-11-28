; Em um vetor de números armazenado na memória, conte quantas ocorrências
; de números maiores que 15 e imprima o resultado.

title exercicio1
.model small
.stack 0100h
.data
        vetor db 10, 13, 2, 5, 18, 30, 4, 38
        quantidade db 'numeros maiores que 15: $'
.code
        main proc
                mov ax, @data
                mov ds, ax
                mov es, ax

                mov ah, 09h
                lea dx, quantidade
                int 21h
                lea si, vetor
                lea di, imprime
                xor cx, cx
                mov cl, tamanho
                call p_maiores

                mov ah, 4ch
                int 21h
        main endp

        p_maiores proc
                push ax
                push dx
                xor bx, bx
                cld
                verifica:
                        lodsb
                        cmp al, 0fh
                        jg maior 
                        jmp volta
                        maior:
                                inc bx
                                stosb
                        volta:
                                loop verifica
                mov ah, 02h
                mov dx, bx
                or dx, 30h
                int 21h     
                pop dx
                pop ax
                ret
        p_maiores endp
end main