@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - Part Planning Calendar'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #CUSTOMIZING
}
@VDM.viewType: #BASIC
define view entity ZI_PartPlanningCalendar_OP
  as select from t439g              as _PlanningPeriods
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _PlanningPeriods.werks = _TvarvcPlant.Low
{
  key _PlanningPeriods.mrppp as PlanningCalendar,
  key _PlanningPeriods.werks as Plant,
      _PlanningPeriods.calhz as MinimumPeriod,
      _PlanningPeriods.datub as ValidToDate,
      _PlanningPeriods.datuv as ValidFromDate,
      _PlanningPeriods.erfdt as CreatedOn,
      _PlanningPeriods.fcopt as StartOfPeriod,
      _PlanningPeriods.mrpps as PlanningCalCalculationRule
}
