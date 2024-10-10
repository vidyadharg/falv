"! This is demo for FALV standard fast call
"! done by Lukasz Pegiel for http://abapblog.com
REPORT zdemo_falv28.

DATA: sflight TYPE STANDARD TABLE OF sflight.

CLASS lcl_test DEFINITION INHERITING FROM zcl_falv_popup.
  PUBLIC SECTION.

  PROTECTED SECTION.
    "redefinition of event handler
    METHODS evf_hotspot_click REDEFINITION.
    METHODS evf_top_of_page REDEFINITION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_test IMPLEMENTATION.

  METHOD evf_hotspot_click.
    CASE e_column_id-fieldname.
      WHEN 'SEATSMAX'.
        CALL FUNCTION 'POPUP_DISPLAY_MESSAGE'
          EXPORTING
            titel = 'Hotspot is working'   " Title
            msgid = '00'
            msgty = 'I'
            msgno = '001'
            msgv1 = 'Yupi!'.
    ENDCASE.
  ENDMETHOD.

  METHOD evf_top_of_page.

    e_dyndoc_id->add_text( text = 'Top Of Page' sap_style = cl_dd_area=>heading ).

    e_dyndoc_id->new_line( repeat = 1 ).

    e_dyndoc_id->add_link(
      EXPORTING
        name                   =  'ABAPBLOG.com'   " Name (You Can Use Any Name You Choose)
        url                    =   'http://abapblog.com'  " URL
        tooltip                =  'ABAPBLOG.com'   " Tool Tip
        text                   =  'ABAPBLOG.com'    " Text
    ).


  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.


  SELECT * UP TO 100 ROWS
  INTO CORRESPONDING FIELDS OF TABLE @sflight
  FROM sflight.

  "FALV creation with only table passed
*    DATA(falv_popup) =
*    zcl_falv_popup=>create_popup( changing ct_table = sflight ).

  DATA falv_popup TYPE REF TO lcl_test.
  falv_popup ?=  lcl_test=>create_popup(
    EXPORTING i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'LCL_TEST' )
    CHANGING ct_table = sflight ).


  "Add title variable
  falv_popup->title_v1 = 'ZDEMO_FALV28'.
  falv_popup->show_top_of_page( ).
  "Display popup and get buton press by user
  DATA(ucomm) = falv_popup->show_popup( ).
  WRITE : ucomm.


  DATA(popup) =
    zcl_falv_popup=>create_popup(
      EXPORTING
        title              = |Popup|
        header_text        = |Verify that ALL imported values ​​are correct. NO OF entreis: { lines( sflight ) }|
      CHANGING
        ct_table = sflight ).

  popup->top_of_page_height = 40. "absolute size

  ucomm = popup->show_popup( ).
    WRITE : ucomm.
