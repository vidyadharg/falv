CLASS zcl_falv_onf4_internal DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING falv TYPE REF TO zcl_falv.
    "! Must be called <em>inside ZCL_FALV->DISPLAY</em> method<br/>
    "! to build automatic F4 for fields with domain values<br/>
    "! or search helps in data elements. This works in case<br/>
    "! the field is not a reference to a table field.<br/>
    METHODS build_automatic_f4.

    METHODS handle_onf4 IMPORTING VALUE(fieldname)  TYPE lvc_fname                OPTIONAL
                                  VALUE(fieldvalue) TYPE lvc_value                OPTIONAL
                                  VALUE(row_no)     TYPE lvc_s_roid               OPTIONAL
                                  VALUE(event_data) TYPE REF TO cl_alv_event_data OPTIONAL
                                  VALUE(bad_cells)  TYPE lvc_t_modi               OPTIONAL
                                  VALUE(display)    TYPE char01                   OPTIONAL ##NEEDED.

  PRIVATE SECTION.
    TYPES:
      BEGIN OF ty_domain_value,
        domvalue_l TYPE dd07l-domvalue_l,
        ddtext     TYPE dd07t-ddtext,
      END OF ty_domain_value,
      ty_domain_values TYPE STANDARD TABLE OF ty_domain_value WITH DEFAULT KEY.

    METHODS get_domain_values
      IMPORTING data_element         TYPE dd04l
      RETURNING VALUE(domain_values) TYPE ty_domain_values.

    DATA falv         TYPE REF TO zcl_falv.
    DATA automatic_f4 TYPE lvc_t_f4.

    METHODS get_data_element IMPORTING rollname            TYPE rollname
                             RETURNING VALUE(data_element) TYPE dd04l.

    METHODS domain_have_fixed_values
      IMPORTING domain             TYPE dd04l-domname
      RETURNING VALUE(have_values) TYPE abap_bool.

    METHODS call_f4_for_domain_values
      IMPORTING event_data   TYPE REF TO cl_alv_event_data
                fieldname    TYPE lvc_fname
                data_element TYPE dd04l
                row_no       TYPE lvc_s_roid.

    METHODS call_f4_from_search_help
      IMPORTING fieldname    TYPE lvc_fname
                row_no       TYPE lvc_s_roid
                event_data   TYPE REF TO cl_alv_event_data
                data_element TYPE dd04l.

    METHODS correct_f4_interface
      IMPORTING data_element TYPE dd04l
                fieldname    TYPE lvc_fname
      CHANGING  shlp         TYPE shlp_descr.

    METHODS correct_ft_field_proposals
      IMPORTING data_element TYPE dd04l
      CHANGING  shlp         TYPE shlp_descr.

    METHODS register_f4_for_fields.
ENDCLASS.


