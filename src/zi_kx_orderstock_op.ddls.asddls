@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - Order Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_OrderStock_OP
  as select from    ZI_OrderStock_OP       as _OrderStock
    left outer join ZI_StorageLocations_OP as _StorageLocations on  _OrderStock.StorageLocation = _StorageLocations.StorageLocation
                                                                and _OrderStock.Plant           = _StorageLocations.Plant
{
  key _OrderStock.BatchNumber,
  key _OrderStock.StorageLocation,
  key _OrderStock.MaterialNumber,
  key _OrderStock.ItemNumberOfTheSDDocument,
  key _OrderStock.SpecialStockIndicator,
  key _OrderStock.SalesDistDocumentNumber,
  key _OrderStock.Plant,
      _OrderStock.StockInQualityInspection,
      _OrderStock.ValuatedUnrestrictedUseStock,
      _OrderStock.BlockedStock,
      _StorageLocations.StorageLocDescrip,
      _StorageLocations.StorageLocMRPInd

}
