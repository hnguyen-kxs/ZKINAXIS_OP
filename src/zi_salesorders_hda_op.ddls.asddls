@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Orders HDA - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_SalesOrders_HDA_OP
  as select from vbap                         as _SalesItem
    inner join   vbep                         as _SalesLine    on  _SalesItem.vbeln = _SalesLine.vbeln
                                                               and _SalesItem.posnr = _SalesLine.posnr
    inner join   vbak                         as _SalesHeader  on _SalesItem.vbeln = _SalesHeader.vbeln

    inner join   ZI_TVARVC_Plant_OP           as _TvarvcPlant  on _SalesItem.werks = _TvarvcPlant.Low

    inner join   ZI_TVARVC_SalesIdx_OrdTyp_OP as _TvarvcOrdTyp on _SalesHeader.auart = _TvarvcOrdTyp.Low
{
  key  _SalesItem.vbeln                                 as SalesDocument,
  key  _SalesItem.posnr                                 as SalesDocumentItem,
  key  _SalesLine.etenr                                 as DeliveryScheduleLine,
       _SalesItem.bedae                                 as RequirementsType,
       _SalesItem.berid                                 as MRPAreaSales,
       _SalesItem.grkor                                 as DeliveryGroupSales,
       cast(_SalesItem.kbmeng  as abap.char( 19 ) )     as CumulConfirmedQty,
       _SalesItem.kmein                                 as UnitOfMeasure,
       _SalesItem.kpein                                 as PricingUnit,
       cast(_SalesItem.kwmeng as abap.char( 19 ) )      as OrderQuantity,
       _SalesItem.kztlf                                 as PartDlv,
       _SalesItem.lfrel                                 as ItmRelevForDeliv,
       _SalesItem.lgort                                 as StorageLocationSales,
       _SalesItem.lprio                                 as DeliveryPriority,
       cast(_SalesItem.matnr as abap.char(40))          as MaterialSales,
       _SalesItem.meins                                 as BaseUnitOfMeasureSales,
       cast(_SalesItem.netpr    as abap.char( 19 ) )    as NetPriceSales,
       cast( _SalesItem.netwr as abap.char( 19 ) )      as NetValue,
       _SalesItem.posex                                 as PurchaseOrderItem,
       _SalesItem.pstyv                                 as ItemCategory,
       cast(_SalesItem.ps_psp_pnr   as abap.char( 24) ) as WBSElement,
       _SalesItem.route                                 as Route,
       _SalesItem.sernr                                 as BOMExplosionNumber,
       _SalesItem.stdat                                 as BOMKeyDate,
       _SalesItem.uepos                                 as HigherLevelItem,
       _SalesItem.umvkn                                 as DenominatorSales,
       _SalesItem.umvkz                                 as NumeratorSales,
       _SalesItem.umziz                                 as ConversionFactor,
       _SalesItem.vrkme                                 as SalesUnitSales,
       _SalesItem.vstel                                 as ShippingPoint,
       _SalesItem.waerk                                 as DocumentCurrency,
       _SalesItem.werks                                 as PlantSales,
       _SalesItem.zieme                                 as TargetQuantityUoM,
       _SalesItem.kdgrp_ana                             as CustomerGroup,
       cast(_SalesItem.zmeng as abap.char( 19 ) )       as TargetQuantity,
       cast(_SalesLine.bmeng as abap.char( 19 ) )       as ConfirmedQty,
       _SalesLine.edatu                                 as ScheduleLineDate,
       _SalesLine.mbdat                                 as MaterialAvailDateSales,
       _SalesItem.erdat                                 as CreatedOnItem,
       _SalesHeader.erdat                               as CreatedOnHeader,
       _SalesHeader.kunnr                               as SoldToParty,
       _SalesHeader.auart                               as SalesDocumentType
}
