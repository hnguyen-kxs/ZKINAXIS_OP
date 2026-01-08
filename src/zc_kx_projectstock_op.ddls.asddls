@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Project Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_ProjectStock_OP
  as select from ZI_KX_ProjectStock_OP
{
  key BatchNumber,
  key StorageLocation,
  key MaterialNumber,
  key WorkBreakdownStructureElement,
  key SpecialStockIndicator,
  key Plant,
      StockInQualityInspection,
      ValuatedUnrestrictedUseStock,
      BlockedStock,
      StorageLocDescrip,
      StorageLocMRPInd

}
