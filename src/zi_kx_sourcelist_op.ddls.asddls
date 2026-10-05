@AbapCatalog.viewEnhancementCategory: [#UNION, #PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Source List'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_SourceList_OP
  as select from    ZI_SourceList_OP        as _SourceList
    inner join      ZI_ProductPlant_OP      as _ProductPlant  on  _SourceList.SourceListPlant = _ProductPlant.Plant
                                                              and _SourceList.Material        = _ProductPlant.MaterialNumber
    left outer join ZI_PurchasingDocItem_OP as _PurDocItem    on  _PurDocItem.PurchasingDocumentNumber       = _SourceList.PurchaseOutlineAgreement
                                                              and _PurDocItem.ItemNumberOfPurchasingDocument = _SourceList.PurchaseOutlineAgreementItem
    left outer join ZI_PurchaseInfoRec_OP   as _PurInfoRecord on  _SourceList.SourceListPlant = _PurInfoRecord.PurchInfoRecPlant
                                                              and _SourceList.Material        = _PurInfoRecord.MaterialNumber
                                                              and _SourceList.Supplier        = _PurInfoRecord.PurchInfoRecSuppliersAccount
    left outer join ZI_Supplier_OP          as _Supplier      on _SourceList.Supplier = _Supplier.AccountNumberofSupplier
{
  key _SourceList.Material,
  key _SourceList.SourceListPlant,
  key _SourceList.SourceListRecord,
      _SourceList.MRPSourcingControl,
      _SourceList.ValidityStartDate,
      _SourceList.ValidityEndDate,
      _SourceList.PurchaseOutlineAgreement,
      _SourceList.PurchaseOutlineAgreementItem,
      _SourceList.PurchasingOrganization,
      _SourceList.ManufacturerMaterial,
      _SourceList.PurOutlineAgreementIsFixed,
      _SourceList.SupplierIsFixed,
      _SourceList.Supplier,
      _SourceList.OrderQuantityUnit,
      _SourceList.SourceOfSupplyIsBlocked,
      _SourceList.SupplyingPlant,
      _PurDocItem.PurchasingDocumentNumber,
      _PurDocItem.ItemNumberOfPurchasingDocument,
      _PurDocItem.RequirementTrackingNumber,
      _PurDocItem.MRPArea,
      _PurDocItem.OrderPriceUnit,
      _PurDocItem.DenominatorForPriceConversion,
      _PurDocItem.NumeratorForPriceConversion,
      _PurDocItem.PurchasingDocumentCategory,
      _PurDocItem.SupplierToBeSupplied,
      _PurDocItem.NumberOfPurchasingInfoRecord,
      _PurDocItem.StockType,
      _PurDocItem.AccountAssignmentCategory,
      _PurDocItem.SubcontractingSupplier,
      _PurDocItem.StorageLocation,
      _PurDocItem.MaterialNumber,
      _PurDocItem.PurchaseOrderUnitOfMeasure,
      _PurDocItem.PurchaseOrderQuantity,
      _PurDocItem.NetPriceInPurchasingDocument,
      _PurDocItem.TargetQuantity,
      _PurDocItem.PriceUnit,
      _PurDocItem.PlannedDeliveryTimeInDays,
      _PurDocItem.ItemCategoryInPurchasingDoc,
      _PurDocItem.SpecialStockIndicator,
      _PurDocItem.DenominatorForUnitConversion,
      _PurDocItem.NumeratorForUnitConversion,
      _PurDocItem.GRProcessingTimeInDays,
      _Supplier.Name,
      _ProductPlant.FactoryCalendar,
      _ProductPlant.AssemblyScrapPercent,
      _ProductPlant.ProcurementType,
      _ProductPlant.LotSizingProcedure,
      _ProductPlant.FixedLotSizeQuantity,
      _ProductPlant.MaximumLotSizeQuantity,
      _ProductPlant.MinimumLotSizeQuantity,
      _ProductPlant.LotSizeRoundingQuantity,
      _ProductPlant.InHouseProductionTime,
      _ProductPlant.PlanningTimeFence,
      _ProductPlant.PlannedDeliveryDurationInDay,
      _ProductPlant.ProcurementSubType,
      _ProductPlant.HasProductionVersion,
      _ProductPlant.GoodsReceiptDuration,
      _ProductPlant.BaseUnit,
      _ProductPlant.StandardPrice,
      _ProductPlant.SpecialProcurementIndicator,
      _ProductPlant.TransferPlant,
      _ProductPlant.QuotaArrangementUsage,
      _ProductPlant.PlantName,
      _PurInfoRecord.PurchInfoRecPlant,
      _PurInfoRecord.PurchInfoRecSuppliersAccount,
      _PurInfoRecord.PurchInfoRecPlanDelTimeInDays
}
