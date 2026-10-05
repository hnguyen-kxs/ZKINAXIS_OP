@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Work center - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_WorkCenter_OP
  as select from ZI_KX_WorkCenter_OP
{
  key     WorkCenterInternalID,
  key     ObjectType,
  key     CapacityInternalID,
  key     Plant,
          IsStandardWorkCenter,
          WorkCenterName,
          Version,
          WorkCenterType,
          WorkCenterDescription,
          FactoryCalendar,
          CapacityFactoryCalendar,
          UnitOfMeasure,
          NumberOfCapacities,
          CapacityUtilizationRate,
          StartTimeInSeconds,
          EndTimeInSeconds,
          BreakDuration,
          ShiftGroup
}
