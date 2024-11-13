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

    m_embarcacoes1 db  20 DUP (0)
                   db  20 DUP (0)
                   db  0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0
                   db  0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
                   db  0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 0, 0, 0
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0  
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1
                   db  20 DUP (0)
                   db  20 DUP (0)

    m_embarcacoes2 db  20 DUP (0)
                   db  20 DUP (0)
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0
                   db  0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  0, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 6, 0, 0, 0, 0
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0
                   db  0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  20 DUP (0)

    m_embarcacoes3 db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 0
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0
                   db  2, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                   db  20 DUP (0)
                   db  20 DUP (0)
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0 

    m_embarcacoes4 db  20 DUP (0)
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

    m_tiros db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")
            db  20 DUP ("~")

    escolha_tabuleiro db 10, 13, 'Qual tabuleiro voce deseja jogar? Ha 4 disponiveis.$'
    s_digite_linha db 10, 13, 'Informe a linha desejada para atirar, entre 1 e 20: $'
    s_digite_coluna db 10, 13, 'Informe a coluna desejada para atirar, entre 1 e 20: $'
    s_digite_novamente db 10, 13, 'Esse nao esta no intervalo, digite novamente: $'
    s_arcertou_encouracado db 10, 13, 'Voce acertou um encouracado!!!$'
    s_arcertou_fragata db 10, 13, 'Voce acertou uma fragata!!!$'
    s_arcertou_subma db 10, 13, 'Voce acertou um submarino!!!$'
    s_arcertou_hidroaviao db 10, 13, 'Voce acertou um hidroaviao!!!$'
    s_errou db 10, 13, 'Voce nao acertou nenhuma embarcacao!!!$'
    s_continua db 10, 13, 'Deseja atirar novamente? (s/n)$'
    s_eliminou_encouracado db 10, 13, 'Voce eliminou a embarcacao de encouracado.$'
    s_eliminou_fragata db 10, 13, 'Voce eliminou a embarcacao de fragata.$'
    s_eliminou_submarino db 10, 13, 'Voce eliminou uma embarcacao de submarino.$'
    s_eliminou_hidroaviao db 10, 13, 'Voce eliminou uma embarcacao de hidroaviao.$'
    v_acertos db 6 dup (0)
    v_contagem db 0
    s_essaposicaojafoiacertada db 10,13, 'Essa posicao ja foi acertada :($'
    s_venceu db 10,13, 'Todas embarcacoes foram afundadas, voce venceu!!!!$'


.code
main proc 
    mov ax, @data
    mov ds, ax

    xor bx, bx
    mov di, 20

tabuleiros:
    mov ah, 9
    lea dx, escolha_tabuleiro
    int 21h
    mov ah, 1
    int 21h
    and al, 0Fh
    cmp al, 1
    jb tabuleiros
    cmp al, 4
    ja tabuleiros
    cmp al, 1
    je tabuleiro1
    cmp al, 2
    je tabuleiro2
    cmp al, 3 
    je tabuleiro3
    cmp al, 4
    je tabuleiro4

tabuleiro1:
    mov cx, 20
    xor si, si
move1:
    mov al, m_embarcacoes1[bx][si]
    mov m_embarcacoes[bx][si], al
    inc si
loop move1
    add bx, 20
    dec di
    jnz tabuleiro1
    jmp r_jogo
tabuleiro2:
    mov cx, 20
    xor si, si
move2:
    mov al, m_embarcacoes2[bx][si]
    mov m_embarcacoes[bx][si], al
    inc si
loop move2
    add bx, 20
    dec di
    jnz tabuleiro2
    jmp r_jogo

tabuleiro3:
    mov cx, 20
    xor si, si
move3:
    mov al, m_embarcacoes3[bx][si]
    mov m_embarcacoes[bx][si], al
    inc si
loop move3
    add bx, 20
    dec di
    jnz tabuleiro3
    jmp r_jogo

tabuleiro4:
    mov cx, 20
    xor si, si
move4:
    mov al, m_embarcacoes4[bx][si]
    mov m_embarcacoes[bx][si], al
    inc si
loop move4
    add bx, 20
    dec di
    jnz tabuleiro4

r_jogo:
    mov ah, 9
    lea dx, s_digite_linha
    int 21h
    xor bx, bx

;leitura decimal de linha
r_linha_leitura:
    mov ah,1
    int 21h
    cmp al,13
    je r_confere_linha
    and al,0Fh
    xor ah,ah
    push ax
    mov ax,10
    mul bx
    pop bx
    add bx,ax
jmp r_linha_leitura
;confere se a linha digitada está dentro do intervalo 
r_confere_linha:
    sub bx, 1
    cmp bx, 19
    jbe r_linha_leitura_fim
    mov ah, 9
    lea dx, s_digite_novamente
    int 21h
    xor bx, bx
    jmp r_linha_leitura

;inicialização de valor para leitura da coluna
r_linha_leitura_fim:
    mov ax, 20
    mul bx
    mov bx, ax
    push bx                             ;empilha a linha 
    mov ah, 9
    lea dx, s_digite_coluna
    int 21h
    xor bx,bx

