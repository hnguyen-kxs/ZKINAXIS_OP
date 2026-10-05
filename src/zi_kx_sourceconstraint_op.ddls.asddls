@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Source constraint - Composite'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define root view entity ZI_KX_SourceConstraint_OP
  as select from ZI_KX_ProductionVersion_OP as _ProdVer
    inner join   ZI_TaskList_OP             as _TaskList    on  _ProdVer.TaskListType        = _TaskList.TaskListType
                                                            and _ProdVer.KeyForTaskListGroup = _TaskList.TaskListGroup
                                                            and _ProdVer.GroupCounter        = _TaskList.GroupCounter
                                                            and _ProdVer.Plant               = _TaskList.Plant
    inner join   ZI_WorkCenterLoad_OP       as _Wc          on  _Wc.WorkCenterInternalID = _TaskList.ObjectID
                                                            and _Wc.Plant                = _ProdVer.Plant
    inner join   ZI_TVARVC_Plant_OP         as _TvarvcPlant on _ProdVer.Plant = _TvarvcPlant.Low
{
  key _ProdVer.MaterialNumber,
  key _ProdVer.Plant,
  key _ProdVer.ProductionVersion,
      _ProdVer.MaxLotSizeQty,
      _ProdVer.MinLotSizeQty,
      _ProdVer.EffectiveIndate,
      _ProdVer.EffectiveOutdate,
      _ProdVer.KeyForTaskListGroup,
      _ProdVer.BOMAlternate,
      _ProdVer.ProductionVersionLock,
      _ProdVer.ProdVersionProcurementType,
      _ProdVer.GroupCounter,
      _ProdVer.TaskListType,
      _ProdVer.SpecialProcurementType,
      _ProdVer.BOMUsage,
      _ProdVer.DistKeyForQtyProduced,
      _ProdVer.ProductionVersionCheckStatus,
      _ProdVer.TransferPlant,
      _ProdVer.ProcurementSubType,
      _TaskList.NumberOfTaskListNode,
      _TaskList.Sequence,
      _TaskList.ValidFromDate,
      _TaskList.ValidToDate,
      _TaskList.Inactive,
      _TaskList.TaskListUsage,
      _TaskList.Status,
      _TaskList.TaskListUnit,
      _TaskList.LotSizeFrom,
      _TaskList.LotSizeTo,
      _TaskList.Activity,
      _TaskList.ObjectType,
      _TaskList.UoMForActivity,
      _TaskList.Denominator,
      _TaskList.Numerator,
      _TaskList.BaseQuantity,
      _TaskList.UoMOfStandardValue01,
      _TaskList.StandardValue01,
      _TaskList.UoMOfStandardValue02,
      _TaskList.StandardValue02,
      _TaskList.UoMOfStandardValue03,
      _TaskList.StandardValue03,
      _TaskList.UoMOfStandardValue04,
      _TaskList.StandardValue04,
      _TaskList.UoMOfStandardValue05,
      _TaskList.StandardValue05,
      _TaskList.UoMOfStandardValue06,
      _TaskList.StandardValue06,
      _Wc.WorkCenterInternalID,
      _Wc.CapacityAllocationNumber,
      _Wc.StartDate,
      _Wc.EndDate,
      _Wc.WorkCenterName,
      _Wc.WorkCenterType,
      _Wc.StdValueKey,
      _Wc.CapacityID,
      _Wc.CapacityStartDate,
      _Wc.CapacityEndDate,
      _Wc.SetupFormula,
      _Wc.ProcessingFormula,
      _Wc.TeardownFormula,
      _Wc.OtherFormula
}
where
  _ProdVer.EffectiveOutdate >= $session.system_date
