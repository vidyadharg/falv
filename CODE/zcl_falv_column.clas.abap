class zcl_falv_column definition
  public
  create public .

  public section.

    data fieldname type lvc_s_fcat-fieldname read-only .

    methods constructor
      importing
        value(iv_fieldname) type lvc_s_fcat-fieldname
        !io_falv            type ref to zcl_falv .
    methods set_editable returning value(r_column) type ref to zcl_falv_column.
    methods set_readonly returning value(r_column) type ref to zcl_falv_column.
    methods set_row_pos
      importing
                value(iv_value) type lvc_rowpos
      returning value(r_column) type ref to zcl_falv_column.
    methods set_col_pos
      importing
                value(iv_value) type lvc_colpos
      returning value(r_column) type ref to zcl_falv_column.
    methods set_fieldname
      importing
                value(iv_value) type lvc_fname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_tabname
      importing
                value(iv_value) type lvc_tname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_currency
      importing
                value(iv_value) type lvc_curr
      returning value(r_column) type ref to zcl_falv_column.
    methods set_cfieldname
      importing
                value(iv_value) type lvc_cfname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_quantity
      importing
                value(iv_value) type lvc_quan
      returning value(r_column) type ref to zcl_falv_column.
    methods set_qfieldname
      importing
                value(iv_value) type lvc_qfname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_ifieldname
      importing
                value(iv_value) type lvc_fname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_round
      importing
                value(iv_value) type lvc_round
      returning value(r_column) type ref to zcl_falv_column..
    methods set_exponent
      importing
                value(iv_value) type lvc_expont
      returning value(r_column) type ref to zcl_falv_column.
    methods set_key
      importing
                value(iv_value) type lvc_key
      returning value(r_column) type ref to zcl_falv_column.
    methods set_key_sel
      importing
                value(iv_value) type lvc_keysel
      returning value(r_column) type ref to zcl_falv_column.
    methods set_icon
      importing
                value(iv_value) type lvc_icon
      returning value(r_column) type ref to zcl_falv_column.
    methods set_symbol
      importing
                value(iv_value) type lvc_symbol
      returning value(r_column) type ref to zcl_falv_column.
    methods set_checkbox
      importing
                value(iv_value) type lvc_checkb
      returning value(r_column) type ref to zcl_falv_column.
    methods set_just
      importing
                value(iv_value) type lvc_just
      returning value(r_column) type ref to zcl_falv_column.
    methods set_lzero
      importing
                value(iv_value) type lvc_lzero
      returning value(r_column) type ref to zcl_falv_column.
    methods set_no_sign
      importing
                value(iv_value) type lvc_nosign
      returning value(r_column) type ref to zcl_falv_column.
    methods set_no_zero
      importing
                value(iv_value) type lvc_nozero
      returning value(r_column) type ref to zcl_falv_column.
    methods set_no_convext
      importing
                value(iv_value) type lvc_noconv
      returning value(r_column) type ref to zcl_falv_column.
    methods set_edit_mask
      importing
                value(iv_value) type lvc_edtmsk
      returning value(r_column) type ref to zcl_falv_column.
    methods set_emphasize
      importing
                value(iv_value) type lvc_emphsz
      returning value(r_column) type ref to zcl_falv_column.
    methods set_color
      importing
                value(iv_value) type lvc_emphsz
      returning value(r_column) type ref to zcl_falv_column.
    methods set_fix_column
      importing
                value(iv_value) type lvc_fixcol
      returning value(r_column) type ref to zcl_falv_column.
    methods set_do_sum
      importing
                value(iv_value) type lvc_dosum
      returning value(r_column) type ref to zcl_falv_column.
    methods set_no_sum
      importing
                value(iv_value) type lvc_nosum
      returning value(r_column) type ref to zcl_falv_column.
    methods set_no_out
      importing
                value(iv_value) type lvc_noout
      returning value(r_column) type ref to zcl_falv_column.
    methods set_tech
      importing
                value(iv_value) type lvc_tech
      returning value(r_column) type ref to zcl_falv_column.
    methods set_outputlen
      importing
                value(iv_value) type lvc_outlen
      returning value(r_column) type ref to zcl_falv_column.
    methods set_convexit
      importing
                value(iv_value) type convexit
      returning value(r_column) type ref to zcl_falv_column.
    methods set_seltext
      importing
                value(iv_value) type lvc_txt
      returning value(r_column) type ref to zcl_falv_column.
    methods set_tooltip
      importing
                value(iv_value) type lvc_tip
      returning value(r_column) type ref to zcl_falv_column.
    methods set_rollname
      importing
                value(iv_value) type lvc_roll
      returning value(r_column) type ref to zcl_falv_column.
    methods set_datatype
      importing
                value(iv_value) type datatype_d
      returning value(r_column) type ref to zcl_falv_column.
    methods set_inttype
      importing
                value(iv_value) type inttype
      returning value(r_column) type ref to zcl_falv_column.
    methods set_intlen
      importing
                value(iv_value) type intlen
      returning value(r_column) type ref to zcl_falv_column.
    methods set_lowercase
      importing
                value(iv_value) type lowercase
      returning value(r_column) type ref to zcl_falv_column.
    methods set_reptext
      importing
                value(iv_value) type reptext
      returning value(r_column) type ref to zcl_falv_column.
    methods set_hier_level
      importing
                value(iv_value) type lvc_hierl
      returning value(r_column) type ref to zcl_falv_column.
    methods set_reprep
      importing
                value(iv_value) type lvc_crprp
      returning value(r_column) type ref to zcl_falv_column.
    methods set_domname
      importing
                value(iv_value) type domname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_sp_group
      importing
                value(iv_value) type lvc_spgrp
      returning value(r_column) type ref to zcl_falv_column.
    methods set_hotspot
      importing
                value(iv_value) type lvc_hotspt
      returning value(r_column) type ref to zcl_falv_column.
    methods set_dfieldname
      importing
                value(iv_value) type lvcdbgfn
      returning value(r_column) type ref to zcl_falv_column.
    methods set_col_id
      importing
                value(iv_value) type lvc_colid
      returning value(r_column) type ref to zcl_falv_column.
    methods set_f4availabl
      importing
                value(iv_value) type ddf4avail
      returning value(r_column) type ref to zcl_falv_column.
    methods set_auto_value
      importing
                value(iv_value) type lvc_auto
      returning value(r_column) type ref to zcl_falv_column.
    methods set_checktable
      importing
                value(iv_value) type tabname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_valexi
      importing
                value(iv_value) type valexi
      returning value(r_column) type ref to zcl_falv_column.
    methods set_web_field
      importing
                value(iv_value) type lvc_fname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_href_hndl
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_style
      importing
                value(iv_value) type lvc_style
      returning value(r_column) type ref to zcl_falv_column.
    methods set_style2
      importing
                value(iv_value) type lvc_style
      returning value(r_column) type ref to zcl_falv_column.
    methods set_style3
      importing
                value(iv_value) type lvc_style
      returning value(r_column) type ref to zcl_falv_column.
    methods set_style4
      importing
                value(iv_value) type lvc_style
      returning value(r_column) type ref to zcl_falv_column.
    methods set_drdn_hndl
      importing
                value(iv_value)             type int4
                value(iv_use_domain_values) type abap_bool default 'X'
                value(iv_use_alias)         type abap_bool default 'X'
                value(it_drop_down)         type lvc_t_drop optional
                value(it_drop_down_alias)   type lvc_t_dral optional
      returning value(r_column)             type ref to zcl_falv_column.
    methods set_drdn_field
      importing
                value(iv_value) type lvc_fname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_no_merging
      importing
                value(iv_value) type char01
      returning value(r_column) type ref to zcl_falv_column.
    methods set_h_ftype
      importing
                value(iv_value) type lvc_ftype
      returning value(r_column) type ref to zcl_falv_column.
    methods set_col_opt
      importing
                value(iv_value) type lvc_colopt
      returning value(r_column) type ref to zcl_falv_column.
    methods set_no_init_ch
      importing
                value(iv_value) type char01
      returning value(r_column) type ref to zcl_falv_column.
    methods set_drdn_alias
      importing
                value(iv_value) type char01
      returning value(r_column) type ref to zcl_falv_column.
    methods set_decfloat_style
      importing
                value(iv_value) type outputstyle
      returning value(r_column) type ref to zcl_falv_column.
    methods set_parameter0
      importing
                value(iv_value) type char30
      returning value(r_column) type ref to zcl_falv_column.
    methods set_parameter1
      importing
                value(iv_value) type char30
      returning value(r_column) type ref to zcl_falv_column.
    methods set_parameter2
      importing
                value(iv_value) type char30
      returning value(r_column) type ref to zcl_falv_column.
    methods set_parameter3
      importing
                value(iv_value) type char30
      returning value(r_column) type ref to zcl_falv_column.
    methods set_parameter4
      importing
                value(iv_value) type char30
      returning value(r_column) type ref to zcl_falv_column.
    methods set_parameter5
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_parameter6
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_parameter7
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_parameter8
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_parameter9
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_ref_field
      importing
                value(iv_value) type lvc_rfname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_ref_table
      importing
                value(iv_value) type lvc_rtname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_txt_field
      importing
                value(iv_value) type lvc_fname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_roundfield
      importing
                value(iv_value) type lvc_rndfn
      returning value(r_column) type ref to zcl_falv_column.
    methods set_decimals_o
      importing
                value(iv_value) type lvc_decmls
      returning value(r_column) type ref to zcl_falv_column.
    methods set_decmlfield
      importing
                value(iv_value) type lvc_dfname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_dd_outlen
      importing
                value(iv_value) type lvc_ddlen
      returning value(r_column) type ref to zcl_falv_column.
    methods set_decimals
      importing
                value(iv_value) type decimals
      returning value(r_column) type ref to zcl_falv_column.
    methods set_coltext
      importing
                value(iv_value) type lvc_txtcol
      returning value(r_column) type ref to zcl_falv_column.
    methods set_scrtext_l
      importing
                value(iv_value) type scrtext_l
      returning value(r_column) type ref to zcl_falv_column.
    methods set_scrtext_m
      importing
                value(iv_value) type scrtext_m
      returning value(r_column) type ref to zcl_falv_column.
    methods set_scrtext_s
      importing
                value(iv_value) type scrtext_s
      returning value(r_column) type ref to zcl_falv_column.
    methods set_colddictxt
      importing
                value(iv_value) type lvc_ddict
      returning value(r_column) type ref to zcl_falv_column.
    methods set_selddictxt
      importing
                value(iv_value) type lvc_ddict
      returning value(r_column) type ref to zcl_falv_column.
    methods set_tipddictxt
      importing
                value(iv_value) type lvc_ddict
      returning value(r_column) type ref to zcl_falv_column.
    methods set_edit
      importing
                value(iv_value) type lvc_edit
      returning value(r_column) type ref to zcl_falv_column.
    methods set_tech_col
      importing
                value(iv_value) type lvc_tcol
      returning value(r_column) type ref to zcl_falv_column.
    methods set_tech_form
      importing
                value(iv_value) type lvc_tform
      returning value(r_column) type ref to zcl_falv_column.
    methods set_tech_comp
      importing
                value(iv_value) type lvc_tcomp
      returning value(r_column) type ref to zcl_falv_column.
    methods set_hier_cpos
      importing
                value(iv_value) type lvchcolpos
      returning value(r_column) type ref to zcl_falv_column.
    methods set_h_col_key
      importing
                value(iv_value) type tv_itmname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_h_select
      importing
                value(iv_value) type lvc_select
      returning value(r_column) type ref to zcl_falv_column.
    methods set_dd_roll
      importing
                value(iv_value) type rollname
      returning value(r_column) type ref to zcl_falv_column.
    methods set_dragdropid
      importing
                value(iv_value) type lvc_ddid
      returning value(r_column) type ref to zcl_falv_column.
    methods set_mac
      importing
                value(iv_value) type char01
      returning value(r_column) type ref to zcl_falv_column.
    methods set_indx_field
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_indx_cfiel
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_indx_qfiel
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_indx_ifiel
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_indx_round
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_indx_decml
      importing
                value(iv_value) type int4
      returning value(r_column) type ref to zcl_falv_column.
    methods set_get_style
      importing
                value(iv_value) type char01
      returning value(r_column) type ref to zcl_falv_column.
    methods set_mark
      importing
                value(iv_value) type char01
      returning value(r_column) type ref to zcl_falv_column.
    methods set_texts
      importing
                value(iv_text_s) type scrtext_s
                value(iv_text_m) type scrtext_m optional
                value(iv_text_l) type scrtext_l optional
      returning value(r_column)  type ref to zcl_falv_column.

    methods get_editable
      returning value(rv_editable) type abap_bool.
    methods get_readonly

      returning value(rv_read_only) type abap_bool.
    methods get_row_pos
      returning
        value(rv_value) type lvc_rowpos .
    methods get_col_pos
      returning
        value(rv_value) type lvc_colpos .
    methods get_fieldname
      returning
        value(rv_value) type lvc_fname .
    methods get_tabname
      returning
        value(rv_value) type lvc_tname .
    methods get_currency
      returning
        value(rv_value) type lvc_curr .
    methods get_cfieldname
      returning
        value(rv_value) type lvc_cfname .
    methods get_quantity
      returning
        value(rv_value) type lvc_quan .
    methods get_qfieldname
      returning
        value(rv_value) type lvc_qfname .
    methods get_ifieldname
      returning
        value(rv_value) type lvc_fname .
    methods get_round
      returning
        value(rv_value) type lvc_round .
    methods get_exponent
      returning
        value(rv_value) type lvc_expont .
    methods get_key
      returning
        value(rv_value) type lvc_key .
    methods get_key_sel
      returning
        value(rv_value) type lvc_keysel .
    methods get_icon
      returning
        value(rv_value) type lvc_icon .
    methods get_symbol
      returning
        value(rv_value) type lvc_symbol .
    methods get_checkbox
      returning
        value(rv_value) type lvc_checkb .
    methods get_just
      returning
        value(rv_value) type lvc_just .
    methods get_lzero
      returning
        value(rv_value) type lvc_lzero .
    methods get_no_sign
      returning
        value(rv_value) type lvc_nosign .
    methods get_no_zero
      returning
        value(rv_value) type lvc_nozero .
    methods get_no_convext
      returning
        value(rv_value) type lvc_noconv .
    methods get_edit_mask
      returning
        value(rv_value) type lvc_edtmsk .
    methods get_emphasize
      returning
        value(rv_value) type lvc_emphsz .
    methods get_color
      returning
        value(rv_value) type lvc_emphsz .
    methods get_fix_column
      returning
        value(rv_value) type lvc_fixcol .
    methods get_do_sum
      returning
        value(rv_value) type lvc_dosum .
    methods get_no_sum
      returning
        value(rv_value) type lvc_nosum .
    methods get_no_out
      returning
        value(rv_value) type lvc_noout .
    methods get_tech
      returning
        value(rv_value) type lvc_tech .
    methods get_outputlen
      returning
        value(rv_value) type lvc_outlen .
    methods get_convexit
      returning
        value(rv_value) type convexit .
    methods get_seltext
      returning
        value(rv_value) type lvc_txt .
    methods get_tooltip
      returning
        value(rv_value) type lvc_tip .
    methods get_rollname
      returning
        value(rv_value) type lvc_roll .
    methods get_datatype
      returning
        value(rv_value) type datatype_d .
    methods get_inttype
      returning
        value(rv_value) type inttype .
    methods get_intlen
      returning
        value(rv_value) type intlen .
    methods get_lowercase
      returning
        value(rv_value) type lowercase .
    methods get_reptext
      returning
        value(rv_value) type reptext .
    methods get_hier_level
      returning
        value(rv_value) type lvc_hierl .
    methods get_reprep
      returning
        value(rv_value) type lvc_crprp .
    methods get_domname
      returning
        value(rv_value) type domname .
    methods get_sp_group
      returning
        value(rv_value) type lvc_spgrp .
    methods get_hotspot
      returning
        value(rv_value) type lvc_hotspt .
    methods get_dfieldname
      returning
        value(rv_value) type lvcdbgfn .
    methods get_col_id
      returning
        value(rv_value) type lvc_colid .
    methods get_f4availabl
      returning
        value(rv_value) type ddf4avail .
    methods get_auto_value
      returning
        value(rv_value) type lvc_auto .
    methods get_checktable
      returning
        value(rv_value) type tabname .
    methods get_valexi
      returning
        value(rv_value) type valexi .
    methods get_web_field
      returning
        value(rv_value) type lvc_fname .
    methods get_href_hndl
      returning
        value(rv_value) type int4 .
    methods get_style
      returning
        value(rv_value) type lvc_style .
    methods get_style2
      returning
        value(rv_value) type lvc_style .
    methods get_style3
      returning
        value(rv_value) type lvc_style .
    methods get_style4
      returning
        value(rv_value) type lvc_style .
    methods get_drdn_hndl
      returning
        value(rv_value) type int4 .
    methods get_drdn_field
      returning
        value(rv_value) type lvc_fname .
    methods get_no_merging
      returning
        value(rv_value) type char01 .
    methods get_h_ftype
      returning
        value(rv_value) type lvc_ftype .
    methods get_col_opt
      returning
        value(rv_value) type lvc_colopt .
    methods get_no_init_ch
      returning
        value(rv_value) type char01 .
    methods get_drdn_alias
      returning
        value(rv_value) type char01 .
    methods get_decfloat_style
      returning
        value(rv_value) type outputstyle .
    methods get_parameter0
      returning
        value(rv_value) type char30 .
    methods get_parameter1
      returning
        value(rv_value) type char30 .
    methods get_parameter2
      returning
        value(rv_value) type char30 .
    methods get_parameter3
      returning
        value(rv_value) type char30 .
    methods get_parameter4
      returning
        value(rv_value) type char30 .
    methods get_parameter5
      returning
        value(rv_value) type int4 .
    methods get_parameter6
      returning
        value(rv_value) type int4 .
    methods get_parameter7
      returning
        value(rv_value) type int4 .
    methods get_parameter8
      returning
        value(rv_value) type int4 .
    methods get_parameter9
      returning
        value(rv_value) type int4 .
    methods get_ref_field
      returning
        value(rv_value) type lvc_rfname .
    methods get_ref_table
      returning
        value(rv_value) type lvc_rtname .
    methods get_txt_field
      returning
        value(rv_value) type lvc_fname .
    methods get_roundfield
      returning
        value(rv_value) type lvc_rndfn .
    methods get_decimals_o
      returning
        value(rv_value) type lvc_decmls .
    methods get_decmlfield
      returning
        value(rv_value) type lvc_dfname .
    methods get_dd_outlen
      returning
        value(rv_value) type lvc_ddlen .
    methods get_decimals
      returning
        value(rv_value) type decimals .
    methods get_coltext
      returning
        value(rv_value) type lvc_txtcol .
    methods get_scrtext_l
      returning
        value(rv_value) type scrtext_l .
    methods get_scrtext_m
      returning
        value(rv_value) type scrtext_m .
    methods get_scrtext_s
      returning
        value(rv_value) type scrtext_s .
    methods get_colddictxt
      returning
        value(rv_value) type lvc_ddict .
    methods get_selddictxt
      returning
        value(rv_value) type lvc_ddict .
    methods get_tipddictxt
      returning
        value(rv_value) type lvc_ddict .
    methods get_edit
      returning
        value(rv_value) type lvc_edit .
    methods get_tech_col
      returning
        value(rv_value) type lvc_tcol .
    methods get_tech_form
      returning
        value(rv_value) type lvc_tform .
    methods get_tech_comp
      returning
        value(rv_value) type lvc_tcomp .
    methods get_hier_cpos
      returning
        value(rv_value) type lvchcolpos .
    methods get_h_col_key
      returning
        value(rv_value) type tv_itmname .
    methods get_h_select
      returning
        value(rv_value) type lvc_select .
    methods get_dd_roll
      returning
        value(rv_value) type rollname .
    methods get_dragdropid
      returning
        value(rv_value) type lvc_ddid .
    methods get_mac
      returning
        value(rv_value) type char01 .
    methods get_indx_field
      returning
        value(rv_value) type int4 .
    methods get_indx_cfiel
      returning
        value(rv_value) type int4 .
    methods get_indx_qfiel
      returning
        value(rv_value) type int4 .
    methods get_indx_ifiel
      returning
        value(rv_value) type int4 .
    methods get_indx_round
      returning
        value(rv_value) type int4 .
    methods get_indx_decml
      returning
        value(rv_value) type int4 .
    methods get_get_style
      returning
        value(rv_value) type char01 .
    methods get_mark
      returning
        value(rv_value) type char01 .

  protected section.
  private section.

    data falv type ref to zcl_falv .

    methods change_setting
      importing
        value(iv_value)   type any
        value(iv_setting) type string .

    methods get_setting
      importing
        value(iv_setting) type string
      exporting
        value(e_value)    type any.
