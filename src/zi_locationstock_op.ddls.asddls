@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Inventory location stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_LocationStock_OP
  as select from nsdm_e_mard        as _LocationStock
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _LocationStock.werks = _TvarvcPlant.Low
{
  key _LocationStock.lgort                        as StorageLocation,
  key cast(_LocationStock.matnr as abap.char(40)) as MaterialNumber,
  key _LocationStock.werks                        as Plant,
      _LocationStock.bskrf                        as InventoryCorrectionFactor,
      _LocationStock.diskz                        as StorageLocationMRPIndicator,
      cast(_LocationStock.einme as abap.char(17)) as TotalStockOfRestrictedBatches,
      cast(_LocationStock.insme as abap.char(17)) as StockInQualityInspection,
      cast(_LocationStock.kinsm as abap.char(17)) as ConsignmentStkQualityInsp,
      cast(_LocationStock.klabs as abap.char(17)) as UnrestrictedConsignmentStock,
      cast(_LocationStock.kspem as abap.char(17)) as BlockedConsignmentStock,
      cast(_LocationStock.labst as abap.char(17)) as ValuatedUnrestrictedStock,
      cast(_LocationStock.speme as abap.char(17)) as BlockedStock,
      cast(_LocationStock.umlme as abap.char(17)) as StockInTransfer
}
where
  (
       _LocationStock.einme != 0
    or _LocationStock.insme != 0
    or _LocationStock.kinsm != 0
    or _LocationStock.klabs != 0
    or _LocationStock.kspem != 0
    or _LocationStock.labst != 0
    or _LocationStock.speme != 0
    or _LocationStock.umlme != 0
  )
