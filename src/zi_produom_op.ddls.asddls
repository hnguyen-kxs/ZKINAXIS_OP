@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Product UoM'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_ProdUOM_OP
  as select from marm
{

  key  cast(matnr as abap.char(40))   as MaterialNumber,
  key  meinh                          as AlternativeUnitOfMeasure,
       cast(brgew as abap.char( 17 )) as GrossWeight,
       ean11                          as IntArticleNum,
       gewei                          as WeightUnit,
       umrez                          as NumeratorForUnitConversion,
       umren                          as DenominatorForUnitConversion

}
