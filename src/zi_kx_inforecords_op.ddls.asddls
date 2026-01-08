@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite View Info Records'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE

define view entity ZI_KX_InfoRecords_OP
  as select from    ZI_PurchaseInfoRecords_OP as _PurchInfoRecords
    inner join      ZI_ProductPlant_OP        as _ProductPlant on  _PurchInfoRecords.Plant          = _ProductPlant.Plant
                                                               and _PurchInfoRecords.MaterialNumber = _ProductPlant.MaterialNumber
    left outer join ZI_Supplier_OP            as _Supplier     on _PurchInfoRecords.SuppliersAccountNumber = _Supplier.AccountNumberofSupplier

{
  key _PurchInfoRecords.PurchasingOrganization,
  key _PurchInfoRecords.PurchasingInfoRecordCategory,
  key _PurchInfoRecords.NumberOfPurchasingInfoRecord,
  key _PurchInfoRecords.Plant,
      _PurchInfoRecords.PlannedDeliveryTimeInDays,
      _PurchInfoRecords.RelevantforAutomaticSourcing,
      _PurchInfoRecords.OrderPriceUnitPurchasing,
      _PurchInfoRecords.DenominatorForPriceConversion,
      _PurchInfoRecords.NumeratorForPriceConversion,
      _PurchInfoRecords.ShippingInstructions,
      _PurchInfoRecords.PurchInfoPurchasingOrgFlagDel,
      _PurchInfoRecords.NetPriceInPurchInfoRecord,
      _PurchInfoRecords.MinimumPurchaseOrderQty,
      _PurchInfoRecords.MaximumPurchaseOrderQty,
      _PurchInfoRecords.PriceUnit,
      _PurchInfoRecords.PriceValidUntil,
      _PurchInfoRecords.CurrencyKey,
      _PurchInfoRecords.MaterialNumberUsedBySupplier,
      _PurchInfoRecords.SuppliersAccountNumber,
      _PurchInfoRecords.PurchasingInfoFlagForDeletion,
      _PurchInfoRecords.MaterialNumber,
      _PurchInfoRecords.PurchaseOrderUnitofMeasure,
      _ProductPlant.FactoryCalendar,
      _ProductPlant.AssemblyScrapPercent,
      _ProductPlant.ProcurementType,
      _ProductPlant.FixedLotSizeQuantity,
      _ProductPlant.MaximumLotSizeQuantity,
      _ProductPlant.MinimumLotSizeQuantity,
      _ProductPlant.LotSizeRoundingQuantity,
      _ProductPlant.LotSizingProcedure,
      _ProductPlant.InHouseProductionTime,
      _ProductPlant.PlannedDeliveryDurationInDay,
      _ProductPlant.ProcurementSubType,
      _ProductPlant.HasProductionVersion,
      _ProductPlant.GoodsReceiptDuration,
      _ProductPlant.StandardPrice,
      _ProductPlant.SpecialProcurementIndicator,
      _ProductPlant.TransferPlant,
      _ProductPlant.PlanningTimeFence,
      _ProductPlant.BaseUnit,
      _Supplier.Name
}
