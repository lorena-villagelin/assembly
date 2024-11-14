title projeto1
.model small
.stack 0100h

pula_linha MACRO ;macro para pular linhas
    push ax
    push dx
    mov ah,02
    mov dl,10
    int 21h
    pop dx
    pop ax
ENDM

espaco MACRO ;macro para dar espaço entre caracteres
    push ax
    push dx
    mov ah,02
    mov dl,' '
    int 21h
    pop dx
    pop ax
ENDM

resultado macro numero ;macro para impressao de strings
    push ax
    push dx
    mov ah, 9
    lea dx, numero
    int 21h
    pop dx
    pop ax
ENDM



.data
       
    l0 db '-----------------------------$' ;abertura do jogo
    l1 db ' $'
    l2 db '=======BATALHA NAVAL=========$'
    l3 db ' $'
    l4 db '-----------------------------$'

    m_embarcacoes db 20 DUP (0) ;matriz auxiliar
                  db 20 DUP (0) 
                  db 20 DUP (0)
                  db 20 DUP (0)
                  db 20 DUP (0)
                  db 20 DUP (0)
                  db 20 DUP (0)
                  db 20 DUP (0)
                  db 20 DUP (0)  
                  db 20 DUP (0)
                  db 20 DUP (0) 
                  db 20 DUP (0)
                  db 20 DUP (0)  
                  db 20 DUP (0)
                  db 20 DUP (0)
                  db 20 DUP (0)
                  db 20 DUP (0)
                  db 20 DUP (0)
                  db 20 DUP (0)
                  db 20 DUP (0)

    m_embarcacoes1 db  20 DUP (0) ;tabuleiro 1
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

    m_embarcacoes2 db  20 DUP (0) ;tabuleiro 2
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

    m_embarcacoes3 db  20 DUP (0) ;tabuleiro 3
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

    m_embarcacoes4 db  20 DUP (0) ;tabuleiro 4
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

    m_tiros db  20 DUP ('~') ;matriz de impressão
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')
            db  20 DUP ('~')

    s_escolha_tabuleiro db 10, 13, 'COM QUAL TABULEIRO VOCE DESEJA JOGAR? [1 - 4]: $'
    s_indisponivel db 10, 13, 'ESTE TABULEIRO ESTA INDISPONIVEL, ESCOLHA OUTRO: $'

    s_digite_linha db 10, 13, 'ESCOLHA UMA LINHA PARA ATIRAR [a - t]: $'
    s_digite_coluna db 10, 13, 'ESCOLHA UMA COLUNA PARA ATIRAR [1 - 20]: $'
    s_digite_novamente db 10, 13, 'ESSA POSICAO NAO ESTA NO INTERVALO, DIGITE OUTRA: $'

    s_arcertou_encouracado db 10, 13, 'VOCE ACERTOU O ENCOURACADO!!!$'
    s_arcertou_fragata db 10, 13, 'VOCE ACERTOU A FRAGATA!!!$'
    s_arcertou_subma db 10, 13, 'VOCE ACERTOU UM SUBMARINO!!!$'
    s_arcertou_hidroaviao db 10, 13, 'VOCE ACERTOU UM HIDROAVIAO!!!$'
    s_errou db 10, 13, 'VOCE NAO ACERTOU NENHUMA EMBARCACAO :($'

    s_afundou_encouracado db 10, 13, 'VOCE AFUNDOU O ENCOURACADO.$'
    s_afundou_fragata db 10, 13, 'VOCE AFUNDOU A FRAGATA.$'
    s_afundou_submarino db 10, 13, 'VOCE AFUNDOU UM SUBMARINO.$'
    s_afundou_hidroaviao db 10, 13, 'VOCE AFUNDOU UM HIDROAVIAO.$'
    s_outra_posicao db 10,13, 'VOCE JA ATIROU NESSA POSICAO, TENTE OUTRA: $'

    s_venceu db 10, 13, 'FIM DE JOGO! VOCE AFUNDOU TODAS AS EMBARCACOES :D$'
    s_continua db 10, 13, 'ATIRAR NOVAMENTE? [s|n]$'
    s_menu db 10, 13, 'DESEJA VER SUA QUANTIDADE DE ACERTOS? [s|n]: $'

    s_menu_encouracado db 10, 13, '  |   ENCOURACADO: $'
    s_menu_fragata db 10, 13, '  |   FRAGATA: $'
    s_menu_submarino_1 db 10, 13, '  |   SUBMARINO 1: $'
    s_menu_submarino_2 db 10, 13, '  |   SUBMARINO 2: $'
    s_menu_hidroaviao_1 db 10, 13, '  |   HIDROAVIAO 1: $'
    s_menu_hidroaviao_2 db 10, 13, '  |   HIDROAVIAO 2: $'
    s_menu_total db 10, 13, '  |   TOTAL: $'

    v_acertos db 6 dup (0)
    v_contagem db 0
    v_espaco db 23 dup (' ')


