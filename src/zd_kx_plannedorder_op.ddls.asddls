@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Planned Order - Delta'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Analytics.dataCategory: #FACT
@Analytics:{
    dataExtraction: {
        enabled: true,
        delta.changeDataCapture: {
        automatic : true
        }
    }
}
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE,
                                      #CDS_MODELING_DATA_SOURCE,
                                      #CDS_MODELING_ASSOCIATION_TARGET,
                                      #EXTRACTION_DATA_SOURCE,
                                      #SEARCHABLE_ENTITY,
                                      #ANALYTICAL_DIMENSION
]

define view entity ZD_KX_PlannedOrder_OP
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
       _PlannedOrder.matnr                        as PlanningMaterial,
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
