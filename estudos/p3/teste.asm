title comparacao vetores
.model small
.stack 0100h
.data
    v1 db 0, 9, 9, 8, 4, 3, 5
    v2 db 9, 9, 6, 2, 8, 3, 5
    msg db 10, 13, 'Quantidade de numeros em comum = $'
    msg2 db 10, 13, 'Numeros em comum = $'
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    cld
    mov bh, 7   ; contador de elementos no primeiro vetor
    xor bl,bl   
    xor si, si
move:
    mov cx, 7    ; contador de elementos que tem que comparar
    mov al, v1[si]          ; move elemento do primeiro vetor para al
    lea di, v2     ;aponta para o primeiro elemento do segundo vetor
verifica:
    scasb           ;escaneia
    jz igual        ; se ZF=1 pula para igual
loop verifica
    inc si      ; pula para a proxima posicao do vetor 1
    dec bh
    jnz move
jmp fim
igual:
    xor ah, ah
    push ax         ; empilha o elemento em comum
    inc si
    inc bl          ; incrementa no contador
    dec bh  
    jnz move

fim:
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov cx, bx
    mov ah, 2
    mov dl, bl
    or dl, 30h
    int 21h
    mov ah, 9
    lea dx, msg2
    int 21h
    mov ah, 2
imprime:
    pop dx
    or dl, 30h
    int 21h
loop imprime

    mov ah, 4ch
    int 21h
main endp
end main

    