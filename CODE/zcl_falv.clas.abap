class ZCL_FALV definition
  public
  inheriting from CL_GUI_ALV_GRID
  create public

  global friends ZCL_FALV_LAYOUT .

public section.

  interfaces IF_ALV_RM_GRID_FRIEND .

  types:
    begin of t_subcl_call,
        progname type progname,
        line     type i,
        column   type i,
        class    type string,
      end of t_subcl_call .
  types:
    tt_subcl_call type sorted table of t_subcl_call with unique key progname line column .
  types:
    begin of t_email,
        smtp_addr  type ad_smtpadr,
        express    type os_boolean,
        copy       type os_boolean,
        blind_copy type os_boolean,
      end of t_email .
  types:
    tt_email type table of t_email .
  types T_COLUMN type ref to ZCL_FALV_COLUMN .
  types:
    t_columns type sorted table of t_column with unique key table_line .

  constants:
    begin of color,
                 blue                         type char4 value 'C100',
                 blue_intensified             type char4 value 'C110',
                 blue_intensified_inversed    type char4 value 'C111',
                 blue_inversed                type char4 value 'C101',
                 gray                         type char4 value 'C200',
                 gray_itensified              type char4 value 'C210',
                 gray_intesified_invers       type char4 value 'C211',
                 gray_inversed                type char4 value 'C201',
                 yellow                       type char4 value 'C300',
                 yellow_intensified           type char4 value 'C310',
                 yellow_intensified_inversed  type char4 value 'C311',
                 yellow_inversed              type char4 value 'C301',
                 light_blue                   type char4 value 'C400',
                 light_blue_itensified        type char4 value 'C410',
                 light_blue_intesified_invers type char4 value 'C411',
                 light_blue_inversed          type char4 value 'C401',
                 green                        type char4 value 'C500',
                 green_intensified            type char4 value 'C510',
                 green_intensified_inversed   type char4 value 'C511',
                 green_inversed               type char4 value 'C501',
                 red                          type char4 value 'C600',
                 red_intensified              type char4 value 'C610',
                 red_intensified_inversed     type char4 value 'C611',
                 red_inversed                 type char4 value 'C601',
                 orange                       type char4 value 'C700',
                 orange_intensified           type char4 value 'C710',
                 orange_intensified_inversed  type char4 value 'C711',
                 orange_inversed              type char4 value 'C701',
               end of color .
  constants VERSION type STRING value '740.1.0.19' ##NO_TEXT.
  constants CC_NAME type CHAR30 value 'CC_GRID' ##NO_TEXT.
  constants C_SCREEN_POPUP type SY-DYNNR value '0200' ##NO_TEXT.
  constants C_SCREEN_FULL type SY-DYNNR value '0100' ##NO_TEXT.
  constants C_FSCR_REPID type SY-REPID value 'SAPLZFALV' ##NO_TEXT.
  data RESULT type I read-only .
  data SPLITTER_ROW_1_HEIGHT type I read-only .
  data SPLITTER_ROW_2_HEIGHT type I read-only .
  data SPLITTER_ROW_3_HEIGHT type I read-only .
  constants FC_BACK type SY-UCOMM value 'BACK' ##NO_TEXT.
  constants FC_UP type SY-UCOMM value 'UP' ##NO_TEXT.
  constants FC_EXIT type SY-UCOMM value 'EXIT' ##NO_TEXT.
  constants FC_CANCEL type SY-UCOMM value 'CANCEL' ##NO_TEXT.
  constants FC_MASS_REPLACE type SY-UCOMM value 'MASS_REPL' ##NO_TEXT.
  constants FC_SAVE type SY-UCOMM value '&DATA_SAVE' ##NO_TEXT.
  constants FC_PRINT type SY-UCOMM value 'PRINT' ##NO_TEXT.
  constants FC_FIND type SY-UCOMM value 'FIND' ##NO_TEXT.
  constants FC_FIND_NEXT type SY-UCOMM value 'FINDNEXT' ##NO_TEXT.
  constants FC_FIRST_PAGE type SY-UCOMM value 'PGHOME' ##NO_TEXT.
  constants FC_LAST_PAGE type SY-UCOMM value 'PGEND' ##NO_TEXT.
  constants FC_PREVIOUS_PAGE type SY-UCOMM value 'PGUP' ##NO_TEXT.
  constants FC_NEXT_PAGE type SY-UCOMM value 'PGDOWN' ##NO_TEXT.
  constants BUTTON_NORMAL type TB_BTYPE value '0' ##NO_TEXT.
  constants BUTTON_MENU_DEFAULT type TB_BTYPE value '1' ##NO_TEXT.
  constants BUTTON_MENU type TB_BTYPE value '2' ##NO_TEXT.
  constants BUTTON_SEPARATOR type TB_BTYPE value '3' ##NO_TEXT.
  constants BUTTON_RADIOBUTTON type TB_BTYPE value '4' ##NO_TEXT.
  constants BUTTON_CHECKBOX type TB_BTYPE value '5' ##NO_TEXT.
  constants BUTTON_MENU_ENTRY type TB_BTYPE value '6' ##NO_TEXT.
  constants:
    begin of symbol,
                 empty_space        type char01 value ' ',
                 plus_box           type char01 value '!',
                 minus_box          type char01 value '"',
                 plus_circle        type char01 value '#',
                 minus_circle       type char01 value '$',
                 filled_square      type char01 value '%',
                 half_filled_square type char01 value '&',
                 square             type char01 value `'`,
                 filled_circle      type char01 value '(',
                 half_filled_circle type char01 value ')',
                 circle             type char01 value '*',
                 filled_diamond     type char01 value '+',
                 diamond            type char01 value ',',
                 bold_x             type char01 value '.',
                 note               type char01 value '/',
                 document           type char01 value '0',
                 checked_document   type char01 value '1',
                 documents          type char01 value '2',
                 folder             type char01 value '3',
                 plus_folder        type char01 value '4',
                 minus_folder       type char01 value '5',
                 open_folder        type char01 value '6',
                 bold_minus         type char01 value '7',
                 bold_plus          type char01 value '8',
                 checkbox           type char01 value '9',
                 radiobutton        type char01 value  ':',
                 left_triangle      type char01 value  ';',
                 right_triangle     type char01 value  '<',
                 up_triangle        type char01 value  '=',
                 down_triangle      type char01 value  '>',
                 left_hand          type char01 value  '?',
                 left_arrow         type char01 value  'A',
                 right_arrow        type char01 value  'B',
                 up_arrow           type char01 value  'C',
                 down_arrow         type char01 value  'D',
                 check_mark         type char01 value  'E',
                 pencil             type char01 value  'F',
                 glasses            type char01 value  'G',
                 locked             type char01 value  'H',
                 unlocked           type char01 value  'I',
                 phone              type char01 value  'J',
                 printer            type char01 value  'K',
                 fax                type char01 value  'L',
                 asterisk           type char01 value  'M',
                 right_hand         type char01 value  'N',
                 sorted_up          type char01 value  'O',
                 sorted_down        type char01 value  'P',
                 cumulated          type char01 value  'Q',
                 delete             type char01 value  'R',
                 executable         type char01 value  'S',
                 workflow_item      type char01 value  'T',
                 caution            type char01 value  'U',
                 flash              type char01 value  'V',
                 large_square       type char01 value  'W',
                 ellipsis           type char01 value  'X',
               end of symbol .
  data MAIN_CONTAINER type ref to CL_GUI_CONTAINER read-only .
  data SPLIT_CONTAINER type ref to CL_GUI_SPLITTER_CONTAINER .
  data MAIN_SPLIT_CONTAINER type ref to CL_GUI_SPLITTER_CONTAINER .
  data TOP_OF_PAGE_CONTAINER type ref to CL_GUI_CONTAINER .
  data VARIANT type DISVARIANT .
  data LAYOUT_SAVE type CHAR01 .
  data EXCLUDE_FUNCTIONS type UI_FUNCTIONS .
  data FCAT type LVC_T_FCAT .
  data SORT type LVC_T_SORT .
  data FILTER type LVC_T_FILT .
  data LVC_LAYOUT type LVC_S_LAYO read-only .
  data LAYOUT type ref to ZCL_FALV_LAYOUT .
  data GUI_STATUS type ref to ZCL_FALV_DYNAMIC_STATUS .
  data SCREEN type SY-DYNNR read-only .
  data OUTTAB type ref to DATA .
  data TITLE_V1 type STRING .
  data TITLE_V2 type STRING .
  data TITLE_V3 type STRING .
  data TITLE_V4 type STRING .
  data TITLE_V5 type STRING .
  data DELAY_MOVE_CURRENT_CELL type I read-only value 20 ##NO_TEXT.
  data DELAY_CHANGE_SELECTION type I read-only value 20 ##NO_TEXT.
  data TOP_OF_PAGE_HEIGHT type I value 150 ##NO_TEXT.
  data ERROR_LOG_HEIGHT type I value 100 ##NO_TEXT.
  data GRID type ref to CL_GUI_ALV_GRID .
  data BUILT_IN_SCREEN type ABAP_BOOL read-only .
  data BUFFERING_ACTIVE type ABAP_BOOL value ABAP_TRUE ##NO_TEXT.
  data BYPASSING_BUFFER type ABAP_BOOL value ABAP_FALSE ##NO_TEXT.

  class-methods CREATE
    importing
      value(I_PARENT) type ref to CL_GUI_CONTAINER optional
      value(I_APPLOGPARENT) type ref to CL_GUI_CONTAINER optional
      value(I_POPUP) type ABAP_BOOL default ABAP_FALSE
      value(I_APPLOG_EMBEDDED) type ABAP_BOOL default ABAP_FALSE
      value(I_SUBCLASS) type ref to CL_ABAP_TYPEDESCR optional
      value(I_HANDLE) type SLIS_HANDL optional
    changing
      !CT_TABLE type STANDARD TABLE
    returning
      value(RV_FALV) type ref to ZCL_FALV .
  class-methods CREATE_BY_TYPE
    importing
      value(I_PARENT) type ref to CL_GUI_CONTAINER optional
      value(I_APPLOGPARENT) type ref to CL_GUI_CONTAINER optional
      value(I_POPUP) type ABAP_BOOL default ABAP_FALSE
      value(I_APPLOG_EMBEDDED) type ABAP_BOOL default ABAP_FALSE
      value(I_SUBCLASS) type ref to CL_ABAP_TYPEDESCR optional
      !I_TYPE type ref to CL_ABAP_TYPEDESCR
    returning
      value(RV_FALV) type ref to ZCL_FALV .
  class-methods LVC_FCAT_FROM_ITAB
    importing
      !IT_TABLE type STANDARD TABLE
    returning
      value(RT_FCAT) type LVC_T_FCAT .
  methods ADD_BUTTON
    importing
      value(IV_FUNCTION) type UI_FUNC
      value(IV_ICON) type ICON_D optional
      value(IV_QUICKINFO) type ICONQUICK optional
      value(IV_BUTN_TYPE) type TB_BTYPE optional
      value(IV_DISABLED) type ABAP_BOOL optional
      value(IV_TEXT) type TEXT40 optional
      value(IV_CHECKED) type ABAP_BOOL optional
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods COLUMN
    importing
      value(IV_FIELDNAME) type LVC_S_FCAT-FIELDNAME
    returning
      value(RV_COLUMN) type ref to ZCL_FALV_COLUMN .
  methods CONSTRUCTOR
    importing
      value(I_SHELLSTYLE) type I default 0
      value(I_LIFETIME) type I optional
      value(I_PARENT) type ref to CL_GUI_CONTAINER optional
      value(I_APPL_EVENTS) type CHAR01 default SPACE
      !I_PARENTDBG type ref to CL_GUI_CONTAINER optional
      !I_APPLOGPARENT type ref to CL_GUI_CONTAINER optional
      !I_GRAPHICSPARENT type ref to CL_GUI_CONTAINER optional
      value(I_NAME) type STRING optional
      !I_FCAT_COMPLETE type SAP_BOOL default SPACE
    exceptions
      ERROR_CNTL_CREATE
      ERROR_CNTL_INIT
      ERROR_CNTL_LINK
      ERROR_DP_CREATE
      OBJECT_CREATED_MANUALLY .
  methods CREATE_BY_COPY
    importing
      value(I_PARENT) type ref to CL_GUI_CONTAINER optional
      value(I_APPLOGPARENT) type ref to CL_GUI_CONTAINER optional
      value(I_POPUP) type ABAP_BOOL default ABAP_FALSE
    returning
      value(RV_FALV) type ref to ZCL_FALV .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
  methods DELETE_ALL_BUTTONS
    importing
      value(IV_EXCEPTIONS) type TTB_BUTTON optional
    returning
      value(R_FALV) type ref to ZCL_FALV .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
  methods DELETE_BUTTON
    importing
      value(IV_FUNCTION) type UI_FUNC
    returning
      value(R_FALV) type ref to ZCL_FALV .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
  methods DISABLE_BUTTON
    importing
      value(IV_FUNCTION) type UI_FUNC
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods DISPLAY
  final
    importing
      value(IV_FORCE_GRID) type ABAP_BOOL default SPACE
      value(IV_START_ROW) type I optional
      value(IV_START_COLUMN) type I optional
      value(IV_END_ROW) type I optional
      value(IV_END_COLUMN) type I optional
    returning
      value(R_FALV) type ref to ZCL_FALV .
    "! Don't call it from Toolbar event handler
    "! as it will cause endless loop
  methods ENABLE_BUTTON
    importing
      value(IV_FUNCTION) type UI_FUNC
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods ENCODE_PICTURE_BASE64
    importing
      value(IV_XSTRING) type XSTRING
      value(IV_MIME_TYPE) type CSEQUENCE
    returning
      value(RV_IMAGE) type STRING .
  methods EXCLUDE_FUNCTION
    importing
      value(IV_UCOMM) type SY-UCOMM
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods EXPORT_TO_EXCEL
    returning
      value(RV_XSTRING) type XSTRING .
    "! Cell can be editable by layout, by field-catalog or by cell styles
  methods GET_CELL_ENABLED
    importing
      value(I_ROW) type I
      value(I_FIELD) type LVC_FNAME
    returning
      value(R_ENABLED) type ABAP_BOOL .
  methods GET_COLUMNS
    returning
      value(RT_COLUMNS) type T_COLUMNS .
  methods GET_FILE_FROM_MIME
    importing
      value(IV_PATH) type STRING
    exporting
      value(EV_XSTRING) type XSTRING
      value(EV_MIME_TYPE) type STRING .
  methods GET_PICTURE_FROM_SE78
    importing
      value(IV_NAME) type STXBITMAPS-TDNAME
      value(IV_TYPE) type STXBITMAPS-TDBTYPE default 'BCOL'
      value(IV_ID) type STXBITMAPS-TDID default 'BMAP'
    returning
      value(RV_XSTRING) type XSTRING .
  methods HIDE_APPLOG .
  methods HIDE_TOP_OF_PAGE
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods INIT_CELL_STYLES .
  methods MASS_REPLACE .
  methods PAI
    importing
      value(IV_DYNNR) type SY-DYNNR default SY-DYNNR
    changing
      !C_UCOMM type SY-UCOMM default SY-UCOMM .
  methods PBO
    importing
      value(IV_DYNNR) type SY-DYNNR default SY-DYNNR .
  methods REDRAW_AFTER_MERGING_CHANGE .
  methods REFRESH_TOOLBAR
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SAVE_EXCEL_LOCALY
    importing
      value(IV_PATH) type STRING optional
    returning
      value(RV_SAVED) type ABAP_BOOL .
  methods SEND
    importing
      value(IV_SUBJECT) type CSEQUENCE optional
      value(IV_SENDER) type AD_SMTPADR optional
      value(IV_SENDER_NAME) type AD_SMTPADR optional
      value(IV_FILENAME) type CSEQUENCE optional
      value(IT_RECIPIENTS) type TT_EMAIL
      value(IV_BODY) type STRING optional
      value(IV_IMPORTANCE) type BCS_DOCIMP optional
      value(IV_SENSITIVITY) type SO_OBJ_SNS optional
      value(IV_IMMEDIATELY) type ABAP_BOOL optional
      value(IV_COMMIT) type ABAP_BOOL default ABAP_TRUE
    returning
      value(R_FALV) type ref to ZCL_FALV
    exceptions
      CREATE_REQUEST_ERROR
      CREATE_DOCUMENT_ERROR
      ADD_ATTACHMENT_ERROR
      ADD_DOCUMENT_ERROR
      ADD_RECIPIENT_ERROR
      ADD_SENDER_ERROR
      SEND_ERROR
      SEND_IMMEDIATELY_ERROR .
  methods SET_CELL_BUTTON
    importing
      value(IV_FIELDNAME) type FIELDNAME
      value(IV_ROW) type LVC_S_ROID-ROW_ID
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SET_CELL_COLOR
    importing
      value(IV_FIELDNAME) type FIELDNAME
      value(IV_COLOR) type LVC_S_COLO
      value(IV_ROW) type LVC_S_ROID-ROW_ID
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SET_CELL_DISABLED
    importing
      value(IV_FIELDNAME) type FIELDNAME
      value(IV_ROW) type LVC_S_ROID-ROW_ID
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SET_CELL_ENABLED
    importing
      value(IV_FIELDNAME) type FIELDNAME
      value(IV_ROW) type LVC_S_ROID-ROW_ID
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SET_CELL_HOTSPOT
    importing
      value(IV_FIELDNAME) type FIELDNAME
      value(IV_ROW) type LVC_S_ROID-ROW_ID
    returning
      value(R_FALV) type ref to ZCL_FALV .
