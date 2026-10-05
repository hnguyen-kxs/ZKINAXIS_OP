@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - Object Status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_ObjectStatus_OP
  as select from jest                 as _ObjStat
    inner join   ZI_TVARVC_ObjStat_OP as _TvarvcObjStat on _ObjStat.stat = _TvarvcObjStat.Low
{
  key _ObjStat.objnr as ObjectNumber,
  key _ObjStat.stat  as ObjectStatus
}
where
  _ObjStat.inact = ''
