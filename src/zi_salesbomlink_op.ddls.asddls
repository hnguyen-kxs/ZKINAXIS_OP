@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View - Sales BOM Link'
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_SalesBOMLink_OP
  as select from kdst               as _SalesBomLink
    inner join   vbak               as _SalesHeader on  _SalesBomLink.vbeln =  _SalesHeader.vbeln
                                                    and _SalesHeader.gbstk  != 'C'
    inner join   vbap               as _SalesItem   on  _SalesBomLink.vbeln =  _SalesItem.vbeln
                                                    and _SalesBomLink.vbpos =  _SalesItem.posnr
                                                    and _SalesItem.wbsta    != 'C'
                                                    and _SalesItem.gbsta    != 'C'
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant on _SalesBomLink.werks = _TvarvcPlant.Low
{
  key _SalesBomLink.vbeln                        as SalesOrder,
  key _SalesBomLink.vbpos                        as SalesOrderItem,
  key cast(_SalesBomLink.matnr as abap.char(40)) as MaterialNumber,
  key _SalesBomLink.werks                        as Plant,
  key _SalesBomLink.stlan                        as BOMUsage,
  key _SalesBomLink.stlnr                        as BillOfMaterial,
  key cast(_SalesBomLink.stlal as abap.char(2))  as AlternativeBOM
}
