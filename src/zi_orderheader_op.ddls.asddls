@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Order Header'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MASTER
}
@VDM.viewType: #BASIC

define view entity ZI_OrderHeader_OP
  as select from afko                   as _OrdHeader
    inner join   aufk                   as _OrdMaster       on _OrdHeader.aufnr = _OrdMaster.aufnr
    inner join   ZI_TVARVC_Plant_OP     as _TvarvcPlant     on _OrdMaster.werks = _TvarvcPlant.Low
    inner join   ZI_TVARVC_OrderType_OP as _TvarvcOrderType on _OrdMaster.auart = _TvarvcOrderType.Low

{
  key _OrdMaster.aufnr                            as OrderNumber,
      _OrdMaster.auart                            as OrderType,
      _OrdMaster.autyp                            as OrderCategory,
      cast(_OrdHeader.gamng  as abap.char( 17 ) ) as TargetOrderQuantity,
      _OrdHeader.gltri                            as ActualFinishDate,
      _OrdHeader.gltrp                            as BasicFinishDate,
      _OrdHeader.gltrs                            as ScheduledFinish,
      _OrdHeader.gmein                            as BaseUnitOfMeasure,
      _OrdHeader.gstri                            as ActualStartDate,
      _OrdHeader.gstrp                            as BasicStartDate,
      _OrdHeader.gstrs                            as ScheduledStart,
      cast(_OrdHeader.igmng as abap.char( 17 ) )  as ConfirmedQuantityOrdConfirm,
      _OrdMaster.kdauf                            as SalesOrderNumber,
      _OrdMaster.kdpos                            as ItemNumberInSalesOrder,
      _OrdMaster.objnr                            as ObjectNumber,
      _OrdHeader.plnal                            as GroupCounter,
      _OrdHeader.plnbez                           as AssyMaterialNumber,
      _OrdHeader.plnnr                            as KeyForTaskListGroup,
      _OrdHeader.plnty                            as TaskListType,
      _OrdHeader.rsnum                            as NumberOfReservation,
      _OrdHeader.stlbez                           as Material,
      _OrdMaster.waers                            as Currency,
      _OrdMaster.werks                            as Plant

}
where
       _OrdMaster.loekz  =  ''
  and(
       _OrdMaster.autyp  =  '10'
    or _OrdMaster.autyp  =  '40'
  )
  and  _OrdHeader.gltrp  != '00000000'
  and  _OrdHeader.gamng  >  0
  and  _OrdHeader.plnbez != ''
