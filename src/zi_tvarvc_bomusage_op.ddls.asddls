@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view BOMUsage TVARVC'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_TVARVC_BOMUsage_OP
  as select from tvarvc as _TvarvcBOMUsage
{
  key _TvarvcBOMUsage.name as Name,
  key _TvarvcBOMUsage.type as Type,
  key _TvarvcBOMUsage.numb as Numb,
      _TvarvcBOMUsage.sign as Sign,
      _TvarvcBOMUsage.opti as Opti,
      _TvarvcBOMUsage.low  as Low,
      _TvarvcBOMUsage.high as High
}
where
  name = 'ZKX_BOMUSAGE'
