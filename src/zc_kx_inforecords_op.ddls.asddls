@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View Info Records'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_InfoRecords_OP
  as select from ZI_KX_InfoRecords_OP
{
  key PurchasingOrganization,
  key PurchasingInfoRecordCategory,
  key NumberOfPurchasingInfoRecord,
  key Plant,
      PlannedDeliveryTimeInDays,
      RelevantforAutomaticSourcing,
      OrderPriceUnitPurchasing,
      DenominatorForPriceConversion,
      NumeratorForPriceConversion,
      ShippingInstructions,
      PurchInfoPurchasingOrgFlagDel,
      NetPriceInPurchInfoRecord,
      MinimumPurchaseOrderQty,
      MaximumPurchaseOrderQty,
      PriceUnit,
      PriceValidUntil,
      CurrencyKey,
      MaterialNumberUsedBySupplier,
      SuppliersAccountNumber,
      PurchasingInfoFlagForDeletion,
      MaterialNumber,
      PurchaseOrderUnitofMeasure,
      FactoryCalendar,
      AssemblyScrapPercent,
      ProcurementType,
      FixedLotSizeQuantity,
      MaximumLotSizeQuantity,
      MinimumLotSizeQuantity,
      LotSizeRoundingQuantity,
      LotSizingProcedure,
      InHouseProductionTime,
      PlannedDeliveryDurationInDay,
      ProcurementSubType,
      HasProductionVersion,
      GoodsReceiptDuration,
      StandardPrice,
      SpecialProcurementIndicator,
      TransferPlant,
      PlanningTimeFence,
      BaseUnit,
      Name
}
