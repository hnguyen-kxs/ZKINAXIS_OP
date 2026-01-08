@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - Part Planning Calendar Date'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_PartPlanningCalendarDate_OP
  as select from t439i              as _PlanningPeriodsLines
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _PlanningPeriodsLines.werks = _TvarvcPlant.Low
{
  key  _PlanningPeriodsLines.mrppp as PlanningCalendar,
  key  _PlanningPeriodsLines.werks as Plant,
  key  _PlanningPeriodsLines.ppbis as LastDayInPeriod,
  key  _PlanningPeriodsLines.ppvon as FirstDayOfPeriod,
       _PlanningPeriodsLines.pperi as PeriodNumber,
       _PlanningPeriodsLines.ppfix as FixedPeriod
}
