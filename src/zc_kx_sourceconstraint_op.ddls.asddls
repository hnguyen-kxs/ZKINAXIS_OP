@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SourceConstraint'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZC_KX_SourceConstraint_OP
  as projection on ZI_KX_SourceConstraint_OP
{
  key            MaterialNumber,
  key            Plant,
  key            ProductionVersion,
                 MaxLotSizeQty,
                 MinLotSizeQty,
                 EffectiveIndate,
                 EffectiveOutdate,
                 KeyForTaskListGroup,
                 BOMAlternate,
                 ProductionVersionLock,
                 ProdVersionProcurementType,
                 GroupCounter,
                 TaskListType,
                 SpecialProcurementType,
                 BOMUsage,
                 DistKeyForQtyProduced,
                 ProductionVersionCheckStatus,
                 TransferPlant,
                 ProcurementSubType,
                 NumberOfTaskListNode,
                 Sequence,
                 ValidFromDate,
                 ValidToDate,
                 Inactive,
                 TaskListUsage,
                 Status,
                 TaskListUnit,
                 LotSizeFrom,
                 LotSizeTo,
                 Activity,
                 ObjectType,
                 UoMForActivity,
                 Denominator,
                 Numerator,
                 BaseQuantity,
                 UoMOfStandardValue01,
                 StandardValue01,
                 UoMOfStandardValue02,
                 StandardValue02,
                 UoMOfStandardValue03,
                 StandardValue03,
                 UoMOfStandardValue04,
                 StandardValue04,
                 UoMOfStandardValue05,
                 StandardValue05,
                 UoMOfStandardValue06,
                 StandardValue06,
                 WorkCenterInternalID,
                 CapacityAllocationNumber,
                 StartDate,
                 EndDate,
                 WorkCenterName,
                 WorkCenterType,
                 StdValueKey,
                 CapacityID,
                 CapacityStartDate,
                 CapacityEndDate,
                 SetupFormula,
                 ProcessingFormula,
                 TeardownFormula,
                 OtherFormula,
                 @ObjectModel.virtualElement: true
                 @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_KX_CALC_FORMULA'
  virtual        SetupFormulaText       : ap_fortxt,
                 @ObjectModel.virtualElement: true
                 @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_KX_CALC_FORMULA'
  virtual        ProcessingFormulaText  : ap_fortxt,
                 @ObjectModel.virtualElement: true
                 @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_KX_CALC_FORMULA'
  virtual        TeardownFormulaText    : ap_fortxt,
                 @ObjectModel.virtualElement: true
                 @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_KX_CALC_FORMULA'
  virtual        OtherFormulaText       : ap_fortxt,
                 @ObjectModel.virtualElement: true
                 @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_KX_CALC_FORMULA'
  virtual        SetupFormulaValue      : ap_fortxt,
                 @ObjectModel.virtualElement: true
                 @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_KX_CALC_FORMULA'
  virtual        ProcessingFormulaValue : ap_fortxt,
                 @ObjectModel.virtualElement: true
                 @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_KX_CALC_FORMULA'
  virtual        TeardownFormulaValue   : ap_fortxt,
                 @ObjectModel.virtualElement: true
                 @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_KX_CALC_FORMULA'
  virtual        OtherFormulaValue      : ap_fortxt
}