*  methods Z_DISPLAY .
  methods SET_CELL_STYLE
    importing
      !ROW type I optional
      !COL type I optional
      !STYLE type LVC_STYLE
      !STYLE2 type LVC_STYLE optional .
  methods SET_DUMMY_FUNCTION_CODE
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SET_EDITABLE
    importing
      value(IV_MODIFY) type ABAP_BOOL default ABAP_FALSE
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SET_FIXED_COL_ROW
    importing
      !COL type I
      !ROW type I .
  methods SET_LIST_VIEW
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SET_MARK_FIELD
    importing
      value(IV_FIELDNAME) type LVC_S_FCAT-FIELDNAME
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SET_MERGE_HORIZONTALLY
    importing
      !ROW type I
      !TAB_COL_MERGE type LVC_T_CO01 .
  methods SET_MERGE_VERTICALLY
    importing
      !ROW type I
      !TAB_COL_MERGE type LVC_T_CO01 .
  methods SET_OUTPUT_TABLE
    changing
      !CT_TABLE type STANDARD TABLE .
  methods SET_READONLY
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SET_ROW_COLOR
    importing
      value(IV_COLOR) type CHAR04
      value(IV_ROW) type LVC_S_ROID-ROW_ID
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SHOW_APPLOG
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SHOW_TOP_OF_PAGE
    returning
      value(R_FALV) type ref to ZCL_FALV .
  methods SOFT_REFRESH
    returning
      value(R_FALV) type ref to ZCL_FALV .

  methods SET_FRONTEND_FIELDCATALOG
    redefinition .
  methods SET_FRONTEND_LAYOUT
    redefinition .
