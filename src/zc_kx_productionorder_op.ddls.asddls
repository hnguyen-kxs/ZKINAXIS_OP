@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Production Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_ProductionOrder_OP
  as select from ZI_KX_ProductionOrder_OP
{
  key OrderNumber,
  key OrderItemNumber,
      MRPArea,
      MaterialNumberForOrder,
      OrdItemPlanTotQuantity,
      PlanningPlantForOrder,
      BOMExplosionNumber,
      GRProcessingDurationInDays,
      QuantityGoodsReceivedOrdItem,
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
      Plant
}
