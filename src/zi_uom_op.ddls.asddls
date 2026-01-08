@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Unit of Measurement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MASTER
}
@VDM.viewType: #BASIC

define view entity ZI_UoM_OP
  as select from t006
{
  key  msehi   as IntMeasUnit,
       andec   as DecimalPlRounding,
       dimid   as Dimension,
       exp10   as Exponent,
       isocode as ISOCode,
       kzkeh   as CommercialMeasUnit,
       nennr   as Denominator,
       primary as PrimaryCode,
       zaehl   as Numerator
}
