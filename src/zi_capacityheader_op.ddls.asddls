@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Capacity Header - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_CapacityHeader_OP
  as select from kazy             as _CapacityInterval
    inner join   ZI_WorkCenter_OP as _WorkCenter on _CapacityInterval.kapid = _WorkCenter.CapacityInternalID
{
  key  _WorkCenter.WorkCenterInternalID    as WorkCenterInternalID,
  key  _WorkCenter.ObjectType              as ObjectType,
  key  _WorkCenter.CapacityInternalID      as CapacityInternalID,
  key  _WorkCenter.Plant                   as Plant,
  key  _WorkCenter.IsStandardWorkCenter    as IsStandardWorkCenter,
  key  _CapacityInterval.kapid             as CapacityID,
  key  _CapacityInterval.versn             as Version,
  key  _CapacityInterval.datub             as ValidToDate,
       _WorkCenter.WorkCenterName          as WorkCenterName,
       _WorkCenter.Version                 as WorkCenterVersion,
       _WorkCenter.WorkCenterType          as WorkCenterType,
       _WorkCenter.WorkCenterDescription   as WorkCenterDescription,
       _WorkCenter.FactoryCalendar         as FactoryCalendar,
       _WorkCenter.CapacityFactoryCalendar as CapacityFactoryCalendar,
       _WorkCenter.UnitOfMeasure           as UnitOfMeasure,
       _WorkCenter.NumberOfCapacities      as NumberOfCapacities,
       _WorkCenter.CapacityUtilizationRate as CapacityUtilizationRate,
       _WorkCenter.StartTimeInSeconds      as StartTimeInSeconds,
       _WorkCenter.EndTimeInSeconds        as EndTimeInSeconds,
       _WorkCenter.BreakDuration           as BreakDuration,
       _WorkCenter.ShiftGroup              as ShiftGroup,
       _CapacityInterval.anztg             as LenIntervalCycle,
       _CapacityInterval.kkopf             as CapacityIsValid
}
