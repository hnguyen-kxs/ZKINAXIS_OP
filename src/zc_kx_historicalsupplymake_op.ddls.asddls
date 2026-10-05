@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Historical Supply Make - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_HistoricalSupplyMake_OP
  with parameters
    p_days : int2
  as select from ZI_KX_HistoricalSupplyMake_OP( p_days: $parameters.p_days )
{
  key OrderNumber,
  key OrderItemNumber,
  key ValuationArea,
  key ValuationType,
      OrderType,
      OrderCategory,
      TargetOrderQuantity,
      ActualFinishDate,
      BasicFinishDate,
      ScheduledFinish,
      BaseUnitOfMeasure,
      ActualStartDate,
      BasicStartDate,
      ScheduledStart,
      ConfirmedQuantityOrdConfirm,
      SalesOrderNumber,
      ItemNumberInSalesOrder,
      ObjectNumber,
      GroupCounter,
      AssyMaterialNumber,
      KeyForTaskListGroup,
      TaskListType,
      NumberOfReservation,
      Material,
      Currency,
      Plant,
      MRPArea,
      MaterialNumberForOrder,
      OrdItemPlanTotQuantity,
      PlanningPlantForOrder,
      BOMExplosionNumber,
      GRProcessingDurationInDays,
      QuantityGoodsReceivedOrdItem,
      ValuationClass,
      PriceUnitQty,
      PriceChangeDate,
      StandardPrice,
      MovingAveragePrice,
      InventoryValuationProcedure     
}
