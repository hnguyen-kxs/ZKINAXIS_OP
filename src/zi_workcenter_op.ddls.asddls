@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Work center - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_WorkCenter_OP
  as select from    crhd               as _Wc
    inner join      kako               as _Capacity    on _Capacity.kapid = _Wc.kapid
    left outer join crtx               as _Text        on  _Text.objty = _Wc.objty
                                                       and _Text.objid = _Wc.objid
                                                       and _Text.spras = $session.system_language
    inner join      t001w              as _Plant       on _Plant.werks = _Wc.werks
    inner join      ZI_TVARVC_Plant_OP as _TvarvcPlant on _Wc.werks = _TvarvcPlant.Low
{
  key _Wc.objid       as WorkCenterInternalID,
  key _Wc.objty       as ObjectType,
  key _Wc.kapid       as CapacityInternalID,
  key _Wc.werks       as Plant,
      _Wc.stand       as IsStandardWorkCenter,
      _Wc.arbpl       as WorkCenterName,
      _Wc.veran       as Version,
      _Wc.verwe       as WorkCenterType,
      _Text.ktext     as WorkCenterDescription,
      _Plant.fabkl    as FactoryCalendar,
      _Capacity.kalid as CapacityFactoryCalendar,
      _Capacity.meins as UnitOfMeasure,
      _Capacity.aznor as NumberOfCapacities,
      _Capacity.ngrad as CapacityUtilizationRate,
      _Capacity.begzt as StartTimeInSeconds,
      _Capacity.endzt as EndTimeInSeconds,
      _Capacity.pause as BreakDuration,
      _Capacity.mosid as ShiftGroup
}
