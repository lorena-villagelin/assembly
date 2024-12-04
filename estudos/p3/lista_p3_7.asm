; Tendo um vetor de 5 elementos armazenado na memória, faça um
; programa que remova um elemento “X” desse vetor, organizando-o após
; a remoção de forma adequada.

title exercicio7
.model small 
.stack 0100h
pula_linha macro
    push ax
    push dx
        mov ah, 02h
        mov dl, 0ah
        int 21h
    pop dx
    pop ax
endm
.data 
    vetor db 1, 2, 3, 4, 5
    tamanho dw 5 
    original db 'vetor original: $'
    elemento db 'qual elemento deseja retirar? $'
    novo db 'novo vetor: $'
    e dw 5
.code 
    main proc 
        mov ax, @data 
        mov ds, ax 
        mov es, ax

        xor cx, cx
        mov cx, tamanho
        lea si, vetor
        call imprime

        pula_linha
        
        ; xor ax, ax
        ; mov al, e
        ; mov cx, tamanho
        ; lea di, vetor
        ; lea si, vetor
        ; call procura
        
        mov cx, tamanho
        mov bx, e
        dec bx
        sub cx, bx
        xor si, si
        xor ax, ax
        mov si, e
        tira:
            mov al, vetor[si]
            dec si
            mov vetor[si], al
            add si, 2
            loop tira
        mov bx, tamanho
        dec bx
        mov vetor[bx], 0


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
    ; procura proc
    ;     cld 
    ;     procurando:
    ;         scasb
    ;         jnz coloca
    ;         jmp pula 
    ;         coloca:
    ;             push ax 
    ;             lodsb
    ;             stosb
    ;             dec di
    ;             pop ax
    ;         pula:
    ;             loop procurando   
    ;     ret            
    ; procura endp
end main