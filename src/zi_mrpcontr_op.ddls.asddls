@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View MRP Controllers'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MASTER
}
@VDM.viewType: #BASIC

define view entity ZI_MRPContr_OP
  as select from t024d              as _MRPControllers
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _MRPControllers.werks = _TvarvcPlant.Low
{
  key  _MRPControllers.dispo as MRPController,
  key  _MRPControllers.werks as Plant,
       _MRPControllers.dsnam as NameOfMRPController
}
where
  _MRPControllers.dispo != ' '
