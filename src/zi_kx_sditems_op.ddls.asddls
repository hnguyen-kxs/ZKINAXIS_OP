@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View of Sales Document Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_KX_SDItems_OP
  as select from    ZI_SDSchedLineItems_OP as _SchedLine
    left outer join ZI_SDLineItems_OP      as _SDItems on  _SchedLine.SalesDocument     = _SDItems.SalesDocument
                                                    and _SchedLine.SalesDocumentItem = _SDItems.SalesDocumentItem
{
  key  _SchedLine.SalesDocument,
  key  _SchedLine.SalesDocumentItem,
  key  _SchedLine.ScheduleLineNumber,
       _SDItems.RequirementsType,
       _SDItems.MRPArea,
       _SDItems.DeliveryGroup,
       _SDItems.CumulConfirmedQty,
       _SDItems.UnitofMeasure,
       _SDItems.PricingUnit,
       _SDItems.OrderQuantity,
       _SDItems.PartDlv,
       _SDItems.StorageLocation,
       _SDItems.DeliveryPriority,
       _SDItems.Material,
       _SDItems.BaseUnitofMeasure,
       _SDItems.NetPrice,
       _SDItems.NetValue,
       _SDItems.PurchaseOrderItem,
       _SDItems.ItemCategory,
       _SDItems.WBSElement,
       _SDItems.Route,
       _SDItems.BOMExplosionNumber,
       _SDItems.BOMKeyDate,
       _SDItems.HigherLevelItem,
       _SDItems.Denominator,
       _SDItems.Numerator,
       _SDItems.ConversionFactor,
       _SDItems.ShippingPoint,
       _SDItems.DocumentCurrency,
       _SDItems.Plant,
       _SDItems.TargetquantityUoM,
       _SDItems.Targetquantity,
       _SchedLine.ConfirmedQuantity,
       _SchedLine.ScheduleLineDate,
       _SchedLine.SchedLineCategory,
       _SchedLine.LoadingDate,
       _SchedLine.ItmRelevForDeliv,
       _SchedLine.DeliveryBlock,
       _SchedLine.MaterialAvailDate,
       _SchedLine.CommittedQty,
       _SchedLine.SalesUnit,
       _SchedLine.GoodsIssueDate,
       _SchedLine.OrderQuantityInSalesUnits
}
