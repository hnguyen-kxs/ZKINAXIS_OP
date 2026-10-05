@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_CustomerStock_OP
  as select from nsdm_e_msku        as _CustomerStock
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _CustomerStock.werks = _TvarvcPlant.Low
{
  key _CustomerStock.matnr                        as MaterialNumber,
  key _CustomerStock.werks                        as Plant,
  key _CustomerStock.charg                        as BatchNumber,
  key _CustomerStock.sobkz                        as SpecialStockIndicator,
  key _CustomerStock.kunnr                        as CustomerNumber,

      cast(_CustomerStock.kuein as abap.char(17)) as TotalStockOfRestrictedBatches,
      cast(_CustomerStock.kuins as abap.char(17)) as StockInQualityInspection,
      cast(_CustomerStock.kulab as abap.char(17)) as ValuatedUnrestrictedUseStock,
      cast(_CustomerStock.kuuml as abap.char(17)) as StockInTransfer
}
where
       _CustomerStock.sobkz =  'W'
  and(
       _CustomerStock.kuein != 0
    or _CustomerStock.kuins != 0
    or _CustomerStock.kulab != 0
    or _CustomerStock.kuuml != 0
  )
