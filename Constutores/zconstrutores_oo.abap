REPORT zconstrutores_oo.

CLASS lcl_dominio DEFINITION.
  PUBLIC SECTION.

    DATA: 
      nome TYPE dd011-domname,
      tab-a TYPE TABLE OF dd07v,
      tab-b TYPE TABLE OF dd07v.

  CLASS-METHODS:
"construtor da classe
"aqui dizemos o que a classe faz ao ser acessada pela primeira vez 
    class_construtor.

   METHODS:
"criando o construtor do objeto lo_dominio_xfeld importando o iv_nome do tipo dd011-domname
     construtor IMPORTING iv_nome TYPE dd011-domname,
     resgatar_valores.
ENDCLASS.


START-OF-SELECTION.
     DATA: lo_dominio_xfeld TYPE REF TO lcl_dominio.

     CREATE OBJECT lo_dominio_xfeld.
       EXPORTING 
"aqui é atribuido o nome de iv_nome
         iv_nome = 'Wesley'.

"aqui não foi explicado, todo esse bloco até o ENDMETHOD
"*******************************************************
CLASS lcl_dominio IMPLEMENTATION.
  METHOD resgatar_valores.
    CALL FUNCTION 'DD_DOMA_GET'
      EXPORTING
        domain_ = name
      TABLES
         dd07v_tab_a = tab_a
         dd07v_tab_n = tab_b
       EXCEPTIONS
         illegal_value = 1
         op_failure = 2
         OTHERS = 3.

       IF sy-subrc <> 0.
          "Deu erro, mas não faça nada
       ENDIF.
  ENDMETHOD.
"*******************************************************

  METHOD construtor.
"transfere o valor de nome para iv_nome
    nome = iv_npme.
"nessa concatenação, no lugar de nome será imprimido Wesley
    WRITE:/ 'O domínio', nome, 'foi criado'.
  ENDMETHOD.

  METHOD class_construtor.
"essa mensagem é a primeira que aparece
    WRITE:/ 'Classe iniciada'.
  ENDMETHOD.   
ENDCLASS.
