@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Historical Supply Buy - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_HistoricalSupplyBuy_OP
  with parameters
    p_days : int2
  as select from ekbe                   as _History
    inner join   ekko                   as _Header          on _History.ebeln = _Header.ebeln
    inner join   ekpo                   as _Item            on  _History.ebeln = _Item.ebeln
                                                            and _History.ebelp = _Item.ebelp
    inner join   mara                   as _Part            on _Item.matnr = _Part.matnr
    inner join   ZI_TVARVC_PurDocTyp_OP as _TvarvcPurDocTyp on _Header.bsart = _TvarvcPurDocTyp.Low
    inner join   ZI_TVARVC_Plant_OP     as _TvarvcPlant     on _History.werks = _TvarvcPlant.Low
{
  key _History.ebeln                         as PurchasingDocumentNumber,
  key _History.ebelp                         as ItemNumberOfPurchasingDocument,
  key _History.zekkn                         as SeqNumberOfAccountAssign,
  key _History.vgabe                         as TransactionType,
  key _History.gjahr                         as MaterialDocumentYear,
  key _History.belnr                         as NumberOfMaterialDocument,
  key _History.buzei                         as ItemInMaterialDocument,
      cast(_History.menge as abap.char(17) ) as Quantity,
      _History.waers                         as CurrencyKey,
      _History.shkzg                         as DebitCreditIndicator,
      _History.budat                         as PostingDate,
      cast(_History.matnr as abap.char(40))  as MaterialNumber,
      _History.werks                         as Plant,
      _Header.bedat                          as PurchasingDocumentDate,
      _Header.bsart                          as PurchasingDocumentType,
      _Header.lifnr                          as SupplierAccountNumber,
      _Header.reswk                          as SupplyingPlantStckTransOrd,
      _Item.meins                            as PurchaseOrderUnitOfMeasure,
      _Item.bprme                            as OrderPriceUnit,
      _Item.bpumn                            as DenominatorForPriceConversion,
      _Item.bpumz                            as NumeratorForPriceConversion,
      _Item.umrez                            as NumeratorForUnitConversion,
      _Item.umren                            as DenominatorForUnitConversion,
      cast(_Item.netpr as abap.char(17) )    as NetPrice,
      _Item.peinh                            as PriceUnit,
      _Part.meins                            as BaseUnitOfMeasure
}
where
      _History.matnr <> ''
  and _History.vgabe =  '1'
  and _History.budat >= (dats_add_days( $session.system_date, -$parameters.p_days, 'FAIL' ) )
