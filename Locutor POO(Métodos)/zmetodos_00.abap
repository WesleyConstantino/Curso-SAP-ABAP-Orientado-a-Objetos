REPORT zmetodos_00.

CLASS lcl_loucutor DEFINITION.
  PUBLIC SECTION.
    DATA:
         v_nome TYPE string,
         v_idade TYPE i,
         v_ultima_mensagem TYPE string.

   CLASS-METHODS:
       _geral_loucutor IMPORTING iv_nome TYPE string
                                 iv_idade TYPE i OPITIONAL
                       EXPORTING eo_loucutor TYPE REF TO lcl_loucutor.

   METHODS:
       	constructor IMPORTING iv_nome TYPE string 
                              iv_idade TYPE i OPITIONAL,

        falar IMPORTING iv_mensagem TYPE string.

        possui_idade RETURNING VALUE(retorno) TYPE boolean.
ENDCLASS.
****************************************************************************

START-OF-SECTION.
  DATA: lo_loucutor1 TYPE REF TO lcl_loucutor,
        lo_loucutor2 TYPE REF TO lcl_loucutor.

  CREATE OBJECT lo_loucutor1
      EXPORTING
         iv_nome = 'Wesley'
         iv_idade = 25.


  CREATE OBJECT lo_loucutor2
      EXPORTING
         iv_nome = 'Maria'.

   lo_loucutor1=>falar( iv_mensagem = 'Olá, meu nome é Wesley.' ).
   lo_loucutor2=>falar( iv_mensagem = 'Olá, meu nome é Maria.' ).

   IF lo_loucutor1=>possui_idade( ) = abap_true.
      WRITE:/ 'Possuí idade.'.
   ELSE.
       WRITE:/ 'Não possuí idade.'.

   IF lo_loucutor2=>possui_idade( ) = abap_true.
      WRITE:/ 'Possuí idade.'.
   ELSE.
       WRITE:/ 'Não possuí idade.'.

****************************************************************************

CLASS lcl_loucutor IMPLEMENTATION.
  METHOD constructor.
     nome = iv_nome.
     idade = iv_idade.
  ENDMETHOD.

  METHOD falar.
      WRITE:/ 'O loucutor', nome COLOR COL_TOTAL, 'diz:', iv_mensagem COLOR COL_POSITIVE.
      ultima_mensagem = iv_mensagem.
  ENDMETHOD.

  METHOD possui_idade.
      IF idade IS INITIAL.
         retorno = abap_false.
      ELSE.
         retorno = abap_true.
      ENDIF.      
  ENDMETHOD.
ENDCLASS.



