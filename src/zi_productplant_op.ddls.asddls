@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Plant Basic View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #C,
    sizeCategory: #XL,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_ProductPlant_OP
  as select from    nsdm_e_marc                 as _MatPlant
    inner join      ZI_TVARVC_Plant_OP          as _TvarvcPlant on _MatPlant.werks = _TvarvcPlant.Low
    inner join      mara                        as _Material    on _MatPlant.matnr = _Material.matnr
    left outer join ZI_ProductValuation_OP      as _ProductVal  on  _MatPlant.matnr = _ProductVal.MaterialNumber
                                                                and _MatPlant.werks = _ProductVal.ValuationArea
    left outer join ZI_SpecialProcurementKey_OP as _SplProcKey  on  _MatPlant.sobsl = _SplProcKey.SpecialProcurementType
                                                                and _MatPlant.werks = _SplProcKey.Plant
    left outer join t001w                       as _Plants      on _MatPlant.werks = _Plants.werks

{
  key  cast(_MatPlant.matnr as abap.char(40))      as MaterialNumber,
  key  _MatPlant.werks                             as Plant,
       _MatPlant.apokz                             as RelevantToAPO,
       _MatPlant.ausdt                             as EffectiveOutDate,
       _MatPlant.ausss                             as AssemblyScrapPercent,
       _MatPlant.beskz                             as ProcurementType,
       cast(_MatPlant.bstfe  as abap.char( 17 ) )  as FixedLotSizeQuantity,
       cast(_MatPlant.bstma  as abap.char( 17 ) )  as MaximumLotSizeQuantity,
       cast(_MatPlant.bstmi  as abap.char( 17 ) )  as MinimumLotSizeQuantity,
       cast(_MatPlant.bstrf  as abap.char( 17 ) )  as LotSizeRoundingQuantity,
       cast(_MatPlant.bwesb as abap.char( 17 ) )   as ValuatedGoodReceiptBlockedStck,
       _MatPlant.diber                             as MRPAreaExists,
       _MatPlant.disgr                             as MRPGroup,
       _MatPlant.disls                             as LotSizingProcedure,
       _MatPlant.dismm                             as MRPType,
       _MatPlant.dispo                             as MRPResponsible,
       _MatPlant.dzeit                             as InHouseProductionTime,
       cast(_MatPlant.eisbe  as abap.char( 17 ) )  as SafetyStockQuantity,
       _MatPlant.ekgrp                             as PurchasingGroup,
       _MatPlant.fevor                             as ProductionSupervisor,
       _MatPlant.fhori                             as SchedulingMarginKey,
       _MatPlant.fxhor                             as PlanningTimeFence,
       _MatPlant.kausf                             as ComponentScrapInPercent,
       _MatPlant.kautb                             as IsAutoPurOrdCreationAllowed,
       _MatPlant.kzaus                             as ProductIsToBeDiscontinued,
       _MatPlant.lagpr                             as StorageCostsPercentageCode,
       _MatPlant.lgrad                             as SrvcLvl,
       cast(_MatPlant.losfx as abap.char( 17 ) )   as LotSizeIndependentCosts,
       _MatPlant.lvorm                             as IsMarkedForDeletionPlantLevel,
       _MatPlant.maabc                             as ABCIndicator,
       cast(_MatPlant.minbe as abap.char( 17 ) )   as ReorderThresholdQuantity,
       _MatPlant.miskz                             as MRPAvailabilityType,
       _MatPlant.mmsta                             as ProfileCode,
       _MatPlant.mrppp                             as MRPPlanningCalendar,
       _MatPlant.nfmat                             as FollowUpProduct,
       _MatPlant.plifz                             as PlannedDeliveryDurationInDay,
       _MatPlant.plnty                             as TaskListType,
       _MatPlant.prctr                             as ProfitCenter,
       _MatPlant.qmatv                             as ProductPlantHasInspectionSetup,
       _MatPlant.sbdkz                             as DependentRequirementsType,
       _MatPlant.schgt                             as IsBulkMaterialComponent,
       _MatPlant.shflg                             as IsSafetyTime,
       _MatPlant.shpro                             as PerdPrflForSftyTme,
       _MatPlant.shzet                             as SafetyDuration,
       _MatPlant.sobsl                             as ProcurementSubType,
       _MatPlant.stdpd                             as ConfigurableProduct,
       _MatPlant.strgr                             as PlanningStrategyGroup,
       _MatPlant.takzt                             as RqmtQtyRcptTaktTmeInWrkgDays,
       cast(_MatPlant.trame   as abap.char( 18 ) ) as StockInTransit,
       cast(_MatPlant.umlmc   as abap.char( 18 ) ) as StockInTransfer,
       _MatPlant.usequ                             as QuotaArrangementUsage,
       _MatPlant.verkz                             as HasProductionVersion,
       _MatPlant.vint1                             as BackwardCnsmpnPeriodInWorkDays,
       _MatPlant.vint2                             as FwdConsumptionPeriodInWorkDays,
       _MatPlant.vrmod                             as ProdRqmtsConsumptionMode,
       _MatPlant.webaz                             as GoodsReceiptDuration,
       _MatPlant.wzeit                             as TotalReplenishmentLeadTime,
       _Material.ferth                             as ProductionOrInspectionMemoTxt,
       _Material.kzkfg                             as ProductIsConfigurable,
       _Material.labor                             as LaboratoryOrDesignOffice,
       _Material.lvorm                             as IsMarkedForDeletion,
       _Material.matkl                             as ProductGroup,
       _Material.meins                             as BaseUnit,
       _Material.mhdhb                             as TotalShelfLife,
       _Material.mhdlp                             as StoragePercentage,
       _Material.mhdrz                             as MinRemShelfLife,
       _Material.mstae                             as CrossPlantStatus,
       _Material.mstav                             as SalesStatus,
       _Material.mtart                             as ProductType,
       _Material.mtpos_mara                        as ItemCategoryGroup,
       _Material.prdha                             as ProductHierarchy,
       _Material.spart                             as Division,
       _Material.tempb                             as TempConditions,
       _ProductVal.ValuationType,
       _ProductVal.ValuationClass,
       _ProductVal.PriceUnitQty,
       _ProductVal.StandardPrice,
       _ProductVal.MovingAveragePrice,
       _ProductVal.InventoryValuationProcedure,
       _SplProcKey.SpecialProcurementIndicator,
       _SplProcKey.TransferPlant,
       _Plants.land1                               as CountryKey,
       _Plants.name1                               as PlantName,
       _Plants.regio                               as Region,
       _Plants.fabkl                               as FactoryCalendar
}
where
      _Material.lvorm = ' '
  and _MatPlant.lvorm = ' '
