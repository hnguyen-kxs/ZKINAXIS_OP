@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TVARVC for Sales Index Order Type'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_TVARVC_SalesIdx_OrdTyp_OP
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
  name = 'ZKX_SALESORDTYP'
