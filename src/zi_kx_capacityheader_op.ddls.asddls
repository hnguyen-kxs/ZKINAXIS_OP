@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Capacity Header - Composite'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_CapacityHeader_OP
  as select from ZI_CapacityHeader_OP
{
  key  WorkCenterInternalID,
  key  ObjectType,
  key  CapacityInternalID,
  key  Plant,
  key  IsStandardWorkCenter,
  key  CapacityID,
  key  Version,
  key  ValidToDate,
       WorkCenterName,
       WorkCenterVersion,
       WorkCenterType,
       WorkCenterDescription,
       FactoryCalendar,
       CapacityFactoryCalendar,
       UnitOfMeasure,
       NumberOfCapacities,
       CapacityUtilizationRate,
       StartTimeInSeconds,
       EndTimeInSeconds,
       BreakDuration,
       ShiftGroup,
       LenIntervalCycle,
       CapacityIsValid
}
