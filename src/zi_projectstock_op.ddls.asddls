@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Inventory project stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_ProjectStock_OP
  as select from nsdm_e_mspr        as _ProjectStock
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _ProjectStock.werks = _TvarvcPlant.Low
{
  key _ProjectStock.charg                        as BatchNumber,
  key _ProjectStock.lgort                        as StorageLocation,
  key cast(_ProjectStock.matnr as abap.char(40)) as MaterialNumber,
  key cast (_ProjectStock.pspnr as abap.char(8)) as WorkBreakdownStructureElement,
  key _ProjectStock.sobkz                        as SpecialStockIndicator,
  key _ProjectStock.werks                        as Plant,
      cast(_ProjectStock.prins as abap.char(17)) as StockInQualityInspection,
      cast(_ProjectStock.prlab as abap.char(17)) as ValuatedUnrestrictedUseStock,
      cast(_ProjectStock.prspe as abap.char(17)) as BlockedStock
}
where
       _ProjectStock.sobkz =  'Q'
  and(
       _ProjectStock.prins != 0
    or _ProjectStock.prlab != 0
    or _ProjectStock.prspe != 0
  )
