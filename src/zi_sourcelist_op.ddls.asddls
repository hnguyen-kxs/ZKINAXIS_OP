@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Source List Basic View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_SourceList_OP
  as select from eord               as _SourceList
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _SourceList.werks = _TvarvcPlant.Low
{
  key cast( _SourceList.matnr as abap.char(40)) as Material,
  key _SourceList.werks                         as SourceListPlant,
  key _SourceList.zeord                         as SourceListRecord,
      _SourceList.autet                         as MRPSourcingControl,
      _SourceList.vdatu                         as ValidityStartDate,
      _SourceList.bdatu                         as ValidityEndDate,
      _SourceList.ebeln                         as PurchaseOutlineAgreement,
      _SourceList.ebelp                         as PurchaseOutlineAgreementItem,
      _SourceList.ekorg                         as PurchasingOrganization,
      cast(_SourceList.ematn as abap.char(40))  as ManufacturerMaterial,
      _SourceList.febel                         as PurOutlineAgreementIsFixed,
      _SourceList.flifn                         as SupplierIsFixed,
      _SourceList.lifnr                         as Supplier,
      _SourceList.meins                         as OrderQuantityUnit,
      _SourceList.notkz                         as SourceOfSupplyIsBlocked,
      _SourceList.reswk                         as SupplyingPlant
}
where
      _SourceList.bdatu >= $session.system_date
  and _SourceList.autet <> ''
