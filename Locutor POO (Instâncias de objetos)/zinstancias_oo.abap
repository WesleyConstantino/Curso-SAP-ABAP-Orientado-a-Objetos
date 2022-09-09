REPORT zinstancias_oo.

CLASS lcl_loucutor DEFINITION.
  PUBLIC SECTION.
    DATA: 
      nome TYPE string,
      idade TYPE i,
      ultima_mensagem TYPE string.

   METHODS:
     falar IMPORTING iv_mensagem TYPE string.
ENDCLASS.

"Instanciando o objeto o_loucutor 
START-OF-SELECTION.
    DATA: o_loucutor TYPE REF TO lcl_loucutor.

"aqui é criado o objeto o_loucutor 
"ele armazena cada loucutor da lista lcl_loucutor e pode imprimir em tela cada um individualmente
"também pode ser criado como CREATE OBJECT o_loucutor, dá no mesmo
    o_loucutor = NEW lcl_loucutor().

"a linha a baixo quer dizer: Se o_loucutor estiver criado...
    IF o_loucutor IS INITIAL.
"imprimimos essas mensagens em tela para saber se o objeto foi ou não criado
      WRITE:/ 'Objeto criado'.
    ELSE.
      WRITE:/ 'Objeto não criado'.
    ENDIF.

'implememtação do método
CLASS o_loucutor IMPLEMENTATION.
  METHOD falar.
  ENDMETHOD.
ENDCLASS.
