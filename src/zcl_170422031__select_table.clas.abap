CLASS zcl_170422031__select_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_170422031__SELECT_TABLE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: name TYPE /dmo/carrier_name.
  SELECT SINGLE FROM /dmo/carrier
    FIELDS name
    WHERE carrier_id = 'SQ'
    INTO @name.
  out->write( |Carrier name is: { name }| ).
  ENDMETHOD.
ENDCLASS.
