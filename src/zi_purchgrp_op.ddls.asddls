@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Purchasing Group'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MASTER
}
@VDM.viewType: #BASIC

define view entity ZI_PurchGrp_OP
  as select from t024
{
  key  ekgrp as PurchasingGroup,
       eknam as DescriptionPGroup
}
