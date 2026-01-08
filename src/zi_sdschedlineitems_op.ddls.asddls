@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Sales Order Schedule Line Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_SDSchedLineItems_OP
  as select from vbep                         as _SchLine
    inner join   v_vapma                      as _SalesIndex   on  _SchLine.vbeln    = _SalesIndex.vbeln
                                                               and _SalesIndex.posnr = _SchLine.posnr
    inner join   ZI_TVARVC_Plant_OP           as _TvarvcPlant  on _SalesIndex.werks = _TvarvcPlant.Low
    inner join   ZI_TVARVC_SalesIdx_OrdTyp_OP as _TvarvcOrdTyp on _SalesIndex.auart = _TvarvcOrdTyp.Low
{
  key  _SchLine.vbeln                                as SalesDocument,
  key  _SchLine.posnr                                as SalesDocumentItem,
  key  _SchLine.etenr                                as ScheduleLineNumber,
       cast(_SchLine.bmeng    as abap.char( 19 ) )   as ConfirmedQuantity,
       cast(_SchLine.edatu  as abap.char( 19 ) )     as ScheduleLineDate,
       _SchLine.ettyp                                as SchedLineCategory,
       _SchLine.lddat                                as LoadingDate,
       _SchLine.lfrel                                as ItmRelevForDeliv,
       _SchLine.lifsp                                as DeliveryBlock,
       _SchLine.mbdat                                as MaterialAvailDate,
       cast(_SchLine.roms1 as abap.char( 19 ) )      as CommittedQty,
       _SchLine.vrkme                                as SalesUnit,
       _SchLine.wadat                                as GoodsIssueDate,
       cast( _SchLine.wmeng     as abap.char( 19 ) ) as OrderQuantityInSalesUnits,
       _SalesIndex.auart
}
