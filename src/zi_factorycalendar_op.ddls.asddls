@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - Factory Calendar'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #C,
    sizeCategory: #XL,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_FactoryCalendar_OP
  as select from tfacs                   as _FactoryCalendar
    inner join   ZI_TVARVC_CalendarId_OP as _TvarvcCalendar on _FactoryCalendar.ident = _TvarvcCalendar.Low
{
  key _FactoryCalendar.ident as FactoryCalendar,
  key _FactoryCalendar.jahr  as YearStored,
      _FactoryCalendar.basis as StartFactoryDayNumbering,
      _FactoryCalendar.fenum as NumberOfDaysInTheYear,
      _FactoryCalendar.mon01 as DaysInMonth01,
      _FactoryCalendar.mon02 as DaysInMonth02,
      _FactoryCalendar.mon03 as DaysInMonth03,
      _FactoryCalendar.mon04 as DaysInMonth04,
      _FactoryCalendar.mon05 as DaysInMonth05,
      _FactoryCalendar.mon06 as DaysInMonth06,
      _FactoryCalendar.mon07 as DaysInMonth07,
      _FactoryCalendar.mon08 as DaysInMonth08,
      _FactoryCalendar.mon09 as DaysInMonth09,
      _FactoryCalendar.mon10 as DaysInMonth10,
      _FactoryCalendar.mon11 as DaysInMonth11,
      _FactoryCalendar.mon12 as DaysInMonth12,
      _FactoryCalendar.load  as LoadYearInBufferFlag,
      _FactoryCalendar.wenum as NumberOfWorkdaysInTheYear
}
