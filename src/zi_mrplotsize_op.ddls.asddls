@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View MRP Lotsizing Procedure'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_MRPLotSize_OP
  as select from t439a
{

  key   disls as LotSize,
        hbvar as MaxStockLvlVar,
        intka as InterpretOfEvents,
        kfpaz as NumberOfPeriods,
        kfpkz as PeriodIndLgtrmPlg,
        kzhor as HorizonLotForLotOrdQty,
        kzspl as SplittingQuota,
        lastl as LastLotExact,
        lgint as InterpretOfDates,
        lgknd as LotSizeMakeToOrder,
        lglkz as LotSizeIndicator,
        lglvf as LotSizingProcedureForLongTerm,
        lgmax as CheckMaxLotSize,
        lgmin as CheckMinLotSize,
        lgpaz as NumberOfPeriodsLongTerm,
        lgspl as SplittingQuotaLongTerm,
        lgter as Scheduling,
        lguel as OverLapping,
        loskz as LotSizeIndicatorShortTerm,
        losvf as LotSizingProcedureShortTerm,
        peraz as NumberOfPeriodsShortTerm,
        terbv as SchedulingForPeriodLotSizes,
        uelap as OverlappingScheduling,
        untkz as UnderdeliveryTol
}