protected section.

  data TOOLBAR_ADDED type TTB_BUTTON .
  data TOOLBAR_DELETED type TTB_BUTTON .
  data TOOLBAR_DISABLED type TTB_BUTTON .
  data TOOLBAR_EXCEPTIONS type TTB_BUTTON .
  data:
    columns type sorted table of t_column with unique key table_line .
  data APPLICATION_LOG_EMBEDDED type ABAP_BOOL .
  data SUBCLASS_TYPE type ref to CL_ABAP_TYPEDESCR .

  events AT_SET_PF_STATUS .
  events AT_SET_TITLE .
    "! Event called just after method <strong>SET_TABLE_FOR_FIRST_DISPLAY</strong> is called internally.
    "! Can be used for example to setup merging of cells
  events BEFORE_FIRST_DISPLAY .

  methods EVF_AFTER_REFRESH
    for event AFTER_REFRESH of CL_GUI_ALV_GRID .
  methods EVF_AFTER_USER_COMMAND
    for event AFTER_USER_COMMAND of CL_GUI_ALV_GRID
    importing
      !E_UCOMM
      !E_SAVED
      !E_NOT_PROCESSED  ##NEEDED.
  methods EVF_AT_SET_PF_STATUS
    for event AT_SET_PF_STATUS of ZCL_FALV .
  methods EVF_AT_SET_TITLE
    for event AT_SET_TITLE of ZCL_FALV .
  methods EVF_BEFORE_FIRST_DISPLAY
    for event BEFORE_FIRST_DISPLAY of ZCL_FALV .
  methods EVF_BEFORE_USER_COMMAND
    for event BEFORE_USER_COMMAND of CL_GUI_ALV_GRID
    importing
      !E_UCOMM  ##NEEDED.
  methods EVF_BTN_CLICK
    for event BUTTON_CLICK of CL_GUI_ALV_GRID
    importing
      !ES_COL_ID
      !ES_ROW_NO  ##NEEDED.
  methods EVF_CLICK_COL_HEADER
    for event CLICK_COL_HEADER of CL_GUI_ALV_GRID
    importing
      !COL_ID  ##NEEDED.
  methods EVF_CLICK_ROW_COL
    for event CLICK_ROW_COL of CL_GUI_ALV_GRID
    importing
      !COL_ID
      !ROW_ID  ##NEEDED.
  methods EVF_CONTEXT_MENU
    for event CONTEXT_MENU of CL_GUI_ALV_GRID .
  methods EVF_CONTEXT_MENU_REQUEST
    for event CONTEXT_MENU_REQUEST of CL_GUI_ALV_GRID
    importing
      !E_OBJECT .
  methods EVF_CONTEXT_MENU_SELECTED
    for event CONTEXT_MENU_SELECTED of CL_GUI_ALV_GRID
    importing
      !FCODE  ##NEEDED.
  methods EVF_DATA_CHANGED
    for event DATA_CHANGED of CL_GUI_ALV_GRID
    importing
      !ER_DATA_CHANGED
      !E_ONF4
      !E_ONF4_BEFORE
      !E_ONF4_AFTER
      !E_UCOMM  ##NEEDED.
  methods EVF_DATA_CHANGED_FINISHED
    for event DATA_CHANGED_FINISHED of CL_GUI_ALV_GRID
    importing
      !E_MODIFIED
      !ET_GOOD_CELLS  ##NEEDED.
  methods EVF_DBLCLICK_ROW_COL
    for event DBLCLICK_ROW_COL of CL_GUI_ALV_GRID
    importing
      !COL_ID
      !ROW_ID  ##NEEDED.
  methods EVF_DELAYED_CALLBACK
    for event DELAYED_CALLBACK of CL_GUI_ALV_GRID .
  methods EVF_DELAYED_CHANGED_SEL_CALL
    for event DELAYED_CHANGED_SEL_CALLBACK of CL_GUI_ALV_GRID .
  methods EVF_DELAYED_CHANGE_SELECTION
    for event DELAYED_CHANGE_SELECTION of CL_GUI_ALV_GRID .
  methods EVF_DELAYED_MOVE_CURRENT_CELL
    for event DELAYED_MOVE_CURRENT_CELL of CL_GUI_ALV_GRID .
  methods EVF_DOUBLE_CLICK
    for event DOUBLE_CLICK of CL_GUI_ALV_GRID
    importing
      !E_ROW
      !E_COLUMN
      !ES_ROW_NO  ##NEEDED.
  methods EVF_DOUBLE_CLICK_COL_SEPARATOR
    for event DOUBLE_CLICK_COL_SEPARATOR of CL_GUI_ALV_GRID
    importing
      !COL_ID  ##NEEDED.
  methods EVF_DROP_EXTERNAL_FILE
    for event DROP_EXTERNAL_FILES of CL_GUI_ALV_GRID
    importing
      !FILES  ##NEEDED.
  methods EVF_F1
    for event F1 of CL_GUI_ALV_GRID .
  methods EVF_HOTSPOT_CLICK
    for event HOTSPOT_CLICK of CL_GUI_ALV_GRID
    importing
      !E_ROW_ID
      !E_COLUMN_ID
      !ES_ROW_NO  ##NEEDED.
  methods EVF_MENU_BUTTON
    for event MENU_BUTTON of CL_GUI_ALV_GRID
    importing
      !E_OBJECT
      !E_UCOMM  ##NEEDED.
  methods EVF_ONDRAG
    for event ONDRAG of CL_GUI_ALV_GRID
    importing
      !ES_ROW_NO
      !E_COLUMN
      !E_DRAGDROPOBJ
      !E_ROW  ##NEEDED.
  methods EVF_ONDROP
    for event ONDROP of CL_GUI_ALV_GRID
    importing
      !ES_ROW_NO
      !E_COLUMN
      !E_DRAGDROPOBJ
      !E_ROW  ##NEEDED.
  methods EVF_ONDROPCOMPLETE
    for event ONDROPCOMPLETE of CL_GUI_ALV_GRID
    importing
      !ES_ROW_NO
      !E_COLUMN
      !E_DRAGDROPOBJ
      !E_ROW  ##NEEDED.
  methods EVF_ONDROPGETFLAVOR
    for event ONDROPGETFLAVOR of CL_GUI_ALV_GRID
    importing
      !ES_ROW_NO
      !E_COLUMN
      !E_DRAGDROPOBJ
      !E_FLAVORS
      !E_ROW  ##NEEDED.
  methods EVF_ONF1
    for event ONF1 of CL_GUI_ALV_GRID
    importing
      !E_FIELDNAME
      !ES_ROW_NO
      !ER_EVENT_DATA  ##NEEDED.
  methods EVF_ONF4
    for event ONF4 of CL_GUI_ALV_GRID
    importing
      !E_FIELDNAME
      !E_FIELDVALUE
      !ES_ROW_NO
      !ER_EVENT_DATA
      !ET_BAD_CELLS
      !E_DISPLAY  ##NEEDED.
  methods EVF_REQUEST_DATA
    for event _REQUEST_DATA of CL_GUI_ALV_GRID
    importing
      !FRAGMENTS  ##NEEDED.
  methods EVF_SUBTOTAL_TEXT
    for event SUBTOTAL_TEXT of CL_GUI_ALV_GRID
    importing
      !ES_SUBTOTTXT_INFO
      !EP_SUBTOT_LINE
      !E_EVENT_DATA  ##NEEDED.
  methods EVF_TOOLBAR
    for event TOOLBAR of CL_GUI_ALV_GRID
    importing
      !E_OBJECT
      !E_INTERACTIVE  ##NEEDED.
  methods EVF_TOOLBAR_BUTTON_CLICK
    for event TOOLBAR_BUTTON_CLICK of CL_GUI_ALV_GRID
    importing
      !FCODE  ##NEEDED.
  methods EVF_TOOLBAR_MENUBUTTON_CLICK
    for event TOOLBAR_MENUBUTTON_CLICK of CL_GUI_ALV_GRID
    importing
      !FCODE
      !MENU_POS_X
      !MENU_POS_Y  ##NEEDED.
  methods EVF_TOOLBAR_MENU_SELECTED
    for event TOOLBAR_MENU_SELECTED of CL_GUI_ALV_GRID
    importing
      !FCODE  ##NEEDED.
  methods EVF_TOP_OF_PAGE
    for event TOP_OF_PAGE of CL_GUI_ALV_GRID
    importing
      !E_DYNDOC_ID
      !TABLE_INDEX  ##NEEDED.
  methods EVF_TOTAL_CLICK_ROW_COL
    for event TOTAL_CLICK_ROW_COL of CL_GUI_ALV_GRID
    importing
      !COL_ID
      !ROW_ID  ##NEEDED.
  methods EVF_USER_COMMAND
    for event USER_COMMAND of CL_GUI_ALV_GRID
    importing
      !E_UCOMM  ##NEEDED.
private section.

  class-data CREATED_FROM_FACTORY type ABAP_BOOL .
  data TOP_OF_PAGE_DOC type ref to CL_DD_DOCUMENT .
  data TOP_OF_PAGE_VISIBLE_AT_START type ABAP_BOOL .
  data CALL_REDRAW_AFTER_MERGING type ABAP_BOOL .

  class-methods CHECK_IF_CALLED_FROM_SUBCLASS
    returning
      value(RO_SUBCLASS) type ref to OBJECT .
  class-methods CRATE_MAIN_SPLITTER
    importing
      !I_MAIN_SPLIT_CONTAINER type ref to CL_GUI_SPLITTER_CONTAINER
    returning
      value(R_SPLIT_CONTAINER) type ref to CL_GUI_SPLITTER_CONTAINER .
  class-methods CREATE_CONTAINTERS
    importing
      !I_PARENT type ref to CL_GUI_CONTAINER
      !I_APPLOGPARENT type ref to CL_GUI_CONTAINER
      !I_POPUP type ABAP_BOOL
      !I_APPLOG_EMBEDDED type ABAP_BOOL
    exporting
      !E_BUILT_IN_SCREEN type ABAP_BOOL
      !E_PARENT type ref to CL_GUI_CONTAINER
      !E_APPLOG type ref to CL_GUI_CONTAINER
      !E_TOP_OF_PAGE_PARENT type ref to CL_GUI_CONTAINER
      !E_CUSTOM_CONTAINER type ref to CL_GUI_CONTAINER
      !E_MAIN_SPLIT_CONTAINER type ref to CL_GUI_SPLITTER_CONTAINER
      !E_SPLIT_CONTAINER type ref to CL_GUI_SPLITTER_CONTAINER .
  class-methods CREATE_FALV_OBJECT
    importing
      !I_SUBCLASS type ref to CL_ABAP_TYPEDESCR
      !I_PARENT type ref to CL_GUI_CONTAINER
      !I_APPLOG type ref to CL_GUI_CONTAINER
    returning
      value(RV_FALV) type ref to ZCL_FALV .
  class-methods CREATE_MAIN_CONT_FOR_FULL_SCR
    importing
      !I_POPUP type ABAP_BOOL
    returning
      value(R_CUSTOM_CONTAINER) type ref to CL_GUI_CONTAINER .
  class-methods CREATE_MAIN_SPLIT_COTAINER
    importing
      !I_POPUP type ABAP_BOOL
      !I_APPLOG_EMBEDDED type ABAP_BOOL
      !I_MAIN_PARENT type ref to CL_GUI_CONTAINER
    returning
      value(R_MAIN_SPLIT_CONTAINER) type ref to CL_GUI_SPLITTER_CONTAINER .
  class-methods LINK_CONTAINERS
    importing
      !IV_FALV type ref to ZCL_FALV
      !I_TOP_OF_PAGE_PARENT type ref to CL_GUI_CONTAINER
      !I_CUSTOM_CONTAINER type ref to CL_GUI_CONTAINER
      !I_MAIN_SPLIT_CONTAINER type ref to CL_GUI_SPLITTER_CONTAINER
      !I_SPLIT_CONTAINER type ref to CL_GUI_SPLITTER_CONTAINER .
  methods BUILD_COLUMNS .
  methods COPY_ATTRIBUTES
    importing
      !I_FALV type ref to ZCL_FALV .
  methods CREATE_EX_RESULT_FALV
    returning
      value(ER_RESULT_TABLE) type ref to CL_SALV_EX_RESULT_DATA_TABLE .
  methods EVF_BEFORE_UCOMMAND_INTERNAL
    for event BEFORE_USER_COMMAND of CL_GUI_ALV_GRID
    importing
      !E_UCOMM  ##NEEDED.
  methods EVF_DATA_CHANGED_INTERNAL
    for event DATA_CHANGED of CL_GUI_ALV_GRID
    importing
      !ER_DATA_CHANGED
      !E_ONF4
      !E_ONF4_BEFORE
      !E_ONF4_AFTER
      !E_UCOMM  ##NEEDED.
  methods EVF_TOOLBAR_INTERNAL
    for event TOOLBAR of CL_GUI_ALV_GRID
    importing
      !E_OBJECT
      !E_INTERACTIVE  ##NEEDED.
  methods RAISE_BEFORE_FIRST_DISPLAY .
  methods RAISE_TOP_OF_PAGE .
  methods SET_HANDLERS
    importing
      !IV_FALV type ref to ZCL_FALV .
  methods SET_PARENT
    importing
      !IO_PARENT type ref to OBJECT
    returning
      value(R_FALV) type ref to ZCL_FALV .
ENDCLASS.



