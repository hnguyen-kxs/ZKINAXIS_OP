@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Order Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_OrderStock_OP
  as select from ZI_KX_OrderStock_OP
{
  key BatchNumber,
  key StorageLocation,
  key MaterialNumber,
  key ItemNumberOfTheSDDocument,
  key SpecialStockIndicator,
  key SalesDistDocumentNumber,
  key Plant,
      StockInQualityInspection,
      ValuatedUnrestrictedUseStock,
      BlockedStock,
      StorageLocDescrip,
      StorageLocMRPInd
}
