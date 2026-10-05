@AbapCatalog.viewEnhancementCategory: [#UNION, #PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_KX_CustomerStock_OP
  as select from ZI_CustomerStock_OP
{
  key MaterialNumber,
  key Plant,
  key BatchNumber,
  key SpecialStockIndicator,
  key CustomerNumber,
  TotalStockOfRestrictedBatches,
  StockInQualityInspection,
  ValuatedUnrestrictedUseStock,
  StockInTransfer
}