CLASS ZCL_FALV IMPLEMENTATION.


  method add_button.
    if not line_exists( toolbar_added[ function = iv_function ] ).
      insert value #( function = iv_function
                      icon = conv #( iv_icon )
                      quickinfo = iv_quickinfo
                      butn_type = iv_butn_type
                      disabled = iv_disabled
                      text = iv_text
                      checked = iv_checked
                        ) into table toolbar_added .

      delete toolbar_deleted where function = iv_function.
      me->refresh_toolbar( ).
    endif.
    r_falv = me.
  endmethod.


  method build_columns.
    loop at fcat assigning field-symbol(<fcat>).
      data(column) = new zcl_falv_column( iv_fieldname = <fcat>-fieldname io_falv = me ).
      insert column into table columns.
    endloop.
  endmethod.


  method check_if_called_from_subclass.
    data: callstack type abap_callstack,
          src       type table of string.

    call function 'SYSTEM_CALLSTACK'
      importing
        callstack = callstack.

    assign callstack[ 3 ] to field-symbol(<stack>).
    check sy-subrc eq 0.
    data(compiler) = cl_abap_compiler=>create(
                    p_name             =  <stack>-mainprogram
                    p_include          =  <stack>-include
                    p_no_package_check = abap_true ).

    compiler->get_single_ref(
      exporting
        p_full_name       =  |\\TY:ZCL_FALV\\ME:{ callstack[ 2 ]-blockname case = upper }|
        p_grade           =  1   " Grade of Use
      importing
        p_result          =    data(falv_references) " Where-Used List
      exceptions
        others            = 5 ).
    if sy-subrc eq 0.
      read report <stack>-include into src.
      if sy-subrc ne 0.
        return.
      endif.

      assign src[ <stack>-line ] to field-symbol(<line>).
      if <line> is assigned.
        assign falv_references[ line = <stack>-line ] to field-symbol(<reference>).
        if sy-subrc eq 0.
          data: subclass_name type string.
          do.
            data(offset) = <reference>-column - sy-index - 2. "-2 because of =>
            if offset lt 0 or <line>+offset(1) eq ` `.
              exit.
            endif.
            subclass_name =  <line>+offset(1) && subclass_name.
          enddo.
          if subclass_name is initial or to_upper( subclass_name ) eq 'ZCL_FALV'.
            return.
          endif.

          "global class
          cl_abap_classdescr=>describe_by_name( exporting p_name = to_upper( subclass_name )
                                                receiving p_descr_ref = ro_subclass
                                                        exceptions type_not_found = 1 ).
          if sy-subrc eq 0.
            return.
          else.
            "local class
            subclass_name = |\\PROGRAM={ <stack>-mainprogram }\\CLASS={ subclass_name }|.
            cl_abap_classdescr=>describe_by_name( exporting p_name = to_upper( subclass_name )
                                                  receiving p_descr_ref = ro_subclass
                                                          exceptions type_not_found = 1 ).
            if sy-subrc eq 0.
              return.
            endif.
          endif.
        endif.
      endif.
    endif.

  endmethod.


  method column.
    try.
        rv_column = columns[  table_line->fieldname = iv_fieldname ].
      catch cx_sy_itab_line_not_found.

    endtry.
  endmethod.


  method constructor.
    if created_from_factory eq abap_false.
      raise object_created_manually.
    endif.

    super->constructor(
      exporting
        i_shellstyle      = i_shellstyle    " Control Style
        i_lifetime        = i_lifetime    " Lifetime
        i_parent          = i_parent    " Parent Container
        i_appl_events     = i_appl_events    " Register Events as Application Events
        i_parentdbg       = i_parentdbg    " Internal, Do not Use
        i_applogparent    = i_applogparent    " Container for Application Log
        i_graphicsparent  = i_graphicsparent    " Container for Graphics
        i_name            = i_name    " Name
        i_fcat_complete   = i_fcat_complete  " Boolean Variable (X=True, Space=False)
      exceptions
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        others            = 5 ).
    if sy-subrc <> 0.
      case sy-subrc.
        when 1.
          raise error_cntl_create.
        when 2.
          raise error_cntl_init.
        when 3.
          raise error_cntl_link.
        when 4.
          raise error_dp_create.
      endcase.
    endif.
  endmethod.


  method create.

    if i_subclass is initial.
      i_subclass ?= check_if_called_from_subclass( ).
    endif.


    create_containters(
          exporting
            i_parent          = i_parent
            i_applogparent    = i_applogparent
            i_popup           = i_popup
            i_applog_embedded = i_applog_embedded
          importing
            e_built_in_screen      = data(built_in_screen)
            e_parent               = data(parent)
            e_applog               = data(applog)
            e_top_of_page_parent   = data(top_of_page_parent)
            e_custom_container     = data(custom_container)
            e_main_split_container = data(main_split_container)
            e_split_container      = data(split_container) ).


    rv_falv = create_falv_object(
      i_subclass = i_subclass
      i_parent   = parent
      i_applog   = applog ).

    rv_falv->set_handlers( rv_falv ).

    rv_falv->set_output_table( changing ct_table = ct_table ).
    rv_falv->fcat = rv_falv->lvc_fcat_from_itab( it_table = ct_table ).
    rv_falv->set_frontend_fieldcatalog( it_fieldcatalog = rv_falv->fcat ).
    rv_falv->application_log_embedded = i_applog_embedded.
    rv_falv->built_in_screen = built_in_screen.
    rv_falv->build_columns( ).
    rv_falv->layout = new zcl_falv_layout( rv_falv ).

    rv_falv->gui_status = new zcl_falv_dynamic_status( ).

    rv_falv->screen = switch #( i_popup when abap_true then c_screen_popup
                                        when abap_false then c_screen_full ).
    if built_in_screen eq abap_true and rv_falv->screen eq c_screen_full.
      "default in full screen
      rv_falv->layout->set_no_toolbar( abap_true ).
      call function 'Z_FALV_ADD_FALV_TO_STACK'
        exporting
          io_falv = rv_falv.
    endif.


    link_containers(
      iv_falv                = rv_falv
      i_top_of_page_parent   = top_of_page_parent
      i_custom_container     = custom_container
      i_main_split_container = main_split_container
      i_split_container      = split_container ).

    rv_falv->layout_save = 'A'.
    rv_falv->variant-report = sy-cprog.
    rv_falv->variant-username = sy-uname.
    if i_handle is not initial.
      rv_falv->variant-handle   = i_handle.
    endif.
    rv_falv->grid = cast #(  rv_falv ).
  endmethod.


  method link_containers.

    iv_falv->main_container ?= i_custom_container.
    iv_falv->split_container = i_split_container.
    iv_falv->main_split_container = i_main_split_container.
    iv_falv->top_of_page_container = i_top_of_page_parent.
    if i_main_split_container is not initial.
      i_main_split_container->set_row_mode(
        exporting
          mode              =  i_split_container->mode_absolute
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0 ).
      iv_falv->hide_applog( ).
    endif.
    if i_split_container is not initial.
      i_split_container->set_row_mode(
        exporting
          mode              =  i_split_container->mode_absolute
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0 ).
      iv_falv->hide_top_of_page( ).
    endif.

  endmethod.


  method create_falv_object.

    created_from_factory = abap_true.

    if i_subclass is not initial.
      data: subclass type ref to object.
      data(sublcass_abs_name) = i_subclass->absolute_name.
      create object subclass type (sublcass_abs_name)
       exporting
        i_parent       = i_parent
        i_applogparent = i_applog.
      rv_falv ?= subclass.
      rv_falv->subclass_type = i_subclass.

    else.
      create object rv_falv
        exporting
          i_parent       = i_parent
          i_applogparent = i_applog.

    endif.


  endmethod.


  method create_containters.

    data main_parent type ref to cl_gui_container.
    data docking_parent type ref to cl_gui_docking_container.

    if cl_gui_alv_grid=>offline( ) is not initial.
      main_parent ?= docking_parent.
    endif.
    "We need to call full screen ALV as container was not passed
    if i_parent is initial.
      e_built_in_screen = abap_true.

      if cl_gui_alv_grid=>offline( ) is initial.
        e_custom_container = create_main_cont_for_full_scr( i_popup ).
        main_parent ?= e_custom_container.
        e_main_split_container = create_main_split_cotainer( i_popup           = i_popup
                                                             i_applog_embedded = i_applog_embedded
                                                             i_main_parent     = main_parent ).
        e_split_container = crate_main_splitter( e_main_split_container ).
        e_parent ?= e_split_container->get_container( row = 2 column = 1 ).
        e_applog ?= e_main_split_container->get_container( row = 2 column = 1 ).
        e_top_of_page_parent ?= e_split_container->get_container( row = 1 column = 1 ).
      else.

        e_parent ?= main_parent.
        e_custom_container ?= e_parent.

      endif.

    else.
      if cl_gui_alv_grid=>offline( ) is not initial.

        e_parent ?= main_parent.
        e_custom_container ?= e_parent.

      else.

        e_applog ?= i_applogparent.
        e_custom_container ?= i_parent.

        e_main_split_container = create_main_split_cotainer( i_popup           = i_popup
                                                             i_applog_embedded = i_applog_embedded
                                                             i_main_parent     = e_custom_container ).

        e_split_container = crate_main_splitter( e_main_split_container ).

        if e_applog is initial.
          e_parent ?= e_split_container->get_container( row = 2 column = 1 ).
          e_applog ?= e_main_split_container->get_container( row = 2 column = 1 ).
          e_top_of_page_parent ?= e_split_container->get_container( row = 1 column = 1 ).
        else.
          e_parent ?= e_split_container->get_container( row = 2 column = 1 ).
          e_top_of_page_parent ?= e_split_container->get_container( row = 1 column = 1 ).
          e_custom_container ?= i_parent.
        endif.

      endif.

    endif.

  endmethod.


  method crate_main_splitter.

    r_split_container  = new cl_gui_splitter_container(
                                                 parent                  = i_main_split_container->get_container( row = 1 column    = 1 )
                                                 rows                    = 2
                                                 columns                 = 1 ).

  endmethod.


  method create_main_cont_for_full_scr.

    if i_popup eq abap_true.

      call function 'Z_FALV_CREATE_MAIN_CONTAINER'
        importing
          main_container = r_custom_container.
    else.
      r_custom_container  = cast cl_gui_container( new cl_gui_custom_container(
           container_name = cc_name
           dynnr          = c_screen_full
           repid          = c_fscr_repid
           no_autodef_progid_dynnr =  abap_true  ) ).
    endif.


  endmethod.


  method create_main_split_cotainer.

    " Create split container, log at bottom, grid at top.
    "Log hidden as default, will appear when error will be thrown.
    r_main_split_container  = new cl_gui_splitter_container(
                                     link_dynnr              = switch #( i_popup when abap_true then c_screen_popup
                                                                                 when abap_false then c_screen_full )
                                     link_repid              = c_fscr_repid
                                     parent                  = i_main_parent
                                     rows                    = cond #( when  i_applog_embedded eq abap_true then 2
                                                                        else 1 )
                                     columns                 = 1 ).

  endmethod.


  method create_by_copy.

    create_containters(
          exporting
            i_parent          = i_parent
            i_applogparent    = i_applogparent
            i_popup           = i_popup
            i_applog_embedded = application_log_embedded
          importing
*            e_built_in_screen      = data(built_in_screen)
            e_parent               = data(parent)
            e_applog               = data(applog)
            e_top_of_page_parent   = data(top_of_page_parent)
            e_custom_container     = data(custom_container)
            e_main_split_container = data(main_split_container)
            e_split_container      = data(split_container) ).


    rv_falv = create_falv_object(
                  i_subclass = subclass_type
                  i_parent   = parent
                  i_applog   = applog ).

    copy_attributes( rv_falv ).
    set_handlers( rv_falv ).


    rv_falv->screen = switch #( i_popup when abap_true then c_screen_popup
                                        when abap_false then c_screen_full ).
    link_containers(
         iv_falv                = rv_falv
         i_top_of_page_parent   = top_of_page_parent
         i_custom_container     = custom_container
         i_main_split_container = main_split_container
         i_split_container      = split_container ).

    if rv_falv->built_in_screen eq abap_true.
      call function 'Z_FALV_ADD_FALV_TO_STACK'
        exporting
          io_falv = rv_falv.
    endif.
    rv_falv->grid = cast #( rv_falv ).
  endmethod.


  method set_handlers.

    set handler iv_falv->evf_after_refresh for iv_falv.
    set handler iv_falv->evf_after_user_command for iv_falv.
    set handler iv_falv->evf_before_ucommand_internal for iv_falv.
    set handler iv_falv->evf_before_user_command for iv_falv.
    set handler iv_falv->evf_btn_click for iv_falv.
    set handler iv_falv->evf_data_changed for iv_falv.
    set handler iv_falv->evf_data_changed_internal for iv_falv.
    set handler iv_falv->evf_data_changed_finished for iv_falv.
    set handler iv_falv->evf_double_click for iv_falv.
    set handler iv_falv->evf_hotspot_click for iv_falv.
    set handler iv_falv->evf_menu_button for iv_falv.
    set handler iv_falv->evf_onf1 for iv_falv.
    set handler iv_falv->evf_onf4 for iv_falv.
    set handler iv_falv->evf_subtotal_text for iv_falv.
    set handler iv_falv->evf_toolbar_internal for iv_falv.
    set handler iv_falv->evf_toolbar for iv_falv.
    set handler iv_falv->evf_user_command for iv_falv.
    set handler iv_falv->evf_at_set_pf_status for iv_falv.
    set handler iv_falv->evf_at_set_title for iv_falv.
    set handler iv_falv->evf_top_of_page for iv_falv.
    set handler iv_falv->evf_delayed_callback for iv_falv.
    set handler iv_falv->evf_delayed_changed_sel_call for iv_falv.
    set handler iv_falv->evf_ondrag for iv_falv.
    set handler iv_falv->evf_ondrop for iv_falv.
    set handler iv_falv->evf_ondropcomplete for iv_falv.
    set handler iv_falv->evf_ondropgetflavor for iv_falv.
    set handler iv_falv->evf_drop_external_file for iv_falv.
    set handler iv_falv->evf_toolbar_menubutton_click for iv_falv.
    set handler iv_falv->evf_click_col_header for iv_falv.
    set handler iv_falv->evf_delayed_move_current_cell for iv_falv.
    set handler iv_falv->evf_f1 for iv_falv.
    set handler iv_falv->evf_dblclick_row_col for iv_falv.
    set handler iv_falv->evf_click_row_col for iv_falv.
    set handler iv_falv->evf_toolbar_button_click for iv_falv.
    set handler iv_falv->evf_double_click_col_separator for iv_falv.
    set handler iv_falv->evf_delayed_change_selection for iv_falv.
    set handler iv_falv->evf_context_menu for iv_falv.
    set handler iv_falv->evf_total_click_row_col for iv_falv.
    set handler iv_falv->evf_context_menu_selected for iv_falv.
    set handler iv_falv->evf_context_menu_request for iv_falv.
    set handler iv_falv->evf_toolbar_menu_selected for iv_falv.
    set handler iv_falv->evf_request_data for iv_falv.
    set handler iv_falv->evf_before_first_display for iv_falv.

    iv_falv->set_delay_change_selection(
      exporting
        time   =  iv_falv->delay_change_selection
      exceptions
        error  = 0
        others = 0 ).

    iv_falv->set_delay_move_current_cell(
      exporting
       time   = iv_falv->delay_move_current_cell
      exceptions
        error  = 0
        others = 0 ).

  endmethod.


  method delete_all_buttons.
    layout->delete_all_buttons = abap_true.
    if iv_exceptions is initial.
      append lines of mt_toolbar to toolbar_deleted.
      refresh toolbar_added.
    else.
      toolbar_exceptions = iv_exceptions.
      loop at mt_toolbar assigning field-symbol(<tlb>).
        if not line_exists( iv_exceptions[ function = <tlb>-function ] ).
          append <tlb> to toolbar_deleted.
          delete toolbar_added where function eq <tlb>-function.
        endif.
      endloop.
    endif.
    append lines of toolbar_deleted to exclude_functions.
    me->refresh_toolbar( ).
    r_falv = me.
  endmethod.


  method delete_button.
    delete toolbar_added where function = iv_function.
    if sy-subrc ne 0.
      insert value #( function = iv_function ) into table toolbar_deleted.
    endif.
    me->refresh_toolbar( ).
    r_falv = me.
  endmethod.


  method disable_button.
    try.
        toolbar_added[ function = iv_function ]-disabled = abap_true.
      catch cx_sy_itab_line_not_found.
        clear sy-subrc.
    endtry.
    insert value #( function = iv_function ) into table toolbar_disabled.
    me->refresh_toolbar( ).
    r_falv = me.
  endmethod.


  method display.
    field-symbols: <outtab> type standard table.
    r_falv = me.
    if me->title_v1 is initial.
      me->title_v1 = sy-title. " for lazy people who wants to have alv title to be equal one from report.
    endif.
    if built_in_screen eq abap_true and iv_force_grid eq abap_false.
      if screen eq c_screen_popup and iv_start_row is initial
                                  and iv_start_column is initial
                                  and iv_end_row is initial
                                  and iv_end_column is initial.
        iv_start_row = 1.
        iv_start_column = 1.
        iv_end_row = 20.
        iv_end_column = 150.
      endif.
      call function 'Z_FALV_DISPLAY'
        exporting
          io_falv         = me
          iv_start_row    = iv_start_row
          iv_start_column = iv_start_column
          iv_end_row      = iv_end_row
          iv_end_column   = iv_end_column.
      .
    else.
      assign outtab->* to <outtab>.
      me->set_table_for_first_display(
        exporting
             i_buffer_active               =  buffering_active   " Buffering Active
             i_bypassing_buffer            =  bypassing_buffer   " Switch Off Buffer
*            i_consistency_check           =     " Starting Consistency Check for Interface Error Recognition
*            i_structure_name              =     " Internal Output Table Structure Name
          is_variant                     =     variant
          i_save                        =      layout_save
*            i_default                     = 'X'    " Default Display Variant
          is_layout                     =      lvc_layout
*            is_print                      =     " Print Control
*            it_special_groups            =     " Field Groups
          it_toolbar_excluding          =     exclude_functions
*            it_hyperlink                  =     " Hyperlinks
*            it_alv_graphics               =     " Table of Structure DTC_S_TC
*            it_except_qinfo               =     " Table for Exception Quickinfo
*            ir_salv_adapter               =     " Interface ALV Adapter
        changing
          it_outtab                     =    <outtab> " Output Table
          it_fieldcatalog               =     fcat
          it_sort                       =     sort " Sort Criteria
          it_filter                     =     filter " Filter Criteria
        exceptions
          invalid_parameter_combination = 1
          program_error                 = 2
          too_many_lines                = 3
          others                        = 4 ).
      if sy-subrc eq 0.
        raise_before_first_display( ).
        if layout->delete_all_buttons eq abap_true.
          delete_all_buttons( toolbar_exceptions ).
        endif.
        if split_container is not initial.
          split_container->set_focus(
            exporting
              control           =     me
            exceptions
              cntl_error        = 0
              cntl_system_error = 0
              others            = 0 ).
          me->hide_applog( ).
        else.
          me->parent->set_focus(
            exporting
              control           =  me
            exceptions
              cntl_error        = 0
              cntl_system_error = 0
              others            = 0  ).
        endif.
        cl_gui_cfw=>flush(
          exceptions
            cntl_system_error = 0
            cntl_error        = 0
            others            = 0 ).
        me->set_visible( abap_true ).
        me->parent->set_visible( abap_true ).
        me->main_container->set_visible( abap_true ).
        if me->split_container is not initial.
          me->split_container->set_visible( abap_true ).
        endif.
        me->raise_top_of_page( ).
      endif.
    endif.
  endmethod.


  method raise_before_first_display.

    raise event before_first_display.
    if call_redraw_after_merging eq abap_true.
      redraw_after_merging_change( ).
    endif.
  endmethod.


  method enable_button.
    try.
        toolbar_added[ function = iv_function ]-disabled = abap_false.
      catch cx_sy_itab_line_not_found.
        clear sy-subrc.
    endtry.
    delete toolbar_disabled where function = iv_function.
    me->refresh_toolbar( ).
    r_falv = me.
  endmethod.


  method encode_picture_base64.

    rv_image = |<img src="data:{ iv_mime_type };base64,{ cl_http_utility=>encode_x_base64( unencoded = iv_xstring ) }">|.

  endmethod.


  method evf_after_refresh.
  endmethod.


  method evf_after_user_command.
  endmethod.


  method evf_at_set_pf_status.
  endmethod.


  method evf_at_set_title.
  endmethod.


  method set_dummy_function_code.
    call function 'SAPGUI_SET_FUNCTIONCODE'
      exporting
        functioncode           = 'DUMMY'
      exceptions
        function_not_supported = 0
        others                 = 0.
    r_falv = me.
  endmethod.


  method evf_before_ucommand_internal.
    field-symbols: <outtab> type standard table.
    case e_ucomm.
      when me->mc_fc_select_all.
        if layout->mark_field is not initial and
           line_exists( fcat[ fieldname = layout->mark_field checkbox = abap_true ] ).
          assign outtab->* to <outtab>.
          loop at <outtab> assigning field-symbol(<line>).
            assign component layout->mark_field of structure <line> to field-symbol(<mark>).
            if sy-subrc eq 0 and me->get_cell_enabled( i_row = sy-tabix i_field = layout->mark_field ) eq abap_true.
              <mark> = abap_true.
            endif.
          endloop.
          me->soft_refresh( ).
          set_user_command( i_ucomm = space ).
        endif.
      when me->mc_fc_deselect_all.
        if layout->mark_field is not initial and
          line_exists( fcat[ fieldname = layout->mark_field checkbox = abap_true ] ).
          assign outtab->* to <outtab>.
          loop at <outtab> assigning <line>.
            assign component layout->mark_field of structure <line> to <mark>.
            if sy-subrc eq 0 and me->get_cell_enabled( i_row = sy-tabix i_field = layout->mark_field ) eq abap_true.
              <mark> = abap_false.
            endif.
          endloop.
          me->soft_refresh( ).
          set_user_command( i_ucomm = space ).
        endif.
    endcase.
  endmethod.


  method evf_before_user_command.
  endmethod.


  method evf_btn_click.
  endmethod.


  method evf_click_col_header.

  endmethod.


  method evf_click_row_col.

  endmethod.


  method evf_context_menu.

  endmethod.


  method evf_context_menu_selected.

  endmethod.


  method evf_context_menu_request.

  endmethod.


  method evf_data_changed.

  endmethod.


  method evf_data_changed_finished.
  endmethod.


  method evf_data_changed_internal.

    if er_data_changed->mt_protocol is not initial.
      show_applog( ).
    else.
      hide_applog( ).
    endif.

    "This lines makes that focus stays on grid
    "while embedded error log appears on the screen.
    "This trick will not work if someone will use own handler
    "for data_changed instead of evf_data_changed
    me->m_display_protocol = abap_true.

    er_data_changed->display_protocol( ).

    cl_gui_control=>set_focus(
      exporting
        control           =  cast #( me )
      exceptions
        cntl_error        = 1
        cntl_system_error = 2
        others            = 3  ).
    if sy-subrc eq 0.
      me->m_display_protocol = abap_false.
    endif.

  endmethod.


  method evf_dblclick_row_col.

  endmethod.


  method evf_delayed_callback.

  endmethod.


  method evf_delayed_changed_sel_call.

  endmethod.


  method evf_delayed_change_selection.

  endmethod.


  method evf_delayed_move_current_cell.

  endmethod.


  method evf_double_click.
  endmethod.


  method evf_double_click_col_separator.

  endmethod.


  method evf_drop_external_file.

  endmethod.


  method evf_f1.

  endmethod.


  method evf_hotspot_click.
  endmethod.


  method evf_menu_button.
  endmethod.


  method evf_ondrag.

  endmethod.


  method evf_ondrop.

  endmethod.


  method evf_ondropcomplete.

  endmethod.


  method evf_ondropgetflavor.

  endmethod.


  method evf_onf1.
  endmethod.


  method evf_onf4.
  endmethod.


  method evf_request_data.

  endmethod.


  method evf_subtotal_text.
  endmethod.


  method evf_toolbar.

  endmethod.


  method evf_toolbar_button_click.

  endmethod.


  method evf_toolbar_internal.
    loop at toolbar_added assigning field-symbol(<tb>).
      insert <tb> into table e_object->mt_toolbar[].
    endloop.
    loop at toolbar_disabled assigning <tb>.
      try.
          e_object->mt_toolbar[ function = <tb>-function ]-disabled = abap_true.
        catch cx_sy_itab_line_not_found.
          clear sy-subrc.
      endtry.
    endloop.
    loop at toolbar_deleted assigning <tb>.
      delete e_object->mt_toolbar where function = <tb>-function.
    endloop.

  endmethod.


  method evf_toolbar_menubutton_click.

  endmethod.


  method evf_toolbar_menu_selected.

  endmethod.


  method evf_top_of_page.

  endmethod.


  method evf_total_click_row_col.

  endmethod.


  method evf_user_command.
    case e_ucomm.
      when fc_back.
        leave to screen 0.
      when fc_exit.
        leave to screen 0.
      when fc_up.
        leave to screen 0.
      when fc_cancel.
        leave to screen 0.
      when fc_mass_replace.
        mass_replace( ).
      when fc_find.
        e_ucomm = '%SC'.
        set_function_code( changing c_ucomm = e_ucomm ).
      when fc_find_next.
        e_ucomm = '%SC+'.
        set_function_code( changing c_ucomm = e_ucomm ).
    endcase.
  endmethod.


  method exclude_function.
    if not line_exists( exclude_functions[ table_line = iv_ucomm ] ).
      insert iv_ucomm into table exclude_functions.
    endif.
  endmethod.


  method create_ex_result_falv.
    data:
      lt_lvc_row type lvc_t_row.

    clear:
      lt_lvc_row.
    me->get_selected_rows(
      importing
        et_index_rows = lt_lvc_row ).

    data: lt_sel_cols  type lvc_t_col,
          lt_sel_cells type lvc_t_cell.

    me->get_selected_columns(
     importing
       et_index_columns = lt_sel_cols ).

    me->get_selected_cells(
     importing
       et_cell = lt_sel_cells ).

    data:
      ls_lvc_col  type lvc_s_col,
      ls_lvc_row  type lvc_s_row,
      ls_cur_cell type lvc_s_cell.

    clear:
      ls_lvc_row,
      ls_lvc_col.
    me->get_current_cell(
     importing
       es_row_id = ls_lvc_row
       es_col_id = ls_lvc_col ).
    ls_cur_cell-col_id-fieldname = ls_lvc_col-fieldname.
    ls_cur_cell-row_id-index = ls_lvc_row-index.

    er_result_table = cl_salv_ex_util=>factory_result_data_table(
        t_selected_rows             = lt_lvc_row
        t_selected_columns          = lt_sel_cols
        t_selected_cells            = lt_sel_cells
        r_data                      = grid->mt_outtab
        s_layout                    = grid->m_cl_variant->ms_layout
        t_fieldcatalog              = grid->m_cl_variant->mt_fieldcatalog
        t_sort                      = grid->m_cl_variant->mt_sort
        t_filter                    = grid->m_cl_variant->mt_filter
        t_hyperlinks                = grid->mt_hyperlinks
        s_current_cell              = ls_cur_cell
*        hyperlink_entry_column      = ls_hyper_entry
*        dropdown_entry_column       = ls_dropdown_entry
*        r_top_of_list               = lr_top_of_list
*        r_end_of_list               = lr_end_of_list
*        t_dropdown_values           = lt_drdn
         ).

  endmethod.


  method export_to_excel.


    data: version type string.
    data: result_data type ref to cl_salv_ex_result_data_table.
    data: columns type ref to cl_salv_columns_table.
    data: aggreg type ref to cl_salv_aggregations.
    data: salv_intf_descr type ref to cl_abap_objectdescr.
    data: salv_table type ref to cl_salv_table.
    data: file_type type salv_bs_constant.
    field-symbols <tab> type any table.


    if cl_salv_bs_a_xml_base=>get_version( ) eq if_salv_bs_xml=>version_25 or
       cl_salv_bs_a_xml_base=>get_version( ) eq if_salv_bs_xml=>version_26.

      result_data = create_ex_result_falv( ).

      case cl_salv_bs_a_xml_base=>get_version( ).
        when if_salv_bs_xml=>version_25.
          version = if_salv_bs_xml=>version_25.
        when if_salv_bs_xml=>version_26.
          version = if_salv_bs_xml=>version_26.
      endcase.

      "if XLSX is possible then we create it,  if not then MHTML excel file
      salv_intf_descr ?= cl_abap_intfdescr=>describe_by_name( exporting p_name = 'IF_SALV_BS_XML' ).
      if salv_intf_descr is not initial and line_exists( salv_intf_descr->attributes[ name = 'C_TYPE_XLSX'  ] ).
        file_type = 10.
      else.
        file_type = 02.
      endif.

      "transformation of data to excel
      call method cl_salv_bs_tt_util=>if_salv_bs_tt_util~transform
        exporting
          xml_type      = file_type
          xml_version   = version
          r_result_data = result_data
          xml_flavour   = if_salv_bs_c_tt=>c_tt_xml_flavour_export
          gui_type      = if_salv_bs_xml=>c_gui_type_gui
        importing
          xml           = rv_xstring.
    endif.


  endmethod.


  method get_cell_enabled.
    field-symbols: <outtab> type standard table,
                   <styles> type lvc_t_styl,
                   <field>  type any.
    check i_row is not initial and i_field is not initial.
    get_frontend_layout( importing es_layout = lvc_layout ).

    " if sy-subrc eq 0. " The value of SY-SUBRC is always set to 0 by CALL METHOD GET_FRONTEND_LAYOUT.
    if lvc_layout-stylefname is not initial.
      assign outtab->* to <outtab>.
      assign <outtab>[ i_row ] to field-symbol(<line>).
      if sy-subrc eq 0.
        assign component lvc_layout-stylefname of structure <line> to <styles>.
        if sy-subrc eq 0.
          assign <styles>[ fieldname = i_field ] to field-symbol(<style>).
          if sy-subrc eq 0.
            if <style>-style = mc_style_enabled.
              r_enabled = abap_true.
              return.
            elseif <style>-style = mc_style_disabled.
              r_enabled = abap_false.
              return.
            endif.
          endif.
        endif.
      endif.
    endif.
    "all cells editable
    if lvc_layout-edit eq abap_true.
      r_enabled = abap_true.
    else.
      get_frontend_fieldcatalog( importing et_fieldcatalog = fcat ).
      assign fcat[ fieldname = i_field ] to field-symbol(<fcat>).
      if <fcat>-edit eq abap_true.
        r_enabled = abap_true.
      endif.
    endif.
    " endif.
  endmethod.


  method get_file_from_mime.
    cl_mime_repository_api=>get_api( )->get(
            exporting i_url = iv_path
            importing e_content = ev_xstring
                      e_mime_type = ev_mime_type
        exceptions others = 1 ).
    check sy-subrc eq 0.
  endmethod.


  method get_picture_from_se78.
    cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp(
      exporting
        p_object       = 'GRAPHICS'    " SAPscript Graphics Management: Application object
        p_name         =  iv_name   " Name
        p_id           =  iv_id   " SAPscript Graphics Management: ID
        p_btype        =  iv_type   " SAPscript: Type of graphic
      receiving
        p_bmp          =  rv_xstring   " Graphic Data
      exceptions
        not_found      = 0
        internal_error = 0
        others         = 0 ).
  endmethod.


  method hide_applog.

    if main_split_container is not initial.
      main_split_container->set_row_sash(
        exporting
          id                =  1   " Row Splitter Bar ID
          type              =  split_container->type_sashvisible   " Attribute
          value             =  0   " Value
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0      ).
      main_split_container->set_row_height(
        exporting
          id                =   2 " Row ID
          height            =   0  " Height
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0   ).
      clear splitter_row_3_height.
    endif.
  endmethod.


  method hide_top_of_page.
    if split_container is not initial.

      split_container->set_row_sash(
        exporting
          id                =  1   " Row Splitter Bar ID
          type              =  split_container->type_sashvisible   " Attribute
          value             =  0   " Value
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0  ).

      split_container->set_row_height(
        exporting
          id                =   1 " Row ID
          height            =   0  " Height
        exceptions
          cntl_error        = 1
          cntl_system_error = 2
          others            = 3   ).
      if sy-subrc eq 0.
        splitter_row_1_height = 0.
      endif.
    endif.
    r_falv = me.
  endmethod.


  method lvc_fcat_from_itab.
    data: table type ref to data.
    create data table like it_table.
    assign table->* to field-symbol(<table>).
    try.
        cl_salv_table=>factory( importing
                                  r_salv_table   = data(salv_table)
                                changing
                                  t_table        = <table>  ).
        rt_fcat = cl_salv_controller_metadata=>get_lvc_fieldcatalog(
            r_columns      = salv_table->get_columns( ) " ALV Filter
            r_aggregations = salv_table->get_aggregations( ) )." ALV Aggregations
      catch cx_root.
    endtry.
  endmethod.


  method mass_replace.
    field-symbols: <outtab> type standard table.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      call function 'Z_FALV_MASS_REPLACE'
        exporting
          io_grid   = cast cl_gui_alv_grid( me )
        changing
          ct_outtab = <outtab>.
    endif.
  endmethod.


  method pai.
    data: ucomm type sy-ucomm.
    ucomm = c_ucomm.
    clear c_ucomm.
    raise event user_command exporting e_ucomm = ucomm.

    me->set_function_code(
       changing
         c_ucomm = ucomm ).
  endmethod.


  method pbo.

    gui_status->show_gui_status( ).
    raise event at_set_pf_status .

    gui_status->show_title(
      exporting
        iv_text1 = title_v1
        iv_text2 = title_v2
        iv_text3 = title_v3
        iv_text4 = title_v4
        iv_text5 = title_v5 ).
    raise event at_set_title.

  endmethod.


  method raise_top_of_page.

    if top_of_page_visible_at_start eq abap_true and
       top_of_page_container is not initial.

      if me->top_of_page_doc is initial.
        top_of_page_doc = new cl_dd_document( ).
      endif.

      export alv_form_html from abap_true
            to memory id 'ALV_FORM_HTML'.


      call method me->list_processing_events
        exporting
          i_event_name = 'TOP_OF_PAGE'
          i_dyndoc_id  = me->top_of_page_doc.


      export alv_form_html from abap_false
             to memory id 'ALV_FORM_HTML'.

      top_of_page_doc->display_document(
        exporting
          reuse_control      =  'X'
           parent             =  top_of_page_container
        exceptions
          html_display_error = 0
          others             = 0    ).
      show_top_of_page( ).
    endif.
  endmethod.


  method refresh_toolbar.
    check cl_gui_alv_grid=>offline( ) is initial.
    check grid->m_init_toolbar eq space.
    try.
        me->set_toolbar_interactive(  ).
      catch cx_root.
        "in case method is called before the display of grid
        "no need to do anything with that
        clear sy-subrc.
    endtry.
    r_falv = me.
  endmethod.


  method save_excel_localy.
    data: path     type string,
          filename type string.

    if iv_path is initial.
      cl_gui_frontend_services=>file_save_dialog(
      exporting
*      window_title         = window_title
        default_extension    = 'XLSX'
*      default_file_name    = default_file_name
*      with_encoding        = with_encoding
*      file_filter          = file_filter
*      initial_directory    = initial_directory
*      prompt_on_overwrite  = 'X'
      changing
        filename             = filename
        path                 = path
        fullpath             = iv_path
*      user_action          = user_action
*      file_encoding        = file_encoding
      exceptions
        cntl_error           = 1
        error_no_gui         = 2
        not_supported_by_gui = 3
        others               = 4 ).
      if sy-subrc <> 0.
        return.
      endif.
    endif.

    if iv_path is not initial.

      data(xstring) = me->export_to_excel( ).
      data(xstrsize) = xstrlen( xstring ).
      data(solix) = cl_bcs_convert=>xstring_to_solix( xstring ).

      cl_gui_frontend_services=>gui_download(
        exporting
          bin_filesize              = xstrsize
          filename                  = iv_path
          filetype                  = 'BIN'
        changing
          data_tab                  = solix
        exceptions
          file_write_error          = 1
          no_batch                  = 2
          gui_refuse_filetransfer   = 3
          invalid_type              = 4
          no_authority              = 5
          unknown_error             = 6
          header_not_allowed        = 7
          separator_not_allowed     = 8
          filesize_not_allowed      = 9
          header_too_long           = 10
          dp_error_create           = 11
          dp_error_send             = 12
          dp_error_write            = 13
          unknown_dp_error          = 14
          access_denied             = 15
          dp_out_of_memory          = 16
          disk_full                 = 17
          dp_timeout                = 18
          file_not_found            = 19
          dataprovider_exception    = 20
          control_flush_error       = 21
          not_supported_by_gui      = 22
          error_no_gui              = 23
          others                    = 24
             ).
      if sy-subrc eq 0.
        rv_saved = abap_true.
      endif.

    endif.
  endmethod.


  method send.
    r_falv = me.
    try.
        data(request) = cl_bcs=>create_persistent( ).
      catch cx_send_req_bcs.
        raise create_request_error.
    endtry.

    try.
        data(document) = cl_document_bcs=>create_document(
                                                            i_type = 'HTM'
                                                            i_text = cl_document_bcs=>string_to_soli( iv_body )
                                                            i_subject = conv #( iv_subject )
                                                            i_importance = iv_importance
                                                            i_sensitivity = iv_sensitivity ).


      catch cx_document_bcs.
        raise create_document_error.
    endtry.

    data(excel) = export_to_excel( ).

    try.
        document->add_attachment(
            i_attachment_type    = 'EXT'
            i_att_content_hex    = cl_document_bcs=>xstring_to_solix( excel )
            i_attachment_size    = conv #( xstrlen( excel ) )
            i_attachment_subject = cond #( when iv_filename is not initial then iv_filename
                                           else conv #( |{ sy-datum }_{ sy-uzeit }.xlsx | )
                                                        ) ).
      catch cx_document_bcs .
        raise add_attachment_error.
    endtry.


    try.

        request->set_document( document ).
      catch cx_send_req_bcs.
        raise add_document_error.
    endtry.

    if it_recipients is not initial.
      loop at it_recipients assigning field-symbol(<addr>).
        try.
            data(smtp_addr) = cl_cam_address_bcs=>create_internet_address( <addr>-smtp_addr ).
          catch cx_address_bcs.
            raise add_recipient_error.
        endtry.

        try.
            request->add_recipient( i_recipient = smtp_addr
                                    i_express = <addr>-express
                                    i_copy = <addr>-copy
                                    i_blind_copy = <addr>-blind_copy
            ).

          catch cx_send_req_bcs.
            raise add_recipient_error.
        endtry.
      endloop.

      if iv_sender is not initial.
        try.
            data(sender)  = cl_cam_address_bcs=>create_internet_address(  i_address_string  = iv_sender
                                                                          i_address_name    = iv_sender_name ).
          catch cx_address_bcs.
            raise add_sender_error.
        endtry.

        try.
            request->set_sender( i_sender = sender ).
          catch cx_send_req_bcs.
            raise add_sender_error.
        endtry.
      endif.

      try.
          request->set_message_subject( ip_subject = iv_subject ).
        catch cx_root.
      endtry.


      if iv_immediately eq abap_true.
        try .
