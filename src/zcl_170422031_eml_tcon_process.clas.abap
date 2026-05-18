CLASS zcl_170422031_eml_tcon_process DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_170422031_EML_TCON_PROCESS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  lcl_connection_eml=>insert_data(  ).
  lcl_connection_eml=>delete_data(  ).
*  lcl_connection_eml=>update_data(  ).
*  lcl_connection_eml=>read_data(  ).

  out->write( 'CRUD operations completed.' ).
  ENDMETHOD.
ENDCLASS.
