CLASS zcl_170422031_select_cds DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS: get_results_from_cds
      IMPORTING carrier_id      TYPE /dmo/carrier_id
                connection_id   TYPE /dmo/connection_id
      EXPORTING airport_from_id TYPE /dmo/airport_from_id
                airport_to_id   TYPE /dmo/airport_to_id
                carrier_name TYPE /dmo/carrier_name
      RAISING   cx_abap_invalid_value.

ENDCLASS.



CLASS ZCL_170422031_SELECT_CDS IMPLEMENTATION.


  METHOD get_results_from_cds.

    SELECT SINGLE FROM /dmo/I_Connection
        FIELDS DepartureAirport ,DestinationAirport, \_Airline-Name
        WHERE AirlineID = @carrier_id AND ConnectionID = @connection_id
        INTO ( @airport_from_id, @airport_to_id, @carrier_name ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    DATA: lv_airport_from_id TYPE /DMO/airport_from_id,
          lv_airport_to_id   TYPE /dmo/airport_to_id,
          lv_carrier_id      TYPE /dmo/carrier_id,
          lv_connection_id   TYPE /dmo/connection_id,
          lv_carrier_name TYPe /dmo/carrier_name.


    lv_carrier_id = 'AA'.
    lv_connection_id = '0322'.

    TRY.
        get_results_from_cds( EXPORTING carrier_id = lv_carrier_id
                                         connection_id = lv_connection_id
                                IMPORTING airport_from_id = lv_airport_from_id
                                          airport_to_id = lv_airport_to_id
                                          carrier_name = lv_carrier_name ).

        out->write( |Airport from id is { lv_airport_from_id }, Airport to id is { lv_airport_to_id }, Carrier name is: {  lv_carrier_name }| ).
      CATCH cx_abap_invalid_value.
        out->write( |Selection returned no results.| ).
    ENDTRY.



* DATA

  ENDMETHOD.
ENDCLASS.
