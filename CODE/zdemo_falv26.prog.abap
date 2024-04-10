*&---------------------------------------------------------------------*
*& Report zdemo_falv26
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_falv26.



data: sflight type standard table of sflight.

class lcl_falv DEFINITION INHERITING FROM zcl_falv.

    PROTECTED SECTION.
        methods: evf_data_changed_finished REDEFINITION.

ENDCLASS.

CLASs lcl_falv IMPLEMENTATION.

  METHOD evf_data_changed_finished.
    me->soft_refresh( ).
  ENDMETHOD.

ENDCLASS.


start-of-selection.


  select * up to 10000 rows
  into corresponding fields of table @sflight
  from sflight.

  "FALV creation with only table passed
  data(falv) = lcl_falv=>create( changing ct_table = sflight ).

  "Add title variable
  falv->title_v1 = 'ZDEMO_FALV26'.


  data(currency) = falv->column( 'CURRENCY' )->set_editable( )->set_drdn_hndl( '1' )->set_drdn_alias( 'X' ).

  falv->set_drop_down_table(
  it_drop_down_alias = value #( handle = '1' ( value = 'EUR Euro' int_value = 'EUR' )
                                             ( value = 'PLN Zloty' int_value = 'PLN' )
                                    )  ).

  falv->set_editable(
      iv_modify = abap_true
  ).
  "Display full screen grid
  falv->display( ).
