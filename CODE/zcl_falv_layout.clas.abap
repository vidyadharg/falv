CLASS zcl_falv_layout DEFINITION
  PUBLIC
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_falv.

  PUBLIC SECTION.
    DATA mark_field TYPE lvc_fname READ-ONLY.

    METHODS constructor
      IMPORTING io_falv TYPE REF TO zcl_falv.

    METHODS set_zebra
      IMPORTING VALUE(iv_value) TYPE lvc_zebra
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_edit
      IMPORTING VALUE(iv_value) TYPE lvc_edit
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_edit_mode
      IMPORTING VALUE(iv_value) TYPE lvc_edmo
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_keyfix
      IMPORTING VALUE(iv_value) TYPE lvc_nokfix
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_frontend
      IMPORTING VALUE(iv_value) TYPE lvc_front
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_object_key
      IMPORTING VALUE(iv_value) TYPE bds_typeid
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_doc_id
      IMPORTING VALUE(iv_value) TYPE bds_docid
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_template
      IMPORTING VALUE(iv_value) TYPE bds_filena
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_language
      IMPORTING VALUE(iv_value) TYPE lang
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_graphics
      IMPORTING VALUE(iv_value) TYPE guid_32
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_smalltitle
      IMPORTING VALUE(iv_value) TYPE lvc_titsz
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_hgridln
      IMPORTING VALUE(iv_value) TYPE lvc_hgrid
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_vgridln
      IMPORTING VALUE(iv_value) TYPE lvc_vgrid
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_headers
      IMPORTING VALUE(iv_value) TYPE lvc_heads
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_merging
      IMPORTING VALUE(iv_value) TYPE lvc_merge
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_cwidth_opt
      IMPORTING VALUE(iv_value) TYPE lvc_cwo
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_totals_bef
      IMPORTING VALUE(iv_value) TYPE lvc_totbef
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_totarr
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_totexp
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_rowmove
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_rowins
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_colexpd
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_f4
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_countfname
      IMPORTING VALUE(iv_value) TYPE lvc_fname
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_col_opt
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_val_data
      IMPORTING VALUE(iv_value) TYPE char01
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_blob_scope
      IMPORTING VALUE(iv_value) TYPE salv_bs_blob_scope
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_blob_flavour
      IMPORTING VALUE(iv_value) TYPE salv_bs_blob_flavour
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_blob_name
      IMPORTING VALUE(iv_value) TYPE salv_bs_blob_name
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_blob_key
      IMPORTING VALUE(iv_value) TYPE slis_blob_key
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_blob_type
      IMPORTING VALUE(iv_value) TYPE slis_blob_type
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_stylefname
      IMPORTING VALUE(iv_value) TYPE lvc_fname
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_rowmark
      IMPORTING VALUE(iv_value) TYPE lvc_rowmk
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_toolbar
      IMPORTING VALUE(iv_value) TYPE lvc_toolb
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_grid_title
      IMPORTING VALUE(iv_value) TYPE lvc_title
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_sel_mode
      IMPORTING VALUE(iv_value) TYPE lvc_libox
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_box_fname
      IMPORTING VALUE(iv_value) TYPE lvc_fname
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_sgl_clk_hd
      IMPORTING VALUE(iv_value) TYPE lvc_sglclh
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_totline
      IMPORTING VALUE(iv_value) TYPE lvc_nototl
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_numc_total
      IMPORTING VALUE(iv_value) TYPE lvc_numcto
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_utsplit
      IMPORTING VALUE(iv_value) TYPE lvc_unitsp
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_excp_fname
      IMPORTING VALUE(iv_value) TYPE lvc_exfnm
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_excp_rolln
      IMPORTING VALUE(iv_value) TYPE lvc_exrol
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_excp_conds
      IMPORTING VALUE(iv_value) TYPE lvc_excon
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_excp_led
      IMPORTING VALUE(iv_value) TYPE lvc_exled
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_excp_group
      IMPORTING VALUE(iv_value) TYPE lvc_exgrp
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_detailinit
      IMPORTING VALUE(iv_value) TYPE lvc_detini
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_detailtitl
      IMPORTING VALUE(iv_value) TYPE lvc_dettit
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_keyhot
      IMPORTING VALUE(iv_value) TYPE lvc_keyhot
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_no_author
      IMPORTING VALUE(iv_value) TYPE lvc_noauth
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_xifunckey
      IMPORTING VALUE(iv_value) TYPE aqs_xikey
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_xidirect
      IMPORTING VALUE(iv_value) TYPE flag
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_s_dragdrop
      IMPORTING VALUE(iv_value) TYPE lvc_s_dd01
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_info_fname
      IMPORTING VALUE(iv_value) TYPE lvc_cifnm
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_ctab_fname
      IMPORTING VALUE(iv_value) TYPE lvc_ctfnm
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_weblook
      IMPORTING VALUE(iv_value) TYPE lvc_look
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_webstyle
      IMPORTING VALUE(iv_value) TYPE lvc_style
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_webrows
      IMPORTING VALUE(iv_value) TYPE lvc_webrow
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_webxwidth
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

    METHODS set_webxheight
      IMPORTING VALUE(iv_value) TYPE int4
      RETURNING VALUE(r_layout) TYPE REF TO zcl_falv_layout.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA falv               TYPE REF TO zcl_falv.
    "! Deletes all buttons except the once passed in delete_all_buttons
    "! method
    DATA delete_all_buttons TYPE abap_bool.

    METHODS change_setting
      IMPORTING VALUE(iv_value)   TYPE any
                VALUE(iv_setting) TYPE string.
ENDCLASS.


