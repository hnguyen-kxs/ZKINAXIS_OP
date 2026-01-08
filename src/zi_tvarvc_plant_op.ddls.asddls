@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TVARVC for Plant'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_TVARVC_Plant_OP
  as select from tvarvc as _TvarvcPlant
{
  key _TvarvcPlant.name as Name,
  key _TvarvcPlant.type as Type,
  key _TvarvcPlant.numb as Numb,
      _TvarvcPlant.sign as Sign,
      _TvarvcPlant.opti as Opti,
      _TvarvcPlant.low  as Low,
      _TvarvcPlant.high as High
}
where
  name = 'ZKX_PLANT'
