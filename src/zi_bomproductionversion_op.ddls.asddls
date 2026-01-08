@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view - Production Version'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_BOMProductionVersion_OP
  as select from mkal               as _ProdVersion
    inner join   mara               as _Product     on _ProdVersion.matnr = _Product.matnr
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _ProdVersion.werks = _TvarvcPlant.Low
{
  key    cast(_ProdVersion.matnr as abap.char(40)) as MaterialNumber,
  key    _ProdVersion.werks                        as Plant,
  key    _ProdVersion.verid                        as ProductionVersion,
         _ProdVersion.adatu                        as ValidFromDateOfProdVersion,
         _ProdVersion.bdatu                        as ValidToDateOfProdVersion,
         _ProdVersion.mksp                         as ProductionVersionLock,
         _ProdVersion.sobsl                        as ProdVerSpecialProcurementType,
         _Product.meins                            as BaseUnitOfMeasure,
         cast(_ProdVersion.bstmi as abap.char(17)) as MinimumLotSizeQuantity,
         cast(_ProdVersion.bstma as abap.char(17)) as MaterialMaximumLotSizeQuantity,
         _ProdVersion.stlan                        as BOMUsage,
         _ProdVersion.stlal                        as AlternativeBOM

}
where
  _ProdVersion.bdatu >= $session.system_date
