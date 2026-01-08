@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SD Line Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_SDLineItems_OP
  as select from vbap                         as _SalesItem
    inner join   vbak                         as _SalesHeader  on _SalesItem.vbeln = _SalesHeader.vbeln
    inner join   ZI_TVARVC_Plant_OP           as _TvarvcPlant  on _SalesItem.werks = _TvarvcPlant.Low
    inner join   ZI_TVARVC_SalesIdx_OrdTyp_OP as _TvarvcOrdTyp on _SalesHeader.auart = _TvarvcOrdTyp.Low
{
  key  _SalesItem.vbeln                                 as SalesDocument,
  key  _SalesItem.posnr                                 as SalesDocumentItem,
       _SalesItem.bedae                                 as RequirementsType,
       _SalesItem.berid                                 as MRPArea,
       _SalesItem.grkor                                 as DeliveryGroup,
       cast(_SalesItem.kbmeng  as abap.char( 19 ) )     as CumulConfirmedQty,
       _SalesItem.kmein                                 as UnitofMeasure,
       _SalesItem.kpein                                 as PricingUnit,
       cast(_SalesItem.kwmeng as abap.char( 19 ) )      as OrderQuantity,
       _SalesItem.kztlf                                 as PartDlv,
       _SalesItem.lfrel                                 as ItmRelevForDeliv,
       _SalesItem.lgort                                 as StorageLocation,
       _SalesItem.lprio                                 as DeliveryPriority,
       cast(_SalesItem.matnr as abap.char(40))                                as Material,
       _SalesItem.meins                                 as BaseUnitofMeasure,
       cast(_SalesItem.netpr    as abap.char( 19 ) )    as NetPrice,
       cast( _SalesItem.netwr as abap.char( 19 ) )      as NetValue,
       _SalesItem.posex                                 as PurchaseOrderItem,
       _SalesItem.pstyv                                 as ItemCategory,
       cast(_SalesItem.ps_psp_pnr   as abap.char( 24) ) as WBSElement,
       _SalesItem.route                                 as Route,
       _SalesItem.sernr                                 as BOMExplosionNumber,
       _SalesItem.stdat                                 as BOMKeyDate,
       _SalesItem.uepos                                 as HigherLevelItem,
       _SalesItem.umvkn                                 as Denominator,
       _SalesItem.umvkz                                 as Numerator,
       _SalesItem.umziz                                 as ConversionFactor,
       _SalesItem.vrkme                                 as SalesUnit,
       _SalesItem.vstel                                 as ShippingPoint,
       _SalesItem.waerk                                 as DocumentCurrency,
       _SalesItem.werks                                 as Plant,
       _SalesItem.zieme                                 as TargetquantityUoM,
       cast(_SalesItem.zmeng as abap.char( 19 ) )       as Targetquantity,
       _SalesHeader.auart
}
where
       _SalesItem.abgru   =  ''
  and(
       _SalesItem.kbmeng  != 0
    or _SalesItem.lfrel   =  'X'
  )
  and  _SalesHeader.gbstk != 'C'
  and(
       _SalesHeader.vbtyp =  'C'
    or _SalesHeader.vbtyp =  'E'
    or _SalesHeader.vbtyp =  'I'
  )
