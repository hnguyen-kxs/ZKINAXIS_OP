@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery Requirements'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #C,
    sizeCategory: #XL,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_DeliveryReqmts_OP
  as select from    ZI_Delivery_OP       as _Delivery
    inner join      ZI_SDRequirements_OP as _Reqmts   on  _Delivery.Delivery     = _Reqmts.SalesDocument
                                                      and _Delivery.DeliveryItem = _Reqmts.SalesDocumentItem
    left outer join ZI_Customer_OP       as _Customer on _Delivery.ShipToParty = _Customer.Customer
{
  key _Delivery.Delivery,
  key _Delivery.DeliveryItem,
      _Delivery.ShipToParty,
      _Delivery.DeliveryType,
      _Delivery.ActGdsMvmntDate,
      _Delivery.MRPArea,
      _Delivery.DeliveryGroup,
      _Delivery.ActualQuantityDelivered,
      _Delivery.StorageLocation,
      _Delivery.Material,
      _Delivery.MaterialAvailDate,
      _Delivery.BaseUnitOfMeasure,
      _Delivery.NetPrice,
      _Delivery.Denominator,
      _Delivery.Numerator,
      _Delivery.ReferenceDocument,
      _Delivery.ReferenceItem,
      _Delivery.SalesUnit,
      _Delivery.Plant,
      _Customer.Name,
      _Reqmts.SalesDocument,
      _Reqmts.SalesDocumentItem,
      _Reqmts.ScheduleLineNumber,
      _Reqmts.SalesDocumentType,
      _Reqmts.DocumentType,
      _Reqmts.RequirementType,
      _Reqmts.Batch,
      _Reqmts.AcctAssignmentCat,
      _Reqmts.NoMRP
}
