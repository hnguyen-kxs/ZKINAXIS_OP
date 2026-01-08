@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View of Production Order Res.'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_ProductionOrderRes_OP
  as select from    ZI_KX_OrderReservation_OP as _OrdResv
    left outer join ZI_OrderItem_OP           as _OrdItm on _OrdResv.OrderNumber = _OrdItm.OrderNumber
{
  key _OrdResv.OrderNumber,
      _OrdResv.OrderType,
      _OrdResv.NumberOfReservation,
      _OrdResv.Plant,
      _OrdResv.ItemNumberOfReservation,
      _OrdResv.RecordType,
      _OrdResv.HigherLevelAssemblyMaterial,
      _OrdResv.RequirementType,
      _OrdResv.RequirementQuantity,
      _OrdResv.RequirementsDate,
      _OrdResv.QuantityWithdrawn,
      _OrdResv.StorageLocation,
      _OrdResv.ReservationMaterial,
      _OrdResv.ReservationPlant,
      _OrdItm.OrderItemNumber,
      _OrdItm.MRPArea,
      _OrdItm.MaterialNumberForOrder,
      _OrdItm.OrdItemPlanTotQuantity,
      _OrdItm.PlanningPlantForOrder,
      _OrdItm.BOMExplosionNumber,
      _OrdItm.GRProcessingDurationInDays,
      _OrdItm.QuantityGoodsReceivedOrdItem
}
