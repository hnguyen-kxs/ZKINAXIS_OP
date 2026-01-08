@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View for Puchase Document'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_KX_PurchaseDocument_OP
  as select from ZI_SchedulingAgreementLines_OP as _SchdLineAggr
    inner join   ZI_PurchasingDocItem_OP       as _PurDocItem   on  _SchdLineAggr.PurchasingDocumentNumber       = _PurDocItem.PurchasingDocumentNumber
                                                              and _SchdLineAggr.ItemNumberOfPurchasingDocument = _PurDocItem.ItemNumberOfPurchasingDocument
    inner join   ZI_PurchasingDocHeader_OP      as _PurDocHeader on _SchdLineAggr.PurchasingDocumentNumber = _PurDocHeader.PurchasingDocumentNumber

{
  key  _SchdLineAggr.PurchasingDocumentNumber,
  key  _SchdLineAggr.ItemNumberOfPurchasingDocument,
  key  _SchdLineAggr.DeliveryScheduleLineCounter,
       _SchdLineAggr.OrderDateOfScheduleLine,
       _SchdLineAggr.QuantityReducedMRP,
       _SchdLineAggr.ItemDeliveryDate,
       _SchdLineAggr.QuantityDeliveredStockTransfer,
       _SchdLineAggr.MaterialStaging,
       _SchdLineAggr.ScheduledQuantity,
       _SchdLineAggr.NumberOfReservation,
       _SchdLineAggr.StatisticsRelevantDeliveryDate,
       _SchdLineAggr.IssuedQuantity,
       _SchdLineAggr.QuantityOfGoodsReceived,
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
       _PurDocItem.PriceUnit,
       _PurDocItem.PlannedDeliveryTimeInDays,
       _PurDocItem.ItemCategoryInPurchasingDoc,
       _PurDocItem.SpecialStockIndicator,
       _PurDocItem.DenominatorForUnitConversion,
       _PurDocItem.NumeratorForUnitConversion,
       _PurDocItem.GRProcessingTimeInDays,
       _PurDocItem.Plant,
       _PurDocHeader.PurchasingDocumentDate,
       _PurDocHeader.PurchasingDocumentType,
       _PurDocHeader.PurchasingOrganization,
       _PurDocHeader.ReleaseIndicatorPurchasingDoc,
       _PurDocHeader.StartOfValidityPeriod,
       _PurDocHeader.EndOfValidityPeriod,
       _PurDocHeader.SupplierAccountNumber,
       _PurDocHeader.GoodsSupplier,
       _PurDocHeader.DelIndicatorInPurchasingDoc,
       _PurDocHeader.SupplyingPlantStckTransOrd,
       _PurDocHeader.StatusOfPurchasingDocument,
       _PurDocHeader.Currency
}
