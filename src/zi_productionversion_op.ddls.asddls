@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View PartSource Prod Version'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_ProductionVersion_OP
  as select from    mkal               as _ProdVer
    inner join      ZI_TVARVC_Plant_OP as _TvarvcPlant on _ProdVer.werks = _TvarvcPlant.Low
    left outer join ZI_ProductPlant_OP as _ProdPlant   on  _ProdVer.matnr = _ProdPlant.MaterialNumber
                                                       and _ProdVer.werks = _ProdPlant.Plant
{
  key cast(_ProdVer.matnr as abap.char(40))   as MaterialNumber,
  key _ProdVer.werks                          as Plant,
  key _ProdVer.verid                          as ProductionVersion,
      cast(_ProdVer.bstma as abap.char( 17 )) as MaxLotSizeQty,
      cast(_ProdVer.bstmi as abap.char( 17 )) as MinLotSizeQty,
      _ProdVer.adatu                          as EffectiveIndate,
      _ProdVer.bdatu                          as EffectiveOutdate,
      _ProdVer.plnnr                          as KeyForTaskListGroup,
      cast(_ProdVer.stlal as abap.char( 2 ))  as BOMAlternate,
      _ProdVer.mksp                           as ProductionVersionLock,
      _ProdVer.beskz                          as ProdVersionProcurementType,
      _ProdVer.alnal                          as GroupCounter,
      _ProdVer.plnty                          as TaskListType,
      _ProdVer.sobsl                          as SpecialProcurementType,
      _ProdVer.stlan                          as BOMUsage,
      _ProdVer.verto                          as DistKeyForQtyProduced,
      _ProdPlant.TransferPlant,
      _ProdPlant.ProcurementSubType,
      _ProdPlant.StandardPrice,
      _ProdPlant.LotSizingProcedure,
      _ProdPlant.FixedLotSizeQuantity,
      _ProdPlant.LotSizeRoundingQuantity,
      _ProdPlant.BaseUnit,
      _ProdPlant.GoodsReceiptDuration,
      _ProdPlant.PlannedDeliveryDurationInDay,
      _ProdPlant.PlanningTimeFence,
      _ProdPlant.AssemblyScrapPercent,
      _ProdPlant.ProcurementType,
      _ProdPlant.MaximumLotSizeQuantity,
      _ProdPlant.MinimumLotSizeQuantity,
      _ProdPlant.InHouseProductionTime,
      _ProdPlant.HasProductionVersion,
      _ProdPlant.SpecialProcurementIndicator,
      _ProdPlant.FactoryCalendar
}
where
  _ProdVer.bdatu >= $session.system_date
