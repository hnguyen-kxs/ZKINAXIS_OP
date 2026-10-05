@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TVARVC Object Status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_TVARVC_ObjStat_OP
  as select from tvarvc
{
  key name as Name,
  key type as Type,
  key numb as Numb,
      sign as Sign,
      opti as Opti,
      low  as Low,
      high as High
}
where
  name = 'ZKX_OBJSTAT'
