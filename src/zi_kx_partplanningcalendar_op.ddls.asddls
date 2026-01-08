@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View - Part Planning Calendar'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_PartPlanningCalendar_OP
  as select from ZI_PartPlanningCalendar_OP     as _Header
    inner join   ZI_PartPlanningCalendarDate_OP as _Lines on  _Header.PlanningCalendar = _Lines.PlanningCalendar
                                                          and _Header.Plant            = _Lines.Plant
{
  key _Header.PlanningCalendar,
  key _Header.Plant,
  key _Lines.LastDayInPeriod,
  key _Lines.FirstDayOfPeriod,
      _Header.MinimumPeriod,
      _Header.ValidToDate,
      _Header.ValidFromDate,
      _Header.CreatedOn,
      _Header.StartOfPeriod,
      _Header.PlanningCalCalculationRule,
      _Lines.PeriodNumber,
      _Lines.FixedPeriod
}
