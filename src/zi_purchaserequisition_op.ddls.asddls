@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - Purchase Requisition'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_PurchaseRequisition_OP
  as select from eban               as _PurReq
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _PurReq.werks = _TvarvcPlant.Low
{
  key _PurReq.banfn                        as PurchaseRequisitionNumber,
  key _PurReq.bnfpo                        as ItemNumberPurchaseRequisition,
      _PurReq.badat                        as RequisitionRequestDate,
      _PurReq.berid                        as MRPArea,
      _PurReq.bsart                        as PurReqDocumentType,
      cast(_PurReq.bsmng as abap.char(17)) as QuantityOrderedAgainstPurReq,
      _PurReq.ebeln                        as PurchaseOrderNumber,
      _PurReq.ebelp                        as PurchaseOrderItemNumber,
      _PurReq.estkz                        as CreationIndicatorPRLines,
      _PurReq.fixkz                        as PurchaseRequisitionIsFixed,
      _PurReq.flief                        as FixedVendor,
      _PurReq.frgdt                        as PurchaseRequisitionReleaseDate,
      _PurReq.lfdat                        as ItemDeliveryDate,
      _PurReq.lgort                        as StorageLocation,
      _PurReq.lifnr                        as DesiredVendor,
      cast(_PurReq.matnr as abap.char(40)) as MaterialNumber,
      _PurReq.meins                        as PurchaseRequisitionUOM,
      cast(_PurReq.menge as abap.char(17)) as PurchaseRequisitionQuantity,
      _PurReq.peinh                        as PriceUnit,
      _PurReq.plifz                        as PlannedDeliveryTimeInDays,
      cast(_PurReq.preis as abap.char(17)) as PriceInPurchaseRequisition,
      _PurReq.pstyp                        as ItemCategoryInPurchasingDoc,
      _PurReq.reswk                        as SupplyingPlantOfSTO,
      _PurReq.rsnum                        as NumberOfReservation,
      _PurReq.sernr                        as BOMExplosionNumber,
      _PurReq.statu                        as ProcessingStatusOfPurReq,
      _PurReq.waers                        as CurrencyKey,
      _PurReq.webaz                        as GRProcessingTimeInDays,
      _PurReq.werks                        as Plant
}
where
        _PurReq.loekz   =  ''
  and   _PurReq.ebakz   =  ''
  and   _PurReq.statu   <> 'L'
  and   _PurReq.menge   >  0
  and   _PurReq.matnr   != ''
  and   not(
      _PurReq.kzvbr     =  'V'
      and _PurReq.estkz =  'V'
    )