endclass.



class zcl_falv_column implementation.


  method change_setting.
    falv->get_frontend_fieldcatalog( importing et_fieldcatalog = falv->fcat ).
    assign falv->fcat[ fieldname = fieldname ] to field-symbol(<fcat>).
    if sy-subrc eq 0.
      data(fcat_field) = |<fcat>-{ iv_setting }|.
      assign (fcat_field) to field-symbol(<field>).
      if sy-subrc eq 0.
        <field> = iv_value.
      endif.
      falv->set_frontend_fieldcatalog( it_fieldcatalog = falv->fcat ).
    endif.
  endmethod.


  method get_setting.
    falv->get_frontend_fieldcatalog( importing et_fieldcatalog = falv->fcat ).
    assign falv->fcat[ fieldname = fieldname ] to field-symbol(<fcat>).
    if sy-subrc eq 0.
      data(fcat_field) = |<fcat>-{ iv_setting }|.
      assign (fcat_field) to field-symbol(<field>).
      if sy-subrc eq 0.
        e_value = <field>.
      endif.
    endif.
  endmethod.


  method constructor.
    fieldname = iv_fieldname.
    falv = io_falv.
  endmethod.


  method set_auto_value.
    change_setting( iv_value = iv_value iv_setting = 'AUTO_VALUE' ).
    r_column = me.
  endmethod.


  method set_cfieldname.
    change_setting( iv_value = iv_value iv_setting = 'CFIELDNAME' ).
    set_tech_form( 2 ).
    r_column = me.
  endmethod.


  method set_checkbox.
    change_setting( iv_value = iv_value iv_setting = 'CHECKBOX' ).
    r_column = me.
  endmethod.


  method set_checktable.
    change_setting( iv_value = iv_value iv_setting = 'CHECKTABLE' ).
    r_column = me.
  endmethod.


  method set_colddictxt.
    change_setting( iv_value = iv_value iv_setting = 'COLDDICTXT' ).
    r_column = me.
  endmethod.


  method set_color.
    set_emphasize( iv_value = iv_value ).
    r_column = me.
  endmethod.


  method set_coltext.
    change_setting( iv_value = iv_value iv_setting = 'COLTEXT' ).
    r_column = me.
  endmethod.


  method set_col_id.
    change_setting( iv_value = iv_value iv_setting = 'COL_ID' ).
    r_column = me.
  endmethod.


  method set_col_opt.
    change_setting( iv_value = iv_value iv_setting = 'COL_OPT' ).
    r_column = me.
  endmethod.


  method set_col_pos.
    falv->get_frontend_fieldcatalog( importing et_fieldcatalog = falv->fcat ).
    assign falv->fcat[ fieldname = fieldname ] to field-symbol(<current_column>).
    if sy-subrc eq 0.
      data(original_pos) = <current_column>-col_pos.
      sort falv->fcat by col_pos ascending.
      loop at falv->fcat assigning field-symbol(<fcat>) where col_pos ge iv_value.
        <fcat>-col_pos = <fcat>-col_pos + 1.
      endloop.
      <current_column>-col_pos = iv_value.
      sort falv->fcat by col_pos ascending.
    endif.
    falv->set_frontend_fieldcatalog( it_fieldcatalog = falv->fcat ).
    r_column = me.
  endmethod.


  method set_convexit.
    change_setting( iv_value = iv_value iv_setting = 'CONVEXIT' ).
    r_column = me.
  endmethod.


  method set_currency.
    change_setting( iv_value = iv_value iv_setting = 'CURRENCY' ).
    r_column = me.
  endmethod.


  method set_datatype.
    change_setting( iv_value = iv_value iv_setting = 'DATATYPE' ).
    r_column = me.
  endmethod.


  method set_dd_outlen.
    change_setting( iv_value = iv_value iv_setting = 'DD_OUTLEN' ).
    r_column = me.
  endmethod.


  method set_dd_roll.
    change_setting( iv_value = iv_value iv_setting = 'DD_ROLL' ).
    r_column = me.
  endmethod.


  method set_decfloat_style.
    change_setting( iv_value = iv_value iv_setting = 'DECFLOAT_STYLE' ).
    r_column = me.
  endmethod.


  method set_decimals.
    change_setting( iv_value = iv_value iv_setting = 'DECIMALS' ).
    r_column = me.
  endmethod.


  method set_decimals_o.
    change_setting( iv_value = iv_value iv_setting = 'DECIMALS_O' ).
    r_column = me.
  endmethod.


  method set_decmlfield.
    change_setting( iv_value = iv_value iv_setting = 'DECMLFIELD' ).
    r_column = me.
  endmethod.


  method set_dfieldname.
    change_setting( iv_value = iv_value iv_setting = 'DFIELDNAME' ).
    r_column = me.
  endmethod.


  method set_domname.
    change_setting( iv_value = iv_value iv_setting = 'DOMNAME' ).
    r_column = me.
  endmethod.


  method set_do_sum.
    change_setting( iv_value = iv_value iv_setting = 'DO_SUM' ).
    r_column = me.
  endmethod.


  method set_dragdropid.
    change_setting( iv_value = iv_value iv_setting = 'DRAGDROPID' ).
    r_column = me.
  endmethod.


  method set_drdn_alias.
    change_setting( iv_value = iv_value iv_setting = 'DRDN_ALIAS' ).
    r_column = me.
  endmethod.


  method set_drdn_field.
    change_setting( iv_value = iv_value iv_setting = 'DRDN_FIELD' ).
    r_column = me.
  endmethod.


  method set_drdn_hndl.
    data: lt_drop_down        type  lvc_t_drop
             ,ls_drop_down        like line of lt_drop_down
             ,lt_drop_down_alias  type lvc_t_dral
             ,ls_drop_down_alias  like line of lt_drop_down_alias
             ,lo_typedescr        type ref to cl_abap_typedescr
             ,lo_elemdescr        type ref to cl_abap_elemdescr
             ,lv_rollname         type lvc_roll
             ,lv_domname          type domname
             ,lt_fixed_values     type standard table of ddfixvalue with empty key
             ,ls_fixed_value      like line of lt_fixed_values
             .


    if ( ( it_drop_down       is not initial ) or
         ( it_drop_down_alias is not initial ) ).

      append lines of it_drop_down       to lt_drop_down.
      append lines of it_drop_down_alias to lt_drop_down_alias.

    else.
      if ( iv_use_domain_values eq abap_true ).
        lv_rollname = me->get_rollname( ).
        call method cl_abap_elemdescr=>describe_by_name
          exporting
            p_name         = lv_rollname
          receiving
            p_descr_ref    = lo_typedescr
          exceptions
            type_not_found = 1
            others         = 2.
        if sy-subrc eq 0.
          lo_elemdescr ?= lo_typedescr.

