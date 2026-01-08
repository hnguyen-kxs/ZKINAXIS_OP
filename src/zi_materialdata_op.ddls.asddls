@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'General Material Data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_MaterialData_OP
  as select from mara as _Material
{
  key cast(_Material.matnr as abap.char(40)) as MaterialNumber,
      _Material.ferth                        as ProductionOrInspectionMemoTxt,
      _Material.kzkfg                        as ProductIsConfigurable,
      _Material.labor                        as LaboratoryOrDesignOffice,
      _Material.lvorm                        as IsMarkedForDeletion,
      _Material.matkl                        as ProductGroup,
      _Material.meins                        as BaseUnit,
      _Material.mhdhb                        as TotalShelfLife,
      _Material.mhdlp                        as StoragePercentage,
      _Material.mhdrz                        as MinRemShelfLife,
      _Material.mstae                        as CrossPlantStatus,
      _Material.mstav                        as SalesStatus,
      _Material.mtart                        as ProductType,
      _Material.mtpos_mara                   as ItemCategoryGroup,
      _Material.prdha                        as ProductHierarchy,
      _Material.spart                        as Division,
      _Material.tempb                        as TempConditions
}
