@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View Unit of Measurement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_KX_UoM_OP
  as select from ZI_UoM_OP
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
