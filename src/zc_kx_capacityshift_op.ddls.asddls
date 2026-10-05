@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Capacity Shift - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_KX_CapacityShift_OP
  with parameters
    p_months : int2
  as select from ZI_KX_CapacityShift_OP( p_months: $parameters.p_months )
{
  key  CapacityID,
  key  CapacityVersion,
  key  ShiftDefinition,
  key  ShiftGroup,
  key  EndDate,
  key  Plant,
       IsStandardWorkCenter,
       WorkCenterName,
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
       LenIntervalCycle,
       CapacityIsValid,
       ShiftNumber,
       WeekdayNumber,
       Capacity,
       NumberIndividualCapacity,
       CapacityUtilRateShift,
       OperDurationInSeconds
}
