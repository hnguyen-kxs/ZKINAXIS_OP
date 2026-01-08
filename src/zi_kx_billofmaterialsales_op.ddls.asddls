@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - Sales BOM'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_BillOfMaterialSales_OP
  as select from ZI_SalesBOMLink_OP as _BOMHeader
    inner join   ZI_SalesBOMItem_OP as _BOMItem on  _BOMHeader.BillOfMaterial = _BOMItem.BillOfMaterial
                                             and _BOMHeader.AlternativeBOM = _BOMItem.AlternativeBOM
{
  key _BOMItem.BillOfMaterial,
  key _BOMHeader.MaterialNumber,
  key _BOMHeader.Plant,
  key _BOMHeader.BOMUsage,
  key _BOMHeader.AlternativeBOM as AlternativeBOM,
  key _BOMItem.BOMItemNumber    as BomItemNumber,
  key _BOMItem.BOMItemNodeNumber,
  key _BOMItem.BOMCategory,
      _BOMItem.BOMComponent,
      _BOMItem.ValidFromDateBOMHeader,
      _BOMItem.ChangeNumberBOMItem,
      _BOMItem.ValidToDateBOMItem,
      _BOMItem.ChangeNumberToBOMItem,
      _BOMItem.LeadTimeOffset,
      _BOMItem.ComponentQuantity,
      _BOMItem.BaseQuantity,
      _BOMItem.ComponentScrapPercent,
      _BOMItem.AlternativeItemGroup,
      _BOMItem.AlternativeItemRankingOrder,
      _BOMItem.UsageProbabilityPercent,
      _BOMItem.IndicatorBulkMaterial,
      _BOMItem.SpecialProcurementType,
      _BOMItem.IndicatorCoProduct,
      _BOMItem.ChangeNumberBOMHeader,
      _BOMItem.ChangeNumberBOMSelection,
      _BOMItem.ValidFromDateBOMSelection,
      _BOMItem.ValidFromDateBOMItem
}
