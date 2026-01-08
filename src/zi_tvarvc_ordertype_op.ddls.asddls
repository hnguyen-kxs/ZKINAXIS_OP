@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@EndUserText.label: 'TVARVC for Sales Index Auart'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_TVARVC_OrderType_OP
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
  name = 'ZKX_PRODORDTYP'
