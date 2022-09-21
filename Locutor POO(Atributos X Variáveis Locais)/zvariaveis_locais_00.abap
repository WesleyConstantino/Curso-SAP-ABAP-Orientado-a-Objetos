REPORT zvariaveis_locais_00.

CLASS lcl_loucutor DEFINITION.
  PUBLIC SECTION.
    DATA:
         v_nome TYPE string,
         v_idade TYPE i,
         v_ultima_mensagem TYPE string.

   CLASS-METHODS:
       _geral_loucutor IMPORTING iv_nome TYPE string
                                 iv_idade TYPE i OPTIONAL
                       EXPORTING eo_loucutor TYPE REF TO lcl_loucutor.

   METHODS:
       	constructor IMPORTING iv_nome TYPE string 
                              iv_idade TYPE i OPTIONAL,

        falar IMPORTING iv_mensagem TYPE string OPTIONAL
                        iv_mensagens TYPE string_table OPTIONAL
                        iv_ultima_mensagem TYPE boolean
                        PREFERRED PARAMETER iv_mensagem, "PREFERRED PARAMETER é parâmetro preferido
        dizer_ultima_mensagem.
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
    
   lo_loucutor1=>dizer_ultima_mensagem( ).
 
   lo_loucutor1=>falar( 'Olá, meu nome é Wesley.' ).
   lo_loucutor2=>falar( 'Olá, meu nome é Maria.' ).


****************************************************************************

CLASS lcl_loucutor IMPLEMENTATION.
  METHOD constructor.
     nome = iv_nome.
     idade = iv_idade.
  ENDMETHOD.

  METHOD falar.

      IF iv_ultima_mensagem IS NOT SUPPLIED. "IS NOT SUPPLIED SIGNIFICA "se nã estiver vazio"
         WRITE:/ 'O loucutor', nome COLOR COL_TOTAL, 'diz:', iv_mensagem COLOR COL_POSITIVE.    
      ELSE.    
         WRITE:/ 'O loucutor', nome COLOR COL_TOTAL, 'diz novaente:', iv_mensagem COLOR COL_GROUP.   
      ENDIF.

      ultima_mensagem = iv_mensagem.
  ENDMETHOD.

  METHOD dizer_ultima_mensagem.
     DATA: ultima_mensagem TYPE string.
    
     me=>falar(
         iv_mensagem = me=>ultima_mensagem
         iv_ultima_mensagem = abap_true
     ).

  ENDMETHOD.
ENDCLASS.
