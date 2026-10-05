@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Capacity Shift - Composite'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_CapacityShift_OP
  with parameters
    p_months : int2
  as select from    ZI_CapacityHeader_OP as _Header
    inner join      kapa                 as _ShiftPar on  _ShiftPar.kapid = _Header.CapacityID
                                                      and _ShiftPar.versn = _Header.Version
                                                      and _ShiftPar.datub = _Header.ValidToDate

    left outer join tc37a                as _ShiftDef on  _Header.ShiftGroup = _ShiftDef.schgrup
                                                      and _ShiftPar.tprog    = _ShiftDef.kaptprog
{
  key      _ShiftPar.kapid                 as CapacityID,
  key      _ShiftPar.versn                 as CapacityVersion,
  key      _ShiftDef.kaptprog              as ShiftDefinition,
  key      _ShiftDef.schgrup               as ShiftGroup,
  key      _ShiftPar.datub                 as EndDate,
  key      _Header.Plant                   as Plant,
           _Header.IsStandardWorkCenter    as IsStandardWorkCenter,
           _Header.WorkCenterName          as WorkCenterName,
           _Header.WorkCenterType          as WorkCenterType,
           _Header.WorkCenterDescription   as WorkCenterDescription,
           _Header.FactoryCalendar         as FactoryCalendar,
           _Header.CapacityFactoryCalendar as CapacityFactoryCalendar,
           _Header.UnitOfMeasure           as UnitOfMeasure,
           _Header.NumberOfCapacities      as NumberOfCapacities,
           _Header.CapacityUtilizationRate as CapacityUtilizationRate,
           _Header.LenIntervalCycle        as LenIntervalCycle,
           _Header.CapacityIsValid         as CapacityIsValid,
           _ShiftPar.schnr                 as ShiftNumber,
           _ShiftPar.tagnr                 as WeekdayNumber,
           _ShiftPar.kapaz                 as Capacity,
           _ShiftPar.anzhl                 as NumberIndividualCapacity,
           _ShiftPar.ngrad                 as CapacityUtilRateShift,
           _ShiftDef.einzt                 as OperDurationInSeconds,
           _ShiftPar.begzt                 as StartTimeInSeconds,
           _ShiftPar.endzt                 as EndTimeInSeconds,
           _ShiftPar.pause                 as BreakDuration
}
where
  _ShiftPar.datub >=(dats_add_months( $session.system_date, -$parameters.p_months, 'FAIL' ) )
