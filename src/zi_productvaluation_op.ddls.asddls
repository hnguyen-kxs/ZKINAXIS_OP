@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Valuation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #C,
    sizeCategory: #XL,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_ProductValuation_OP
  as select from Mbv_Mbew           as _ProdVal
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _ProdVal.bwkey = _TvarvcPlant.Low
{
  key _ProdVal.bwkey                            as ValuationArea,
  key _ProdVal.bwtar                            as ValuationType,
  key cast(_ProdVal.matnr as abap.char(40))     as MaterialNumber,
      _ProdVal.bklas                            as ValuationClass,
      _ProdVal.peinh                            as PriceUnitQty,
      _ProdVal.laepr                            as PriceChangeDate,
      cast(_ProdVal.stprs  as abap.char( 17 ) ) as StandardPrice,
      cast(_ProdVal.verpr as abap.char( 17 ) )  as MovingAveragePrice,
      _ProdVal.vprsv                            as InventoryValuationProcedure
}
where
       _ProdVal.lvorm = ''
  and  _ProdVal.bwtar = ''

  and(
       _ProdVal.verpr is not initial
    or _ProdVal.stprs is not initial
  )
