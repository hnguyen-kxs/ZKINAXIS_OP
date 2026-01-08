@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Location Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_LocationStock_OP
  as select from ZI_KX_LocationStock_OP
{
  key StorageLocation,
  key MaterialNumber,
  key Plant,
      InventoryCorrectionFactor,
      StorageLocationMRPIndicator,
      TotalStockOfRestrictedBatches,
      StockInQualityInspection,
      ConsignmentStkQualityInsp,
      UnrestrictedConsignmentStock,
      BlockedConsignmentStock,
      ValuatedUnrestrictedStock,
      BlockedStock,
      StockInTransfer,
      StorageLocDescrip,
      StorageLocMRPInd
}
