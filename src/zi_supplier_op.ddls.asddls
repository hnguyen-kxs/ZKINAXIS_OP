@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view for Supplier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_Supplier_OP
  as select from lfa1 as _Supplier
{
  key    _Supplier.lifnr         as AccountNumberofSupplier,

         _Supplier.j_sc_currency as Currency,
         _Supplier.kraus         as CreditInformationNumber,
         _Supplier.name1         as Name,
         _Supplier.regio         as Region,
         _Supplier.werks         as Plant
}
