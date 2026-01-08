@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumtion View Supplier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_Supplier_OP
  as select from ZI_KX_Supplier_OP
{
  key AccountNumberofSupplier,
      Currency,
      CreditInformationNumber,
      Name,
      Region,
      Plant
}
