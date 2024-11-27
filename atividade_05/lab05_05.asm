title calculadora 
.model small
.stack 100h
.data
    numero db 'Digite um numero: $'
    soma db 'Soma total: $'
    resultado db 0, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    mov cx, 5 ;contador
    mov bx, 0 ;armazena a soma
    mov bh,10 ;intrução pula linha

    ;leitura dos valores
    ler_numeros:

        ;imprime 'numero'
        mov ah, 9
        lea dx, numero
        int 21h

        ;ler caractere
        mov ah, 1 
        int 21h
        sub al, '0' ;converte o caractere para um número real
        add bx, ax ;soma o valor na soma total
        mov dl,bh 
        int 21h
        loop ler_numeros ; Decrementa CX e repete até ler 5 números

    ;converte a soma para ASCII e coloca em 'resultado'
    mov  ax, bx         
    add  al, '0'
    mov  resultado, al      

    ;exibe a mensagem 'soma' e resultado
    mov  ah, 09h        
    lea  dx, soma        
    int  21h   
    lea  dx, resultado  
    mov  ah, 09h        
    int  21h           

    ;finaliza
    mov  ah, 4Ch        
    int  21h

main endp
end main
