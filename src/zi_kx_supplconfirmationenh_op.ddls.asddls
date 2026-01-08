@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - Suppl Confirmation Enh'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_SupplConfirmationEnh_OP
  as select from    ZI_SupplierConfirmation_OP as _SupplierConfirmation
    left outer join ZI_Supplier_OP             as _Supplier on _SupplierConfirmation.SupplierAccountNumber = _Supplier.AccountNumberofSupplier
{
  key  _SupplierConfirmation.PurchasingDocumentNumber,
  key  _SupplierConfirmation.ItemNumberOfPurchasingDocument,
  key  _SupplierConfirmation.SequentialSupplierConfirmation,
       _SupplierConfirmation.BatchNumber,
       _SupplierConfirmation.QuantityReducedMRP,
       _SupplierConfirmation.ConfirmationCategory,
       _SupplierConfirmation.DlvDateSupplierConfirmation,
       _SupplierConfirmation.ManufacturerPartNumber,
       _SupplierConfirmation.CreationDateOfConfirmation,
       _SupplierConfirmation.CreateIndSupplierConfirmation,
       _SupplierConfirmation.TimeConfirmationCreated,
       _SupplierConfirmation.ConfirmationRelevantPlanning,
       _SupplierConfirmation.ConfirmationDeletionInd,
       _SupplierConfirmation.DateCategoryDeliveryDate,
       _SupplierConfirmation.QtyPerSupplierConfirmation,
       _SupplierConfirmation.MfrPartProfile,
       _SupplierConfirmation.DeliveryDateTimeSpot,
       _SupplierConfirmation.Delivery,
       _SupplierConfirmation.DeliveryItem,
       _SupplierConfirmation.ReferenceDocumentNumber,
       _Supplier.Name,
       _SupplierConfirmation.MRPArea,
       _SupplierConfirmation.OrderPriceUnit,
       _SupplierConfirmation.DenominatorForPriceConversion,
       _SupplierConfirmation.NumeratorForPriceConversion,
       _SupplierConfirmation.PurchasingDocumentCategory,
       _SupplierConfirmation.SupplierToBeSupplied,
       _SupplierConfirmation.NumberOfPurchasingInfoRecord,
       _SupplierConfirmation.StockType,
       _SupplierConfirmation.AccountAssignmentCategory,
       _SupplierConfirmation.SubcontractingSupplier,
       _SupplierConfirmation.StorageLocation,
       _SupplierConfirmation.MaterialNumber,
       _SupplierConfirmation.PurchaseOrderUnitOfMeasure,
       _SupplierConfirmation.PurchaseOrderQuantity,
       _SupplierConfirmation.NetPriceInPurchasingDocument,
       _SupplierConfirmation.PriceUnit,
       _SupplierConfirmation.PlannedDeliveryTimeInDays,
       _SupplierConfirmation.ItemCategoryInPurchasingDoc,
       _SupplierConfirmation.SpecialStockIndicator,
       _SupplierConfirmation.DenominatorForUnitConversion,
       _SupplierConfirmation.NumeratorForUnitConversion,
       _SupplierConfirmation.GRProcessingTimeInDays,
       _SupplierConfirmation.Plant,
       _SupplierConfirmation.PurchasingDocumentDate,
       _SupplierConfirmation.PurchasingDocumentType,
       _SupplierConfirmation.PurchasingOrganization,
       _SupplierConfirmation.ReleaseIndicatorPurchasingDoc,
       _SupplierConfirmation.StartOfValidityPeriod,
       _SupplierConfirmation.EndOfValidityPeriod,
       _SupplierConfirmation.SupplierAccountNumber,
       _SupplierConfirmation.GoodsSupplier,
       _SupplierConfirmation.DelIndicatorInPurchasingDoc,
       _SupplierConfirmation.SupplyingPlantStckTransOrd,
       _SupplierConfirmation.StatusOfPurchasingDocument,
       _SupplierConfirmation.Currency
}
