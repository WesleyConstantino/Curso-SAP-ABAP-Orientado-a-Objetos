REPORT zinterface_oo.

INTERFACE lif_controle. "Declaração da interface
    METHODS:
     receber_comando IMPORTING iv_comando TYPE string,
     executar_comando.
ENDINTERFACE.

CLASS lcl_controle_video_game DEFINITION ABSTRACT. "ABSTRACT indica classe abistrata
  PUBLIC SECTION.
    METHODS: 
       constructor.
ENDCLASS.

CLASS lcl_controle_video_game IMPLEMENTATION. "Aqui implementamos o(s) método(s) da classe lcl_controle_video_game
    METHOD constructor.
    ENDMETHOD.
ENDCLASS.