;leitura decimal de coluna
r_coluna_leitura:
    mov ah,1
    int 21h
    cmp al,13
    je r_confere_coluna
    and al,0Fh
    xor ah,ah
    push ax
    mov ax,10
    mul bx
    pop bx
    add bx,ax
jmp r_coluna_leitura
;confere se a coluna digitada está dentro do intervalo 
r_confere_coluna:
    sub bx, 1
    cmp bx, 19
    jbe confere_se_ja
    mov ah, 9
    lea dx, s_digite_novamente
    int 21h
    xor bx, bx
    jmp r_coluna_leitura

confere_se_ja: 
    mov si, bx                              ;move a coluna para si 
    pop bx  
    cmp m_tiros[bx][si], "~"
    jne r_continua2
    jmp r_coluna_leitura_fim

r_continua2: 
    mov ah,09 
    lea dx,s_essaposicaojafoiacertada
    int 21h 
    jmp r_jogo
  

;confere se a posição digitada contém uma embarcação
r_coluna_leitura_fim:
                                ;desempilha a linha 
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
    resultado s_eliminou_encouracado
    jmp r_saida

;caso tenha acertado um fragata
r_eliminou_fragata:
    call p_fragata
    cmp cl, 3
    jne r_saida
    resultado s_eliminou_fragata
    jmp r_saida

;caso tenha acertado um dos submarinos
r_eliminou_submarino_1:
    call p_submarino_1
    cmp cl, 2
    jne r_saida
    resultado s_eliminou_submarino
    jmp r_saida

;caso tenha acertado um dos submarinos
r_eliminou_submarino_2:
    call p_submarino_2
    cmp cl, 4
    jne r_saida
    resultado s_eliminou_submarino
    jmp r_saida

;caso tenha acertado um dos hidroaviões
r_eliminou_hidroaviao_1:
    call p_hidroaviao_1
    cmp cl, 4
    jne r_saida
    resultado s_eliminou_hidroaviao
    jmp r_saida

;caso tenha acertado um dos hidroaviões
r_eliminou_hidroaviao_2:
    call p_hidroaviao_2
    cmp cl, 4
    jne r_saida
    resultado s_eliminou_hidroaviao

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
cmp v_acertos[6],19
je fim_do_jogo 
jmp r_continua

fim_do_jogo: 
    mov ah,9 
    lea dx ,s_venceu
    int 21h 
    jmp r_fim

r_continua:
    mov ah, 9
    lea dx, s_continua       
    int 21h
    mov ah, 1
    int 21h
    cmp al, 's'
    je r_volta_jogo
    jmp r_fim
r_volta_jogo:
    jmp r_jogo

r_fim:
    mov ah, 4ch
    int 21h
main endp

p_encouracado proc
    mov m_tiros[bx][si], 1
    mov ah, 9
    lea dx, s_arcertou_encouracado
    int 21h
    xor di, di
    inc v_acertos[di]
    mov cl, v_acertos[di]
    inc v_acertos[6]            ; v_acertos[6] representa a soma de todos os acertos juntos, para saber se o usuário venceu
    ret
p_encouracado endp

p_fragata proc 
    mov m_tiros[bx][si], 2
    mov ah, 9
    lea dx, s_arcertou_fragata
    int 21h
    mov di, 1
    inc v_acertos[di]
    mov cl, v_acertos[di]
    inc v_acertos[6]
    ret
p_fragata  endp
p_submarino_1 proc
    mov m_tiros[bx][si], 3
    mov ah, 9
    lea dx, s_arcertou_subma
    int 21h
    mov di, 2
    inc v_acertos[di]
    mov cl, v_acertos[di]
    inc v_acertos[6]
    ret
p_submarino_1 endp
p_submarino_2 proc 
    mov m_tiros[bx][si], 4
    mov ah, 9
    lea dx, s_arcertou_subma
    int 21h
    mov di, 3
    inc v_acertos[di]
    mov cl, v_acertos[di]
    inc v_acertos[6]
    ret
p_submarino_2 endp
p_hidroaviao_1 proc
    mov m_tiros[bx][si], 5
    mov ah, 9
    lea dx, s_arcertou_hidroaviao
    int 21h
    mov di, 4
    inc v_acertos[di]
    mov cl, v_acertos[di]
    inc v_acertos[6]
    ret
p_hidroaviao_1 endp
p_hidroaviao_2 proc 
    mov m_tiros[bx][si], 6
    mov ah, 9
    lea dx, s_arcertou_hidroaviao
    int 21h
    mov di, 5
    inc v_acertos[di]
    mov cl, v_acertos[di]
    inc v_acertos[6]
    ret 
p_hidroaviao_2 endp
p_erro proc
    mov ah, 9                       ;se nao move x 
    lea dx, s_errou
    int 21h
    mov m_tiros[bx][si], "X"
    ret
p_erro endp
end main