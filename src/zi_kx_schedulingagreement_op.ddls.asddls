@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View Scheduling Aggreement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_KX_SchedulingAgreement_OP
  as select from    ZI_PurchasingDocHeader_OP as _PurchDocHeader
    inner join      ZI_PurchasingDocItem_OP   as _PurDocItem   on _PurchDocHeader.PurchasingDocumentNumber = _PurDocItem.PurchasingDocumentNumber
    inner join      ZI_ProductPlant_OP        as _ProductPlant on  _PurDocItem.Plant          = _ProductPlant.Plant
                                                            and _PurDocItem.MaterialNumber = _ProductPlant.MaterialNumber
    left outer join ZI_Supplier_OP            as _Supplier     on _PurchDocHeader.SupplierAccountNumber = _Supplier.AccountNumberofSupplier
{
  key  _PurchDocHeader.PurchasingDocumentNumber,
       _PurchDocHeader.PurchasingDocumentDate,
       _PurchDocHeader.PurchasingDocumentType,
       _PurchDocHeader.PurchasingDocumentCategory,
       _PurchDocHeader.PurchasingOrganization,
       _PurchDocHeader.ReleaseIndicatorPurchasingDoc,
       _PurchDocHeader.StartOfValidityPeriod,
       _PurchDocHeader.EndOfValidityPeriod,
       _PurchDocHeader.SupplierAccountNumber,
       _PurchDocHeader.GoodsSupplier,
       _PurchDocHeader.DelIndicatorInPurchasingDoc,
       _PurchDocHeader.SupplyingPlantStckTransOrd,
       _PurchDocHeader.StatusOfPurchasingDocument,
       _PurchDocHeader.Currency,
       _PurDocItem.ItemNumberOfPurchasingDocument,
       _PurDocItem.RequirementTrackingNumber,
       _PurDocItem.MRPArea,
       _PurDocItem.OrderPriceUnit,
       _PurDocItem.DenominatorForPriceConversion,
       _PurDocItem.NumeratorForPriceConversion,
       _PurDocItem.SupplierToBeSupplied,
       _PurDocItem.NumberOfPurchasingInfoRecord,
       _PurDocItem.StockType,
       _PurDocItem.AccountAssignmentCategory,
       _PurDocItem.SubcontractingSupplier,
       _PurDocItem.StorageLocation,
       _PurDocItem.MaterialNumber,
       _PurDocItem.PurchaseOrderUnitOfMeasure,
       _PurDocItem.PurchaseOrderQuantity,
       _PurDocItem.TargetQuantity,
       _PurDocItem.NetPriceInPurchasingDocument,
       _PurDocItem.PriceUnit,
       _PurDocItem.PlannedDeliveryTimeInDays,
       _PurDocItem.ItemCategoryInPurchasingDoc,
       _PurDocItem.SpecialStockIndicator,
       _PurDocItem.DenominatorForUnitConversion,
       _PurDocItem.NumeratorForUnitConversion,
       _PurDocItem.GRProcessingTimeInDays,
       _PurDocItem.Plant,
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
where
  (
       _PurchDocHeader.PurchasingDocumentCategory = 'L'
    or _PurchDocHeader.PurchasingDocumentCategory = 'K'
  )
  and  _PurchDocHeader.EndOfValidityPeriod        >= $session.system_date
