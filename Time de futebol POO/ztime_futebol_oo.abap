REPORT ztime_futebol_oo.

"aqui informo que a classe lcl_jogador existe e adio sua definição
"isso é necessário aqui, pois o Abap faz a leitura de cima para baixo
"sendo assim, se uma classe referanciada dentro de outra ainda não tiver sido lida, o programa apresentará erros de compilação
CLASS lcl_jogador DEFINITION DEFERRED.
CLASS lcl_chuteira DEFINITION DEFERRED.
CLASS lcl_selecao DEFINITION DEFERRED.
CLASS lcl_campo DEFINITION DEFERRED.

"criação da classe
"a classe lcl_pessoa é uma classe genárica
CLASS lcl_pessoa DEFINITION.
"encapsulamento da classe podendo ser PUBLIC, PRIVATE ou PROTECTED
    PUBLIC SECTION.
"criação dos atributos da classe
    DATA: nome TYPE string,
          idade TYPE i,
          cor_racial TYPE string,
          estilo_cabelo TYPE string.

"declaração do método
     METHODS: falar.
ENDCLASS.

"a classe lcl_tecnico é uma classe filha da classe lcl_pessoa
"com INHERITING FROM <classe pai> informamos que essa é uma classe filha de outra
CLASS lcl_tecnico DEFINITION INHERITING FROM lcl_pessoa.
    PUBLIC SECTION.
      DATA: selecao TYPE REF TO lcl_selecao.   
ENDCLASS.

"a classe lcl_jogador é uma classe filha da classe lcl_pessoa
CLASS lcl_jogador DEFINITION INHERITING FROM lcl_pessoa.
    PUBLIC SECTION.
      DATA: numero TYPE i,
            posicao TYPE string,
            posse_bola TYPE boolean,
"informo que o jogador pertence a uma seleção através da variável selecao do tipo lcl_selecao
            selecao TYPE REF TO lcl_selecao, 
"temos TABLE OF (tabela de), pois o jogador pode ter várias chuteiras
            chuteira TYPE TABLE OF REF TO lcl_chuteira,
            campo TYPE REF TO lcl_campo.

     METHODS:
        chutar,
"IMPORTING passa um parâmetro ao método
        movimentar IMPORTING distancia TYPE p.
ENDCLASS.


CLASS lcl_chuteira DEFINITION.
    PUBLIC SECTION.
      DATA: tamanho TYPE i,
            marca TYPE string,
            tamanho_trava TYPE c,
            lado TYPE c.
ENDCLASS.


CLASS lcl_selecao DEFINITION.
    PUBLIC SECTION.
"cria uma variável de nome jogadores do tipo tabela, tendo como referência os jogadores criados na classe lcl_jogador
      DATA: jogadores TYPE TABLE OF REF TO lcl_jogador,
            tecnico TYPE REF TO lcl_tecnico.

"importação do objero jogador advindo da classe lcl_jogador
      METHODS: escalar_jogador IMPORTING jogador TYPE REF TO lcl_jogador.
ENDCLASS.


CLASS lcl_campo DEFINITION.
    PUBLIC SECTION.
      DATA: tipo_grama TYPE string,
            largura TYPE p,
            comprimento TYPE p,
            jogadores TYPE TABLE OF REF TO lcl_jogador.
ENDCLASS.


"implementação do método deve ser feita assim
CLASS lcl_pessoa IMPLEMENTATION.
     METHOD falar.
        "codificação aqui
     ENDMETHOD.
ENDCLASS.

CLASS lcl_jogador IMPLEMENTATION.
     METHOD chutar.
     ENDMETHOD.

     METHOD movimentar.
     ENDMETHOD.
ENDCLASS.


CLASS lcl_selecao IMPLEMENTATION.
     METHOD escalar_jogador.

     ENDMETHOD.
ENDCLASS.
