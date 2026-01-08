@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View MRP Group'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MASTER
}
@VDM.viewType: #BASIC

define view entity ZI_MRPGrp_OP
  as select from MDCV_E_T438M       as _MRPGrp
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _MRPGrp.werks = _TvarvcPlant.Low
{
  key        _MRPGrp.mtart  as MRPGroup,
  key        _MRPGrp.werks  as Plant,
             _MRPGrp.andis  as MaxMRPInterval,
             _MRPGrp.auar2  as OrdTypeProcOrd,
             _MRPGrp.auart  as OrderType,
             _MRPGrp.baner  as CreatePurchaseReq,
             _MRPGrp.bartl  as DocTypeSubcontr,
             _MRPGrp.bartu  as StockTransDocType,
             _MRPGrp.besal  as ExplosionDate,
             _MRPGrp.bsart  as DocTypePurchaseOrd,
             _MRPGrp.diser  as CreateMRPList,
             _MRPGrp.exsgt  as ExclBulkMaterial,
             _MRPGrp.fixhz  as PlanningTimeFence,
             _MRPGrp.fkobs  as ActivateFullConfirmationLogic,
             _MRPGrp.grrel  as GroupRequirements,
             _MRPGrp.gterm  as SchedulingInfoRecordAgreem,
             _MRPGrp.kzdrb  as DirectProcurementProduction,
             _MRPGrp.lifkz  as ScheduleLines,
             _MRPGrp.mdach  as ActionControl,
             _MRPGrp.plahz  as PlanningHorizon,
             _MRPGrp.plsel  as IssueStorLocSel,
             _MRPGrp.prasta as PeriodSplit,
             _MRPGrp.prreg  as CheckingRule,
             _MRPGrp.reshz  as RollForwardPeriod,
             _MRPGrp.resvp  as AdjustPerForIndReqs,
             _MRPGrp.rvpkz  as AdjPlndIndReqmts,
             _MRPGrp.sbdis  as AvailSafetyStock,
             _MRPGrp.shflg  as SafetyTimeInd,
             _MRPGrp.shzet  as SafetyTimeActCov,
             _MRPGrp.strgr  as MRPGroupPlanningStrategyGroup,
             _MRPGrp.umthz  as ReschedulingHorizon,
             _MRPGrp.vertr  as OrdStartInPast,
             _MRPGrp.vint1  as BwdConsumptionPerMRPGroup,
             _MRPGrp.vint2  as FwdConsumptionPerMRPGroup,
             _MRPGrp.vrmod  as ConsumptionMode,
             _MRPGrp.vwver  as ToleranceValueForDisplacemt,
             _MRPGrp.vwvor  as ToleranceValueForward,
             _MRPGrp.xfat1  as FirmTransmSLines
}
