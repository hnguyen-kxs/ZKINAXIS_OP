@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Sales BOM'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_BillOfMaterialSales_OP
  as select from ZI_KX_BillOfMaterialSales_OP
{
  key BillOfMaterial,
  key MaterialNumber,
  key Plant,
  key BOMUsage,
  key AlternativeBOM,
  key BomItemNumber,
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
      IndicatorBulkMaterial,
      SpecialProcurementType,
      IndicatorCoProduct,
      ChangeNumberBOMHeader,
      ChangeNumberBOMSelection,
      ValidFromDateBOMSelection,
      ValidFromDateBOMItem
}
