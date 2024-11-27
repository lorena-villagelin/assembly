title maiuscula&minuscula ;titulo
.model small ;modelo
.stack 100h
.code ;inicio do código
main proc 
    mov ah,2 ;instrução imprime caracter
    mov bh, 10 ;pula linha
    mov cx,26 ;armazena 26
    mov dl,'A' ;letra 'A'

    ;imprime letras muisculas
    imprime_mai:
        int 21h
        inc dl ;+1 (proxima letra)
        loop imprime_mai

    ;proxima linha
    mov dl,10
    int 21h

    mov cx,26 ;armazena 26
    mov dl,'a' ;letra 'a'

    ;imprime letras minusculas
    imprime_min: 
        int 21h
        inc dl;+1 (proxima letra)
        loop imprime_min        
    
    mov ah,4ch
    int 21h
main endp
end main