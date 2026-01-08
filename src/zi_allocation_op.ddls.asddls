@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View of Allocation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_Allocation_OP
  as select from resb               as _Allocation
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _Allocation.werks = _TvarvcPlant.Low
{

  key    _Allocation.rsnum                         as NumberOfReservation,
  key    _Allocation.rspos                         as ItemNumberOfReservation,
  key    _Allocation.rsart                         as RecordType,
         _Allocation.aufnr                         as OrderNumber,
         cast(_Allocation.baugr as abap.char(40))  as HigherLevelAssemblyMaterial,
         _Allocation.bdart                         as RequirementType,
         cast (_Allocation.bdmng as abap.char(17)) as RequirementQuantity,
         _Allocation.bdter                         as RequirementsDate,
         _Allocation.bwart                         as MovementType,
         _Allocation.ebele                         as DeliveryScheduleLineCounter,
         _Allocation.ebeln                         as PurchasingDocumentNumber,
         _Allocation.ebelp                         as ItemNumberOfPurchasingDocument,
         cast(_Allocation.enmng as abap.char(17))  as QuantityWithdrawn,
         _Allocation.lgort                         as StorageLocation,
         _Allocation.lifnr                         as AccountNumberOfSupplier,
         cast(_Allocation.matnr as abap.char(40))  as ReservationMaterial,
         cast(_Allocation.posnr as abap.char(4))   as BOMItemNumber,
         _Allocation.shkzg                         as DebitCreditIndicator,
         _Allocation.umlgo                         as ReceivingStorageLocation,
         _Allocation.umwrk                         as ReceivingPlant,
         cast(_Allocation.vornr as abap.char(4))   as ActivityNumber,
         _Allocation.waers                         as Currency,
         _Allocation.werks                         as ReservationPlant
}

where
       _Allocation.matnr <> ''

  and(
       _Allocation.bdart =  'AR'
    or _Allocation.bdart =  'SB'
    or _Allocation.bdart =  'BB'
    or _Allocation.bdart =  'MR'
  )
  and  _Allocation.xloek =  ''
  and  _Allocation.kzear =  ''
  and  _Allocation.bdmng >  0
  and  _Allocation.postp != 'T'
  and  _Allocation.schgt =  ''
  and  _Allocation.dumps =  ''
