@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - BOM Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_BOMItem_OP
  as select from stas as _BOMSelection
    inner join   stko as _BOMHeader on  _BOMHeader.stlal = _BOMSelection.stlal
                                    and _BOMHeader.stlnr = _BOMSelection.stlnr
                                    and _BOMHeader.stlty = _BOMSelection.stlty

    inner join   stpo as _BOMItem   on  _BOMHeader.stlty    =  _BOMItem.stlty
                                    and _BOMHeader.stlnr    =  _BOMItem.stlnr
                                    and _BOMSelection.stlkn =  _BOMItem.stlkn
                                    and _BOMItem.idnrk      != ''
{
  key _BOMItem.stlty                                as BOMCategory,
  key cast(_BOMItem.stlnr as char8 preserving type) as BillOfMaterial,
  key cast(_BOMHeader.stlal as abap.char(2))        as AlternativeBOM,
      _BOMHeader.stkoz                              as InternalCounterBOMHeader,
      _BOMHeader.aennr                              as ChangeNumberBOMHeader,
      _BOMHeader.bmein                              as BaseUOMforBOM,
      cast(_BOMHeader.bmeng as abap.char(17))       as BaseQuantity,
      _BOMHeader.datuv                              as ValidFromDateBOMHeader,
      _BOMHeader.lkenz                              as DeletionIndicatorBOMHeader,
      _BOMHeader.loekz                              as DeletionFlagForBOM,
      _BOMHeader.stlst                              as BillOfMaterialStatus,
      _BOMHeader.vgkzl                              as PreviousHeaderCounter,
      _BOMSelection.stasz                           as InternalCounterBOMSelection,
      _BOMSelection.aennr                           as ChangeNumberBOMSelection,
      _BOMSelection.datuv                           as ValidFromDateBOMSelection,
      _BOMSelection.stvkn                           as InheritedNodeNumberOfBOMItem,
      cast(_BOMItem.stlkn as abap.char(9))          as BOMItemNodeNumber,
      _BOMItem.stpoz                                as InternalCounterBOMItem,
      _BOMItem.aennr                                as ChangeNumberBOMItem,
      _BOMItem.lkenz                                as DeletionIndicatorBOMItem,
      _BOMItem.alpgr                                as AlternativeItemGroup,
      _BOMItem.alprf                                as AlternativeItemRankingOrder,
      _BOMItem.alpst                                as AlternativeItemStrategy,
      _BOMItem.ausch                                as ComponentScrapPercent,
      _BOMItem.beikz                                as MaterialProvisionIndicator,
      _BOMItem.datuv                                as ValidFromDateBOMItem,
      _BOMItem.ewahr                                as UsageProbabilityPercent,
      _BOMItem.fmeng                                as FixedQuantity,
      cast(_BOMItem.idnrk as abap.char(40))         as BOMComponent,
      _BOMItem.itsob                                as SpecialProcurementType,
      _BOMItem.kzkup                                as IndicatorCoProduct,
      _BOMItem.kznfp                                as IndicatorFollowUpItem,
      _BOMItem.lgort                                as IssueLocationProductionOrder,
      _BOMItem.meins                                as ComponentUnitOfMeasure,
      cast(_BOMItem.menge as abap.char(17))         as ComponentQuantity,
      _BOMItem.netau                                as NetScrapIndicator,
      _BOMItem.nfeag                                as DiscontinuationGroup,
      _BOMItem.nfgrp                                as FollowUpGroup,
      _BOMItem.nlfzt                                as LeadTimeOffset,
      cast(_BOMItem.posnr as abap.char(9))          as BOMItemNumber,
      _BOMItem.postp                                as ItemCategoryBOM,
      _BOMItem.prvbe                                as ProductionSupplyArea,
      _BOMItem.rekri                                as RecursiveBOMIndicator,
      _BOMItem.rekrs                                as RecursiveAllowedIndicator,
      _BOMItem.sanfe                                as ItemRelatedToProductionInd,
      _BOMItem.schgt                                as IndicatorBulkMaterial,
      _BOMItem.verti                                as DistributionKeyConsumption,
      _BOMItem.vgknt                                as PredecessorNode,
      _BOMItem.vgpzl                                as PreviousItemCounter,
      _BOMItem.valid_to                             as ValidToDateBOMItem,
      _BOMItem.ecn_to                               as ChangeNumberToBOMItem
}
where
      _BOMHeader.stlty    =  'M'
  and _BOMSelection.lkenz =  ''
  and _BOMHeader.bmeng    != 0
  and _BOMHeader.loekz    =  ''
  and _BOMItem.lkenz      =  ''
