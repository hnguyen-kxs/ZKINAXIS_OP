@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite for Planned Order Reservation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_KX_PlannedOrdReserv_OP
  as select from ZI_PlannedOrder_OP as _Order
    inner join   ZI_Allocation_OP   as _Allocation on _Order.NumberOfReservation = _Allocation.NumberOfReservation
{
  key   _Order.PlannedOrder,
        _Order.FirmingIndforPlannedOrder,
        _Order.NumberOfReservation,
        _Order.PlanningMaterial,
        _Order.BaseUnitOfMeasure,
        _Order.PlannedOrderType,
        _Order.PlanningPlant,
        _Order.ProductionPlant,
        _Allocation.ItemNumberOfReservation,
        _Allocation.RecordType,
        _Allocation.OrderNumber,
        _Allocation.HigherLevelAssemblyMaterial,
        _Allocation.RequirementType,
        _Allocation.RequirementQuantity,
        _Allocation.RequirementsDate,
        _Allocation.QuantityWithdrawn,
        _Allocation.StorageLocation,
        _Allocation.ReservationMaterial,
        _Allocation.ReservationPlant
}
