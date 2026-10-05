@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Work center load - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define root view entity ZI_WorkCenterLoad_OP
  as select from crhd               as _Wc
    inner join   crca               as _WcCap       on  _Wc.objty = _WcCap.objty
                                                    and _Wc.objid = _WcCap.objid
                                                    and _Wc.kapid = _WcCap.kapid
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _Wc.werks = _TvarvcPlant.Low
{
  key _Wc.objty    as ObjectType,
  key _Wc.objid    as WorkCenterInternalID,
  key _WcCap.canum as CapacityAllocationNumber,
      _Wc.begda    as StartDate,
      _Wc.endda    as EndDate,
      _Wc.arbpl    as WorkCenterName,
      _Wc.werks    as Plant,
      _Wc.verwe    as WorkCenterType,
      _Wc.vgwts    as StdValueKey,
      _WcCap.kapid as CapacityID,
      _WcCap.begda as CapacityStartDate,
      _WcCap.endda as CapacityEndDate,
      _WcCap.fork1 as SetupFormula,
      _WcCap.fork2 as ProcessingFormula,
      _WcCap.fork3 as TeardownFormula,
      _WcCap.forkn as OtherFormula
}
