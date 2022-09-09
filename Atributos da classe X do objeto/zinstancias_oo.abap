REPORT zinstancias_oo.

CLASS lcl_loucutor DEFINITION.
  PUBLIC SECTION.
"CLASS-DATA: indica que a variável é da classe e não do objeto
    CLASS-DATA:
     _instancia TYPE REF TO lcl_loucutor.
"CLASS-METHODS: indica que o método é da classe e não do objeto
    CLASS-METHODS:
    _geerar_instancia RETURNING VALUE(instancia) TYPE REF TO lcl_loucutor.

"DATA: indica que a variável é do objeto e não da classe
    DATA: 
      nome TYPE string,
      idade TYPE i,
      ultima_mensagem TYPE string.
"METHODS: indica que o método é do objeto e não da classe
   METHODS:
     falar IMPORTING iv_mensagem TYPE string.
ENDCLASS.






"implememtação dos métodos da classe e objeto
"aqui ambos são implementados da mesma forma, o que muda é como declaramos os métodos na classe 
CLASS lcl_loucutor IMPLEMENTATION.
  METHOD falar.
  ENDMETHOD.

  METHOD _geerar_instancia.
  ENDMETHOD.
ENDCLASS.
