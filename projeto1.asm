title projeto1
.model small
.stack 0100h
pula_linha MACRO        
    push ax
    push dx
    mov ah,02
    mov dl,10
    int 21h
    pop dx
    pop ax
ENDM
espaco MACRO
    push ax
    push dx
    mov ah,02
    mov dl,' '
    int 21h
    pop dx
    pop ax
ENDM
resultado macro numero
    push ax
    push dx
    mov ah, 9
    lea dx, numero
    int 21h
    pop dx
    pop ax
ENDM
.data
    m_embarcacoes db  20 DUP (0)
                  db  0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
                  db  20 DUP (0)
                  db  20 DUP (0)
                  db  20 DUP (0)
                  db  0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0
                  db  20 DUP (0)
                  db  20 DUP (0)
                  db  0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                  db  20 DUP (0)
                  db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0  
                  db  0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                  db  0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                  db  0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                  db  20 DUP (0)
                  db  20 DUP (0)
                  db  6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                  db  6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                  db  6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                  db  20 DUP (0)

    m_tiros db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)
            db  20 DUP (0)

    
    l_digite_linha db 10, 13, 'Informe a linha desejada para atirar, entre 1 e 20: $'
    l_digite_coluna db 10, 13, 'Informe a coluna desejada para atirar, entre 1 e 20: $'
    l_digite_novamente db 10, 13, 'Esse nao esta no intervalo, digite novamente: $'
    l_arcertou_encouracado db 10, 13, 'Voce acertou um encouracado!!!$'
    l_arcertou_fragata db 10, 13, 'Voce acertou uma fragata!!!$'
    l_arcertou_subma db 10, 13, 'Voce acertou um submarino!!!$'
    l_arcertou_hidroaviao db 10, 13, 'Voce acertou um hidroaviao!!!$'
    l_errou db 10, 13, 'Voce nao acertou nenhuma embarcacao!!!$'
    l_continua db 10, 13, 'Deseja atirar novamente? (s/n)$'
    l_eliminou_encouracado db 10, 13, 'Voce eliminou a embarcacao de encouracado.$'
    l_eliminou_fragata db 10, 13, 'Voce eliminou a embarcacao de fragata.$'
    l_eliminou_submarino db 10, 13, 'Voce eliminou uma embarcacao de submarino.$'
    l_eliminou_hidroaviao db 10, 13, 'Voce eliminou uma embarcacao de hidroaviao.$'
    v_acertos db 6 dup (0)

.code
main proc 
    mov ax, @data
    mov ds, ax

r_jogo:
    mov ah, 9
    lea dx, l_digite_linha
    int 21h
    xor bx, bx

;leitura decimal de linha
r_linha_leitura:
    mov ax, 10               
    mul bx
    push ax
    mov ah,1
    int 21h
    and al, 0Fh
    cmp al, 13
    je r_confere_linha
    xor ah, ah
    pop bx
    add bx, ax
    sub bx, 1
jmp r_linha_leitura

;confere se a linha digitada está dentro do intervalo 
r_confere_linha:
    cmp bx, 19
    jbe r_linha_leitura_fim
    mov ah, 9
    lea dx, l_digite_novamente
    int 21h
    xor bx, bx
    jmp r_linha_leitura

;inicialização de valor para leitura da coluna
r_linha_leitura_fim:
    mov ax, 20
    mul bx
    mov bx, ax
    push bx
    mov ah, 9
    lea dx, l_digite_coluna
    int 21h
    xor bx,bx

;leitura decimal de coluna
r_coluna_leitura:
    mov ax, 10
    mul bx
    push ax
    mov ah,1
    int 21h
    and al, 0Fh
    cmp al, 13
    je r_confere_coluna
    xor ah, ah
    pop bx
    add bx, ax
    sub bx, 1
jmp r_coluna_leitura

;confere se a coluna digitada está dentro do intervalo 
r_confere_coluna:
    cmp bx, 19
    jbe r_coluna_leitura_fim
    mov ah, 9
    lea dx, l_digite_novamente
    int 21h
    xor bx, bx
    jmp r_coluna_leitura

;confere se a posição digitada contém uma embarcação
r_coluna_leitura_fim:
    mov si, bx                  
    pop ax
    pop bx
    mov ch, m_embarcacoes[bx][si]
    cmp ch, 1                      
    je r_acertou_encouracado
    cmp ch, 2
    je r_eliminou_fragata
    cmp ch, 3
    je r_eliminou_submarino_1
    cmp ch, 4
    je r_eliminou_submarino_2
    cmp ch, 5
    je r_eliminou_hidroaviao_1
    cmp ch, 6
    je r_eliminou_hidroaviao_2
    call p_erro
    jmp r_saida

