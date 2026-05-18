CLASS zcl_170422031_rest_client_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_170422031_rest_client_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data(lo_rest_client) = new lcl_rest_client(  io_out = out ).
  data(local_service) = new lcl_eml_service( io_out = out ).

  data(ls_user) = lo_rest_client->get_user_from_rest(  iv_username = 'z_karayigit_3' ).
  out->write( ls_user ).

  local_service->save_user( is_user = ls_user ).

  ENDMETHOD.
ENDCLASS.
