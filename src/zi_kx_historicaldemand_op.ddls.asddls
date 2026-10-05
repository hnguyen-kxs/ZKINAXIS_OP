@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Historical Demand - Composite'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_HistoricalDemand_OP
  with parameters
    p_days : int2
  as select from    ZI_Delivery_HDA_OP( p_days: $parameters.p_days  ) as _Delivery
    inner join      ZI_SalesOrders_HDA_OP                             as _Sales    on  _Delivery.ReferenceDocument = _Sales.SalesDocument
                                                                                   and _Delivery.ReferenceItem     = _Sales.SalesDocumentItem
    left outer join ZI_Customer_OP                                    as _Customer on _Sales.SoldToParty = _Customer.Customer
{
  key _Delivery.Delivery,
  key _Delivery.DeliveryItem,
  key _Sales.SalesDocument,
  key _Sales.SalesDocumentItem,
  key _Sales.DeliveryScheduleLine,
  key _Customer.Customer,
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
      _Sales.RequirementsType,
      _Sales.MRPAreaSales,
      _Sales.DeliveryGroupSales,
      _Sales.CumulConfirmedQty,
      _Sales.UnitOfMeasure,
      _Sales.PricingUnit,
      _Sales.PartDlv,
      _Sales.ItmRelevForDeliv,
      _Sales.StorageLocationSales,
      _Sales.DeliveryPriority,
      _Sales.MaterialSales,
      _Sales.BaseUnitOfMeasureSales,
      _Sales.NetPriceSales,
      _Sales.NetValue,
      _Sales.PurchaseOrderItem,
      _Sales.ItemCategory,
      _Sales.WBSElement,
      _Sales.Route,
      _Sales.BOMExplosionNumber,
      _Sales.BOMKeyDate,
      _Sales.HigherLevelItem,
      _Sales.DenominatorSales,
      _Sales.NumeratorSales,
      _Sales.ConversionFactor,
      _Sales.SalesUnitSales,
      _Sales.ShippingPoint,
      _Sales.DocumentCurrency,
      _Sales.PlantSales,
      _Sales.TargetQuantityUoM,
      _Sales.TargetQuantity,
      _Sales.ConfirmedQty,
      _Sales.ScheduleLineDate,
      _Sales.MaterialAvailDateSales,
      _Sales.CreatedOnItem,
      _Sales.CreatedOnHeader,
      _Sales.SoldToParty,
      _Sales.SalesDocumentType,
      _Sales.CustomerGroup,
      _Customer.Industry,
      _Customer.AccountGroup,
      _Customer.Name
}
