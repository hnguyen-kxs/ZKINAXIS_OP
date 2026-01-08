@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SD Item Requirments'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_KX_SDItemReqts_OP
  as select from    ZI_KX_SDItems_OP     as _SDItem
    inner join      ZI_SDRequirements_OP as _SDRequirements on  _SDItem.SalesDocument      = _SDRequirements.SalesDocument
                                                         and _SDItem.SalesDocumentItem  = _SDRequirements.SalesDocumentItem
                                                         and _SDItem.ScheduleLineNumber = _SDRequirements.ScheduleLineNumber
    left outer join ZI_Customer_OP       as _Customer       on _SDRequirements.SoldToParty = _Customer.Customer
{
  key _SDItem.SalesDocument,
  key _SDItem.SalesDocumentItem,
  key _SDItem.ScheduleLineNumber,
      _SDItem.RequirementsType,
      _SDItem.MRPArea,
      _SDItem.DeliveryGroup,
      _SDItem.CumulConfirmedQty,
      _SDItem.UnitofMeasure,
      _SDItem.PricingUnit,
      _SDItem.OrderQuantity,
      _SDItem.PartDlv,
      _SDItem.StorageLocation,
      _SDItem.DeliveryPriority,
      _SDItem.BaseUnitofMeasure,
      _SDItem.NetPrice,
      _SDItem.NetValue,
      _SDItem.PurchaseOrderItem,
      _SDItem.ItemCategory,
      _SDItem.Route,
      _SDItem.Denominator,
      _SDItem.Numerator,
      _SDItem.ConversionFactor,
      _SDItem.ShippingPoint,
      _SDItem.TargetquantityUoM,
      _SDItem.Targetquantity,
      _SDItem.ConfirmedQuantity,
      _SDItem.ScheduleLineDate,
      _SDItem.SchedLineCategory,
      _SDItem.ItmRelevForDeliv,
      _SDItem.DeliveryBlock,
      _SDItem.CommittedQty,
      _SDItem.SalesUnit,
      _SDItem.GoodsIssueDate,
      _SDItem.OrderQuantityInSalesUnits,
      _SDRequirements.SalesDocumentType,
      _SDRequirements.DocumentType,
      _SDRequirements.RequirementType,
      _SDRequirements.Batch,
      _SDRequirements.SoldToParty,
      _SDRequirements.SpecStkValuation,
      _SDRequirements.Material,
      _SDRequirements.MaterialAvailDate,
      _SDRequirements.NoMRP,
      _SDRequirements.OpenQuantity,
      _SDRequirements.Plant,
      _Customer.Name
}
