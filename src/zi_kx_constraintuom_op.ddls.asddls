@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Constraint UOM - Composite'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_ConstraintUoM_OP
  as select from ZI_UoM_OP as _t006
    inner join   kako      as _kako on _t006.IntMeasUnit = _kako.meins
{
  key _t006.IntMeasUnit    as IntMeasUnit,
      max( _t006.ISOCode ) as ISOCode
}
group by
  _t006.IntMeasUnit
