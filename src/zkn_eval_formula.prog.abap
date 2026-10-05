*&---------------------------------------------------------------------*
*& Report ZKN_EVAL_FORMULA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report zkn_eval_formula.

*       FORM VAR_GET                                                  *
*---------------------------------------------------------------------*

form var_get using value(name)
             changing value(value)
                      value(subrc).
  subrc = 0.
  value = 0.  "Default
  select single value_def from tc20 into @value where parid = @name.
endform.                    "VAR_GET
