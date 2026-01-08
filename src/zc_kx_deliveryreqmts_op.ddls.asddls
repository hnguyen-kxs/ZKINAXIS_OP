@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View Delivery Requirements'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #C,
    sizeCategory: #XL,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_DeliveryReqmts_OP
  as select from ZI_KX_DeliveryReqmts_OP
{
  key Delivery,
  key DeliveryItem,
      ShipToParty,
      DeliveryType,
      ActGdsMvmntDate,
      MRPArea,
      DeliveryGroup,
      ActualQuantityDelivered,
      StorageLocation,
      Material,
      MaterialAvailDate,
      BaseUnitOfMeasure,
      NetPrice,
      Denominator,
      Numerator,
      ReferenceDocument,
      ReferenceItem,
      SalesUnit,
      Plant,
      Name,
      SalesDocument,
      SalesDocumentItem,
      ScheduleLineNumber,
      SalesDocumentType,
      DocumentType,
      RequirementType,
      Batch,
      AcctAssignmentCat,
      NoMRP
}