*     set send immediately
            request->set_send_immediately( abap_true ).
          catch cx_send_req_bcs.
            raise send_immediately_error.
        endtry.

      endif.
      try.
          data(result) = request->send(  ).
          if iv_commit eq abap_true.
            commit work.
          endif.
        catch cx_send_req_bcs.
          raise send_error.
      endtry.
    else.
      raise add_recipient_error.
    endif.
  endmethod.


  method set_cell_button.
    r_falv = me.
    field-symbols: <outtab> type standard table,
                   <styles> type lvc_t_styl.
    get_frontend_layout( importing es_layout = lvc_layout ).
    check lvc_layout-stylefname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-stylefname of structure <row> to <styles>.
        if sy-subrc eq 0.
          try.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_button.
            catch cx_sy_itab_line_not_found.
              insert value #( fieldname = iv_fieldname style = mc_style_button ) into table <styles>.
          endtry.
        endif.
      endif.
    endif.
  endmethod.


  method set_cell_color.
    field-symbols: <outtab> type standard table,
                   <colors> type lvc_t_scol.
    r_falv = me.
    get_frontend_layout( importing es_layout = lvc_layout ).
    check lvc_layout-ctab_fname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-ctab_fname of structure <row> to <colors>.
        if sy-subrc eq 0.
          try.
              <colors>[ fname = iv_fieldname ]-color = iv_color.
            catch cx_sy_itab_line_not_found.
              insert value #( fname = iv_fieldname color = iv_color ) into table <colors>.
          endtry.
        endif.
      endif.
    endif.
  endmethod.


  method set_cell_disabled.
    field-symbols: <outtab> type standard table,
                   <styles> type lvc_t_styl.
    r_falv = me.
    get_frontend_layout( importing es_layout = lvc_layout ).
    check lvc_layout-stylefname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-stylefname of structure <row> to <styles>.
        if sy-subrc eq 0.
          try.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_disabled.
            catch cx_sy_itab_line_not_found.
              insert value #( fieldname = iv_fieldname style = mc_style_disabled ) into table <styles>.
          endtry.
        endif.
      endif.
    endif.
  endmethod.


  method set_cell_enabled.
    field-symbols: <outtab> type standard table,
                   <styles> type lvc_t_styl.
    r_falv = me.
    get_frontend_layout( importing es_layout = lvc_layout ).
    check lvc_layout-stylefname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-stylefname of structure <row> to <styles>.
        if sy-subrc eq 0.
          try.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_enabled.
            catch cx_sy_itab_line_not_found.
              insert value #( fieldname = iv_fieldname style = mc_style_enabled ) into table <styles>.
          endtry.
        endif.
      endif.
    endif.
  endmethod.


  method set_cell_hotspot.
    field-symbols: <outtab> type standard table,
                   <styles> type lvc_t_styl.
    r_falv = me.
    get_frontend_layout( importing es_layout = lvc_layout ).
    check lvc_layout-stylefname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-stylefname of structure <row> to <styles>.
        if sy-subrc eq 0.
          try.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_hotspot.
            catch cx_sy_itab_line_not_found.
              insert value #( fieldname = iv_fieldname style = mc_style_hotspot ) into table <styles>.
          endtry.
        endif.
      endif.
    endif.
  endmethod.


  method set_editable.
    r_falv = me.
    check cl_gui_alv_grid=>offline( ) is initial.
    me->set_ready_for_input( i_ready_for_input = 1 ).
    if iv_modify eq abap_true.
      me->register_edit_event(
        exporting
          i_event_id =  me->mc_evt_modified
        exceptions
          error      = 0
          others     = 0 ).
    else.
      me->register_edit_event(
        exporting
          i_event_id =  me->mc_evt_enter
        exceptions
          error      = 0
          others     = 0  ).
    endif.
  endmethod.


  method set_frontend_fieldcatalog.
    fcat = it_fieldcatalog.
    super->set_frontend_fieldcatalog( fcat ).
  endmethod.


  method set_frontend_layout.
    lvc_layout = is_layout.
    super->set_frontend_layout( is_layout ).
  endmethod.


  method set_list_view.
    m_batch_mode = abap_true.
    r_falv = me.
  endmethod.


  method set_mark_field.
    if line_exists( fcat[ fieldname = iv_fieldname ] ).
      layout->mark_field = iv_fieldname.
      check iv_fieldname is not initial.
      column( iv_fieldname )->set_checkbox( abap_true ).
    endif.
  endmethod.


  method set_output_table.
    get reference of ct_table into outtab.
  endmethod.


  method set_parent.
    me->parent ?= io_parent.
    r_falv = me.
  endmethod.


  method set_readonly.
    me->set_ready_for_input( i_ready_for_input = 0 ).
    r_falv = me.
  endmethod.


  method set_row_color.
    field-symbols: <outtab> type standard table,
                   <color>  type char04.
    r_falv = me.
    get_frontend_layout( importing es_layout = lvc_layout ).
    check lvc_layout-info_fname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-info_fname of structure <row> to <color>.
        if sy-subrc eq 0.
          <color> = iv_color.
        endif.
      endif.
    endif.
  endmethod.


  method show_applog.

    r_falv = me.
    if main_split_container is not initial.
      main_split_container->get_row_height(
    exporting
      id                =  2
    importing
      result            =  splitter_row_2_height
    exceptions
      cntl_error        = 1
      cntl_system_error = 2
      others            = 3  ).
      if sy-subrc eq 0 and splitter_row_2_height eq 0.
        main_split_container->set_row_sash(
          exporting
            id                =  1   " Row Splitter Bar ID
            type              =  split_container->type_sashvisible   " Attribute
            value             =  1   " Value
          exceptions
            cntl_error        = 0
            cntl_system_error = 0
            others            = 0 ).
        main_split_container->get_row_height(
          exporting
            id                =  1   " ALV
          importing
            result            =  splitter_row_2_height
          exceptions
            cntl_error        = 0
            cntl_system_error = 0
            others            = 0 ).

        main_split_container->get_row_height(
          exporting
            id                = 2   " Row ID
          importing
            result            =  splitter_row_3_height   " Result Code
          exceptions
            cntl_error        = 0
            cntl_system_error = 0
            others            = 0 ).

        main_split_container->set_row_height(
          exporting
            id                =   2 "error log
            height            =   error_log_height
          importing
            result           = result
          exceptions
            cntl_error        = 0
            cntl_system_error = 0
            others            = 0 ).

        try.
            main_split_container->set_row_height(
             exporting
               id                =   1 " ALV
               height            =   conv #( splitter_row_2_height - error_log_height )
             importing
               result           = result
             exceptions
               cntl_error        = 0
               cntl_system_error = 0
               others            = 0 ).
          catch cx_root.
        endtry.
      endif.
      clear splitter_row_2_height.
      clear splitter_row_3_height.
    endif.
  endmethod.


  method show_top_of_page.
    r_falv = me.
    if split_container is not initial.
      split_container->set_row_sash(
        exporting
          id                =  1   " Row Splitter Bar ID
          type              =  split_container->type_sashvisible   " Attribute
          value             =  1   " Value
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0 ).

      split_container->get_row_height(
        exporting
          id                =  1   " Row ID
        importing
          result            =  splitter_row_1_height   " Result Code
        exceptions
          cntl_error        = 1
          cntl_system_error = 2
          others            = 3 ).
      if sy-subrc eq 0 and splitter_row_1_height eq 0.
        split_container->set_row_height(
          exporting
            id                =   1 " Row ID
            height            =   top_of_page_height
          importing
            result           = result
          exceptions
            cntl_error        = 0
            cntl_system_error = 0
            others            = 0 ).
      endif.
      top_of_page_visible_at_start = abap_true.
    endif.
  endmethod.


  method soft_refresh.
    me->refresh_table_display(
      exporting
        is_stable      =     conv #( 'XX' ) " With Stable Rows/Columns
        i_soft_refresh =     abap_true" Without Sort, Filter, etc.
      exceptions
        finished       = 0
        others         = 0 ).
    r_falv = me.
  endmethod.


  method copy_attributes.
    field-symbols: <outtab> type standard table.
    assign me->outtab->* to <outtab>.
    i_falv->set_output_table( changing ct_table = <outtab> ).
    i_falv->fcat = i_falv->lvc_fcat_from_itab( it_table = <outtab> ).
    i_falv->sort = me->sort.
    i_falv->filter = me->filter.
    i_falv->set_frontend_fieldcatalog( it_fieldcatalog = me->fcat ).
    i_falv->application_log_embedded = application_log_embedded.
    i_falv->built_in_screen = built_in_screen.
    i_falv->build_columns( ).
    i_falv->layout = new zcl_falv_layout( io_falv = i_falv ).
    i_falv->gui_status ?= me->gui_status->if_os_clone~clone( ). "clone object
    i_falv->lvc_layout = me->lvc_layout.
    i_falv->variant = me->variant.
    i_falv->top_of_page_height = me->top_of_page_height.
    i_falv->top_of_page_visible_at_start = me->top_of_page_visible_at_start.
    i_falv->title_v1 = me->title_v1.
    i_falv->title_v2 = me->title_v2.
    i_falv->title_v3 = me->title_v3.
    i_falv->title_v4 = me->title_v4.
    i_falv->exclude_functions = me->exclude_functions.
    i_falv->toolbar_added = me->toolbar_added.
    i_falv->toolbar_deleted = me->toolbar_deleted.
    i_falv->toolbar_disabled = me->toolbar_disabled.
    i_falv->m_batch_mode = me->m_batch_mode.
    i_falv->layout->delete_all_buttons = me->layout->delete_all_buttons.
    i_falv->layout->mark_field = me->layout->mark_field.
    i_falv->register_f4_for_fields( it_f4 = me->grid->mt_f4 ).
  endmethod.


  method get_columns.
    rt_columns = me->columns.
  endmethod.


  method create_by_type.
    data:
      lr_output type ref to data.

    field-symbols:
      <table> type any table.

    data(lv_type_name) = i_type->absolute_name.

    if i_type->kind <> cl_abap_typedescr=>kind_table.
      free: rv_falv.
      return.
    endif.

    create data lr_output type (lv_type_name).
    assign lr_output->* to <table>.

    if i_subclass is initial.
      i_subclass ?= check_if_called_from_subclass( ).
    endif.

    rv_falv = zcl_falv=>create(
      exporting
        i_parent          = i_parent
        i_applogparent    = i_applogparent
        i_popup           = i_popup
        i_applog_embedded = i_applog_embedded
        i_subclass        = i_subclass
      changing
        ct_table          = <table>
    ).
  endmethod.


  method init_cell_styles.
