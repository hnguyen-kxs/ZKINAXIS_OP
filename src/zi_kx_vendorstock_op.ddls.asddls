@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - Vendor Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_VendorStock_OP
  as select from    ZI_VendorStock_OP      as _VendorStock
    left outer join ZI_StorageLocations_OP as _StorageLocations on  _VendorStock.StorageLocation = _StorageLocations.StorageLocation
                                                                and _VendorStock.Plant           = _StorageLocations.Plant
{
  key _VendorStock.BatchNumber,
  key _VendorStock.StorageLocation,
  key _VendorStock.Vendor,
  key _VendorStock.MaterialNumber,
  key _VendorStock.SpecialStockIndicator,
  key _VendorStock.Plant,
      _VendorStock.RestrictedUseConsignmentStock,
      _VendorStock.ConsignmentQualityInspection,
      _VendorStock.UnrestrictedConsignmentStock,
      _VendorStock.BlockedConsignmentStock,
      _StorageLocations.StorageLocDescrip,
      _StorageLocations.StorageLocMRPInd
}
