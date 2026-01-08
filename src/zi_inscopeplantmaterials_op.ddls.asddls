@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - InScopePlantMaterials'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_InScopePlantMaterials_OP
  as select from nsdm_e_marc        as _MatPlant
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _MatPlant.werks = _TvarvcPlant.Low
{
  key cast(_MatPlant.matnr as abap.char(40)) as MaterialNumber,
  key _MatPlant.werks                        as Plant
}
where
  _MatPlant.lvorm = ''
