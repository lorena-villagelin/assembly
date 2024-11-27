title eco
.model small
.stack 100h
.data 
    inserir db 'insira o caracter: $'
    exibir db 'caracter digitado: $'

.code
    main proc

    ;acesso às variáveis
    mov ax, @data
    mov ds, ax

    ;'inserir'
    mov ah, 9
    lea dx, inserir
    int 21h

    ;receber caracter
    mov ah, 1
    mov al, ah
    int 21h
    mov bl, al
    int 21h

    ;pular linha
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    ;'exibir'
    mov ah, 9
    lea dx, exibir
    int 21h

    ;caracter
    mov ah, 2
    mov dl, bl
    int 21h

    ;finalizar
    mov ah,4ch
    int 21h

    endp main
end main