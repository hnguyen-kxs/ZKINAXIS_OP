@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Work center - Composite'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_WorkCenter_OP
  as select from ZI_WorkCenter_OP
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
