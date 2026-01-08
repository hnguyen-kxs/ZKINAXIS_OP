@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - Location Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_LocationStock_OP
  as select from    ZI_LocationStock_OP    as _LocationStock
    left outer join ZI_StorageLocations_OP as _StorageLocations on  _LocationStock.StorageLocation = _StorageLocations.StorageLocation
                                                                and _LocationStock.Plant           = _StorageLocations.Plant
{
  key _LocationStock.StorageLocation,
  key _LocationStock.MaterialNumber,
  key _LocationStock.Plant,
      _LocationStock.InventoryCorrectionFactor,
      _LocationStock.StorageLocationMRPIndicator,
      _LocationStock.TotalStockOfRestrictedBatches,
      _LocationStock.StockInQualityInspection,
      _LocationStock.ConsignmentStkQualityInsp,
      _LocationStock.UnrestrictedConsignmentStock,
      _LocationStock.BlockedConsignmentStock,
      _LocationStock.ValuatedUnrestrictedStock,
      _LocationStock.BlockedStock,
      _LocationStock.StockInTransfer,
      _StorageLocations.StorageLocDescrip,
      _StorageLocations.StorageLocMRPInd
}
