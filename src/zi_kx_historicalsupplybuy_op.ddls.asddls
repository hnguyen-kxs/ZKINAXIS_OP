@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Historical Supply Buy - Composite'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_HistoricalSupplyBuy_OP
  with parameters
    p_days : int2
  as select from ZI_HistoricalSupplyBuy_OP( p_days: $parameters.p_days  )
{
  key PurchasingDocumentNumber,
  key ItemNumberOfPurchasingDocument,
  key SeqNumberOfAccountAssign,
  key TransactionType,
  key MaterialDocumentYear,
  key NumberOfMaterialDocument,
  key ItemInMaterialDocument,
      Quantity,
      CurrencyKey,
      DebitCreditIndicator,
      PostingDate,
      MaterialNumber,
      Plant,
      PurchasingDocumentDate,
      PurchasingDocumentType,
      SupplierAccountNumber,
      SupplyingPlantStckTransOrd,
      PurchaseOrderUnitOfMeasure,
      OrderPriceUnit,
      DenominatorForPriceConversion,
      NumeratorForPriceConversion,
      NumeratorForUnitConversion,
      DenominatorForUnitConversion,
      NetPrice,
      PriceUnit,
      BaseUnitOfMeasure
}
