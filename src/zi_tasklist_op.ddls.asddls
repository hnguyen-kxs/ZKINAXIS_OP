@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Task List - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_TaskList_OP
  as select from plko               as _TaskList
    inner join   plas               as _TaskListSel on  _TaskList.plnty    = _TaskListSel.plnty
                                                    and _TaskList.plnnr    = _TaskListSel.plnnr
                                                    and _TaskList.plnal    = _TaskListSel.plnal
                                                    and _TaskListSel.loekz = ' '
    inner join   plpo               as _TaskListOp  on  _TaskListSel.plnty = _TaskListOp.plnty
                                                    and _TaskListSel.plnnr = _TaskListOp.plnnr
                                                    and _TaskListSel.plnkn = _TaskListOp.plnkn
                                                    and _TaskListSel.zaehl = _TaskListOp.zaehl
                                                    and _TaskListOp.loekz  = ' '
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _TaskListOp.werks = _TvarvcPlant.Low
{
  key _TaskList.plnty                          as TaskListType,
  key _TaskList.plnnr                          as TaskListGroup,
  key _TaskList.plnal                          as GroupCounter,
  key _TaskList.zaehl                          as Counter,
      _TaskListOp.plnkn                        as NumberOfTaskListNode,
      _TaskListSel.plnfl                       as Sequence,
      _TaskListSel.datuv                       as ValidFromDate,
      _TaskListSel.valid_to                    as ValidToDate,
      _TaskListSel.parkz                       as Inactive,
      _TaskList.verwe                          as TaskListUsage,
      _TaskList.statu                          as Status,
      _TaskList.plnme                          as TaskListUnit,
      cast(_TaskList.losvn as abap.char(17))   as LotSizeFrom,
      cast(_TaskList.losbs as abap.char(17))   as LotSizeTo,
      cast(_TaskListOp.vornr as abap.char(4))  as Activity,
      _TaskListOp.arbid                        as ObjectID,
      _TaskListOp.objty                        as ObjectType,
      _TaskListOp.werks                        as Plant,
      _TaskListOp.meinh                        as UoMForActivity,
      _TaskListOp.umren                        as Denominator,
      _TaskListOp.umrez                        as Numerator,
      cast(_TaskListOp.bmsch as abap.char(17)) as BaseQuantity,
      _TaskListOp.vge01                        as UoMOfStandardValue01,
      cast(_TaskListOp.vgw01 as abap.char(17)) as StandardValue01,
      _TaskListOp.vge02                        as UoMOfStandardValue02,
      cast(_TaskListOp.vgw02 as abap.char(17)) as StandardValue02,
      _TaskListOp.vge03                        as UoMOfStandardValue03,
      cast(_TaskListOp.vgw03 as abap.char(17)) as StandardValue03,
      _TaskListOp.vge04                        as UoMOfStandardValue04,
      cast(_TaskListOp.vgw04 as abap.char(17)) as StandardValue04,
      _TaskListOp.vge05                        as UoMOfStandardValue05,
      cast(_TaskListOp.vgw05 as abap.char(17)) as StandardValue05,
      _TaskListOp.vge06                        as UoMOfStandardValue06,
      cast(_TaskListOp.vgw06 as abap.char(17)) as StandardValue06
}
where
  _TaskList.verwe = '1'
