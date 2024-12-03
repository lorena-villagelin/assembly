; Tendo um vetor de 5 elementos armazenado na memória, faça um
; programa que remova um elemento “X” desse vetor, organizando-o após
; a remoção de forma adequada.

title exercicio7
.model small 
.stack 0100h
.data 
    vetor db 1, 2, 3, 4, 5
    tamanho dw 5 
    original db 'vetor original: $'
    elemento db 'qual elemento deseja retirar? $'
    novo db 'novo vetor: $'
    e db 2
.code 
    main proc 
        mov ax, @data 
        mov ds, ax 
        mov es, ax

        xor cx, cx
        mov cx, tamanho
        lea si, vetor
        call imprime

        mov cx, tamanho
        lea di, vetor
        call procura

        mov cx, tamanho 
        lea si, vetor
        call imprime

        mov ah, 4ch
        int 21h
    main endp
    imprime proc
        push ax 
        push dx
        cld
        imprimindo: 
            lodsb
            mov dl, al
            mov ah, 02h
            or dl, 30h
            int 21h
            loop imprimindo
        pop dx
        pop ax
        ret
    imprime endp
    procura proc
        push ax
        cld 
        procurando:
            scasb
            jnz coloca
            jmp pula 
            coloca:
                stosb
                dec di
            pula:
                loop procurando 
        pop ax   
        ret            
    procura endp
end main