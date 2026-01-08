@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - Purchase Doc Supplier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_PurchaseDocSupplier_OP
  as select from    ZI_KX_PurchaseDocument_OP as _PurDoc
    left outer join ZI_Supplier_OP            as _Supplier on _PurDoc.SupplierAccountNumber = _Supplier.AccountNumberofSupplier
{
  key  _PurDoc.PurchasingDocumentNumber,
  key  _PurDoc.ItemNumberOfPurchasingDocument,
  key  _PurDoc.DeliveryScheduleLineCounter,
       _PurDoc.OrderDateOfScheduleLine,
       _PurDoc.QuantityReducedMRP,
       _PurDoc.ItemDeliveryDate,
       _PurDoc.QuantityDeliveredStockTransfer,
       _PurDoc.MaterialStaging,
       _PurDoc.ScheduledQuantity,
       _PurDoc.NumberOfReservation,
       _PurDoc.StatisticsRelevantDeliveryDate,
       _PurDoc.IssuedQuantity,
       _PurDoc.QuantityOfGoodsReceived,
       _PurDoc.RequirementTrackingNumber,
       _PurDoc.MRPArea,
       _PurDoc.OrderPriceUnit,
       _PurDoc.DenominatorForPriceConversion,
       _PurDoc.NumeratorForPriceConversion,
       _PurDoc.PurchasingDocumentCategory,
       _PurDoc.SupplierToBeSupplied,
       _PurDoc.NumberOfPurchasingInfoRecord,
       _PurDoc.StockType,
       _PurDoc.AccountAssignmentCategory,
       _PurDoc.SubcontractingSupplier,
       _PurDoc.StorageLocation,
       _PurDoc.MaterialNumber,
       _PurDoc.PurchaseOrderUnitOfMeasure,
       _PurDoc.PurchaseOrderQuantity,
       _PurDoc.NetPriceInPurchasingDocument,
       _PurDoc.PriceUnit,
       _PurDoc.PlannedDeliveryTimeInDays,
       _PurDoc.ItemCategoryInPurchasingDoc,
       _PurDoc.SpecialStockIndicator,
       _PurDoc.DenominatorForUnitConversion,
       _PurDoc.NumeratorForUnitConversion,
       _PurDoc.GRProcessingTimeInDays,
       _PurDoc.Plant,
       _PurDoc.PurchasingDocumentDate,
       _PurDoc.PurchasingDocumentType,
       _PurDoc.PurchasingOrganization,
       _PurDoc.ReleaseIndicatorPurchasingDoc,
       _PurDoc.StartOfValidityPeriod,
       _PurDoc.EndOfValidityPeriod,
       _PurDoc.SupplierAccountNumber,
       _PurDoc.GoodsSupplier,
       _PurDoc.DelIndicatorInPurchasingDoc,
       _PurDoc.SupplyingPlantStckTransOrd,
       _PurDoc.StatusOfPurchasingDocument,
       _PurDoc.Currency,
       _Supplier.Name
}
