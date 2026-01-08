@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SD Item Requirments'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_SDItemRequirements_OP
  as select from ZI_KX_SDItemReqts_OP
{
  key SalesDocument,
  key SalesDocumentItem,
  key ScheduleLineNumber,
      RequirementsType,
      MRPArea,
      DeliveryGroup,
      CumulConfirmedQty,
      UnitofMeasure,
      PricingUnit,
      OrderQuantity,
      PartDlv,
      StorageLocation,
      DeliveryPriority,
      BaseUnitofMeasure,
      NetPrice,
      NetValue,
      PurchaseOrderItem,
      ItemCategory,
      Route,
      Denominator,
      Numerator,
      ConversionFactor,
      ShippingPoint,
      TargetquantityUoM,
      Targetquantity,
      ConfirmedQuantity,
      ScheduleLineDate,
      SchedLineCategory,
      ItmRelevForDeliv,
      DeliveryBlock,
      CommittedQty,
      SalesUnit,
      GoodsIssueDate,
      OrderQuantityInSalesUnits,
      SalesDocumentType,
      DocumentType,
      RequirementType,
      Batch,
      SoldToParty,
      Name,
      SpecStkValuation,
      Material,
      MaterialAvailDate,
      NoMRP,
      OpenQuantity,
      Plant
}
