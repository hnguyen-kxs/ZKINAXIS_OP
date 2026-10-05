@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Capacity Header - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_KX_CapacityHeader_OP
  as select from ZI_KX_CapacityHeader_OP
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
