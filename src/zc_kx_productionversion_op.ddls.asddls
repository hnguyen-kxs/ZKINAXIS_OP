@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Production Version'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_ProductionVersion_OP
  as select from ZI_KX_ProductionVersion_OP
{
  key MaterialNumber,
  key Plant,
  key ProductionVersion,
      MaxLotSizeQty,
      MinLotSizeQty,
      EffectiveIndate,
      EffectiveOutdate,
      KeyForTaskListGroup,
      BOMAlternate,
      ProductionVersionLock,
      ProdVersionProcurementType,
      GroupCounter,
      TaskListType,
      SpecialProcurementType,
      BOMUsage,
      DistKeyForQtyProduced,
      TransferPlant,
      ProcurementSubType,
      StandardPrice,
      LotSizingProcedure,
      FixedLotSizeQuantity,
      LotSizeRoundingQuantity,
      BaseUnit,
      GoodsReceiptDuration,
      PlannedDeliveryDurationInDay,
      PlanningTimeFence,
      AssemblyScrapPercent,
      ProcurementType,
      MaximumLotSizeQuantity,
      MinimumLotSizeQuantity,
      InHouseProductionTime,
      HasProductionVersion,
      SpecialProcurementIndicator,
      FactoryCalendar

}