* https://tricktresor.de/blog/zellen-verbinden/
    field-symbols <data> type lvc_s_data.
* Nur Spalte setze komplette Spalte
    loop at mt_data assigning <data>.
      <data>-style = 0.
    endloop.
    call_redraw_after_merging = abap_true.
  endmethod.


  method set_cell_style.
* https://tricktresor.de/blog/zellen-verbinden/
    field-symbols <data> type lvc_s_data.
    if row is initial.
      if col is initial.
* Beides leer -> nichts zu tun.
        exit.
      else.
* Nur Spalte setze komplette Spalte
        loop at mt_data assigning <data>
              where col_pos = col.
          <data>-style  = <data>-style + style.
          <data>-style2 = <data>-style2 + style2.
        endloop.
        if sy-subrc eq 0.
          call_redraw_after_merging = abap_true.
        endif.
      endif.
    else.
      if col is initial.
* Nur Zeile eingegeben -> komplette Zeile setzen
        loop at mt_data assigning <data>
              where row_pos = row.
          <data>-style  = <data>-style + style.
          <data>-style2 = <data>-style2 + style2.
        endloop.
        if sy-subrc eq 0.
          call_redraw_after_merging = abap_true.
        endif.
      else.
        read table mt_data assigning <data>
            with key row_pos = row
                     col_pos = col.
        if sy-subrc eq 0.
          <data>-style  = <data>-style + style.
          <data>-style2 = <data>-style2 + style2.
          call_redraw_after_merging = abap_true.
        else.
          exit.
        endif.
      endif.
    endif.

  endmethod.


  method set_fixed_col_row.
