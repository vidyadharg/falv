CLASS zcl_falv_dynamic_status DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_os_clone.

    TYPES:
      BEGIN OF t_buttons,
        f01 TYPE rsfunc_txt,
        f02 TYPE rsfunc_txt,
        f03 TYPE rsfunc_txt,
        f04 TYPE rsfunc_txt,
        f05 TYPE rsfunc_txt,
        f06 TYPE rsfunc_txt,
        f07 TYPE rsfunc_txt,
        f08 TYPE rsfunc_txt,
        f09 TYPE rsfunc_txt,
        f10 TYPE rsfunc_txt,
        f11 TYPE rsfunc_txt,
        f12 TYPE rsfunc_txt,
        f13 TYPE rsfunc_txt,
        f14 TYPE rsfunc_txt,
        f15 TYPE rsfunc_txt,
        f16 TYPE rsfunc_txt,
        f17 TYPE rsfunc_txt,
        f18 TYPE rsfunc_txt,
        f19 TYPE rsfunc_txt,
        f20 TYPE rsfunc_txt,
        f21 TYPE rsfunc_txt,
        f22 TYPE rsfunc_txt,
        f23 TYPE rsfunc_txt,
        f24 TYPE rsfunc_txt,
        f25 TYPE rsfunc_txt,
        f26 TYPE rsfunc_txt,
        f27 TYPE rsfunc_txt,
        f28 TYPE rsfunc_txt,
        f29 TYPE rsfunc_txt,
        f30 TYPE rsfunc_txt,
        f31 TYPE rsfunc_txt,
        f32 TYPE rsfunc_txt,
        f33 TYPE rsfunc_txt,
        f34 TYPE rsfunc_txt,
        f35 TYPE rsfunc_txt,
      END OF t_buttons.
    TYPES:
      BEGIN OF t_allowed_but,
        function TYPE sy-ucomm,
      END OF t_allowed_but.
    TYPES tt_excluded_but TYPE STANDARD TABLE OF sy-ucomm.
    TYPES tt_allowed_but  TYPE STANDARD TABLE OF t_allowed_but.

    CONSTANTS b_01 TYPE sy-ucomm VALUE 'F01' ##NO_TEXT.
    CONSTANTS b_02 TYPE sy-ucomm VALUE 'F02' ##NO_TEXT.
    CONSTANTS b_03 TYPE sy-ucomm VALUE 'F03' ##NO_TEXT.
    CONSTANTS b_04 TYPE sy-ucomm VALUE 'F04' ##NO_TEXT.
    CONSTANTS b_05 TYPE sy-ucomm VALUE 'F05' ##NO_TEXT.
    CONSTANTS b_06 TYPE sy-ucomm VALUE 'F06' ##NO_TEXT.
    CONSTANTS b_07 TYPE sy-ucomm VALUE 'F07' ##NO_TEXT.
    CONSTANTS b_08 TYPE sy-ucomm VALUE 'F08' ##NO_TEXT.
    CONSTANTS b_09 TYPE sy-ucomm VALUE 'F09' ##NO_TEXT.
    CONSTANTS b_10 TYPE sy-ucomm VALUE 'F10' ##NO_TEXT.
    CONSTANTS b_11 TYPE sy-ucomm VALUE 'F11' ##NO_TEXT.
    CONSTANTS b_12 TYPE sy-ucomm VALUE 'F12' ##NO_TEXT.
    CONSTANTS b_13 TYPE sy-ucomm VALUE 'F13' ##NO_TEXT.
    CONSTANTS b_14 TYPE sy-ucomm VALUE 'F14' ##NO_TEXT.
    CONSTANTS b_15 TYPE sy-ucomm VALUE 'F15' ##NO_TEXT.
    CONSTANTS b_16 TYPE sy-ucomm VALUE 'F16' ##NO_TEXT.
    CONSTANTS b_17 TYPE sy-ucomm VALUE 'F17' ##NO_TEXT.
    CONSTANTS b_18 TYPE sy-ucomm VALUE 'F18' ##NO_TEXT.
    CONSTANTS b_19 TYPE sy-ucomm VALUE 'F19' ##NO_TEXT.
    CONSTANTS b_20 TYPE sy-ucomm VALUE 'F20' ##NO_TEXT.
    CONSTANTS b_21 TYPE sy-ucomm VALUE 'F21' ##NO_TEXT.
    CONSTANTS b_22 TYPE sy-ucomm VALUE 'F22' ##NO_TEXT.
    CONSTANTS b_23 TYPE sy-ucomm VALUE 'F23' ##NO_TEXT.
    CONSTANTS b_24 TYPE sy-ucomm VALUE 'F24' ##NO_TEXT.
    CONSTANTS b_25 TYPE sy-ucomm VALUE 'F25' ##NO_TEXT.
    CONSTANTS b_26 TYPE sy-ucomm VALUE 'F26' ##NO_TEXT.
    CONSTANTS b_27 TYPE sy-ucomm VALUE 'F27' ##NO_TEXT.
    CONSTANTS b_28 TYPE sy-ucomm VALUE 'F28' ##NO_TEXT.
    CONSTANTS b_29 TYPE sy-ucomm VALUE 'F29' ##NO_TEXT.
    CONSTANTS b_30 TYPE sy-ucomm VALUE 'F30' ##NO_TEXT.
    CONSTANTS b_31 TYPE sy-ucomm VALUE 'F31' ##NO_TEXT.
    CONSTANTS b_32 TYPE sy-ucomm VALUE 'F32' ##NO_TEXT.
    CONSTANTS b_33 TYPE sy-ucomm VALUE 'F33' ##NO_TEXT.
    CONSTANTS b_34 TYPE sy-ucomm VALUE 'F34' ##NO_TEXT.
    CONSTANTS b_35 TYPE sy-ucomm VALUE 'F35' ##NO_TEXT.

    DATA fully_dynamic    TYPE abap_bool.
    DATA excluded_buttons TYPE tt_excluded_but.
    DATA buttons          TYPE t_buttons.

    METHODS constructor.

    METHODS add_button
      IMPORTING  VALUE(iv_button)  TYPE sy-ucomm
                 VALUE(iv_text)    TYPE smp_dyntxt-text      OPTIONAL
                 VALUE(iv_icon)    TYPE smp_dyntxt-icon_id   OPTIONAL
                 VALUE(iv_qinfo)   TYPE smp_dyntxt-quickinfo OPTIONAL
                 VALUE(iv_allowed) TYPE abap_bool            DEFAULT abap_true
      RETURNING  VALUE(r_status)   TYPE REF TO zcl_falv_dynamic_status
      EXCEPTIONS button_already_filled
                 button_does_not_exists
                 icon_and_text_empty.

    METHODS hide_button
      IMPORTING VALUE(iv_button) TYPE sy-ucomm
      RETURNING VALUE(r_status)  TYPE REF TO zcl_falv_dynamic_status.

    METHODS show_button
      IMPORTING VALUE(iv_button) TYPE sy-ucomm
      RETURNING VALUE(r_status)  TYPE REF TO zcl_falv_dynamic_status.

    METHODS get_toolbar
      EXPORTING e_toolbar TYPE t_buttons.

    METHODS add_separator
      IMPORTING VALUE(iv_button) TYPE sy-ucomm
      RETURNING VALUE(r_status)  TYPE REF TO zcl_falv_dynamic_status.

    METHODS show_title
      IMPORTING VALUE(iv_text1) TYPE string
                VALUE(iv_text2) TYPE string OPTIONAL
                VALUE(iv_text3) TYPE string OPTIONAL
                VALUE(iv_text4) TYPE string OPTIONAL
                VALUE(iv_text5) TYPE string OPTIONAL.

    METHODS show_gui_status.

  PROTECTED SECTION.
    DATA allowed_buttons TYPE tt_allowed_but.
