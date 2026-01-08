@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Bill of Material'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_BillOfMaterial_OP
  as select from ZI_KX_BillOfMaterial_OP
{
  key BillOfMaterial,
  key MaterialNumber,
  key Plant,
  key BOMUsage,
  key AlternativeBOM,
  key BOMItemNumber,
  key BOMItemNodeNumber,
  key BOMCategory,
      BOMComponent,
      ValidFromDateBOMHeader,
      ChangeNumberBOMItem,
      ValidToDateBOMItem,
      ChangeNumberToBOMItem,
      LeadTimeOffset,
      ComponentQuantity,
      BaseQuantity,
      ComponentScrapPercent,
      AlternativeItemGroup,
      AlternativeItemRankingOrder,
      UsageProbabilityPercent,
      ProductionVersion,
      IndicatorBulkMaterial,
      SpecialProcurementType,
      IndicatorCoProduct,
      ChangeNumberBOMHeader,
      ChangeNumberBOMSelection,
      ValidFromDateBOMSelection,
      ValidFromDateBOMItem,
      ComponentUnitOfMeasure,
      BaseUnit,
      AlternativeUnitOfMeasure,
      NumeratorForUnitConversion,
      DenominatorForUnitConversion,
      Numerator,
      Denominator,

      ValidFromDateOfProdVersion,
      ValidToDateOfProdVersion,
      ProductionVersionLock,
      ProdVerSpecialProcurementType,
      BaseUnitOfMeasure,
      MinimumLotSizeQuantity,
      MaterialMaximumLotSizeQuantity
}
