;Faça um programa que rotacione um vetor de 5 elementos k vezes.

title exercicio4
.model small
.stack 0100h
.data
    vetor db 1, 2, 3, 4, 5
    tamanho db 5
    vezes db 3
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax


        cld
        xor si, si
        xor di, di 
        add di, 3
        lea si, vetor 
        lea di, vetor
        desloca:
            lodsb
            stosb
            inc si 
            inc di
            loop desloca


            

        ; lodsb ;al=5
        ; xor di, di ;di=0
        ; xor bx, bx ;bx=0
        ; mov bl, al  ;bl=5
        ; lea di, vetor
        ; xor cx, cx  
        ; mov cl, tamanho
        
        ; repe movsb
        ; mov vetor[di], bl

        ; xor cx, cx
        ; mov cl, tamanho
        ; lea si, vetor+4 ;aponta para 5
        ; call move

        ; xor cx, cx 
        ; mov cl, tamanho
        ; lea si, rotacao

        xor cx, cx
        mov cl, tamanho
        lea si, vetor
        call impressao

        mov ah, 4ch
        int 21h
    main endp

    ; move proc
    ;     push ax
    ;     push di
    ;     push dx
    ;     std
    ;     lodsb ;al=5
    ;     xor bx, bx ;bx=0
    ;     mov bl, al ;bl=5
    ;     xor di, di ;di=0
    ;     mov dx, cx
    ;     mov vetor[di], bl ; 5, 2, 3, 4, 5  
    ;     gira:
            
    ;         loop gira


    ;     pop dx
    ;     pop di
    ;     pop ax 
    ;     ret
    ; move endp

    ; rotacao proc
    ;     push ax
    ;     push di
    ;     cld
    ;     xor di, di
    ;     rodando:
    ;         lodsb
    ;         add di, 2
    ;         mov vetor[di],  al
    ;         loop rodando
    ;     pop di
    ;     pop ax
    ;     ret 
    ; rotacao endp

    impressao proc 
        push ax
        push dx
        cld
        mov ah, 02h
        imprimindo:
            lodsb
            mov dl, al
            or dl, 30h
            int 21h
            loop imprimindo
        pop dx
        pop ax
        ret
    impressao endp
end main