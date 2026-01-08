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
  as select from jest as _ObjStat
{
  key _ObjStat.objnr as ObjectNumber,
  key _ObjStat.stat  as ObjectStatus
}
where
  (
       _ObjStat.stat  = 'I0045'
    or _ObjStat.stat  = 'I0046'
    or _ObjStat.stat  = 'I0012'
    or _ObjStat.stat  = 'I0076'
  )
  and  _ObjStat.inact = ''
