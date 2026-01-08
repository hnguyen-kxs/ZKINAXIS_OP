@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Purchase Document'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_PurchaseDocument_OP
  as select from ZI_KX_PurchaseDocSupplier_OP
{
  key  PurchasingDocumentNumber,
  key  ItemNumberOfPurchasingDocument,
  key  DeliveryScheduleLineCounter,
       OrderDateOfScheduleLine,
       QuantityReducedMRP,
       ItemDeliveryDate,
       QuantityDeliveredStockTransfer,
       MaterialStaging,
       ScheduledQuantity,
       NumberOfReservation,
       StatisticsRelevantDeliveryDate,
       IssuedQuantity,
       QuantityOfGoodsReceived,
       RequirementTrackingNumber,
       MRPArea,
       OrderPriceUnit,
       DenominatorForPriceConversion,
       NumeratorForPriceConversion,
       PurchasingDocumentCategory,
       SupplierToBeSupplied,
       NumberOfPurchasingInfoRecord,
       StockType,
       AccountAssignmentCategory,
       SubcontractingSupplier,
       StorageLocation,
       MaterialNumber,
       PurchaseOrderUnitOfMeasure,
       PurchaseOrderQuantity,
       NetPriceInPurchasingDocument,
       PriceUnit,
       PlannedDeliveryTimeInDays,
       ItemCategoryInPurchasingDoc,
       SpecialStockIndicator,
       DenominatorForUnitConversion,
       NumeratorForUnitConversion,
       GRProcessingTimeInDays,
       Plant,
       PurchasingDocumentDate,
       PurchasingDocumentType,
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
       Name
}
