interface ZIF_CA_ABAP_UNIT_TEST3
  public .
    methods is_integer_prime_number
      importing
        number_to_test type i
      returning
        value(result) type abap_bool.

endinterface.
