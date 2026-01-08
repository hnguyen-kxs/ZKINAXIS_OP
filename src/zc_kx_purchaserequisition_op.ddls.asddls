@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View - Purchase Requisition'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #M,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_PurchaseRequisition_OP
  as select from ZI_KX_PurchaseRequisition_OP
{
  key PurchaseRequisitionNumber,
  key ItemNumberPurchaseRequisition,
      RequisitionRequestDate,
      MRPArea,
      PurReqDocumentType,
      QuantityOrderedAgainstPurReq,
      PurchaseOrderNumber,
      PurchaseOrderItemNumber,
      CreationIndicatorPRLines,
      PurchaseRequisitionIsFixed,
      FixedVendor,
      PurchaseRequisitionReleaseDate,
      ItemDeliveryDate,
      StorageLocation,
      DesiredVendor,
      MaterialNumber,
      PurchaseRequisitionUOM,
      PurchaseRequisitionQuantity,
      PriceUnit,
      PlannedDeliveryTimeInDays,
      PriceInPurchaseRequisition,
      ItemCategoryInPurchasingDoc,
      SupplyingPlantOfSTO,
      NumberOfReservation,
      BOMExplosionNumber,
      ProcessingStatusOfPurReq,
      CurrencyKey,
      GRProcessingTimeInDays,
      Plant
}
