@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Historical Supply Make - Composite'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_HistoricalSupplyMake_OP
  with parameters
    p_days : int2
  as select from    ZI_OrderHSA_OP( p_days: $parameters.p_days ) as _OrderHeader
    inner join      ZI_OrderItem_OP                              as _OrderItem on _OrderHeader.OrderNumber = _OrderItem.OrderNumber
    left outer join ZI_ProductValuation_OP                       as _ProdVal   on  _OrderHeader.Material = _ProdVal.MaterialNumber
                                                                               and _OrderHeader.Plant    = _ProdVal.ValuationArea
{
  key _OrderHeader.OrderNumber,
  key _OrderItem.OrderItemNumber,
  key _ProdVal.ValuationArea,
  key _ProdVal.ValuationType,
      _OrderHeader.OrderType,
      _OrderHeader.OrderCategory,
      _OrderHeader.TargetOrderQuantity,
      _OrderHeader.ActualFinishDate,
      _OrderHeader.BasicFinishDate,
      _OrderHeader.ScheduledFinish,
      _OrderHeader.BaseUnitOfMeasure,
      _OrderHeader.ActualStartDate,
      _OrderHeader.BasicStartDate,
      _OrderHeader.ScheduledStart,
      _OrderHeader.ConfirmedQuantityOrdConfirm,
      _OrderHeader.SalesOrderNumber,
      _OrderHeader.ItemNumberInSalesOrder,
      _OrderHeader.ObjectNumber,
      _OrderHeader.GroupCounter,
      _OrderHeader.AssyMaterialNumber,
      _OrderHeader.KeyForTaskListGroup,
      _OrderHeader.TaskListType,
      _OrderHeader.NumberOfReservation,
      _OrderHeader.Material,
      _OrderHeader.Currency,
      _OrderHeader.Plant,
      _OrderItem.MRPArea,
      _OrderItem.MaterialNumberForOrder,
      _OrderItem.OrdItemPlanTotQuantity,
      _OrderItem.PlanningPlantForOrder,
      _OrderItem.BOMExplosionNumber,
      _OrderItem.GRProcessingDurationInDays,
      _OrderItem.QuantityGoodsReceivedOrdItem,
      _ProdVal.ValuationClass,
      _ProdVal.PriceUnitQty,
      _ProdVal.PriceChangeDate,
      _ProdVal.StandardPrice,
      _ProdVal.MovingAveragePrice,
      _ProdVal.InventoryValuationProcedure      
}