.code
    main proc 

        mov ax, @data
        mov ds, ax

        mov ah, 00h ;impressão inicial do jogo
        mov al, 3
        int 10h

        pula_linha
        pula_linha
        pula_linha 
        
        espaco
        espaco 
        espaco
        espaco
        espaco 
        espaco
        espaco
        espaco 
        espaco
        espaco
        espaco 
        espaco
        espaco
        espaco 
        espaco
        espaco
        espaco 
        espaco
        espaco 
        espaco
        espaco
        espaco 
        espaco
        mov ah,09 
        lea dx,l2
        int 21h 

        pula_linha
        pula_linha
        pula_linha
        pula_linha

        ;call p_selecao_tabuleiros
    
        xor bx, bx
        mov di, 20
        jmp r_selecao
        
    r_tabuleiros: ;caso o tabuleiro (que sera selecionado posteriormente) seja invalido
        mov ah, 09h
        lea dx, s_indisponivel
        int 21h
        pula_linha

        r_selecao: ;seleçao do tabuleiro
            mov ah, 9
            lea dx, s_escolha_tabuleiro
            int 21h
            mov ah, 1
            int 21h
            and al, 0Fh
            cmp al, 1
            jb r_tabuleiros
            cmp al, 4
            ja r_tabuleiros
            cmp al, 1
            je r_tabuleiro_1
            cmp al, 2
            je r_tabuleiro_2
            cmp al, 3 
            je r_tabuleiro_3
            cmp al, 4
            je r_tabuleiro_4
        
    r_tabuleiro_1: 
        mov cx, 20
        xor si, si
    r_tranforma_tab_1:
        mov al, m_embarcacoes1[bx][si]
        mov m_embarcacoes[bx][si], al
        inc si
    loop r_tranforma_tab_1
        add bx, 20
        dec di
        jnz r_tabuleiro_1
        jmp r_jogo

    r_tabuleiro_2:
        mov cx, 20
        xor si, si
    r_tranforma_tab_2:
        mov al, m_embarcacoes2[bx][si]
        mov m_embarcacoes[bx][si], al
        inc si
    loop r_tranforma_tab_2
        add bx, 20
        dec di
        jnz r_tabuleiro_2
        jmp r_jogo

    r_tabuleiro_3:
        mov cx, 20
        xor si, si
    r_tranforma_tab_3:
        mov al, m_embarcacoes3[bx][si]
        mov m_embarcacoes[bx][si], al
        inc si
    loop r_tranforma_tab_3
        add bx, 20
        dec di
        jnz r_tabuleiro_3
        jmp r_jogo

    r_tabuleiro_4:
        mov cx, 20
        xor si, si
    r_tranforma_tab_4:
        mov al, m_embarcacoes4[bx][si]
        mov m_embarcacoes[bx][si], al
        inc si
    loop r_tranforma_tab_4
        add bx, 20
        dec di
        jnz r_tabuleiro_4

    r_jogo:
        mov ah,00h
        mov al,3
        int 10h 
        mov ah, 9
        lea dx, s_digite_linha
        int 21h
        xor bx, bx

    ;leitura decimal de linha
    r_linha_leitura:
        mov ah,1
        int 21h
        sub al, 60h
        xor ah, ah
        mov bx, ax
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
        jbe r_confere_se_ja
        mov ah, 9
        lea dx, s_digite_novamente
        int 21h
        xor bx, bx
        jmp r_coluna_leitura

    r_confere_se_ja: 
        mov si, bx                              ;move a coluna para si 
        pop bx  
        cmp m_tiros[bx][si], '~'
        jne r_continua2
        jmp r_coluna_leitura_fim

    r_continua2: 
        mov ah,09 
        lea dx, s_outra_posicao
        int 21h 
        jmp r_jogo
    
        
    ;confere se a posição digitada contém uma embarcação
    r_coluna_leitura_fim:
                                    ;desempilha a linha 
        mov ch, m_embarcacoes[bx][si]               
        cmp ch, 1                      
        je r_acertou_encouracado
        cmp ch, 2
        je r_afundou_fragata
        cmp ch, 3
        je r_afundou_submarino_1
        cmp ch, 4
        je r_afundou_submarino_2
        cmp ch, 5
        je r_afundou_hidroaviao_1
        cmp ch, 6
        je r_afundou_hidroaviao_2
        call p_erro
        jmp r_impressao_matriz

        
    ;caso tenha acertado um encouracado
    r_acertou_encouracado:     
        call p_encouracado
        cmp cl, 4
        jne r_impressao_matriz
        resultado s_afundou_encouracado
        jmp r_impressao_matriz

    ;caso tenha acertado um fragata
    r_afundou_fragata:
        call p_fragata
        cmp cl, 3
        jne r_impressao_matriz
        resultado s_afundou_fragata
        jmp r_impressao_matriz

    ;caso tenha acertado um dos submarinos
    r_afundou_submarino_1:
        call p_submarino_1
        cmp cl, 2
        jne r_impressao_matriz
        resultado s_afundou_submarino
        jmp r_impressao_matriz

    ;caso tenha acertado um dos submarinos
    r_afundou_submarino_2:
        call p_submarino_2
        cmp cl, 4
        jne r_impressao_matriz
        resultado s_afundou_submarino
        jmp r_impressao_matriz

    ;caso tenha acertado um dos hidroaviões
    r_afundou_hidroaviao_1:
        call p_hidroaviao_1
        cmp cl, 4
        jne r_impressao_matriz
        resultado s_afundou_hidroaviao
        jmp r_impressao_matriz

    ;caso tenha acertado um dos hidroaviões
    r_afundou_hidroaviao_2:
        call p_hidroaviao_2
        cmp cl, 4
        jne r_impressao_matriz
        resultado s_afundou_hidroaviao

    ;impressão da matriz atualizada, com os tiros dados

    r_impressao_matriz:
        pula_linha
        xor al, al
        mov di,15      ; imprime do 1 ao 15
        espaco
        espaco
        espaco
    r_numero_unico:
        xor ah, ah
        inc ax
        and al, 0Fh
        cmp ax, 10
        jae r_indice_coluna_1
        espaco
    r_indice_coluna_1:
        mov bx, 10
        xor cx, cx
        push ax
    r_indice_coluna_2:
        xor dx, dx
        div bx
        push dx
        inc cx
        cmp ax, 0
        je r_imprime_indice_coluna_1
    jmp r_indice_coluna_2
    r_imprime_indice_coluna_1:
        mov ah, 2
        pop dx
        or dl, 30h
        int 21h
    loop r_imprime_indice_coluna_1
        espaco
        dec di
        pop ax
        jnz r_numero_unico
    mov di, 5        ; imprime do 16 ao 20
    r_indice_coluna_3:
        xor ah, ah
        inc ax
        mov bx, 10
        xor cx, cx
        push ax
    r_indice_coluna_4:
        xor dx, dx
        div bx
        push dx
        inc cx
        cmp ax, 0
        je r_imprime_indice_coluna_2
    jmp r_indice_coluna_4
    r_imprime_indice_coluna_2:
        mov ah, 2
        pop dx
        or dl, 30h
        int 21h
    loop r_imprime_indice_coluna_2
        espaco
        dec di
        pop ax
        jnz r_indice_coluna_3

        xor bx, bx
        mov di, 20
        pula_linha
        pula_linha

        xor bx, bx
        mov di, 20
        mov al, 97

    r_linha_impressao:
        xor si, si
        mov cx, 20
        mov ah, 2
        mov dl, al
        int 21h
        push ax
        espaco
        espaco
        espaco

    r_coluna_impressao:
        mov ah, 2
        mov dl, m_tiros[bx][si]
        or dl, 30h
        int 21h
        espaco
        espaco
        inc si
    loop r_coluna_impressao
        pula_linha
        add bx, 20
        pop ax
        inc al
        dec di
    jnz r_linha_impressao
    cmp v_acertos[6],19
    je fim_do_jogo 
    jmp r_continua

    fim_do_jogo: 
        mov ah,9 
        lea dx, s_venceu
        int 21h 
        jmp r_fim

    r_continua:
        mov ah, 09h
        lea dx, s_menu
        int 21h
        mov ah, 01h
        int 21h
        cmp al, 's'
        je r_imprime_menu
        cmp al, 'S'
        jne r_continuar_jogo
    r_imprime_menu:
        call p_menu
    r_continuar_jogo:
        mov ah, 9
        lea dx, s_continua       
        int 21h
        mov ah, 1
        int 21h
        cmp al, 's'
        je r_volta_jogo
        cmp al, 'S'
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
    mov m_tiros[bx][si], 'x'
    ret
