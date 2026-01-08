@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - Independent Demand'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_IndependentDemandPIR_OP
  as select from pbim               as _IndReqMaterial
    inner join   pbed               as _IndReqData  on _IndReqMaterial.bdzei = _IndReqData.bdzei
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _IndReqMaterial.werks = _TvarvcPlant.Low
{
  key cast(_IndReqMaterial.matnr as abap.char(40)) as MaterialNumber,
  key _IndReqMaterial.werks                        as Plant,
  key _IndReqMaterial.bedae                        as RequirementType,
  key _IndReqMaterial.versb                        as VersionNumberForIndependentReq,
  key _IndReqMaterial.pbdnr                        as RequirementsPlanNumber,
      _IndReqMaterial.bdzei                        as IndependentRequirementsPointer,
      _IndReqMaterial.oplkz                        as WithNoMRP,
      _IndReqMaterial.verkz                        as IndicatorVersionActive,
      _IndReqMaterial.zuvkz                        as ConsumptionIndicator,
      _IndReqData.pdatu                            as DeliveryOrderFinishDate,
      cast(_IndReqData.plnmg as abap.char(17))     as PlannedQuantity
}
where
      _IndReqData.loevr     = ''
  and _IndReqData.plnmg     > 0
  and _IndReqMaterial.loevr = ''
  and _IndReqMaterial.vervs = 'X'