* https://tricktresor.de/blog/zellen-verbinden/
    me->set_fixed_cols( col ).
    me->set_fixed_rows( row ).
    call_redraw_after_merging = abap_true.
  endmethod.


  method set_merge_horizontally.
* https://tricktresor.de/blog/zellen-verbinden/
* ROW - Zeile deren Spalten zusammengeführt werden sollen
* tab_col_merge - Spalten, die zusammengeführt werden sollen
    field-symbols <data> type lvc_s_data.
    data outputlen type i.

    data(cols) = tab_col_merge.

    sort cols.

* Die Spalten, die zusammengeführt werden sollen
    loop at cols into data(col) where col_id > 0.
* ein paar Prüfungen
      if col-outputlen <= col-col_id.
        continue.
      endif.
      outputlen = col-outputlen - col-col_id.
      loop at mt_data assigning <data>
           where row_pos = row  and
                 ( col_pos between col-col_id and
                                   col-outputlen ).
* Setze wie weit soll gemerged werden Von Spalte in Länge
* und zwar wird bei der 1 Spalte angefangen
        if <data>-col_pos = col-col_id.
          <data>-mergehoriz = outputlen.
* bei allen anderen, die zusammangehören
* muss der Wert raus, da er aus der 1. Spalte kommt
* und das mergekennzeichen muss auch weg !
        else.
          clear <data>-mergehoriz.
          clear <data>-value.
        endif.
      endloop.

    endloop.
    call_redraw_after_merging = abap_true.
  endmethod.


  method set_merge_vertically.
