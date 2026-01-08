@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Allocation Production Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_AllocationProdOrder_OP
  as select from ZI_KX_ProductionOrderRes_OP
{
  key OrderNumber,
      OrderType,
      NumberOfReservation,
      Plant,
      ItemNumberOfReservation,
      RecordType,
      HigherLevelAssemblyMaterial,
      RequirementType,
      RequirementQuantity,
      RequirementsDate,
      QuantityWithdrawn,
      StorageLocation,
      ReservationMaterial,
      ReservationPlant,
      OrderItemNumber,
      MRPArea,
      MaterialNumberForOrder,
      OrdItemPlanTotQuantity,
      PlanningPlantForOrder,
      BOMExplosionNumber,
      GRProcessingDurationInDays,
      QuantityGoodsReceivedOrdItem
}
