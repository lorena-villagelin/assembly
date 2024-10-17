title numero ;titulo 
.model small ;modelo
.stack 100h ;reserva 100h bytes para a área de pilha
.data ;declaração
    msg db "Digite um caractere: $"
    sim db 10,13, "O caractere digitado e um numero. $"
    nao db 10,13, "O caractere digitado nao e um numero. $"

.code ;incio do codigo
    main proc 

    ;acesso às variáveis
    mov ax, @data
    mov ds, ax

    ;exibe 'msg'
    mov ah, 9
    mov dx, offset msg
    int 21h

    ;le um caracter e salva em al
    mov ah, 1
    int 21h

    ;copia o caractere para bl
    mov bl, al

    ;compara o caractere com o valor 48 (0)
    cmp bl, 48

    ;se o caractere for menor que 48 salta para NAOENUMERO
    jb NAOENUMERO 

    ;compara o caractere com o valor 57 (9)
    cmp bl, 57

    ;se o caractere for maior que 57 salta para NAOENUMERO
    ja NAOENUMERO

    ;exibe que é numero (não se encaixou nas condições anteriores)
    mov ah, 9
    mov dx, offset sim
    int 21h

    ;rótulo FIM
    jmp FIM  

    ;rótulo NAOENUMERO
    NAOENUMERO:

        ;exibe 'nao'
        mov ah, 9
        mov dx, offset nao 
        int 21h

    ;rótulo FIM
    FIM:

    ;finaliza 
    mov ah, 4ch 
    int 21h

endp
end main

;Função do programa: Separar caracteres que são números dos outros.