title mensagens
.model small ;modelo
.data ;declaracao
    msg1 db "mensagem 1$" 
    msg2 db "mensagem 2$"

.code ;inicio do codigo
    main proc 
    
        ; acesso às variáveis definidas
        mov ax, @data 
        mov ds, ax

        ;exibe na tela a string msg1
        mov ah, 9
        lea dx, msg1 ;mov dx, offset msg1
        int 21h 

        ;exibe string msg2
        mov ah, 9
        lea dx, msg2
        int 21h 

        ;finalizar
        mov ah, 4ch 
        int 21h 
    main endp
end main