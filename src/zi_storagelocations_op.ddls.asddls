@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Storage Locations'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_StorageLocations_OP
  as select from t001l              as _StorageLocations
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _StorageLocations.werks = _TvarvcPlant.Low
{
  key _StorageLocations.werks as Plant,
  key _StorageLocations.lgort as StorageLocation,
      _StorageLocations.lgobe as StorageLocDescrip,
      _StorageLocations.diskz as StorageLocMRPInd
}