CLASS zcl_falv_onf4_internal IMPLEMENTATION.
  METHOD handle_onf4.
    " TODO: parameter FIELDVALUE is never used (ABAP cleaner)
    " TODO: parameter BAD_CELLS is never used (ABAP cleaner)

    CHECK line_exists( automatic_f4[ fieldname = fieldname ] ).

    falv->get_frontend_fieldcatalog( IMPORTING et_fieldcatalog = falv->fcat ).
    ASSIGN falv->fcat[ fieldname = fieldname ] TO FIELD-SYMBOL(<fcat>).
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    DATA(data_element) = get_data_element( <fcat>-rollname ).
    IF data_element-shlpname IS NOT INITIAL.
      call_f4_from_search_help( fieldname    = fieldname
                                row_no       = row_no
                                event_data   = event_data
                                data_element = data_element ).
    ELSEIF data_element-domname IS NOT INITIAL.
      call_f4_for_domain_values( event_data   = event_data
                                 fieldname    = fieldname
                                 row_no       = row_no
                                 data_element = data_element ).

    ENDIF.
  ENDMETHOD.

  METHOD call_f4_from_search_help.
    DATA shlp        TYPE shlp_descr.
    DATA return_code TYPE i.
    DATA f4_values   TYPE STANDARD TABLE OF ddshretval.
    FIELD-SYMBOLS <new_value> TYPE lvc_t_modi.

    CALL FUNCTION 'F4IF_GET_SHLP_DESCR'
      EXPORTING shlpname = data_element-shlpname
                shlptype = 'SH'
      IMPORTING shlp     = shlp.

    DATA(ready_for_input) = falv->is_ready_for_input( i_row_id  = row_no-row_id
                                                      is_col_id = VALUE #( fieldname = fieldname ) ).

    correct_ft_field_proposals( EXPORTING data_element = data_element
                                CHANGING  shlp         = shlp ).

    correct_f4_interface( EXPORTING data_element = data_element
                                    fieldname    = fieldname
                          CHANGING  shlp         = shlp ).

    CALL FUNCTION 'F4IF_START_VALUE_REQUEST'
      EXPORTING shlp          = shlp
                disponly      = COND #( WHEN ready_for_input = 0 THEN abap_true ELSE abap_false )
      IMPORTING rc            = return_code
      TABLES    return_values = f4_values.
    IF return_code = 0 AND f4_values IS NOT INITIAL.
      ASSIGN f4_values[ fieldname = data_element-shlpfield  ] TO FIELD-SYMBOL(<f4_value>).
      IF sy-subrc <> 0.
        ASSIGN f4_values[ fieldname = fieldname ] TO <f4_value>.
      ENDIF.
      IF <f4_value> IS ASSIGNED.
        ASSIGN event_data->m_data->* TO <new_value>.
        IF <new_value> IS ASSIGNED.
          INSERT VALUE lvc_s_modi( fieldname  = fieldname
                                   row_id     = row_no-row_id
                                   sub_row_id = row_no-sub_row_id
                                   value      = <f4_value>-fieldval )
                 INTO TABLE <new_value>.
          event_data->m_event_handled = abap_true.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD correct_ft_field_proposals.
    ASSIGN shlp-fieldprop[ fieldname = data_element-shlpfield ] TO FIELD-SYMBOL(<fieldprop>).
    IF sy-subrc = 0.
      <fieldprop>-shlpoutput = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD correct_f4_interface.
    ASSIGN shlp-interface[ shlpfield = data_element-shlpfield ] TO FIELD-SYMBOL(<interface>).
    IF sy-subrc = 0.
      <interface>-valfield  = fieldname.
      <interface>-f4field   = abap_true.
      <interface>-dispfield = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD call_f4_for_domain_values.
    DATA f4_results TYPE STANDARD TABLE OF ddshretval.
    DATA user_reset TYPE c LENGTH 1.
    FIELD-SYMBOLS <new_value> TYPE lvc_t_modi.

    DATA(domain_values) = get_domain_values( data_element ).

    DATA(ready_for_input) = falv->is_ready_for_input( i_row_id  = row_no-row_id
                                                      is_col_id = VALUE #( fieldname = fieldname ) ).

    CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
      EXPORTING  retfield        = 'DOMVALUE_L'
                 value_org       = 'S'
                 display         = COND #( WHEN ready_for_input = 0 THEN abap_true ELSE abap_false )
      IMPORTING  user_reset      = user_reset
      TABLES     value_tab       = domain_values
                 return_tab      = f4_results
      EXCEPTIONS parameter_error = 1
                 no_values_found = 2
                 OTHERS          = 3.
    IF sy-subrc = 0 AND user_reset IS INITIAL.
      ASSIGN f4_results[ 1 ] TO FIELD-SYMBOL(<return>).
      IF sy-subrc = 0.
        ASSIGN event_data->m_data->* TO <new_value>.
        IF <new_value> IS ASSIGNED.
          INSERT VALUE lvc_s_modi( fieldname  = fieldname
                                   row_id     = row_no-row_id
                                   sub_row_id = row_no-sub_row_id
                                   value      = <return>-fieldval )
                 INTO TABLE <new_value>.
          event_data->m_event_handled = abap_true.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD get_domain_values.
    SELECT a~domvalue_l,
           b~ddtext
      INTO CORRESPONDING FIELDS OF TABLE @domain_values
      FROM dd07l AS a
             LEFT OUTER JOIN
               dd07t AS b ON  a~domname  = b~domname
                          AND a~as4local = b~as4local
                          AND a~valpos   = b~valpos
                          AND a~as4vers  = b~as4vers
      WHERE a~domname    = @data_element-domname
        AND b~ddlanguage = @sy-langu.
  ENDMETHOD.

  METHOD build_automatic_f4.
    falv->get_frontend_fieldcatalog( IMPORTING et_fieldcatalog = falv->fcat ).
    DATA(f4_registered) = falv->get_registered_f4_for_fields( ).
    LOOP AT falv->fcat ASSIGNING FIELD-SYMBOL(<fcat>).
      IF    <fcat>-ref_table  IS NOT INITIAL
         OR <fcat>-rollname   IS INITIAL
         OR <fcat>-f4availabl  = abap_false
         OR line_exists( f4_registered[ fieldname = <fcat>-fieldname ] ).
        CONTINUE.
      ENDIF.

      DATA(data_element) = get_data_element( <fcat>-rollname ).
      IF data_element-shlpname IS NOT INITIAL.
        INSERT VALUE #( fieldname  = <fcat>-fieldname
                        getbefore  = abap_true
                        chngeafter = abap_true
                        register   = abap_true )
               INTO TABLE automatic_f4.
      ELSEIF     data_element-domname IS NOT INITIAL
             AND domain_have_fixed_values( data_element-domname )  = abap_true.

        INSERT VALUE #( fieldname  = <fcat>-fieldname
                        getbefore  = abap_true
                        chngeafter = abap_true
                        register   = abap_true )
               INTO TABLE automatic_f4.
      ENDIF.
    ENDLOOP.

    register_f4_for_fields( ).
  ENDMETHOD.

  METHOD register_f4_for_fields.
    IF automatic_f4 IS NOT INITIAL.
      DATA(f4_to_register) = automatic_f4.
      INSERT LINES OF falv->get_registered_f4_for_fields( ) INTO TABLE f4_to_register.
      falv->register_f4_for_fields( it_f4 = f4_to_register ).
    ENDIF.
  ENDMETHOD.

  METHOD constructor.
    me->falv = falv.
  ENDMETHOD.

  METHOD get_data_element.
    SELECT SINGLE rollname, domname, shlpname, shlpfield
      FROM dd04l
      WHERE rollname = @rollname
        AND as4local = 'A'
        AND as4vers  = '0000'
      INTO CORRESPONDING FIELDS OF @data_element. "#EC CI_SEL_NESTED
  ENDMETHOD.

  METHOD domain_have_fixed_values.
    SELECT SINGLE 'X' FROM dd07v
      WHERE domname    = @domain
        AND ddlanguage = @sy-langu
      INTO @have_values.
  ENDMETHOD.
ENDCLASS.
