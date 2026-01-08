@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View for Purch Doc Allocation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_PurchaseDocAllocation_OP
  as select from ZI_KX_PurchaseDocument_OP as _PurDoc
    inner join   ZI_Allocation_OP          as _Alloc on _PurDoc.NumberOfReservation = _Alloc.NumberOfReservation

{
  key  _PurDoc.PurchasingDocumentNumber,
  key  _PurDoc.ItemNumberOfPurchasingDocument,
  key  _PurDoc.DeliveryScheduleLineCounter,
       _PurDoc.OrderDateOfScheduleLine,
       _PurDoc.MaterialNumber,
       _PurDoc.PurchaseOrderUnitOfMeasure,
       _PurDoc.Plant,
       _PurDoc.PurchasingDocumentType,
       _PurDoc.SupplyingPlantStckTransOrd,
       _PurDoc.NumberOfReservation,
       _Alloc.ItemNumberOfReservation,
       _Alloc.RecordType,
       _Alloc.OrderNumber,
       _Alloc.HigherLevelAssemblyMaterial,
       _Alloc.RequirementType,
       _Alloc.RequirementQuantity,
       _Alloc.RequirementsDate,
       _Alloc.QuantityWithdrawn,
       _Alloc.StorageLocation,
       _Alloc.ReservationMaterial,
       _Alloc.ReservationPlant
}
