@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Vendor Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_VendorStock_OP
  as select from ZI_KX_VendorStock_OP
{
  key BatchNumber,
  key StorageLocation,
  key Vendor,
  key MaterialNumber,
  key SpecialStockIndicator,
  key Plant,
      RestrictedUseConsignmentStock,
      ConsignmentQualityInspection,
      UnrestrictedConsignmentStock,
      BlockedConsignmentStock,
      StorageLocDescrip,
      StorageLocMRPInd
}
