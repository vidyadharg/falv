CLASS zcl_falv_popup DEFINITION
  PUBLIC
  INHERITING FROM zcl_falv
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS create_popup
      IMPORTING
        title              TYPE lvc_title DEFAULT space
        header_text        TYPE csequence DEFAULT space
        striped_pattern    TYPE abap_bool DEFAULT abap_false
        optimize_col_width TYPE abap_bool DEFAULT abap_true
        sel_mode           TYPE lvc_libox DEFAULT 'D'
        i_subclass         TYPE REF TO cl_abap_typedescr OPTIONAL
      CHANGING
        ct_table           TYPE STANDARD TABLE
      RETURNING
        VALUE(falv_popup)  TYPE REF TO zcl_falv_popup.

    METHODS show_popup
      RETURNING
        VALUE(e_ucomm) TYPE sy-ucomm.

  PROTECTED SECTION.
    METHODS evf_top_of_page REDEFINITION.
    METHODS evf_user_command REDEFINITION.

  PRIVATE SECTION.
    METHODS:
      set_header_text
        IMPORTING
          header_text TYPE csequence DEFAULT space.

    DATA:
      top_of_page_txt TYPE sdydo_text_element,
      ucomm           TYPE sy-ucomm.
ENDCLASS.



CLASS zcl_falv_popup IMPLEMENTATION.

  METHOD evf_top_of_page.
    e_dyndoc_id->add_text( text = top_of_page_txt sap_style = cl_dd_area=>list_total ).
  ENDMETHOD.


  METHOD create_popup.

    IF i_subclass IS NOT SUPPLIED.
      DATA(lv_subclass) = cl_abap_classdescr=>describe_by_name( p_name = 'ZCL_FALV_POPUP' ).
    ELSE.
      lv_subclass = i_subclass.
    ENDIF.

    "FALV creation with only table passed
    falv_popup ?= zcl_falv=>create(
          EXPORTING i_popup = abap_true
                    i_subclass = lv_subclass
           CHANGING ct_table = ct_table ).

    "title
    falv_popup->title_v1 = title.

    "header_text
    falv_popup->set_header_text( header_text ).

    "striped_pattern
    falv_popup->layout->set_zebra( striped_pattern ).

    "optimize_col_width
    falv_popup->layout->set_cwidth_opt( optimize_col_width ).
    "sel mode
    falv_popup->layout->set_sel_mode( sel_mode ).

  ENDMETHOD.


  METHOD evf_user_command.
    ucomm = e_ucomm.
    super->evf_user_command( e_ucomm ).
  ENDMETHOD.

  METHOD  set_header_text.
    top_of_page_txt = header_text.
  ENDMETHOD.

  METHOD show_popup.
    IF top_of_page_txt IS NOT INITIAL.
      show_top_of_page( ).
    ENDIF.
    display( ).
    e_ucomm = ucomm.
  ENDMETHOD.
ENDCLASS.
