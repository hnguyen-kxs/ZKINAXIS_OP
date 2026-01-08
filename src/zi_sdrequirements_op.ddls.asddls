@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for SD Requirments'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_SDRequirements_OP
  as select from    vbbe               as _SalesRequirements
    left outer join tauum              as _SalesDocTypName on  _SalesRequirements.auart = _SalesDocTypName.auart
                                                           and _SalesDocTypName.spras   = 'E'
    inner join      ZI_TVARVC_Plant_OP as _TvarvcPlant     on _SalesRequirements.werks = _TvarvcPlant.Low
{
  key   _SalesRequirements.vbeln                          as SalesDocument,
  key   _SalesRequirements.posnr                          as SalesDocumentItem,
  key   _SalesRequirements.etenr                          as ScheduleLineNumber,
        _SalesRequirements.auart                          as SalesDocumentType,
        _SalesDocTypName.spras                            as LanguageKey,
        _SalesDocTypName.auart_spr                        as Languagekey1,
        case
            when _SalesDocTypName.auart_spr = '' then   _SalesRequirements.auart
            when  _SalesDocTypName.auart_spr is null  then  _SalesRequirements.auart
            else _SalesDocTypName.auart_spr
        end                                               as DocumentType,
        _SalesRequirements.bdart                          as RequirementType,
        _SalesRequirements.berid                          as MRPArea,
        _SalesRequirements.charg                          as Batch,
        _SalesRequirements.knttp                          as AcctAssignmentCat,
        _SalesRequirements.kunnr                          as SoldToParty,
        _SalesRequirements.kzbws                          as SpecStkValuation,
        _SalesRequirements.lgort                          as StorageLocation,
        cast(_SalesRequirements.matnr as abap.char(40))   as Material,
        _SalesRequirements.mbdat                          as MaterialAvailDate,
        _SalesRequirements.meins                          as BaseUnitOfMeasure,
        _SalesRequirements.nodis                          as NoMRP,
        cast(_SalesRequirements.omeng as abap.char(19))   as OpenQuantity,
        _SalesRequirements.plnkz                          as PlanningIndicator,
        cast(_SalesRequirements.pspel   as abap.char(19)) as WBSElement,
        _SalesRequirements.sobkz                          as SpecialStock,
        _SalesRequirements.umref                          as Cnversion,
        _SalesRequirements.vbtyp                          as SDDocumentCateg,
        _SalesRequirements.werks                          as Plant
}
