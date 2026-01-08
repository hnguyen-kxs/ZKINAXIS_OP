@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View of Purchasing Document Header'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
serviceQuality: #X,
sizeCategory: #S,
dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_PurchasingDocHeader_OP
  as select from ekko                as _PurDocHeader
    inner join   ZI_TVARVC_PurDocTyp_OP as _TvarvcPurDocTyp on _PurDocHeader.bsart = _TvarvcPurDocTyp.Low
{
  key _PurDocHeader.ebeln as PurchasingDocumentNumber,
      _PurDocHeader.bedat as PurchasingDocumentDate,
      _PurDocHeader.bsart as PurchasingDocumentType,
      _PurDocHeader.bstyp as PurchasingDocumentCategory,
      _PurDocHeader.ekorg as PurchasingOrganization,
      _PurDocHeader.frgke as ReleaseIndicatorPurchasingDoc,
      _PurDocHeader.kdatb as StartOfValidityPeriod,
      _PurDocHeader.kdate as EndOfValidityPeriod,
      _PurDocHeader.lifnr as SupplierAccountNumber,
      _PurDocHeader.llief as GoodsSupplier,
      _PurDocHeader.loekz as DelIndicatorInPurchasingDoc,
      _PurDocHeader.reswk as SupplyingPlantStckTransOrd,
      _PurDocHeader.statu as StatusOfPurchasingDocument,
      _PurDocHeader.waers as Currency
}
where
      _PurDocHeader.loekz =  ''
  and _PurDocHeader.bstyp <> 'A'
