@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - Project Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_ProjectStock_OP
  as select from    ZI_ProjectStock_OP     as _ProjectStock
    left outer join ZI_StorageLocations_OP as _StorageLocations on  _ProjectStock.StorageLocation = _StorageLocations.StorageLocation
                                                             and _ProjectStock.Plant           = _StorageLocations.Plant
{
  key _ProjectStock.BatchNumber,
  key _ProjectStock.StorageLocation,
  key _ProjectStock.MaterialNumber,
  key _ProjectStock.WorkBreakdownStructureElement,
  key _ProjectStock.SpecialStockIndicator,
  key _ProjectStock.Plant,
      _ProjectStock.StockInQualityInspection,
      _ProjectStock.ValuatedUnrestrictedUseStock,
      _ProjectStock.BlockedStock,
      _StorageLocations.StorageLocDescrip,
      _StorageLocations.StorageLocMRPInd
}
