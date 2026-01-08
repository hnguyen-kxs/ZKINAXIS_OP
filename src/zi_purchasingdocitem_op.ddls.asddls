@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View of Purchasing Document Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
serviceQuality: #X,
sizeCategory: #S,
dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_PurchasingDocItem_OP
  as select from ekpo               as _PurDocItem
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _PurDocItem.werks = _TvarvcPlant.Low
{
  key _PurDocItem.ebeln                          as PurchasingDocumentNumber,
  key _PurDocItem.ebelp                          as ItemNumberOfPurchasingDocument,
      _PurDocItem.bednr                          as RequirementTrackingNumber,
      _PurDocItem.berid                          as MRPArea,
      _PurDocItem.bprme                          as OrderPriceUnit,
      _PurDocItem.bpumn                          as DenominatorForPriceConversion,
      _PurDocItem.bpumz                          as NumeratorForPriceConversion,
      _PurDocItem.bstyp                          as PurchasingDocumentCategory,
      _PurDocItem.emlif                          as SupplierToBeSupplied,
      _PurDocItem.infnr                          as NumberOfPurchasingInfoRecord,
      _PurDocItem.insmk                          as StockType,
      _PurDocItem.knttp                          as AccountAssignmentCategory,
      _PurDocItem.lblkz                          as SubcontractingSupplier,
      _PurDocItem.lgort                          as StorageLocation,
      cast(_PurDocItem.matnr as abap.char(40))   as MaterialNumber,
      _PurDocItem.meins                          as PurchaseOrderUnitOfMeasure,
      cast(_PurDocItem.menge as abap.char(17))   as PurchaseOrderQuantity,
      cast(_PurDocItem.netpr   as abap.char(16)) as NetPriceInPurchasingDocument,
      cast(_PurDocItem.ktmng as abap.char(17))   as TargetQuantity,
      _PurDocItem.peinh                          as PriceUnit,
      _PurDocItem.plifz                          as PlannedDeliveryTimeInDays,
      _PurDocItem.pstyp                          as ItemCategoryInPurchasingDoc,
      _PurDocItem.sobkz                          as SpecialStockIndicator,
      _PurDocItem.umren                          as DenominatorForUnitConversion,
      _PurDocItem.umrez                          as NumeratorForUnitConversion,
      _PurDocItem.webaz                          as GRProcessingTimeInDays,
      _PurDocItem.werks                          as Plant

}
where
      _PurDocItem.loekz =  ''
  and _PurDocItem.elikz =  ''
  and _PurDocItem.erekz =  ''
  and _PurDocItem.matnr <> ''
  and _PurDocItem.menge >  0
  and _PurDocItem.kzvbr != 'V'
