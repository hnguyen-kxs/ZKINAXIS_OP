@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Inventory vendor stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_VendorStock_OP
  as select from nsdm_e_mkol        as _VendorStock
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _VendorStock.werks = _TvarvcPlant.Low
{
  key _VendorStock.charg                        as BatchNumber,
  key _VendorStock.lgort                        as StorageLocation,
  key _VendorStock.lifnr                        as Vendor,
  key _VendorStock.matnr                        as MaterialNumber,
  key _VendorStock.sobkz                        as SpecialStockIndicator,
  key _VendorStock.werks                        as Plant,
      cast(_VendorStock.seinm as abap.char(17)) as RestrictedUseConsignmentStock,
      cast(_VendorStock.sinsm as abap.char(17)) as ConsignmentQualityInspection,
      cast(_VendorStock.slabs as abap.char(17)) as UnrestrictedConsignmentStock,
      cast(_VendorStock.sspem as abap.char(17)) as BlockedConsignmentStock
}
where
       _VendorStock.sobkz =  'K'
  and(
       _VendorStock.seinm != 0
    or _VendorStock.sinsm != 0
    or _VendorStock.slabs != 0
    or _VendorStock.sspem != 0
  )