CLASS zcl_falv_layout IMPLEMENTATION.
  METHOD change_setting.
    falv->get_frontend_layout( IMPORTING es_layout = falv->lvc_layout ).
    DATA(layout_field) = |falv->lvc_layout-{ iv_setting }|.
    ASSIGN (layout_field) TO FIELD-SYMBOL(<field>).
    IF sy-subrc = 0.
      <field> = iv_value.
    ENDIF.
    falv->set_frontend_layout( is_layout = falv->lvc_layout  ).
  ENDMETHOD.

  METHOD constructor.
    falv = io_falv.
  ENDMETHOD.

  METHOD set_blob_flavour.
    change_setting( iv_value   = iv_value
                    iv_setting = 'BLOB_FLAVOUR' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_blob_key.
    change_setting( iv_value   = iv_value
                    iv_setting = 'BLOB_KEY' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_blob_name.
    change_setting( iv_value   = iv_value
                    iv_setting = 'BLOB_NAME' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_blob_scope.
    change_setting( iv_value   = iv_value
                    iv_setting = 'BLOB_SCOPE' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_blob_type.
    change_setting( iv_value   = iv_value
                    iv_setting = 'BLOB_TYPE' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_box_fname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'BOX_FNAME' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_col_opt.
    change_setting( iv_value   = iv_value
                    iv_setting = 'COL_OPT' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_countfname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'COUNTFNAME' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_ctab_fname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'CTAB_FNAME' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_cwidth_opt.
    change_setting( iv_value   = iv_value
                    iv_setting = 'CWIDTH_OPT' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_detailinit.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DETAILINIT' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_detailtitl.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DETAILTITL' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_doc_id.
    change_setting( iv_value   = iv_value
                    iv_setting = 'DOC_ID' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_edit.
    change_setting( iv_value   = iv_value
                    iv_setting = 'EDIT' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_edit_mode.
    change_setting( iv_value   = iv_value
                    iv_setting = 'EDIT_MODE' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_excp_conds.
    change_setting( iv_value   = iv_value
                    iv_setting = 'EXCP_CONDS' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_excp_fname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'EXCP_FNAME' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_excp_group.
    change_setting( iv_value   = iv_value
                    iv_setting = 'EXCP_GROUP' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_excp_led.
    change_setting( iv_value   = iv_value
                    iv_setting = 'EXCP_LED' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_excp_rolln.
    change_setting( iv_value   = iv_value
                    iv_setting = 'EXCP_ROLLN' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_frontend.
    change_setting( iv_value   = iv_value
                    iv_setting = 'FRONTEND' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_graphics.
    change_setting( iv_value   = iv_value
                    iv_setting = 'GRAPHICS' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_grid_title.
    change_setting( iv_value   = iv_value
                    iv_setting = 'GRID_TITLE' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_info_fname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'INFO_FNAME' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_keyhot.
    change_setting( iv_value   = iv_value
                    iv_setting = 'KEYHOT' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_language.
    change_setting( iv_value   = iv_value
                    iv_setting = 'LANGUAGE' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_author.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_AUTHOR' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_colexpd.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_COLEXPD' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_f4.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_F4' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_headers.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_HEADERS' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_hgridln.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_HGRIDLN' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_keyfix.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_KEYFIX' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_merging.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_MERGING' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_rowins.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_ROWINS' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_rowmark.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_ROWMARK' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_rowmove.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_ROWMOVE' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_toolbar.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_TOOLBAR' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_totarr.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_TOTARR' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_totexp.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_TOTEXP' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_totline.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_TOTLINE' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_utsplit.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_UTSPLIT' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_no_vgridln.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NO_VGRIDLN' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_numc_total.
    change_setting( iv_value   = iv_value
                    iv_setting = 'NUMC_TOTAL' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_object_key.
    change_setting( iv_value   = iv_value
                    iv_setting = 'OBJECT_KEY' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_sel_mode.
    change_setting( iv_value   = iv_value
                    iv_setting = 'SEL_MODE' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_sgl_clk_hd.
    change_setting( iv_value   = iv_value
                    iv_setting = 'SGL_CLK_HD' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_smalltitle.
    change_setting( iv_value   = iv_value
                    iv_setting = 'SMALLTITLE' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_stylefname.
    change_setting( iv_value   = iv_value
                    iv_setting = 'STYLEFNAME' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_s_dragdrop.
    change_setting( iv_value   = iv_value
                    iv_setting = 'S_DRAGDROP' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_template.
    change_setting( iv_value   = iv_value
                    iv_setting = 'TEMPLATE' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_totals_bef.
    change_setting( iv_value   = iv_value
                    iv_setting = 'TOTALS_BEF' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_val_data.
    change_setting( iv_value   = iv_value
                    iv_setting = 'VAL_DATA' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_weblook.
    change_setting( iv_value   = iv_value
                    iv_setting = 'WEBLOOK' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_webrows.
    change_setting( iv_value   = iv_value
                    iv_setting = 'WEBROWS' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_webstyle.
    change_setting( iv_value   = iv_value
                    iv_setting = 'WEBSTYLE' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_webxheight.
    change_setting( iv_value   = iv_value
                    iv_setting = 'WEBXHEIGHT' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_webxwidth.
    change_setting( iv_value   = iv_value
                    iv_setting = 'WEBXWIDTH' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_xidirect.
    change_setting( iv_value   = iv_value
                    iv_setting = 'XIDIRECT' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_xifunckey.
    change_setting( iv_value   = iv_value
                    iv_setting = 'XIFUNCKEY' ).
    r_layout = me.
  ENDMETHOD.

  METHOD set_zebra.
    change_setting( iv_value   = iv_value
                    iv_setting = 'ZEBRA' ).
    r_layout = me.
  ENDMETHOD.
ENDCLASS.
