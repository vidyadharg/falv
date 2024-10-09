class ZCL_FALV_POPUP definition
  public
  inheriting from ZCL_FALV
  create public .

public section.

  class-methods CREATE_POPUP
    changing
      !CT_TABLE type STANDARD TABLE
    returning
      value(FALV_POPUP) type ref to ZCL_FALV_POPUP .
  methods SHOW_POPUP
    returning
      value(E_UCOMM) type SY-UCOMM .
  PROTECTED SECTION.
    METHODS evf_user_command REDEFINITION.

  PRIVATE SECTION.
    DATA:
      ucomm  TYPE sy-ucomm.
ENDCLASS.



CLASS ZCL_FALV_POPUP IMPLEMENTATION.


METHOD create_popup.
    "FALV creation with only table passed
    falv_popup ?= zcl_falv=>create(
          EXPORTING i_popup = abap_true
                    i_subclass = cl_abap_classdescr=>describe_by_name( p_name = 'ZCL_FALV_POPUP' )
           CHANGING ct_table = ct_table ).
ENDMETHOD.


  METHOD evf_user_command.
    ucomm = e_ucomm.
    super->evf_user_command( e_ucomm ).
  ENDMETHOD.


  METHOD show_popup.
    display( ).
    e_ucomm = ucomm.
  ENDMETHOD.
ENDCLASS.
