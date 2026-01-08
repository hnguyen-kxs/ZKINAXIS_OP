@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View for Quota'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_KX_Quota_OP
  as select from    ZI_Quota_OP        as _Quota
    inner join      ZI_ProductPlant_OP as _ProductPlant on  _Quota.Plant          = _ProductPlant.Plant
                                                     and _Quota.MaterialNumber = _ProductPlant.MaterialNumber
    left outer join ZI_Supplier_OP     as _Supplier     on _Quota.SupplierAccountNumber = _Supplier.AccountNumberofSupplier

{
  key  _Quota.NumberOfQuotaArrangement,
  key  _Quota.QuotaArrangementItem,
  key  _Quota.MaterialNumber,
  key  _Quota.Plant,
  key  _Quota.QuotaArrangePeriodValidUntil,
       _Quota.NoOfPeriodsToReleaseQtyRelates,
       _Quota.PeriodToReleaseQtyRelates,
       _Quota.MaximumReleaseQtyPerPeriod,
       _Quota.QuotaProcurementType,
       _Quota.PlantFromWhichMatIsProcured,
       _Quota.MatNoCorrespondingToMPN,
       _Quota.IndicatorOnceOnly,
       _Quota.SupplierAccountNumber,
       _Quota.MaximumLotSizePerQuotaItem,
       _Quota.MaxQtyOfQuotaArrangementItem,
       _Quota.MinimumLotSizePerQuotaItem,
       _Quota.PlannedDeliveryTimeInDays,
       _Quota.PriorityForDeterminationOfSeq,
       _Quota.QuotaBaseQtyOfQuotaArrangeItm,
       _Quota.AllocatedQtyQuotaArrangeItm,
       _Quota.Quota,
       _Quota.RoundingProfile,
       _Quota.SpecialProcurementType,
       _Quota.ProductionVersion,
       _Quota.QuotaArrangePeriodValidFrom,
       _Supplier.Name,
       _ProductPlant.FactoryCalendar,
       _ProductPlant.AssemblyScrapPercent,
       _ProductPlant.ProcurementType,
       _ProductPlant.FixedLotSizeQuantity,
       _ProductPlant.MaximumLotSizeQuantity,
       _ProductPlant.MinimumLotSizeQuantity,
       _ProductPlant.LotSizeRoundingQuantity,
       _ProductPlant.LotSizingProcedure,
       _ProductPlant.InHouseProductionTime,
       _ProductPlant.PlanningTimeFence,
       _ProductPlant.PlannedDeliveryDurationInDay,
       _ProductPlant.ProcurementSubType,
       _ProductPlant.HasProductionVersion,
       _ProductPlant.GoodsReceiptDuration,
       _ProductPlant.BaseUnit,
       _ProductPlant.StandardPrice,
       _ProductPlant.SpecialProcurementIndicator,
       _ProductPlant.TransferPlant
}
