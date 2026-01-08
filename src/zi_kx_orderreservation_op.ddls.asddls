@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view of Order Allocation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_KX_OrderReservation_OP
  as select from ZI_OrderHeader_OP as _Order
    inner join   ZI_Allocation_OP  as _Reservation on _Order.NumberOfReservation = _Reservation.NumberOfReservation
{
  key  _Order.OrderNumber,
       _Order.OrderType,
       _Order.OrderCategory,
       _Order.TargetOrderQuantity,
       _Order.ActualFinishDate,
       _Order.BasicFinishDate,
       _Order.ScheduledFinish,
       _Order.BaseUnitOfMeasure,
       _Order.ActualStartDate,
       _Order.BasicStartDate,
       _Order.ScheduledStart,
       _Order.ConfirmedQuantityOrdConfirm,
       _Order.SalesOrderNumber,
       _Order.ItemNumberInSalesOrder,
       _Order.ObjectNumber,
       _Order.GroupCounter,
       _Order.AssyMaterialNumber,
       _Order.KeyForTaskListGroup,
       _Order.TaskListType,
       _Order.NumberOfReservation,
       _Order.Material,
       _Order.Currency,
       _Order.Plant,
       _Reservation.ItemNumberOfReservation,
       _Reservation.RecordType,
       _Reservation.HigherLevelAssemblyMaterial,
       _Reservation.RequirementType,
       _Reservation.RequirementQuantity,
       _Reservation.RequirementsDate,
       _Reservation.QuantityWithdrawn,
       _Reservation.StorageLocation,
       _Reservation.ReservationMaterial,
       _Reservation.ReservationPlant
}
