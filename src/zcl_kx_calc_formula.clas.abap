class zcl_kx_calc_formula definition
  public
  final
  create public .

  public section.
    interfaces if_sadl_exit_calc_element_read .

  protected section.
    methods evaluate_wc_formula
      importing
                FormulaText           type ap_fortxt
      returning value(EvaluatedValue) type ap_fortxt.

  private section.
endclass.

class zcl_kx_calc_formula implementation.
  method if_sadl_exit_calc_element_read~get_calculation_info.
    et_requested_orig_elements = value #( base et_requested_orig_elements
                                              ( conv #( 'SETUPFORMULA' ) )
                                              ( conv #( 'PROCESSINGFORMULA' ) )
                                              ( conv #( 'TEARDOWNFORMULA' ) )
                                              ( conv #( 'OTHERFORMULA' ) )
                                            ).
  endmethod.

  method if_sadl_exit_calc_element_read~calculate.
* for performance: preload static TC25,TC20 with formula texts and their evaluated values
    types: begin of ty_tc25,
             mandt     type mandt,
             ident     type ap_formel,
             ftext     type ap_fortxt,
             value_def type ap_fortxt,
           end of ty_tc25.
    types: tt_tc25 type hashed table of ty_tc25
                         with unique key mandt ident.
    data: lt_tc25 type tt_tc25.
    select mandt, ident, ftext
      from tc25
      into table @lt_tc25.
    loop at lt_tc25  assigning field-symbol(<fs_tc25>).
      <fs_tc25>-value_def = evaluate_wc_formula( <fs_tc25>-ftext ).
    endloop.

* loop ZC_KX_SourceConstraint_OP and look up lt_tc25 for setup, processing, teardown, and other formulas
    types: begin of ty_cds_data,
             mandt                  type mandt,
             SetupFormulaText       type ap_fortxt,
             ProcessingFormulaText  type ap_fortxt,
             TeardownFormulaText    type ap_fortxt,
             OtherFormulaText       type ap_fortxt,
             SetupFormulaValue      type ap_fortxt,
             ProcessingFormulaValue type ap_fortxt,
             TeardownFormulaValue   type ap_fortxt,
             OtherFormulaValue      type ap_fortxt,
           end of ty_cds_data.

    data lt_original_data type standard table of ZC_KX_SourceConstraint_OP with default key.
    lt_original_data = corresponding #( it_original_data ).

    loop at lt_original_data assigning field-symbol(<fs_data>).
      read table lt_tc25
      assigning field-symbol(<fs_setup>)
      with table key mandt = sy-mandt
                  ident = <fs_data>-SetupFormula.
      if sy-subrc = 0.
        <fs_data>-SetupFormulaText = <fs_setup>-ftext.
        <fs_data>-SetupFormulaValue = <fs_setup>-value_def.
      endif.

      read table lt_tc25
      assigning field-symbol(<fs_processing>)
      with table key mandt = sy-mandt
                  ident = <fs_data>-ProcessingFormula.
      if sy-subrc = 0.
        <fs_data>-ProcessingFormulaText = <fs_processing>-ftext.
        <fs_data>-ProcessingFormulaValue = <fs_processing>-value_def.
      endif.

      read table lt_tc25
      assigning field-symbol(<fs_teardown>)
      with table key mandt = sy-mandt
                  ident = <fs_data>-TeardownFormula.
      if sy-subrc = 0.
        <fs_data>-TeardownFormulaText = <fs_teardown>-ftext.
        <fs_data>-TeardownFormulaValue = <fs_teardown>-value_def.
      endif.

      read table lt_tc25
      assigning field-symbol(<fs_other>)
      with table key mandt = sy-mandt
                  ident = <fs_data>-OtherFormula.
      if sy-subrc = 0.
        <fs_data>-OtherFormulaText = <fs_other>-ftext.
        <fs_data>-OtherFormulaValue = <fs_other>-value_def.
      endif.
    endloop.
    ct_calculated_data = corresponding #( lt_original_data ).
  endmethod.

  method evaluate_wc_formula.
    " This method evaluates a formula string and returns the evaluated value
    data: lv_result type f,
          fval      type vgwrt.
    call function 'EVAL_FORMULA'
      exporting
        formula            = FormulaText
        program            = 'ZKN_EVAL_FORMULA' "sy-repid
*       program            = 'ZCL_KX_CALC_FORMULA================CP' " Class pool program name
        routine            = 'VAR_GET'
      importing
        value              = lv_result
      exceptions
        division_by_zero   = 1
        invalid_expression = 2
        others             = 3.
    if sy-subrc = 0.
      move lv_result to fval.
      move fval to EvaluatedValue.
      condense EvaluatedValue.
    else.
      EvaluatedValue = ''. " Or handle fallback logic
    endif.
  endmethod.
endclass.
