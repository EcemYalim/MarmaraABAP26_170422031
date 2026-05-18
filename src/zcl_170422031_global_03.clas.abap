CLASS zcl_170422031_global_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.



    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_170422031_GLOBAL_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA carrier_id TYPE /dmo/carrier_id.
  DATA connection_id TYPE /dmo/connection_id.

  DATA connection TYPE REF TO lcl_connection.
  DATA connections TYPE TABLE OF REF TO lcl_connection.
  DATA: flight_status TYPE i,
        flight_date TYPE d.

  TRY.
    connection = NEW #( i_carrier_id = 'TH'
                        i_connection_id = '0040'
                        i_status = '1'
                        i_flight_date = cl_abap_context_info=>get_system_date( ) ).
    APPEND connection TO connections.
  CATCH cx_ABAP_INVALID_VALUE.
    out->write( 'Method call failed' ).
  ENDTRY.

   TRY.
    connection = NEW #( i_carrier_id = 'AA'
                        i_connection_id = '0039'
                        i_status = '7'
                        i_flight_date = cl_abap_context_info=>get_system_date( )   ).
    APPEND connection TO connections.
  CATCH cx_ABAP_INVALID_VALUE.
    out->write( 'Method call failed' ).
  ENDTRY.

    LOOP AT connections INTO connection.
        connection->get_attributes(
        IMPORTING
        e_carrier_id = carrier_id
        e_connection_id = connection_id
        e_status = flight_status
        e_flight_date = flight_date  ).

    out->write( |FlightConnection { carrier_id } { connection_id } { flight_status } { flight_date }| ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
