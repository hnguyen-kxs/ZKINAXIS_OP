@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View Unit of Measurement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_UoM_OP
  as select from ZI_KX_UoM_OP
{
  key IntMeasUnit,
      DecimalPlRounding,
      Dimension,
      Exponent,
      ISOCode,
      CommercialMeasUnit,
      Denominator,
      PrimaryCode,
      Numerator
}
