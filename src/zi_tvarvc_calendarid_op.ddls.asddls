@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - Calendar ID'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_TVARVC_CalendarId_OP
  as select from tvarvc as _TvarvcCalendar
{
  key _TvarvcCalendar.name as Name,
  key _TvarvcCalendar.type as Type,
  key _TvarvcCalendar.numb as Numb,
      _TvarvcCalendar.sign as Sign,
      _TvarvcCalendar.opti as Opti,
      _TvarvcCalendar.low  as Low,
      _TvarvcCalendar.high as High
}
where
  name = 'ZKX_CALENDAR'
