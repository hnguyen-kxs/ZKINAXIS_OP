@EndUserText.label: 'Table Function for Routing Calculations'
@ClientHandling.type: #CLIENT_DEPENDENT

define table function ZIB_MFG_TIMECALC
with parameters @Environment.systemField: #SYSTEM_CLIENT
   p_mandt : abap.clnt
returns {
  client             : abap.clnt;
 routing_type       : plnty;
 routing_group      : plnnr;
 routing_counter    : plnal;
 internal_counter   : plnkn;
 operation_id       : vornr;
 work_center        : arbpl;
 calculated_setup   : abap.fltp;
 calculated_machine : abap.fltp;
  
}
implemented by method zcl_mfg_time_amdp=>calculate_routing_times;
