@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View Production Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_ProductionOrder_OP
  as select from    ZI_OrderHeader_OP  as _Order
    left outer join ZI_OrderItem_OP    as _OrderItem on _Order.OrderNumber = _OrderItem.OrderNumber
    left outer join ZI_ObjectStatus_OP as _ObjStat   on _Order.ObjectNumber = _ObjStat.ObjectNumber
{
  key _OrderItem.OrderNumber,
  key _OrderItem.OrderItemNumber,
      _OrderItem.MRPArea,
      _OrderItem.MaterialNumberForOrder,
      _OrderItem.OrdItemPlanTotQuantity,
      _OrderItem.PlanningPlantForOrder,
      _OrderItem.BOMExplosionNumber,
      _OrderItem.GRProcessingDurationInDays,
      _OrderItem.QuantityGoodsReceivedOrdItem,
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
      _Order.Plant
}

where
  _ObjStat.ObjectNumber is null
