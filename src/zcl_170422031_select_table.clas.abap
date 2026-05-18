CLASS zcl_170422031_select_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS: get_results_from_table
      IMPORTING carrier_id      TYPE /dmo/carrier_id
                connection_id   TYPE /dmo/connection_id
      EXPORTING airport_from_id TYPE /dmo/airport_from_id
                airport_to_id   TYPE /dmo/airport_to_id
      RAISING   cx_abap_invalid_value.

ENDCLASS.



CLASS ZCL_170422031_SELECT_TABLE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lv_airport_from_id TYPE /DMO/airport_from_id,
          lv_airport_to_id   TYPE /dmo/airport_to_id,
          lv_carrier_id      TYPE /dmo/carrier_id,
          lv_connection_id   TYPE /dmo/connection_id.


    lv_carrier_id = 'UA'.
    lv_connection_id = '059'.

    TRY.
        get_results_from_table( EXPORTING carrier_id = lv_carrier_id
                                         connection_id = lv_connection_id
                                IMPORTING airport_from_id = lv_airport_from_id
                                          airport_to_id = lv_airport_to_id ).

        out->write( |Airport from id is { lv_airport_from_id }, Airport to id is { lv_airport_to_id }| ).
      CATCH cx_abap_invalid_value.
        out->write( |Selection returned no results.| ).
    ENDTRY.



* DATA

  ENDMETHOD.


  METHOD get_results_from_table.

    SELECT SINGLE FROM /dmo/connection
        FIELDS airport_from_id, airport_to_id
        WHERE carrier_id = @carrier_id AND connection_id = @connection_id
        INTO ( @airport_from_id, @airport_to_id ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
