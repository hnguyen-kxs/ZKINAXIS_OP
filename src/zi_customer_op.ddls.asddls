@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer - Basic View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_Customer_OP
  as select from kna1 as _Customer

{
  key  _Customer.kunnr  as Customer,
       _Customer. brsch as Industry,
       _Customer. ktokd as AccountGroup,
       _Customer. name1 as Name
}
