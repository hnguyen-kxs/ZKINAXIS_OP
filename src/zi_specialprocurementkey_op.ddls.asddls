@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic Views Special Procurement Key'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_SpecialProcurementKey_OP
  as select from t460a as _SplProcType
{
  key   _SplProcType.sobsl as SpecialProcurementType,
  key   _SplProcType.werks as Plant,
        _SplProcType.addin as AdditionalInfoOnBAdI,
        _SplProcType.beskz as ProcurementType,
        _SplProcType.clcor as IndicatorForDirectProduction,
        _SplProcType.dirpr as DirectProcurementIndicator,
        _SplProcType.dumps as PhantomItemIndicator,
        _SplProcType.rewfg as WithdrawalFromAlternativePlant,
        _SplProcType.rewrk as IssuingPlantForDependentReqmts,
        _SplProcType.sobes as SpecialProcurementIndicator,
        _SplProcType.umldb as IndStockTransferWithMRPAreas,
        _SplProcType.wrk02 as TransferPlant
}
