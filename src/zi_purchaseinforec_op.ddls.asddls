@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Info Record'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_PurchaseInfoRec_OP
  as select from eine               as _PurchInfoRecPurchOrg
    inner join   eina               as _PurchInfoRecords on _PurchInfoRecords.infnr = _PurchInfoRecPurchOrg.infnr
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant      on _PurchInfoRecPurchOrg.werks = _TvarvcPlant.Low
{
  key  _PurchInfoRecPurchOrg.ekorg                        as PurchasingOrganization,
  key  _PurchInfoRecPurchOrg.infnr                        as NumberOfPurchasingInfoRecord,
  key  _PurchInfoRecPurchOrg.esokz                        as PurchasingInfoRecordCategory,
  key  _PurchInfoRecPurchOrg.werks                        as PurchInfoRecPlant,
       _PurchInfoRecords.idnlf                            as MaterialNumberUsedBySupplier,
       _PurchInfoRecords.lifnr                            as PurchInfoRecSuppliersAccount,
       _PurchInfoRecords.loekz                            as PurchasingInfoFlagForDeletion,
       cast(_PurchInfoRecords.matnr as abap.char(40))     as MaterialNumber,
       _PurchInfoRecords.meins                            as PurchaseOrderUnitofMeasure,
       _PurchInfoRecPurchOrg.aplfz                        as PurchInfoRecPlanDelTimeInDays,
       _PurchInfoRecPurchOrg.aut_source                   as RelevantforAutomaticSourcing,
       _PurchInfoRecPurchOrg.bprme                        as OrderPriceUnitPurchasing,
       _PurchInfoRecPurchOrg.bpumn                        as DenominatorForPriceConversion,
       _PurchInfoRecPurchOrg.bpumz                        as NumeratorForPriceConversion,
       _PurchInfoRecPurchOrg.evers                        as ShippingInstructions,
       _PurchInfoRecPurchOrg.loekz                        as PurchInfoPurchasingOrgFlagDel,
       cast(_PurchInfoRecPurchOrg.minbm as abap.char(17)) as MinimumPurchaseOrderQty,
       cast(_PurchInfoRecPurchOrg.netpr as abap.char(17)) as NetPriceInPurchInfoRecord,
       cast(_PurchInfoRecPurchOrg.bstma as abap.char(17)) as MaximumPurchaseOrderQty,
       _PurchInfoRecPurchOrg.peinh                        as PriceUnit,
       _PurchInfoRecPurchOrg.prdat                        as PriceValidUntil,
       _PurchInfoRecPurchOrg.waers                        as CurrencyKey
}
where
      _PurchInfoRecords.matnr     is not initial
  and _PurchInfoRecords.loekz     is initial
  and _PurchInfoRecPurchOrg.loekz is initial
  and _PurchInfoRecPurchOrg.prdat >= $session.system_date