;caso tenha acertado um encouracado
r_acertou_encouracado:     
    call p_encouracado
    cmp cl, 4
    jne r_saida
    resultado l_eliminou_encouracado
    jmp r_saida

;caso tenha acertado um fragata
r_eliminou_fragata:
    call p_fragata
    cmp cl, 3
    jne r_saida
    resultado l_eliminou_fragata
    jmp r_saida

;caso tenha acertado um dos submarinos
r_eliminou_submarino_1:
    call p_submarino_1
    cmp cl, 2
    jne r_saida
    resultado l_eliminou_submarino
    jmp r_saida

;caso tenha acertado um dos submarinos
r_eliminou_submarino_2:
    call p_submarino_2
    cmp cl, 4
    jne r_saida
    resultado l_eliminou_submarino
    jmp r_saida

;caso tenha acertado um dos hidroaviões
r_eliminou_hidroaviao_1:
    call p_hidroaviao_1
    cmp cl, 4
    jne r_saida
    resultado l_eliminou_hidroaviao
    jmp r_saida

;caso tenha acertado um dos hidroaviões
r_eliminou_hidroaviao_2:
    call p_hidroaviao_2
    cmp cl, 4
    jne r_saida
    resultado l_eliminou_hidroaviao

;impressão da matriz atualizada, com os tiros dados
r_saida:
    pula_linha
    xor bx, bx
    mov di, 20
r_linha_impressao:
    xor si, si
    mov cx, 20
r_coluna_impressao:
    mov ah, 2
    mov dl, m_tiros[bx][si]
    or dl, 30h
    int 21h
    espaco
    inc si
loop r_coluna_impressao
    pula_linha
    add bx, 20
    dec di
jnz r_linha_impressao

;verifica se quer continuar o programa 
r_continua:
    mov ah, 9
    lea dx, l_continua       
    int 21h
    mov ah, 1
    int 21h
    cmp al, 's'
    je r_volta_jogo
    jmp r_fim
r_volta_jogo:
    jmp r_jogo

r_fim:
;    pula_linha
;    xor bx, bx
;    mov di, 20
;f1:
;    xor si, si
;   mov cx, 20
;f2:
;    mov ah, 2
;    mov dl, m_tiros[bx][si]
;    or dl, 30h
;    int 21h
;    inc si
;loop f2
;    pula_linha
;   add bx, 20
;    dec di
;jnz f1
    mov ah, 4ch
    int 21h
main endp

p_encouracado proc
    mov m_tiros[bx][si], 1
    mov ah, 9
    lea dx, l_arcertou_encouracado
    int 21h
    xor di, di
    inc v_acertos[di]
    mov cl, v_acertos[di]
    ret
p_encouracado endp

p_fragata proc 
    mov m_tiros[bx][si], 2
    mov ah, 9
    lea dx, l_arcertou_fragata
    int 21h
    mov di, 1
    inc v_acertos[di]
    mov cl, v_acertos[di]
    ret
p_fragata  endp
p_submarino_1 proc
    mov m_tiros[bx][si], 3
    mov ah, 9
    lea dx, l_arcertou_subma
    int 21h
    mov di, 2
    inc v_acertos[di]
    mov cl, v_acertos[di]
    ret
p_submarino_1 endp
p_submarino_2 proc 
    mov m_tiros[bx][si], 4
    mov ah, 9
    lea dx, l_arcertou_subma
    int 21h
    mov di, 3
    inc v_acertos[di]
    mov cl, v_acertos[di]
    ret
p_submarino_2 endp
p_hidroaviao_1 proc
    mov m_tiros[bx][si], 5
    mov ah, 9
    lea dx, l_arcertou_hidroaviao
    int 21h
    mov di, 4
    inc v_acertos[di]
    mov cl, v_acertos[di]
    ret
p_hidroaviao_1 endp
p_hidroaviao_2 proc 
    mov m_tiros[bx][si], 6
    mov ah, 9
    lea dx, l_arcertou_hidroaviao
    int 21h
    mov di, 5
    inc v_acertos[di]
    mov cl, v_acertos[di]
    ret 
p_hidroaviao_2 endp
p_erro proc
    mov ah, 9                       ;se nao move x 
    lea dx, l_errou
    int 21h
    mov m_tiros[bx][si], 'X'
    ret
p_erro endp
end main

    

;melhorar escritas e detalhes 