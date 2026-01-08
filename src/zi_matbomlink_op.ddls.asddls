@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Material to BOM Link'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_MatBOMLink_OP
  as select from mast                  as _MatBomLink
    inner join   ZI_TVARVC_Plant_OP    as _TvarvcPlant    on _MatBomLink.werks = _TvarvcPlant.Low
    inner join   ZI_TVARVC_BOMUsage_OP as _TvarvcBOMUsage on _MatBomLink.stlan = _TvarvcBOMUsage.Low
{
  key cast(_MatBomLink.matnr as abap.char(40))  as MaterialNumber,
  key cast(_MatBomLink.stlal as abap.char(2))   as AlternativeBOM,
  key _MatBomLink.stlan                         as BOMUsage,
  key _MatBomLink.stlnr                         as BillOfMaterial,
  key _MatBomLink.werks                         as Plant,
      _MatBomLink.cslty                         as ConfigutedMaterial,
      cast(_MatBomLink.losbs as abap.char(17) ) as ToLotSize,
      cast(_MatBomLink.losvn as abap.char(17) ) as FromLotSize
}
where
  _MatBomLink.cslty = ''
