@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Allocation Plan Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_AllocationPlanOrder_OP
  as select from ZI_KX_PlannedOrdReserv_OP
{
  key PlannedOrder,
      NumberOfReservation,
      PlanningMaterial,
      BaseUnitOfMeasure,
      PlannedOrderType,
      PlanningPlant,
      ProductionPlant,
      FirmingIndforPlannedOrder,
      ItemNumberOfReservation,
      RecordType,
      OrderNumber,
      HigherLevelAssemblyMaterial,
      RequirementType,
      RequirementQuantity,
      RequirementsDate,
      QuantityWithdrawn,
      StorageLocation,
      ReservationMaterial,
      ReservationPlant
}
