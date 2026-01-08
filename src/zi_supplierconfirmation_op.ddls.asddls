@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - Supplier Confirmations'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_SupplierConfirmation_OP
  as select from ekes                      as _SupplierConfirmation
    inner join   ZI_PurchasingDocItem_OP   as _PurDocItem   on  _SupplierConfirmation.ebeln = _PurDocItem.PurchasingDocumentNumber
                                                            and _SupplierConfirmation.ebelp = _PurDocItem.ItemNumberOfPurchasingDocument
    inner join   ZI_PurchasingDocHeader_OP as _PurDocHeader on _PurDocItem.PurchasingDocumentNumber = _PurDocHeader.PurchasingDocumentNumber


{
  key _SupplierConfirmation.ebeln                        as PurchasingDocumentNumber,
  key _SupplierConfirmation.ebelp                        as ItemNumberOfPurchasingDocument,
  key _SupplierConfirmation.etens                        as SequentialSupplierConfirmation,
      _SupplierConfirmation.charg                        as BatchNumber,
      cast(_SupplierConfirmation.dabmg as abap.char(17)) as QuantityReducedMRP,
      _SupplierConfirmation.ebtyp                        as ConfirmationCategory,
      _SupplierConfirmation.eindt                        as DlvDateSupplierConfirmation,
      cast(_SupplierConfirmation.ematn as abap.char(40)) as ManufacturerPartNumber,
      _SupplierConfirmation.erdat                        as CreationDateOfConfirmation,
      _SupplierConfirmation.estkz                        as CreateIndSupplierConfirmation,
      _SupplierConfirmation.ezeit                        as TimeConfirmationCreated,
      _SupplierConfirmation.kzdis                        as ConfirmationRelevantPlanning,
      _SupplierConfirmation.loekz                        as ConfirmationDeletionInd,
      _SupplierConfirmation.lpein                        as DateCategoryDeliveryDate,
      cast(_SupplierConfirmation.menge as abap.char(17)) as QtyPerSupplierConfirmation,
      _SupplierConfirmation.mprof                        as MfrPartProfile,
      _SupplierConfirmation.uzeit                        as DeliveryDateTimeSpot,
      _SupplierConfirmation.vbeln                        as Delivery,
      _SupplierConfirmation.vbelp                        as DeliveryItem,
      _SupplierConfirmation.xblnr                        as ReferenceDocumentNumber,
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
      cast(_PurDocItem.MaterialNumber as abap.char(40))  as MaterialNumber,
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
where
       _SupplierConfirmation.menge >  0
  and  _SupplierConfirmation.loekz != 'X'
  and  _SupplierConfirmation.kzdis =  'X'
  and(
       _SupplierConfirmation.estkz =  '1'
    or _SupplierConfirmation.estkz =  '2'
    or _SupplierConfirmation.estkz =  '3'
  )
