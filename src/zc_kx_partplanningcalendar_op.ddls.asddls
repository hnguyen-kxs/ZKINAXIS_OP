@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Part Planning Cal'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_PartPlanningCalendar_OP
  as select from ZI_KX_PartPlanningCalendar_OP
{
  key PlanningCalendar,
  key Plant,
  key LastDayInPeriod,
  key FirstDayOfPeriod,
      MinimumPeriod,
      ValidToDate,
      ValidFromDate,
      CreatedOn,
      StartOfPeriod,
      PlanningCalCalculationRule,
      PeriodNumber,
      FixedPeriod
}
