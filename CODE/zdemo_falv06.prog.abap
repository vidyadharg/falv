"! This is demo for FALV full screen with layout changes
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv06.

TYPES: BEGIN OF t_sflight,
         mark TYPE bcselect,
         flag TYPE flag.
         INCLUDE TYPE sflight.
TYPES: END OF t_sflight.

DATA sflight TYPE STANDARD TABLE OF t_sflight.


PARAMETERS p_usemar AS CHECKBOX.

START-OF-SELECTION.
  SELECT *
    UP TO 100 ROWS
    INTO CORRESPONDING FIELDS OF TABLE @sflight
    FROM sflight.

  " FALV creation with only table passed
  DATA(falv) = zcl_falv=>create( CHANGING ct_table = sflight ).

  " Add title variable
  falv->title_v1 = 'ZDEMO_FALV06'.

  " All layout settings have set method in layout object of FALV
  " it can be udated before output or during runtime of program
  falv->layout->set_zebra( abap_true  ).
  falv->layout->set_no_merging( abap_true ).

  " additionally there is a attribute mark field which when is set
  " then fcat for it is changed so it's checkbox field and
  " when you'll use standard select all/deselect all functions then
  " it will check/uncheck checkbox instead of selecting/deselecting rows
  IF p_usemar = abap_true.
    falv->set_mark_field( 'MARK' ).
  ENDIF.

  " user Layout option save changed to user-specific only
  falv->layout_save = 'U'.
  falv->layout->set_edit( iv_value = abap_true ).
  " Display full screen grid
  falv->display( ).
