@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View SchedulingAgreement Lines'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_SchedulingAgreementLines_OP
  as select from eket as _SchdLineAggr
{
  key _SchdLineAggr.ebeln                          as PurchasingDocumentNumber,
  key _SchdLineAggr.ebelp                          as ItemNumberOfPurchasingDocument,
  key _SchdLineAggr.etenr                          as DeliveryScheduleLineCounter,
      _SchdLineAggr.bedat                          as OrderDateOfScheduleLine,
      cast(_SchdLineAggr.dabmg as abap.char(17))   as QuantityReducedMRP,
      _SchdLineAggr.eindt                          as ItemDeliveryDate,
      cast(_SchdLineAggr.glmng as abap.char(17))   as QuantityDeliveredStockTransfer,
      _SchdLineAggr.mbdat                          as MaterialStaging,
      cast(_SchdLineAggr.menge as abap.char(17))   as ScheduledQuantity,
      _SchdLineAggr.rsnum                          as NumberOfReservation,
      _SchdLineAggr.slfdt                          as StatisticsRelevantDeliveryDate,
      cast( _SchdLineAggr.wamng  as abap.char(17)) as IssuedQuantity,
      cast( _SchdLineAggr.wemng  as abap.char(17)) as QuantityOfGoodsReceived

}
where
  _SchdLineAggr.menge > 0