p_erro endp
p_menu proc

    mov ah, 09h
    lea dx, s_menu_encouracado
    int 21h
    mov ah, 02h
    mov dl, v_acertos[0]
    or dl, 30h
    int 21h
    mov dl, '/'
    int 21h
    mov dl, '4'
    int 21h

    mov ah, 09h
    lea dx, s_menu_fragata
    int 21h
    mov ah, 02h
    mov dl, v_acertos[1]
    or dl, 30h
    int 21h
    mov dl, '/'
    int 21h
    mov dl, '3'
    int 21h

    mov ah, 09h
    lea dx, s_menu_submarino_1
    int 21h
    mov ah, 02h
    mov dl, v_acertos[2]
    or dl, 30h
    int 21h
    mov dl, '/'
    int 21h
    mov dl, '2'
    int 21h

    mov ah, 09h
    lea dx, s_menu_submarino_2
    int 21h
    mov ah, 02h
    mov dl, v_acertos[3]
    or dl, 30h
    int 21h
    mov dl, '/'
    int 21h
    mov dl, '2'
    int 21h

    mov ah, 09h
    lea dx, s_menu_hidroaviao_1
    int 21h
    mov ah, 02h
    mov dl, v_acertos[4]
    or dl, 30h
    int 21h
    mov dl, '/'
    int 21h
    mov dl, '4'
    int 21h

    mov ah, 09h
    lea dx, s_menu_hidroaviao_2
    int 21h
    mov ah, 02h
    mov dl, v_acertos[5]
    or dl, 30h
    int 21h
    mov dl, '/'
    int 21h
    mov dl, '4'
    int 21h

    mov ah, 09h
    lea dx, s_menu_total
    int 21h
    mov ah, 02h
    mov dl, v_acertos[6]
    or dl, 30h
    int 21h
    mov dl, '/'
    int 21h
    mov dl, '1'
    int 21h
    mov dl, '9'
    int 21h
    
    ret
p_menu endp
end main