@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View of Order item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_OrderItem_OP
  as select from afpo               as _OrderItem
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _OrderItem.pwerk = _TvarvcPlant.Low
{
  key  _OrderItem.aufnr                          as OrderNumber,
  key  _OrderItem.posnr                          as OrderItemNumber,
       _OrderItem.berid                          as MRPArea,
       cast(_OrderItem.matnr as abap.char(40))   as MaterialNumberForOrder,
       cast( _OrderItem.psmng as abap.char(17) ) as OrdItemPlanTotQuantity,
       _OrderItem.pwerk                          as PlanningPlantForOrder,
       _OrderItem.sernr                          as BOMExplosionNumber,
       _OrderItem.webaz                          as GRProcessingDurationInDays,
       cast( _OrderItem.wemng as abap.char(17))  as QuantityGoodsReceivedOrdItem
}
