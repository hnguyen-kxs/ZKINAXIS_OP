@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Factory Calendar'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_FactoryCalendar_OP
  as select from ZI_KX_FactoryCalendar_OP
{
  key FactoryCalendar,
  key YearStored,
      StartFactoryDayNumbering,
      NumberOfDaysInTheYear,
      DaysInMonth01,
      DaysInMonth02,
      DaysInMonth03,
      DaysInMonth04,
      DaysInMonth05,
      DaysInMonth06,
      DaysInMonth07,
      DaysInMonth08,
      DaysInMonth09,
      DaysInMonth10,
      DaysInMonth11,
      DaysInMonth12,
      LoadYearInBufferFlag,
      NumberOfWorkdaysInTheYear
}
