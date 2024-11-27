title letras ;titulo
.model small ;modelo
.stack 100h
.code ;inicio do codigo
main proc
    mov ah,2 ;armazena instrução imprime caracter
    mov bh,10 ;armazena intrução pula linha
    mov cx,26 ;armazena 26 em cx
    mov bl,4 ;armazena 4 em bl
    mov dl,61h ;armazena a letra 'a' em dl

    ;imprime a letra correspondente ao valor hexadecimal
    imprime:
        int 21H
        inc dl ;+1 (proxima letra)
        dec bl ;-1
        jnz saltar ;enquanto for diferente de zero
        xchg dl, bh ;'troca' os valores de dl e bh
        int 21H
        xchg dl, bh
        mov bl,4; inicializa bl com 4 novamente

        saltar:
            loop imprime ;repete as instruções até cx=0
    
    ;finaliza
    mov ah,4ch
    int 21H
main endp
end main
