@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - Special Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_SpecialStock_OP
  as select from nsdm_e_mssl        as _SpecialStock
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _SpecialStock.werks = _TvarvcPlant.Low
{
  key _SpecialStock.lifnr                        as AccountNumberOfSupplier,
  key cast(_SpecialStock.matnr as abap.char(40)) as MaterialNumber,
  key _SpecialStock.sobkz                        as SpecialStockIndicator,
  key _SpecialStock.werks                        as Plant,
      cast(_SpecialStock.slins as abap.char(17)) as StockInQualityInspection,
      cast(_SpecialStock.sllab as abap.char(17)) as ValuatedUnrestrictedUseStock
}
where
  (
       _SpecialStock.sllab != 0
    or _SpecialStock.slins != 0
  )
