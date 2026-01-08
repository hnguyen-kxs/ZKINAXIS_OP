@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - Order Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_OrderStock_OP
  as select from nsdm_e_mska        as _OrderStock
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _OrderStock.werks = _TvarvcPlant.Low
{
  key _OrderStock.charg                        as BatchNumber,
  key _OrderStock.lgort                        as StorageLocation,
  key cast(_OrderStock.matnr as abap.char(40)) as MaterialNumber,
  key _OrderStock.posnr                        as ItemNumberOfTheSDDocument,
  key _OrderStock.sobkz                        as SpecialStockIndicator,
  key _OrderStock.vbeln                        as SalesDistDocumentNumber,
  key _OrderStock.werks                        as Plant,
      cast(_OrderStock.kains as abap.char(17)) as StockInQualityInspection,
      cast(_OrderStock.kalab as abap.char(17)) as ValuatedUnrestrictedUseStock,
      cast(_OrderStock.kaspe as abap.char(17)) as BlockedStock
}
where
       _OrderStock.sobkz =  'E'
  and(
       _OrderStock.kains != 0
    or _OrderStock.kalab != 0
    or _OrderStock.kaspe != 0
  )
