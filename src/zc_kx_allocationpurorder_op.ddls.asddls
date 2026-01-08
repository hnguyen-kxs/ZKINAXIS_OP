@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Allocation Purchase Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_AllocationPurOrder_OP
  as select from ZI_KX_PurchaseDocAllocation_OP
{
  key PurchasingDocumentNumber,
  key ItemNumberOfPurchasingDocument,
  key DeliveryScheduleLineCounter,
      OrderDateOfScheduleLine,
      MaterialNumber,
      PurchaseOrderUnitOfMeasure,
      Plant,
      PurchasingDocumentType,
      SupplyingPlantStckTransOrd,
      NumberOfReservation,
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
