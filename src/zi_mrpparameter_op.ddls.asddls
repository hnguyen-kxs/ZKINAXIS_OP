@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View MRP Control Parameter'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MASTER
}
@VDM.viewType: #BASIC

define view entity ZI_MRPParameter_OP
  as select from MDCV_E_T399D       as _MrpParam
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _MrpParam.werks = _TvarvcPlant.Low
{
  key _MrpParam.werks as Plant,
      _MrpParam.bztek as PurchasingProcTime
}