*          get_ddic_fixed_values
          call method lo_elemdescr->get_ddic_fixed_values
            receiving
              p_fixed_values = lt_fixed_values
            exceptions
              not_found      = 1
              no_ddic_type   = 2
              others         = 3.
          if sy-subrc eq 0.

            loop at lt_fixed_values into ls_fixed_value.
              if ( iv_use_alias eq abap_true ).
                clear: ls_drop_down_alias.

                ls_drop_down_alias-handle = iv_value.
                concatenate ls_fixed_value-ddtext '['
                    into ls_drop_down_alias-value separated by space.

                concatenate ls_drop_down_alias-value
                           ls_fixed_value-low ']'
                  into ls_drop_down_alias-value.

                ls_drop_down_alias-int_value = ls_fixed_value-low.
                append ls_drop_down_alias to lt_drop_down_alias.
              else.
                clear: ls_drop_down.

                ls_drop_down-handle = iv_value.
                ls_drop_down-value = ls_fixed_value-low.
                append ls_drop_down to lt_drop_down.
              endif.

            endloop.
          else.
          endif.

        endif.
      else.
      endif.
    endif.




    if ( ( lt_drop_down       is not initial ) or
         ( lt_drop_down_alias is not initial ) ).


      change_setting( iv_value = iv_value iv_setting = 'DRDN_HNDL' ).
      if ( iv_use_alias eq abap_true ).
        falv->set_drop_down_table(
          it_drop_down_alias = lt_drop_down_alias ).
        change_setting( iv_value = 'X' iv_setting = 'DRDN_ALIAS' ).
      else.
        falv->set_drop_down_table(
          it_drop_down = lt_drop_down
        ).
      endif.


    endif.
    r_column = me.
  endmethod.


  method set_edit.
    change_setting( iv_value = iv_value iv_setting = 'EDIT' ).
    r_column = me.
  endmethod.


  method set_editable.
    change_setting( iv_value = abap_true iv_setting = 'EDIT' ).
    r_column = me.
  endmethod.


  method set_edit_mask.
    change_setting( iv_value = iv_value iv_setting = 'EDIT_MASK' ).
    r_column = me.
  endmethod.


  method set_emphasize.
    change_setting( iv_value = iv_value iv_setting = 'EMPHASIZE' ).
    r_column = me.
  endmethod.


  method set_exponent.
    change_setting( iv_value = iv_value iv_setting = 'EXPONENT' ).
    r_column = me.
  endmethod.


  method set_f4availabl.
    change_setting( iv_value = iv_value iv_setting = 'F4AVAILABL' ).
    r_column = me.
  endmethod.


  method set_fieldname.
    change_setting( iv_value = iv_value iv_setting = 'FIELDNAME' ).
    r_column = me.
  endmethod.


  method set_fix_column.
    change_setting( iv_value = iv_value iv_setting = 'FIX_COLUMN' ).
    r_column = me.
  endmethod.


  method set_get_style.
    change_setting( iv_value = iv_value iv_setting = 'GET_STYLE' ).
    r_column = me.
  endmethod.


  method set_hier_cpos.
    change_setting( iv_value = iv_value iv_setting = 'HIER_CPOS' ).
    r_column = me.
  endmethod.


  method set_hier_level.
    change_setting( iv_value = iv_value iv_setting = 'HIER_LEVEL' ).
    r_column = me.
  endmethod.


  method set_hotspot.
    change_setting( iv_value = iv_value iv_setting = 'HOTSPOT' ).
    r_column = me.
  endmethod.


  method set_href_hndl.
    change_setting( iv_value = iv_value iv_setting = 'HREF_HNDL' ).
    r_column = me.
  endmethod.


  method set_h_col_key.
    change_setting( iv_value = iv_value iv_setting = 'H_COL_KEY' ).
    r_column = me.
  endmethod.


  method set_h_ftype.
    change_setting( iv_value = iv_value iv_setting = 'H_FTYPE' ).
    r_column = me.
  endmethod.


  method set_h_select.
    change_setting( iv_value = iv_value iv_setting = 'H_SELECT' ).
    r_column = me.
  endmethod.


  method set_icon.
    change_setting( iv_value = iv_value iv_setting = 'ICON' ).
    r_column = me.
  endmethod.


  method set_ifieldname.
    change_setting( iv_value = iv_value iv_setting = 'IFIELDNAME' ).
    r_column = me.
  endmethod.


  method set_indx_cfiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_CFIEL' ).
    r_column = me.
  endmethod.


  method set_indx_decml.
    change_setting( iv_value = iv_value iv_setting = 'INDX_DECML' ).
    r_column = me.
  endmethod.


  method set_indx_field.
    change_setting( iv_value = iv_value iv_setting = 'INDX_FIELD' ).
    r_column = me.
  endmethod.


  method set_indx_ifiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_IFIEL' ).
    r_column = me.
  endmethod.


  method set_indx_qfiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_QFIEL' ).
    r_column = me.
  endmethod.


  method set_indx_round.
    change_setting( iv_value = iv_value iv_setting = 'INDX_ROUND' ).
    r_column = me.
  endmethod.


  method set_intlen.
    change_setting( iv_value = iv_value iv_setting = 'INTLEN' ).
    r_column = me.
  endmethod.


  method set_inttype.
    change_setting( iv_value = iv_value iv_setting = 'INTTYPE' ).
    r_column = me.
  endmethod.


  method set_just.
    change_setting( iv_value = iv_value iv_setting = 'JUST' ).
    r_column = me.
  endmethod.


  method set_key.
    change_setting( iv_value = iv_value iv_setting = 'KEY' ).
    r_column = me.
  endmethod.


  method set_key_sel.
    change_setting( iv_value = iv_value iv_setting = 'KEY_SEL' ).
    r_column = me.
  endmethod.


  method set_lowercase.
    change_setting( iv_value = iv_value iv_setting = 'LOWERCASE' ).
    r_column = me.
  endmethod.


  method set_lzero.
    change_setting( iv_value = iv_value iv_setting = 'LZERO' ).
    r_column = me.
  endmethod.


  method set_mac.
    change_setting( iv_value = iv_value iv_setting = 'MAC' ).
    r_column = me.
  endmethod.


  method set_mark.
    change_setting( iv_value = iv_value iv_setting = 'MARK' ).
    r_column = me.
  endmethod.


  method set_texts.
    data(lv_text_l) = cond scrtext_l( when iv_text_l is not initial then iv_text_l
                                      when iv_text_m is not initial then iv_text_m
                                      else iv_text_s ).
    data(lv_text_m) = cond scrtext_m( when iv_text_m is not initial then iv_text_m
                                      else iv_text_s ).
    set_scrtext_s( iv_text_s ).
    set_scrtext_m( lv_text_m ).
    set_scrtext_l( lv_text_l ).
    set_tooltip( lv_text_l ) .
    set_coltext( lv_text_l ).
    set_seltext( lv_text_l ).
    set_reptext( lv_text_l && '' ).

    r_column = me.
  endmethod.


  method set_no_convext.
    change_setting( iv_value = iv_value iv_setting = 'NO_CONVEXT' ).
    r_column = me.
  endmethod.


  method set_no_init_ch.
    change_setting( iv_value = iv_value iv_setting = 'NO_INIT_CH' ).
    r_column = me.
  endmethod.


  method set_no_merging.
    change_setting( iv_value = iv_value iv_setting = 'NO_MERGING' ).
    r_column = me.
  endmethod.


  method set_no_out.
    change_setting( iv_value = iv_value iv_setting = 'NO_OUT' ).
    r_column = me.
  endmethod.


  method set_no_sign.
    change_setting( iv_value = iv_value iv_setting = 'NO_SIGN' ).
    r_column = me.
  endmethod.


  method set_no_sum.
    change_setting( iv_value = iv_value iv_setting = 'NO_SUM' ).
    r_column = me.
  endmethod.


  method set_no_zero.
    change_setting( iv_value = iv_value iv_setting = 'NO_ZERO' ).
    r_column = me.
  endmethod.


  method set_outputlen.
    change_setting( iv_value = iv_value iv_setting = 'OUTPUTLEN' ).
    r_column = me.
  endmethod.


  method set_parameter0.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER0' ).
    r_column = me.
  endmethod.


  method set_parameter1.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER1' ).
    r_column = me.
  endmethod.


  method set_parameter2.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER2' ).
    r_column = me.
  endmethod.


  method set_parameter3.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER3' ).
    r_column = me.
  endmethod.


  method set_parameter4.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER4' ).
    r_column = me.
  endmethod.


  method set_parameter5.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER5' ).
    r_column = me.
  endmethod.


  method set_parameter6.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER6' ).
    r_column = me.
  endmethod.


  method set_parameter7.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER7' ).
    r_column = me.
  endmethod.


  method set_parameter8.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER8' ).
    r_column = me.
  endmethod.


  method set_parameter9.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER9' ).
    r_column = me.
  endmethod.


  method set_qfieldname.
    change_setting( iv_value = iv_value iv_setting = 'QFIELDNAME' ).
    r_column = me.
  endmethod.


  method set_quantity.
    change_setting( iv_value = iv_value iv_setting = 'QUANTITY' ).
    r_column = me.
  endmethod.


  method set_readonly.
    change_setting( iv_value = abap_false iv_setting = 'EDIT' ).
    r_column = me.
  endmethod.


  method set_ref_field.
    change_setting( iv_value = iv_value iv_setting = 'REF_FIELD' ).
    r_column = me.
  endmethod.


  method set_ref_table.
    change_setting( iv_value = iv_value iv_setting = 'REF_TABLE' ).
    r_column = me.
  endmethod.


  method set_reprep.
    change_setting( iv_value = iv_value iv_setting = 'REPREP' ).
    r_column = me.
  endmethod.


  method set_reptext.
    change_setting( iv_value = iv_value iv_setting = 'REPTEXT' ).
    r_column = me.
  endmethod.


  method set_rollname.
    change_setting( iv_value = iv_value iv_setting = 'ROLLNAME' ).
    r_column = me.
  endmethod.


  method set_round.
    change_setting( iv_value = iv_value iv_setting = 'ROUND' ).
    r_column = me.
  endmethod.


  method set_roundfield.
    change_setting( iv_value = iv_value iv_setting = 'ROUNDFIELD' ).
    r_column = me.
  endmethod.


  method set_row_pos.
    change_setting( iv_value = iv_value iv_setting = 'ROW_POS' ).
    r_column = me.
  endmethod.


  method set_scrtext_l.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_L' ).
    r_column = me.
  endmethod.


  method set_scrtext_m.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_M' ).
    r_column = me.
  endmethod.


  method set_scrtext_s.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_S' ).
    r_column = me.
  endmethod.


  method set_selddictxt.
    change_setting( iv_value = iv_value iv_setting = 'SELDDICTXT' ).
    r_column = me.
  endmethod.


  method set_seltext.
    change_setting( iv_value = iv_value iv_setting = 'SELTEXT' ).
    r_column = me.
  endmethod.


  method set_sp_group.
    change_setting( iv_value = iv_value iv_setting = 'SP_GROUP' ).
    r_column = me.
  endmethod.


  method set_style.
    change_setting( iv_value = iv_value iv_setting = 'STYLE' ).
    r_column = me.
  endmethod.


  method set_style2.
    change_setting( iv_value = iv_value iv_setting = 'STYLE2' ).
    r_column = me.
  endmethod.


  method set_style3.
    change_setting( iv_value = iv_value iv_setting = 'STYLE3' ).
    r_column = me.
  endmethod.


  method set_style4.
    change_setting( iv_value = iv_value iv_setting = 'STYLE4' ).
    r_column = me.
  endmethod.


  method set_symbol.
    change_setting( iv_value = iv_value iv_setting = 'SYMBOL' ).
    r_column = me.
  endmethod.


  method set_tabname.
    change_setting( iv_value = iv_value iv_setting = 'TABNAME' ).
    r_column = me.
  endmethod.


  method set_tech.
    change_setting( iv_value = iv_value iv_setting = 'TECH' ).
    r_column = me.
  endmethod.


  method set_tech_col.
    change_setting( iv_value = iv_value iv_setting = 'TECH_COL' ).
    r_column = me.
  endmethod.


  method set_tech_comp.
    change_setting( iv_value = iv_value iv_setting = 'TECH_COMP' ).
    r_column = me.
  endmethod.


  method set_tech_form.
    change_setting( iv_value = iv_value iv_setting = 'TECH_FORM' ).
    r_column = me.
  endmethod.


  method set_tipddictxt.
    change_setting( iv_value = iv_value iv_setting = 'TIPDDICTXT' ).
    r_column = me.
  endmethod.


  method set_tooltip.
    change_setting( iv_value = iv_value iv_setting = 'TOOLTIP' ).
    r_column = me.
  endmethod.


  method set_txt_field.
    change_setting( iv_value = iv_value iv_setting = 'TXT_FIELD' ).
    r_column = me.
  endmethod.


  method set_valexi.
    change_setting( iv_value = iv_value iv_setting = 'VALEXI' ).
    r_column = me.
  endmethod.


  method set_web_field.
    change_setting( iv_value = iv_value iv_setting = 'WEB_FIELD' ).
    r_column = me.
  endmethod.


  method get_auto_value.
    get_setting( exporting iv_setting = 'AUTO_VALUE' importing e_value = rv_value ).
  endmethod.


  method get_cfieldname.
    get_setting( exporting iv_setting = 'CFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_checkbox.
    get_setting( exporting iv_setting = 'CHECKBOX' importing e_value = rv_value ).
  endmethod.


  method get_checktable.
    get_setting( exporting iv_setting = 'CHECKTABLE' importing e_value = rv_value ).
  endmethod.


  method get_colddictxt.
    get_setting( exporting iv_setting = 'COLDDICTXT' importing e_value = rv_value ).
  endmethod.


  method get_color.
    get_emphasize( receiving rv_value = rv_value ).
  endmethod.


  method get_coltext.
    get_setting( exporting iv_setting = 'COLTEXT' importing e_value = rv_value ).
  endmethod.


  method get_col_id.
    get_setting( exporting iv_setting = 'COL_ID' importing e_value = rv_value ).
  endmethod.


  method get_col_opt.
    get_setting( exporting iv_setting = 'COL_OPT' importing e_value = rv_value ).
  endmethod.


  method get_col_pos.
    get_setting( exporting iv_setting = 'COL_POS' importing e_value = rv_value ).
  endmethod.


  method get_convexit.
    get_setting( exporting iv_setting = 'CONVEXIT' importing e_value = rv_value ).
  endmethod.


  method get_currency.
    get_setting( exporting iv_setting = 'CURRENCY' importing e_value = rv_value ).
  endmethod.


  method get_datatype.
    get_setting( exporting iv_setting = 'DATATYPE' importing e_value = rv_value ).
  endmethod.


  method get_dd_outlen.
    get_setting( exporting iv_setting = 'DD_OUTLEN' importing e_value = rv_value ).
  endmethod.


  method get_dd_roll.
    get_setting( exporting iv_setting = 'DD_ROLL' importing e_value = rv_value ).
  endmethod.


  method get_decfloat_style.
    get_setting( exporting iv_setting = 'DECFLOAT_STYLE' importing e_value = rv_value ).
  endmethod.


  method get_decimals.
    get_setting( exporting iv_setting = 'DECIMALS' importing e_value = rv_value ).
  endmethod.


  method get_decimals_o.
    get_setting( exporting iv_setting = 'DECIMALS_O' importing e_value = rv_value ).
  endmethod.


  method get_decmlfield.
    get_setting( exporting iv_setting = 'DECMLFIELD' importing e_value = rv_value ).
  endmethod.


  method get_dfieldname.
    get_setting( exporting iv_setting = 'DFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_domname.
    get_setting( exporting iv_setting = 'DOMNAME' importing e_value = rv_value ).
  endmethod.


  method get_do_sum.
    get_setting( exporting iv_setting = 'DO_SUM' importing e_value = rv_value ).
  endmethod.


  method get_dragdropid.
    get_setting( exporting iv_setting = 'DRAGDROPID' importing e_value = rv_value ).
  endmethod.


  method get_drdn_alias.
    get_setting( exporting iv_setting = 'DRDN_ALIAS' importing e_value = rv_value ).
  endmethod.


  method get_drdn_field.
    get_setting( exporting iv_setting = 'DRDN_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_drdn_hndl.
    get_setting( exporting iv_setting = 'DRDN_HNDL' importing e_value = rv_value ).
  endmethod.


  method get_edit.
    get_setting( exporting iv_setting = 'EDIT' importing e_value = rv_value ).
  endmethod.


  method get_editable.
    get_setting( exporting iv_setting = 'EDIT' importing e_value = rv_editable ).
  endmethod.


  method get_edit_mask.
    get_setting( exporting iv_setting = 'EDIT_MASK' importing e_value = rv_value ).
  endmethod.


  method get_emphasize.
    get_setting( exporting iv_setting = 'EMPHASIZE' importing e_value = rv_value ).
  endmethod.


  method get_exponent.
    get_setting( exporting iv_setting = 'EXPONENT' importing e_value = rv_value ).
  endmethod.


  method get_f4availabl.
    get_setting( exporting iv_setting = 'F4AVAILABL' importing e_value = rv_value ).
  endmethod.


  method get_fieldname.
    get_setting( exporting iv_setting = 'FIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_fix_column.
    get_setting( exporting iv_setting = 'FIX_COLUMN' importing e_value = rv_value ).
  endmethod.


  method get_get_style.
    get_setting( exporting iv_setting = 'GET_STYLE' importing e_value = rv_value ).
  endmethod.


  method get_hier_cpos.
    get_setting( exporting iv_setting = 'HIER_CPOS' importing e_value = rv_value ).
  endmethod.


  method get_hier_level.
    get_setting( exporting iv_setting = 'HIER_LEVEL' importing e_value = rv_value ).
  endmethod.


  method get_hotspot.
    get_setting( exporting iv_setting = 'HOTSPOT' importing e_value = rv_value ).
  endmethod.


  method get_href_hndl.
    get_setting( exporting iv_setting = 'HREF_HNDL' importing e_value = rv_value ).
  endmethod.


  method get_h_col_key.
    get_setting( exporting iv_setting = 'H_COL_KEY' importing e_value = rv_value ).
  endmethod.


  method get_h_ftype.
    get_setting( exporting iv_setting = 'H_FTYPE' importing e_value = rv_value ).
  endmethod.


  method get_h_select.
    get_setting( exporting iv_setting = 'H_SELECT' importing e_value = rv_value ).
  endmethod.


  method get_icon.
    get_setting( exporting iv_setting = 'ICON' importing e_value = rv_value ).
  endmethod.


  method get_ifieldname.
    get_setting( exporting iv_setting = 'IFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_indx_cfiel.
    get_setting( exporting iv_setting = 'INDX_CFIEL' importing e_value = rv_value ).
  endmethod.


  method get_indx_decml.
    get_setting( exporting iv_setting = 'INDX_DECML' importing e_value = rv_value ).
  endmethod.


  method get_indx_field.
    get_setting( exporting iv_setting = 'INDX_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_indx_ifiel.
    get_setting( exporting iv_setting = 'INDX_IFIEL' importing e_value = rv_value ).
  endmethod.


  method get_indx_qfiel.
    get_setting( exporting iv_setting = 'INDX_QFIEL' importing e_value = rv_value ).
  endmethod.


  method get_indx_round.
    get_setting( exporting iv_setting = 'INDX_ROUND' importing e_value = rv_value ).
  endmethod.


  method get_intlen.
    get_setting( exporting iv_setting = 'INTLEN' importing e_value = rv_value ).
  endmethod.


  method get_inttype.
    get_setting( exporting iv_setting = 'INTTYPE' importing e_value = rv_value ).
  endmethod.


  method get_just.
    get_setting( exporting iv_setting = 'JUST' importing e_value = rv_value ).
  endmethod.


  method get_key.
    get_setting( exporting iv_setting = 'KEY' importing e_value = rv_value ).
  endmethod.


  method get_key_sel.
    get_setting( exporting iv_setting = 'KEY_SEL' importing e_value = rv_value ).
  endmethod.


  method get_lowercase.
    get_setting( exporting iv_setting = 'LOWERCASE' importing e_value = rv_value ).
  endmethod.


  method get_lzero.
    get_setting( exporting iv_setting = 'LZERO' importing e_value = rv_value ).
  endmethod.


  method get_mac.
    get_setting( exporting iv_setting = 'MAC' importing e_value = rv_value ).
  endmethod.


  method get_mark.
    get_setting( exporting iv_setting = 'MARK' importing e_value = rv_value ).
  endmethod.


  method get_no_convext.
    get_setting( exporting iv_setting = 'NO_CONVEXT' importing e_value = rv_value ).
  endmethod.


  method get_no_init_ch.
    get_setting( exporting iv_setting = 'NO_INIT_CH' importing e_value = rv_value ).
  endmethod.


  method get_no_merging.
    get_setting( exporting iv_setting = 'NO_MERGING' importing e_value = rv_value ).
  endmethod.


  method get_no_out.
    get_setting( exporting iv_setting = 'NO_OUT' importing e_value = rv_value ).
  endmethod.


  method get_no_sign.
    get_setting( exporting iv_setting = 'NO_SIGN' importing e_value = rv_value ).
  endmethod.


  method get_no_sum.
    get_setting( exporting iv_setting = 'NO_SUM' importing e_value = rv_value ).
  endmethod.


  method get_no_zero.
    get_setting( exporting iv_setting = 'NO_ZERO' importing e_value = rv_value ).
  endmethod.


  method get_outputlen.
    get_setting( exporting iv_setting = 'OUTPUTLEN' importing e_value = rv_value ).
  endmethod.


  method get_parameter0.
    get_setting( exporting iv_setting = 'PARAMETER0' importing e_value = rv_value ).
  endmethod.


  method get_parameter1.
    get_setting( exporting iv_setting = 'PARAMETER1' importing e_value = rv_value ).
  endmethod.


  method get_parameter2.
    get_setting( exporting iv_setting = 'PARAMETER2' importing e_value = rv_value ).
  endmethod.


  method get_parameter3.
    get_setting( exporting iv_setting = 'PARAMETER3' importing e_value = rv_value ).
  endmethod.


  method get_parameter4.
    get_setting( exporting iv_setting = 'PARAMETER4' importing e_value = rv_value ).
  endmethod.


  method get_parameter5.
    get_setting( exporting iv_setting = 'PARAMETER5' importing e_value = rv_value ).
  endmethod.


  method get_parameter6.
    get_setting( exporting iv_setting = 'PARAMETER6' importing e_value = rv_value ).
  endmethod.


  method get_parameter7.
    get_setting( exporting iv_setting = 'PARAMETER7' importing e_value = rv_value ).
  endmethod.


  method get_parameter8.
    get_setting( exporting iv_setting = 'PARAMETER8' importing e_value = rv_value ).
  endmethod.


  method get_parameter9.
    get_setting( exporting iv_setting = 'PARAMETER9' importing e_value = rv_value ).
  endmethod.


  method get_qfieldname.
    get_setting( exporting iv_setting = 'QFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_quantity.
    get_setting( exporting iv_setting = 'QUANTITY' importing e_value = rv_value ).
  endmethod.


  method get_readonly.
    get_setting( exporting iv_setting = 'EDIT' importing e_value = rv_read_only ).
    rv_read_only = switch #( rv_read_only when abap_true then abap_false
                                          when abap_false then abap_true ).
  endmethod.


  method get_ref_field.
    get_setting( exporting iv_setting = 'REF_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_ref_table.
    get_setting( exporting iv_setting = 'REF_TABLE' importing e_value = rv_value ).
  endmethod.


  method get_reprep.
    get_setting( exporting iv_setting = 'REPREP' importing e_value = rv_value ).
  endmethod.


  method get_reptext.
    get_setting( exporting iv_setting = 'REPTEXT' importing e_value = rv_value ).
  endmethod.


  method get_rollname.
    get_setting( exporting iv_setting = 'ROLLNAME' importing e_value = rv_value ).
  endmethod.


  method get_round.
    get_setting( exporting iv_setting = 'ROUND' importing e_value = rv_value ).
  endmethod.


  method get_roundfield.
    get_setting( exporting iv_setting = 'ROUNDFIELD' importing e_value = rv_value ).
  endmethod.


  method get_row_pos.
    get_setting( exporting iv_setting = 'ROW_POS' importing e_value = rv_value ).
  endmethod.


  method get_scrtext_l.
    get_setting( exporting iv_setting = 'SCRTEXT_L' importing e_value = rv_value ).
  endmethod.


  method get_scrtext_m.
    get_setting( exporting iv_setting = 'SCRTEXT_M' importing e_value = rv_value ).
  endmethod.


  method get_scrtext_s.
    get_setting( exporting iv_setting = 'SCRTEXT_S' importing e_value = rv_value ).
  endmethod.


  method get_selddictxt.
    get_setting( exporting iv_setting = 'SELDDICTXT' importing e_value = rv_value ).
  endmethod.


  method get_seltext.
    get_setting( exporting iv_setting = 'SELTEXT' importing e_value = rv_value ).
  endmethod.


  method get_sp_group.
    get_setting( exporting iv_setting = 'SP_GROUP' importing e_value = rv_value ).
  endmethod.


  method get_style.
    get_setting( exporting iv_setting = 'STYLE' importing e_value = rv_value ).
  endmethod.


  method get_style2.
    get_setting( exporting iv_setting = 'STYLE2' importing e_value = rv_value ).
  endmethod.


  method get_style3.
    get_setting( exporting iv_setting = 'STYLE3' importing e_value = rv_value ).
  endmethod.


  method get_style4.
    get_setting( exporting iv_setting = 'STYLE4' importing e_value = rv_value ).
  endmethod.


  method get_symbol.
    get_setting( exporting iv_setting = 'SYMBOL' importing e_value = rv_value ).
  endmethod.


  method get_tabname.
    get_setting( exporting iv_setting = 'TABNAME' importing e_value = rv_value ).
  endmethod.


  method get_tech.
    get_setting( exporting iv_setting = 'TECH' importing e_value = rv_value ).
  endmethod.


  method get_tech_col.
    get_setting( exporting iv_setting = 'TECH_COL' importing e_value = rv_value ).
  endmethod.


  method get_tech_comp.
    get_setting( exporting iv_setting = 'TECH_COMP' importing e_value = rv_value ).
  endmethod.


  method get_tech_form.
    get_setting( exporting iv_setting = 'TECH_FORM' importing e_value = rv_value ).
  endmethod.


  method get_tipddictxt.
    get_setting( exporting iv_setting = 'TIPDDICTXT' importing e_value = rv_value ).
  endmethod.


  method get_tooltip.
    get_setting( exporting iv_setting = 'TOOLTIP' importing e_value = rv_value ).
  endmethod.


  method get_txt_field.
    get_setting( exporting iv_setting = 'TXT_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_valexi.
    get_setting( exporting iv_setting = 'VALEXI' importing e_value = rv_value ).
  endmethod.


  method get_web_field.
    get_setting( exporting iv_setting = 'WEB_FIELD' importing e_value = rv_value ).
  endmethod.
endclass.
