title atividade2
.model small ;modelo
.data ;declaração
    insira1 db "Digite o primeiro numero: $"
    insira2 db "Digite o segundo numero: $"
    soma db "Soma dos dois numeros: $"

.code ;inicio do codigo
    main proc  

    ;acesso das variaveis
    mov ax, @data 
    mov ds, ax 

    ;exibe 'insira1'
    mov ah, 9 
    lea dx, insira1
    int 21h 

    ;le o caracter (numero)
    mov ah, 1 
    int 21h 

    ;copia o caracter lido para bl 
    mov bl, al 

    ;transforma hexadecimal para caracter
    sub bl, 30h

    ;desce o cursor para a proxima linha
    mov ah, 2 
    mov dl, 10
    int 21h

    ;move o cursor para a esquerda
    mov ah, 2 
    mov dl, 13
    int 21h

    ;exibe 'insira2' 
    mov ah, 9
    lea dx, insira2 
    int 21h

    ;le o caracter (numero)
    mov ah, 1 
    int 21h 

    ;copia o caracter lido para bh 
    mov bh, al 

    ;transforma hexadecimal para caracter
    sub bh, 30h

    ;soma dos numeros no formato hexadecimal
    add bl, bh 

    ;transforma a soma de hexadecimal para caracter
    add bl,30h

    ;desce o cursor para a proxima linha
    mov ah, 2 
    mov dl, 10
    int 21h 

    ;move o cursor para a esquerda
    mov ah, 2
    mov dl, 13
    int 21h 
     
    ;exibe 'soma'
    mov ah, 9 
    lea dx, soma 
    int 21h 

    ;exibe o resultado da soma
    mov ah, 2 
    mov dl, bl
    int 21h

    ;finalizar
    mov ah, 4ch
    int 21h
main endp
end main
