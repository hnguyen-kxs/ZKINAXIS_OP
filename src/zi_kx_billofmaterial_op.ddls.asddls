@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - Bill of Material'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_BillOfMaterial_OP
  as select from    ZI_MatBOMLink_OP           as _BOMHeader
    inner join      ZI_BOMItem_OP              as _BOMItem  on  _BOMHeader.BillOfMaterial = _BOMItem.BillOfMaterial
                                                            and _BOMHeader.AlternativeBOM = _BOMItem.AlternativeBOM
    inner join      ZI_MaterialData_OP         as _Material on _Material.MaterialNumber = _BOMItem.BOMComponent
    left outer join ZI_KX_ProdUoM_OP           as _ProdUoM  on  _ProdUoM.MaterialNumber           = _BOMItem.BOMComponent
                                                            and _ProdUoM.Plant                    = _BOMHeader.Plant
                                                            and _ProdUoM.AlternativeUnitOfMeasure = _BOMItem.ComponentUnitOfMeasure
    left outer join ZI_BOMProductionVersion_OP as _ProdVer  on  _BOMHeader.MaterialNumber = _ProdVer.MaterialNumber
                                                            and _BOMHeader.Plant          = _ProdVer.Plant
                                                            and _BOMHeader.BOMUsage       = _ProdVer.BOMUsage
                                                            and _BOMHeader.AlternativeBOM = _ProdVer.AlternativeBOM
{
  key    _BOMItem.BillOfMaterial,
  key    _BOMHeader.MaterialNumber,
  key    _BOMHeader.Plant,
  key    _BOMHeader.BOMUsage,
  key    _BOMHeader.AlternativeBOM,
  key    _BOMItem.BOMItemNumber,
  key    _BOMItem.BOMItemNodeNumber,
  key    _BOMItem.BOMCategory,
  key    _ProdVer.ProductionVersion,
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
         _BOMItem.ValidFromDateBOMItem,
         _BOMItem.ComponentUnitOfMeasure,
         _Material.BaseUnit,
         _ProdUoM.AlternativeUnitOfMeasure,
         _ProdUoM.NumeratorForUnitConversion,
         _ProdUoM.DenominatorForUnitConversion,
         _ProdUoM.Numerator,
         _ProdUoM.Denominator,


         _ProdVer.ValidFromDateOfProdVersion,
         _ProdVer.ValidToDateOfProdVersion,
         _ProdVer.ProductionVersionLock,
         _ProdVer.ProdVerSpecialProcurementType,
         _ProdVer.BaseUnitOfMeasure,
         _ProdVer.MinimumLotSizeQuantity,
         _ProdVer.MaterialMaximumLotSizeQuantity
}