ENDCLASS.


CLASS zcl_falv_dynamic_status IMPLEMENTATION.
  METHOD add_button.
    r_status = me.
    DATA button TYPE smp_dyntxt.
    CHECK iv_button IS NOT INITIAL.

    IF iv_text IS INITIAL AND iv_icon IS INITIAL.
      RAISE icon_and_text_empty.
      RETURN.
    ENDIF.

    button-icon_id   = iv_icon.
    button-icon_text = iv_text.
    button-text      = iv_text.
    button-quickinfo = iv_qinfo.

    ASSIGN COMPONENT iv_button OF STRUCTURE buttons TO FIELD-SYMBOL(<bt>).
    IF <bt> IS ASSIGNED.
      IF <bt> IS INITIAL.
        <bt> = button.
        IF iv_allowed = abap_true.
          show_button( iv_button = iv_button ).
        ENDIF.
      ELSE.
        RAISE button_already_filled.
      ENDIF.
    ELSE.
      RAISE button_does_not_exists.
    ENDIF.
  ENDMETHOD.

  METHOD add_separator.
    r_status = me.
    add_button( EXPORTING  iv_button  = iv_button
                           iv_text    = |{ cl_abap_char_utilities=>minchar }|
                           iv_allowed = abap_true
                EXCEPTIONS OTHERS     = 0 ).
  ENDMETHOD.

  METHOD constructor.
    excluded_buttons = VALUE #( ( b_01 )
                                ( b_02 )
                                ( b_03 )
                                ( b_04 )
                                ( b_05 )
                                ( b_06 )
                                ( b_07 )
                                ( b_08 )
                                ( b_09 )
                                ( b_10 )
                                ( b_11 )
                                ( b_12 )
                                ( b_13 )
                                ( b_14 )
                                ( b_15 )
                                ( b_16 )
                                ( b_17 )
                                ( b_18 )
                                ( b_19 )
                                ( b_20 )
                                ( b_21 )
                                ( b_22 )
                                ( b_23 )
                                ( b_24 )
                                ( b_25 )
                                ( b_26 )
                                ( b_27 )
                                ( b_28 )
                                ( b_29 )
                                ( b_30 )
                                ( b_31 )
                                ( b_32 )
                                ( b_33 )
                                ( b_34 )
                                ( b_35 )
                                ( zcl_falv=>mc_fc_data_save )
                                ( zcl_falv=>fc_first_page )
                                ( zcl_falv=>fc_last_page )
                                ( zcl_falv=>fc_next_page )
                                ( zcl_falv=>fc_previous_page )
                                ( zcl_falv=>fc_print ) ).
  ENDMETHOD.

  METHOD get_toolbar.
    e_toolbar = buttons.
  ENDMETHOD.

  METHOD hide_button.
    r_status = me.
    IF iv_button IS INITIAL.
      RETURN.
    ENDIF.

    DELETE allowed_buttons WHERE function = iv_button.
    APPEND iv_button TO excluded_buttons.
  ENDMETHOD.

  METHOD if_os_clone~clone.
    SYSTEM-CALL OBJMGR CLONE me TO result.
  ENDMETHOD.

  METHOD show_button.
    r_status = me.
    IF iv_button IS INITIAL.
      RETURN.
    ENDIF.
    IF NOT line_exists( allowed_buttons[ function = iv_button ] ).
      DATA(allowed) = VALUE t_allowed_but( function = iv_button ).
      APPEND allowed TO allowed_buttons.
      DELETE excluded_buttons WHERE table_line = iv_button.
    ENDIF.
  ENDMETHOD.

  METHOD show_gui_status.
    IF sy-dynnr = zcl_falv=>c_screen_full AND fully_dynamic = abap_true.
      SET PF-STATUS 'DYNAMIC_STATUS' OF PROGRAM zcl_falv=>c_fscr_repid EXCLUDING excluded_buttons.
    ELSEIF sy-dynnr = zcl_falv=>c_screen_full.
      SET PF-STATUS 'DYNAMIC_STATUS_PART' OF PROGRAM zcl_falv=>c_fscr_repid EXCLUDING excluded_buttons.
    ELSE.
      SET PF-STATUS 'STATUS_0200' OF PROGRAM zcl_falv=>c_fscr_repid EXCLUDING excluded_buttons.
    ENDIF.
  ENDMETHOD.

  METHOD show_title.
    SET TITLEBAR 'TITLE' OF PROGRAM zcl_falv=>c_fscr_repid WITH iv_text1 iv_text2 iv_text3 iv_text4 iv_text5.
  ENDMETHOD.
ENDCLASS.
