
CLASS zcl_ca_abap_unit_test3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_ca_abap_unit_test3.

  PRIVATE SECTION.

    METHODS is_integer_multiple_of
      IMPORTING
        number_to_test TYPE i
        multiple       TYPE i
      RETURNING
        VALUE(result)  TYPE abap_bool.


ENDCLASS.



CLASS zcl_ca_abap_unit_test3 IMPLEMENTATION.


  METHOD zif_ca_abap_unit_test3~is_integer_prime_number.

    DATA remainder TYPE i.
    DATA divider   TYPE i.

    " Result is true, until I prove the opposite
    result = abap_true.

    DO number_to_test TIMES.

      IF sy-index = 1.
        CONTINUE.
      ENDIF.
      divider = sy-index.
      IF divider EQ number_to_test.
        RETURN.
      ENDIF.

      IF is_integer_multiple_of( number_to_test = number_to_test
                                 multiple       = divider       ) eq abap_true.
        result = abap_false.
        RETURN.
      ENDIF.

    ENDDO.

  ENDMETHOD.




  method is_integer_multiple_of.
    data remainder type i.
    remainder = number_to_test MOD multiple.
    result = cond #( when remainder eq 0
                       then abap_true
                       else abap_false ).
  endmethod.


ENDCLASS.
