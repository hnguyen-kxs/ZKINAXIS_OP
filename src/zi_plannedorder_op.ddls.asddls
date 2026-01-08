@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View of Planned Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_PlannedOrder_OP
  as select from plaf               as _PlannedOrder
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _PlannedOrder.pwwrk = _TvarvcPlant.Low

{
  key  _PlannedOrder.plnum                        as PlannedOrder,
       _PlannedOrder.auffx                        as FirmingIndforPlannedOrder,
       _PlannedOrder.bedid                        as IDCapacityRequirementsRecord,
       cast(_PlannedOrder.gsmng as abap.char(17)) as PlannedTotalOrderQuantity,
       _PlannedOrder.kdauf                        as SalesOrderNumber,
       _PlannedOrder.kdpos                        as ItemNumberSalesOrder,
       _PlannedOrder.lgort                        as StorageLocation,
       _PlannedOrder.lvsch                        as PlanOrdLeadingSchedulingLevel,
       cast(_PlannedOrder.matnr as abap.char(40)) as PlanningMaterial,
       _PlannedOrder.meins                        as BaseUnitOfMeasure,
       _PlannedOrder.paart                        as PlannedOrderType,
       _PlannedOrder.pedtr                        as PlannedOrderEndDate,
       _PlannedOrder.plwrk                        as PlanningPlant,
       _PlannedOrder.psttr                        as PlannedOrderStartDate,
       _PlannedOrder.pwwrk                        as ProductionPlant,
       _PlannedOrder.rsnum                        as NumberOfReservation,
       _PlannedOrder.sernr                        as BOMExplosionNumber,
       _PlannedOrder.sobes                        as SpecialProcurementType,
       _PlannedOrder.webaz                        as GRProcessingDurationInDays

}
where
       _PlannedOrder.gsmng >  0
  and(
       _PlannedOrder.obart != '5'
    or _PlannedOrder.obart != '6'
  )
