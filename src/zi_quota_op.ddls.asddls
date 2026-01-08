@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Quota Header-Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #L,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC

define view entity ZI_Quota_OP
  as select from equk               as _QuotaFileHeader
    inner join   equp               as _QuotaFileItem on _QuotaFileHeader.qunum = _QuotaFileItem.qunum
    inner join   ZI_TVARVC_Plant_OP as _TvarvcPlant   on _QuotaFileHeader.werks = _TvarvcPlant.Low

{
  key       cast(_QuotaFileHeader.matnr as abap.char(40)) as MaterialNumber,
  key       _QuotaFileHeader.werks                        as Plant,
  key       _QuotaFileItem.qunum                          as NumberOfQuotaArrangement,
  key       _QuotaFileItem.qupos                          as QuotaArrangementItem,
  key       _QuotaFileHeader.bdatu                        as QuotaArrangePeriodValidUntil,
            _QuotaFileHeader.vdatu                        as QuotaArrangePeriodValidFrom,
            _QuotaFileItem.abanz                          as NoOfPeriodsToReleaseQtyRelates,
            _QuotaFileItem.abper                          as PeriodToReleaseQtyRelates,
            cast(_QuotaFileItem.abrmg as abap.char(17))   as MaximumReleaseQtyPerPeriod,
            _QuotaFileItem.beskz                          as QuotaProcurementType,
            _QuotaFileItem.bewrk                          as PlantFromWhichMatIsProcured,
            cast(_QuotaFileItem.ematn as abap.char(40))   as MatNoCorrespondingToMPN,
            _QuotaFileItem.kzein                          as IndicatorOnceOnly,
            _QuotaFileItem.lifnr                          as SupplierAccountNumber,
            cast(_QuotaFileItem.maxls  as abap.char(17))  as MaximumLotSizePerQuotaItem,
            cast( _QuotaFileItem.maxmg as abap.char(17))  as MaxQtyOfQuotaArrangementItem,
            cast(_QuotaFileItem.minls  as abap.char(17))  as MinimumLotSizePerQuotaItem,
            _QuotaFileItem.plifz                          as PlannedDeliveryTimeInDays,
            _QuotaFileItem.preih                          as PriorityForDeterminationOfSeq,
            cast( _QuotaFileItem.qubmg  as abap.char(17)) as QuotaBaseQtyOfQuotaArrangeItm,
            cast(_QuotaFileItem.qumng as abap.char(17))   as AllocatedQtyQuotaArrangeItm,
            _QuotaFileItem.quote                          as Quota,
            _QuotaFileItem.rdprf                          as RoundingProfile,
            _QuotaFileItem.sobes                          as SpecialProcurementType,
            _QuotaFileItem.verid                          as ProductionVersion
}
where
  _QuotaFileHeader.bdatu >= $session.system_date