* https://tricktresor.de/blog/zellen-verbinden/

* ROW - Zeile deren Spalten zusammengeführt werden sollen
* tab_col_merge - Spalten, die zusammengeführt werden sollen
    field-symbols <data> type lvc_s_data.
    data outputlen type i.

    data(cols) = tab_col_merge.
    sort cols.

* Die Spalten, die zusammengeführt werden sollen
    loop at cols into data(col) where col_id > 0.
* ein paar Prüfungen
      if col-outputlen <= col-col_id.
        continue.
      endif.
      outputlen = col-outputlen - col-col_id.
      loop at mt_data assigning <data>
           where row_pos = row  and
                 ( col_pos between col-col_id and
                                   col-outputlen ).
* Setze wie weit soll gemerged werden Von Spalte in Länge
* und zwar wird bei der 1 Spalte angefangen
        if <data>-col_pos = col-col_id.
          <data>-mergevert = outputlen.
* bei allen anderen, die zusammangehören
* muss der Wert raus, da er aus der 1. Spalte kommt
* und das mergekennzeichen muss auch weg !
        else.
          clear <data>-mergevert.
****************          clear <data>-value.
        endif.
      endloop.

      call_redraw_after_merging = abap_true.
    endloop.

  endmethod.


  method evf_before_first_display ##NEEDED.

  endmethod.


  method redraw_after_merging_change.
* https://tricktresor.de/blog/zellen-verbinden/
    me->set_data_table( changing data_table = mt_data[] ).
    set_auto_redraw( enable = 1 ).

  endmethod.
ENDCLASS.
