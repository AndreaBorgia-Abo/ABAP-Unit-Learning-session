CLASS ltc_test_prime DEFINITION
      FOR TESTING
      RISK LEVEL HARMLESS
      DURATION SHORT
      FINAL.

  PRIVATE SECTION.

    TYPES: BEGIN OF ts_number_to_test,
             value TYPE i,
             prime TYPE abap_bool,
           END OF ts_number_to_test,
           tt_number_to_test TYPE STANDARD TABLE OF ts_number_to_test
                             WITH NON-UNIQUE DEFAULT KEY.

    METHODS setup.

    METHODS class_could_be_bounded       FOR TESTING.
    METHODS it_finds_number_is_prime     FOR TESTING.

    METHODS given_i_have_numbers
      RETURNING
        VALUE(results) TYPE tt_number_to_test.

    DATA o_cut TYPE REF TO zif_ca_abap_unit_test3.


ENDCLASS.



CLASS ltc_test_prime IMPLEMENTATION.


  METHOD setup.
    o_cut = NEW zcl_ca_abap_unit_test3(  ).
  ENDMETHOD.


  METHOD class_could_be_bounded.
    cl_abap_unit_assert=>assert_bound( o_cut ).
  ENDMETHOD.


  METHOD it_finds_number_is_prime.
    LOOP AT given_i_have_numbers( )
        REFERENCE INTO DATA(number_to_test).
      cl_abap_unit_assert=>assert_equals(
        act = o_cut->is_integer_prime_number( number_to_test->value )
        exp = number_to_test->prime ).
    ENDLOOP.
  ENDMETHOD.


  METHOD given_i_have_numbers.
    results = VALUE #(  ( value = '3'   prime = abap_true )
                        ( value = '5'   prime = abap_true )
                        ( value = '127' prime = abap_true )
                        ( value = '900' prime = abap_false )
                        ( value = '963' prime = abap_false ) ).
  ENDMETHOD.


ENDCLASS.
