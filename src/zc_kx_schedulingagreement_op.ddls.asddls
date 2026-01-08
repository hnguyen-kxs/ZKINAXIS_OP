@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View Scheduling Aggreement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_SchedulingAgreement_OP
  as select from ZI_KX_SchedulingAgreement_OP
{
  key PurchasingDocumentNumber,
      PurchasingDocumentDate,
      PurchasingDocumentType,
      PurchasingDocumentCategory,
      PurchasingOrganization,
      ReleaseIndicatorPurchasingDoc,
      StartOfValidityPeriod,
      EndOfValidityPeriod,
      SupplierAccountNumber,
      GoodsSupplier,
      DelIndicatorInPurchasingDoc,
      SupplyingPlantStckTransOrd,
      StatusOfPurchasingDocument,
      Currency,
      ItemNumberOfPurchasingDocument,
      RequirementTrackingNumber,
      MRPArea,
      OrderPriceUnit,
      DenominatorForPriceConversion,
      NumeratorForPriceConversion,
      SupplierToBeSupplied,
      NumberOfPurchasingInfoRecord,
      StockType,
      AccountAssignmentCategory,
      SubcontractingSupplier,
      StorageLocation,
      MaterialNumber,
      PurchaseOrderUnitOfMeasure,
      PurchaseOrderQuantity,
      TargetQuantity,
      NetPriceInPurchasingDocument,
      PriceUnit,
      PlannedDeliveryTimeInDays,
      ItemCategoryInPurchasingDoc,
      SpecialStockIndicator,
      DenominatorForUnitConversion,
      NumeratorForUnitConversion,
      GRProcessingTimeInDays,
      Plant,
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
