@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View Quota'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_Quota_OP
  as select from ZI_KX_Quota_OP
{
  key NumberOfQuotaArrangement,
  key QuotaArrangementItem,
  key MaterialNumber,
  key Plant,
  key QuotaArrangePeriodValidUntil,
      NoOfPeriodsToReleaseQtyRelates,
      PeriodToReleaseQtyRelates,
      MaximumReleaseQtyPerPeriod,
      QuotaProcurementType,
      PlantFromWhichMatIsProcured,
      MatNoCorrespondingToMPN,
      IndicatorOnceOnly,
      SupplierAccountNumber,
      MaximumLotSizePerQuotaItem,
      MaxQtyOfQuotaArrangementItem,
      MinimumLotSizePerQuotaItem,
      PlannedDeliveryTimeInDays,
      PriorityForDeterminationOfSeq,
      QuotaBaseQtyOfQuotaArrangeItm,
      AllocatedQtyQuotaArrangeItm,
      Quota,
      RoundingProfile,
      SpecialProcurementType,
      ProductionVersion,
      QuotaArrangePeriodValidFrom,
      Name,
      FactoryCalendar,
      AssemblyScrapPercent,
      ProcurementType,
      FixedLotSizeQuantity,
      MaximumLotSizeQuantity,
      MinimumLotSizeQuantity,
      LotSizeRoundingQuantity,
      LotSizingProcedure,
      InHouseProductionTime,
      PlanningTimeFence,
      PlannedDeliveryDurationInDay,
      ProcurementSubType,
      HasProductionVersion,
      GoodsReceiptDuration,
      BaseUnit,
      StandardPrice,
      SpecialProcurementIndicator,
      TransferPlant
}
