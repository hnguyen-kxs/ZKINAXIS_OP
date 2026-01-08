@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Delivery'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #C,
    sizeCategory: #XL,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_Delivery_OP
  as select from    lips                      as _DeliveryItems
    left outer join likp                      as _DeliveryHeader on _DeliveryItems.vbeln = _DeliveryHeader.vbeln
    inner join      ZI_TVARVC_Plant_OP        as _TvarvcPlant    on _DeliveryItems.werks = _TvarvcPlant.Low
    inner join      ZI_TVARVC_DeliveryType_OP as _DeliveryType   on _DeliveryHeader.lfart = _DeliveryType.Low
{
  key _DeliveryItems.vbeln                         as Delivery,
  key _DeliveryItems.posnr                         as DeliveryItem,
      _DeliveryHeader.kunnr                        as ShipToParty,
      _DeliveryHeader.lfart                        as DeliveryType,
      _DeliveryHeader.wadat_ist                    as ActGdsMvmntDate,
      _DeliveryItems.berid                         as MRPArea,
      _DeliveryItems.grkor                         as DeliveryGroup,
      cast(_DeliveryItems.lfimg  as abap.char(19)) as ActualQuantityDelivered,
      _DeliveryItems.lgort                         as StorageLocation,
      cast(_DeliveryItems.matnr as abap.char(40))  as Material,
      _DeliveryItems.mbdat                         as MaterialAvailDate,
      _DeliveryItems.meins                         as BaseUnitOfMeasure,
      cast(_DeliveryItems.netpr  as abap.char(19)) as NetPrice,
      _DeliveryItems.umvkn                         as Denominator,
      _DeliveryItems.umvkz                         as Numerator,
      _DeliveryItems.vgbel                         as ReferenceDocument,
      _DeliveryItems.vgpos                         as ReferenceItem,
      _DeliveryItems.vrkme                         as SalesUnit,
      _DeliveryItems.werks                         as Plant
}
where
      _DeliveryItems.lfimg  >  0
  and _DeliveryHeader.gbstk != 'C'
