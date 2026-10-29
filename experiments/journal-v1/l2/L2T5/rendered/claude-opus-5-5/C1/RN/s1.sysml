package L2Model {
    item def AbnormalStartsFailuresOrValvePositionsItem { doc /* @S181 */ }
    item def AnalyticalStatusItem { doc /* @S195 */ }
    item def DemandChangesItem { doc /* @S022 */ }
    item def DischargePressureTotalFlowAndPumpStatusItem { doc /* @S176 */ }
    item def FilterServiceStatusIndicationItem { doc /* @S186 */ }
    item def FinishedWaterItem { doc /* @S003 */ }
    item def LocalEquipmentStatusHeadlossIndicationTurbidityMonitoringAndBackwashControlItem { doc /* @S010 */ }
    item def NotificationItem { doc /* @S192 */ }
    item def ResultsItem { doc /* @S162 */ }
    item def SampleChainSlipItem { doc /* @S188 */ }
    item def TheAlumBatchTicketItem { doc /* @S083 */ }
    item def TheBackwashSolidsManifestItem { doc /* @S245 */ }
    item def TheChlorineCylinderSealLogItem { doc /* @S223 */ }
    item def TheFilterRunExceptionNoteItem { doc /* @S153 */ }
    item def UnusualResultsItem { doc /* @S018 */ }
    part def AlarmPriorities { doc /* @S209 */ }
    part def AlarmShelvingSuppressionAndDisabling { doc /* @S211 */ }
    part def AssignedCraftWorker { doc /* @S108 */ }
    part def BackupPower { doc /* @S214 */ }
    part def BackwashRecoveryTank { doc /* @S008,S151,S154 */ }
    part def CedarFallsMunicipalDrinkingWaterTreatmentPlant { doc /* @S200 */ }
    part def CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem { doc /* @S001,S003,S022,S025,S045,S134,S150,S181,S200 */ }
    part def ChemicalSupplierDriver { doc /* @S016,S112,S223,S246 */ }
    part def ChiefOperator { doc /* @S019,S030,S038,S046,S054,S058,S070,S076,S078,S096,S102,S124,S126,S138,S153,S154,S164,S165,S173,S175,S184,S208,S218,S225,S235,S245,S250 */ }
    part def ChlorineContactBasin { doc /* @S008,S011 */ }
    part def ChlorineContactBasinAndClearwellLevelController { doc /* @S232 */ }
    part def ChlorineResidualAlarm { doc /* @S095,S119,S210,S234 */ }
    part def ClearwellLevelController { doc /* @S008,S011,S074,S111,S131,S134 */ }
    part def CoagulantDosingSkid { doc /* @S008,S009,S055,S056,S083,S158,S159,S160,S229 */ }
    part def Commissioning { doc /* @S226 */ }
    part def CommissioningTest { doc /* @S227 */ }
    part def ControlNetwork { doc /* @S203,S206 */ }
    part def ControlRoom { doc /* @S129,S176,S186,S191,S192,S195 */ }
    part def ControlledIntakeProcess { doc /* @S006 */ }
    part def DistributionDispatcher { doc /* @S022,S075,S144,S177,S182,S189,S193,S197,S220,S242 */ }
    part def DutyEngineer { doc /* @S020,S048,S058,S092,S106,S146,S155,S185,S208,S219,S223,S228,S250 */ }
    part def EngineeringPrivileges { doc /* @S202 */ }
    part def FieldCrews { doc /* @S192 */ }
    part def FunctionalTesting { doc /* @S229 */ }
    part def GravityFilters { doc /* @S059 */ }
    part def HighServicePumpHeader { doc /* @S003,S137,S140,S176,S230 */ }
    part def LaboratorySampleReceivingBench { doc /* @S017,S085,S121,S187,S195 */ }
    part def LaboratoryTechnician { doc /* @S018,S039,S065,S081,S083,S084,S088,S093,S094,S100,S120,S130,S161,S162,S188,S221,S237 */ }
    part def LocalControls { doc /* @S181 */ }
    part def MaintenancePlanner { doc /* @S021,S052,S104,S105,S204,S222,S238,S239 */ }
    part def NorthDistributionPressureStation { doc /* @S142,S244 */ }
    part def NorthFilterGallery { doc /* @S008,S010,S059,S060,S150,S163,S186,S229 */ }
    part def OperatingStaff { doc /* @S064,S071 */ }
    part def Operations { doc /* @S018,S108,S119 */ }
    part def Operator { doc /* @S069,S145,S148,S151,S157,S162,S163,S236 */ }
    part def OperatorPrivileges { doc /* @S202 */ }
    part def Operators { doc /* @S128 */ }
    part def Plant { doc /* @S215 */ }
    part def PlantStaff { doc /* @S010,S026,S031,S035 */ }
    part def RawWaterScreenChannel { doc /* @S006,S034,S035,S036,S229 */ }
    part def ReliabilityTargets { doc /* @S224 */ }
    part def ResidualsHauler { doc /* @S024,S245 */ }
    part def RiverIntakePumpStation { doc /* @S005,S007,S027,S028,S043,S109,S229 */ }
    part def SCADAHistorianServer { doc /* @S013,S014,S047,S067,S086,S125,S147,S152,S188,S196,S205,S231 */ }
    part def SouthDistributionPressureStation { doc /* @S142,S180,S243 */ }
    part def SouthFilterGallery { doc /* @S008,S010,S061,S150,S153,S164,S229 */ }
    part def StandingAlarms { doc /* @S212 */ }
    part def StormIntakeMode { doc /* @S213,S233 */ }
    part def System { doc /* @S118 */ }
    part def TreatmentScope { doc /* @S008 */ }
    part def UninterruptiblePowerSupplies { doc /* @S216 */ }
    part system {
        part alarmPriorities : AlarmPriorities;
        part alarmShelvingSuppressionAndDisabling : AlarmShelvingSuppressionAndDisabling;
        part assignedCraftWorker : AssignedCraftWorker {
            perform action a0 { doc /* Field isolation is verified locally @S108 */ }
        }
        part backupPower : BackupPower {
            perform action a0 { doc /* support safe operation or controlled shutdown @S214 */ }
        }
        part backwashRecoveryTank : BackwashRecoveryTank {
            perform action a0 { doc /* receives spent washwater @S151 */ }
            exhibit state modes {
                state s0 { doc /* settle-and-decant condition @S154 */ }
            }
        }
        part cedarFallsMunicipalDrinkingWaterTreatmentPlant : CedarFallsMunicipalDrinkingWaterTreatmentPlant;
        part cedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem {
            perform action a0 { doc /* support continuous production of potable water @S001 */ }
            perform action a1 { doc /* alarms the condition @S045 */ }
            perform action a2 { doc /* stops the affected pump @S045 */ }
            perform action a3 { doc /* level and isolation prerequisites have been verified @S134 */ }
            perform action a4 { doc /* confirms that turbidity, valve position, and flow indications are within the expected recovery range @S150 */ }
            perform action a5 { doc /* use role-based access control with named accounts @S200 */ }
            exhibit state modes {
                state s0 { doc /* Chlorine Residual Alarm @S025 */ }
            }
        }
        part chemicalSupplierDriver : ChemicalSupplierDriver {
            perform action a0 { doc /* interacts with the plant through controlled delivery procedures @S016 */ }
            perform action a1 { doc /* sends the Chlorine Cylinder Seal Log @S112 */ }
            perform action a2 { doc /* unloading any replacement cylinders @S112 */ }
            perform action a3 { doc /* follow site access, unloading, verification, and communication procedures @S246 */ }
        }
        part chiefOperator : ChiefOperator {
            perform action a0 { doc /* has overall operating authority for plant mode selection @S019 */ }
            perform action a1 { doc /* authorizes entry into Storm Intake Mode @S030 */ }
            perform action a2 { doc /* determines whether to adjust pumping rate, request additional laboratory testing, or increase downstream process monitoring @S038 */ }
            perform action a3 { doc /* authorize temporary manual operation @S046 */ }
            perform action a4 { doc /* establishes the starting coagulant dose @S054 */ }
            perform action a5 { doc /* confirms the sustained control point @S058 */ }
            perform action a6 { doc /* approve a larger correction @S070 */ }
            perform action a7 { doc /* reviews trends from the affected operating period @S076 */ }
            perform action a8 { doc /* confirms that corrective actions restored stable clarified and filtered water quality @S076 */ }
            perform action a9 { doc /* establishes daily sampling priorities @S078 */ }
            perform action a10 { doc /* reviews the next-day schedule with operations staff @S102 */ }
            perform action a11 { doc /* determines whether the equipment remains isolated or can be operated under restriction @S124 */ }
            perform action a12 { doc /* confirms that the chlorine feed controls, residual instruments, and level indications are responding consistently @S126 */ }
            perform action a13 { doc /* entered operating restriction @S138 */ }
            perform action a14 { doc /* uses the Filter Run Exception Note @S153 */ }
            perform action a15 { doc /* determine whether a shortened run, high headloss, or abnormal turbidity response requires follow-up @S153 */ }
            perform action a16 { doc /* holds the return path out of service @S154 */ }
            perform action a17 { doc /* keeps the Backwash Recovery Tank in a settle-and-decant condition @S154 */ }
            perform action a18 { doc /* approves return to service @S164 */ }
            perform action a19 { doc /* classifies upsets as advisory, controlled, or critical @S165 */ }
            perform action a20 { doc /* produces the Backwash Solids Manifest @S173 */ }
            perform action a21 { doc /* confirms that the upset classification can be closed @S175 */ }
            perform action a22 { doc /* direct a conservative pumping posture @S184 */ }
            perform action a23 { doc /* owns alarm governance for process alarms @S208 */ }
            perform action a24 { doc /* direct emergency operating priorities @S218 */ }
            perform action a25 { doc /* require a brief operational review @S225 */ }
            perform action a26 { doc /* coordinate training @S235 */ }
            perform action a27 { doc /* reviewed by the Chief Operator and Duty Engineer @S250 */ }
        }
        part chlorineContactBasin : ChlorineContactBasin {
            perform action a0 { doc /* provide the principal control points for disinfection contact management @S011 */ }
        }
        part chlorineContactBasinAndClearwellLevelController : ChlorineContactBasinAndClearwellLevelController;
        part chlorineResidualAlarm : ChlorineResidualAlarm {
            perform action a0 { doc /* causes the affected task to pause @S119 */ }
            exhibit state modes {
                state s0 { doc /* active @S095 */ }
            }
        }
        part clearwellLevelController : ClearwellLevelController {
            perform action a0 { doc /* provide the principal control points for finished-water storage coordination @S011 */ }
            perform action a1 { doc /* remains coordinated with filter production @S074 */ }
            perform action a2 { doc /* maintains normal storage within established operating limits @S131 */ }
            perform action a3 { doc /* sends the Clearwell Diver Entry Permit @S134 */ }
        }
        part coagulantDosingSkid : CoagulantDosingSkid {
            perform action a0 { doc /* supports chemical feed control @S009 */ }
            perform action a1 { doc /* meters the primary coagulant @S055 */ }
            perform action a2 { doc /* sends the Alum Batch Ticket @S056 */ }
            perform action a3 { doc /* adjusts feed response only within approved operating limits @S158 */ }
            perform action a4 { doc /* uses the set to confirm the selected dose response @S159 */ }
            perform action a5 { doc /* hold the last operator-approved dose @S160 */ }
            perform action a6 { doc /* respond correctly to local and supervisory commands @S229 */ }
            exhibit state modes {
                state s0 { doc /* automatic control @S055 */ }
            }
        }
        part commissioning : Commissioning;
        part commissioningTest : CommissioningTest;
        part controlNetwork : ControlNetwork;
        part controlRoom : ControlRoom {
            perform action a0 { doc /* verifies analyzer sample flow @S129 */ }
            perform action a1 { doc /* compares the reading with a grab sample result @S129 */ }
            perform action a2 { doc /* holds any planned production increase @S129 */ }
            perform action a3 { doc /* assumes the last confirmed operating mode remains in effect @S191 */ }
            perform action a4 { doc /* uses that status to interpret pressure-zone complaints @S195 */ }
        }
        part controlledIntakeProcess : ControlledIntakeProcess;
        part distributionDispatcher : DistributionDispatcher {
            perform action a0 { doc /* coordinates finished-water delivery expectations with the plant @S022 */ }
            perform action a1 { doc /* communicates demand changes @S022 */ }
            perform action a2 { doc /* communicates expected demand changes, main break impacts, and pressure complaints @S144 */ }
            perform action a3 { doc /* watches each pressure zone for sustained deviations @S177 */ }
            perform action a4 { doc /* records the reason, the expected duration, and the field contact responsible for the change @S182 */ }
            perform action a5 { doc /* sends the Pressure Zone Handoff Card @S189 */ }
            perform action a6 { doc /* verifying current pressure-zone setpoints, active alarms, and open field work @S189 */ }
            perform action a7 { doc /* coordinates planned hydrant flushing, valve exercising, and main isolation work with pumping schedules @S193 */ }
            perform action a8 { doc /* avoids unnecessary zone changes @S197 */ }
            perform action a9 { doc /* confirm that distribution readiness messages are acknowledged @S242 */ }
        }
        part dutyEngineer : DutyEngineer {
            perform action a0 { doc /* supports configuration control @S020 */ }
            perform action a1 { doc /* evaluates control-system problems @S020 */ }
            perform action a2 { doc /* approves engineering changes @S020 */ }
            perform action a3 { doc /* reviews storm forecasts and river-stage information @S048 */ }
            perform action a4 { doc /* authorize a temporary dose adjustment @S058 */ }
            perform action a5 { doc /* reviews significant differences between field readings and laboratory values @S092 */ }
            perform action a6 { doc /* checks proposed work against current operating constraints @S106 */ }
            perform action a7 { doc /* may defer nonessential activity @S106 */ }
            perform action a8 { doc /* review the operating condition @S146 */ }
            perform action a9 { doc /* reviews repeated abnormal wash recovery trends @S155 */ }
            perform action a10 { doc /* reviews persistent low-pressure complaints, repeated station alarms, or mismatches between observed pressure and modeled expectations @S185 */ }
            perform action a11 { doc /* supports alarm limit review @S208 */ }
            perform action a12 { doc /* authorize temporary control workarounds during an emergency @S219 */ }
            perform action a13 { doc /* reviews the Chlorine Cylinder Seal Log @S223 */ }
            perform action a14 { doc /* accepting a change in chlorine storage status @S223 */ }
            perform action a15 { doc /* confirm that temporary controls, bypasses, and manual operating instructions are understood by the affected staff @S228 */ }
            perform action a16 { doc /* reviewed by the Chief Operator and Duty Engineer @S250 */ }
        }
        part engineeringPrivileges : EngineeringPrivileges;
        part fieldCrews : FieldCrews {
            perform action a0 { doc /* notify the control room @S192 */ }
            perform action a1 { doc /* opening or closing major distribution valves @S192 */ }
        }
        part functionalTesting : FunctionalTesting;
        part gravityFilters : GravityFilters;
        part highServicePumpHeader : HighServicePumpHeader {
            perform action a0 { doc /* sequences available pumps to meet distribution demand @S137 */ }
            perform action a1 { doc /* produces the Pump Bearing Vibration Clip @S140 */ }
            perform action a2 { doc /* demonstrate stable pressure control through startup, lead-lag transfer, and controlled shutdown @S230 */ }
        }
        part laboratorySampleReceivingBench : LaboratorySampleReceivingBench {
            perform action a0 { doc /* receiving point for process and compliance samples @S017 */ }
            perform action a1 { doc /* sends the Jar Test Photograph Set @S085 */ }
            perform action a2 { doc /* records incoming distribution check samples with the pressure zone, collection point, and time @S187 */ }
            perform action a3 { doc /* provides analytical status through normal plant reporting channels @S195 */ }
            exhibit state modes {
                state s0 { doc /* available @S121 */ }
            }
        }
        part laboratoryTechnician : LaboratoryTechnician {
            perform action a0 { doc /* provides analytical confirmation @S018 */ }
            perform action a1 { doc /* communicates unusual results to operations @S018 */ }
            perform action a2 { doc /* helps determine whether process adjustments require additional verification @S018 */ }
            perform action a3 { doc /* supports intake decisions @S039 */ }
            perform action a4 { doc /* prioritizing raw-water checks @S039 */ }
            perform action a5 { doc /* provides confirmation testing @S065 */ }
            perform action a6 { doc /* checks container type, holding time, temperature, preservative status, and seal condition @S081 */ }
            perform action a7 { doc /* logging a sample for analysis @S081 */ }
            perform action a8 { doc /* uses the Alum Batch Ticket to verify chemical lot identity @S083 */ }
            perform action a9 { doc /* recording related laboratory observations @S083 */ }
            perform action a10 { doc /* prepares and sends the Sample Chain Slip @S084 */ }
            perform action a11 { doc /* verifying that custody entries are complete and legible @S084 */ }
            perform action a12 { doc /* records any mismatch between bottle labels, bench log entries, and operator notes @S088 */ }
            perform action a13 { doc /* assigning an acceptance status to the sample @S088 */ }
            perform action a14 { doc /* confirms that sample mixing, settling time, and instrument range are appropriate @S093 */ }
            perform action a15 { doc /* confirms reagent condition, sample contact time, and measurement timing @S094 */ }
            perform action a16 { doc /* accepting the result @S094 */ }
            perform action a17 { doc /* preserves all custody and acceptance records @S100 */ }
            perform action a18 { doc /* confirming sampling needs @S120 */ }
            perform action a19 { doc /* reporting any acceptance concern @S120 */ }
            perform action a20 { doc /* provides confirmatory residual results @S130 */ }
            perform action a21 { doc /* prioritizes turbidity, apparent color, alkalinity, and disinfectant residual checks @S161 */ }
            perform action a22 { doc /* retain access needed for sample status review and reporting @S221 */ }
        }
        part localControls : LocalControls {
            perform action a0 { doc /* sequence pumps within approved limits @S181 */ }
            perform action a1 { doc /* report abnormal starts, failures, or valve positions to the control system @S181 */ }
        }
        part maintenancePlanner : MaintenancePlanner {
            perform action a0 { doc /* converts equipment condition information into planned work @S021 */ }
            perform action a1 { doc /* coordinating with operations @S021 */ }
            perform action a2 { doc /* reviews intake equipment condition @S052 */ }
            perform action a3 { doc /* schedules cleaning or inspection work @S052 */ }
            perform action a4 { doc /* verifies that each work order identifies affected equipment, required isolations, parts staging, and the evidence needed to close the work @S104 */ }
            perform action a5 { doc /* uses the snapshot to compare planned rake work against recent mechanical loading @S105 */ }
            perform action a6 { doc /* releasing the task package @S105 */ }
            perform action a7 { doc /* maintains the weekly access review for maintenance accounts @S204 */ }
            perform action a8 { doc /* disables privileges after reassignment @S204 */ }
            perform action a9 { doc /* uses the permit to verify isolation boundaries @S222 */ }
            perform action a10 { doc /* review commissioning defects, recurring nuisance alarms, calibration drift, and equipment access problems @S238 */ }
            perform action a11 { doc /* use the clip to compare observed pump condition with planned inspection intervals and corrective work priorities @S239 */ }
        }
        part northDistributionPressureStation : NorthDistributionPressureStation {
            perform action a0 { doc /* receive pressure support through coordinated setpoints @S142 */ }
        }
        part northFilterGallery : NorthFilterGallery {
            perform action a0 { doc /* records individual filter effluent turbidity and headloss @S060 */ }
            perform action a1 { doc /* completes a backwash cycle @S150 */ }
            perform action a2 { doc /* shows rapid headloss growth @S163 */ }
            perform action a3 { doc /* provide a reliable filter service status indication @S186 */ }
            perform action a4 { doc /* respond correctly to local and supervisory commands @S229 */ }
        }
        part operatingStaff : OperatingStaff {
            perform action a0 { doc /* compare the analyzer trend with nearby sample results @S064 */ }
            perform action a1 { doc /* declaring a process upset @S064 */ }
            perform action a2 { doc /* hold the last verified safe dose @S071 */ }
            perform action a3 { doc /* revert to an approved fixed dose @S071 */ }
            perform action a4 { doc /* collecting additional grab samples @S071 */ }
        }
        part operations : Operations {
            perform action a0 { doc /* acknowledged by operations @S108 */ }
            perform action a1 { doc /* confirms whether the alarm is process-related or maintenance-induced @S119 */ }
        }
        part operator : Operator {
            perform action a0 { doc /* state the reason @S069 */ }
            perform action a1 { doc /* monitor the affected process variable closely @S069 */ }
            perform action a2 { doc /* restore automatic control as soon as practicable @S069 */ }
            perform action a3 { doc /* watch the relationship between raw water quality, filter loading, disinfectant demand, and high-service pumping @S145 */ }
            perform action a4 { doc /* maintain residual targets, clearwell limits, and distribution pressure @S148 */ }
            perform action a5 { doc /* verified acceptable clarity @S151 */ }
            perform action a6 { doc /* monitor influent turbidity, screen differential level, coagulant demand, and filter headloss @S157 */ }
            perform action a7 { doc /* make a sustained change to coagulation or filter loading strategy @S162 */ }
            perform action a8 { doc /* stagger wash timing @S163 */ }
        }
        part operatorPrivileges : OperatorPrivileges;
        part operators : Operators {
            perform action a0 { doc /* adjust chlorine feed gradually @S128 */ }
        }
        part plant : Plant {
            perform action a0 { doc /* maintain written expectations for generator start time, automatic transfer performance, fuel availability, and operator checks @S215 */ }
        }
        part plantStaff : PlantStaff {
            perform action a0 { doc /* supervise automatic control @S026 */ }
            perform action a1 { doc /* place equipment in safe manual operation @S026 */ }
            perform action a2 { doc /* document deviations @S026 */ }
            perform action a3 { doc /* increase observation of river level, screen loading, turbidity, and pump cycling frequency @S031 */ }
            perform action a4 { doc /* verify that the cleaning mechanism is running @S035 */ }
        }
        part rawWaterScreenChannel : RawWaterScreenChannel {
            perform action a0 { doc /* sends the Rake Torque Snapshot @S034 */ }
            perform action a1 { doc /* shows rapid level change @S035 */ }
            perform action a2 { doc /* respond correctly to local and supervisory commands @S229 */ }
            exhibit state modes {
                state s0 { doc /* high-high level condition @S036 */ }
            }
        }
        part reliabilityTargets : ReliabilityTargets;
        part residualsHauler : ResidualsHauler {
            perform action a0 { doc /* removal activities associated with treatment residuals @S024 */ }
            perform action a1 { doc /* use the Backwash Solids Manifest to confirm load identity, destination, and acceptance requirements @S245 */ }
        }
        part riverIntakePumpStation : RiverIntakePumpStation {
            perform action a0 { doc /* provides the first controlled pumping function @S005 */ }
            perform action a1 { doc /* maintain reliable raw-water availability @S005 */ }
            perform action a2 { doc /* pump starts governed by raw-water demand and available channel depth @S027 */ }
            perform action a3 { doc /* respond correctly to local and supervisory commands @S229 */ }
            exhibit state modes {
                state s0 { doc /* Reduced-capacity service @S028 */ }
                state s1 { doc /* Storm Intake Mode @S007 */ }
                state s2 { doc /* automatic service @S027 */ }
                state s3 { doc /* unavailable for routine maintenance release @S109 */ }
            }
        }
        part sCADAHistorianServer : SCADAHistorianServer {
            perform action a0 { doc /* stores operating data @S013 */ }
            perform action a1 { doc /* remain synchronized to plant time standards @S014 */ }
            perform action a2 { doc /* retains river level, screen differential, pump status, and raw-water quality trends @S047 */ }
            perform action a3 { doc /* retains dose changes, analyzer values, filter status changes, wash sequences, and operator comments @S067 */ }
            perform action a4 { doc /* retain accepted laboratory result timestamps with the associated process trend interval @S086 */ }
            perform action a5 { doc /* retains operating data @S125 */ }
            perform action a6 { doc /* stores residual, level, pressure, and pump status data @S147 */ }
            perform action a7 { doc /* records recovery volume, tank level, turbidity trend, and return timing @S152 */ }
            perform action a8 { doc /* uses the Sample Chain Slip to associate distribution water-quality entries with the operating period shown in the electronic log @S188 */ }
            perform action a9 { doc /* retains pressure, flow, pump status, and alarm data @S196 */ }
            perform action a10 { doc /* supports compliance review, alarm analysis, operational trending, and event reconstruction @S205 */ }
        }
        part southDistributionPressureStation : SouthDistributionPressureStation {
            perform action a0 { doc /* receive pressure support through coordinated setpoints @S142 */ }
            perform action a1 { doc /* starts its lead booster pump @S180 */ }
            perform action a2 { doc /* use the card to confirm zone status, valve lineup, and communication checks @S243 */ }
        }
        part southFilterGallery : SouthFilterGallery {
            perform action a0 { doc /* sends the Filter Run Exception Note @S061 */ }
            perform action a1 { doc /* completes a backwash cycle @S150 */ }
            perform action a2 { doc /* shows turbidity breakthrough or delayed ripening @S164 */ }
            perform action a3 { doc /* respond correctly to local and supervisory commands @S229 */ }
        }
        part standingAlarms : StandingAlarms;
        part stormIntakeMode : StormIntakeMode;
        part systemPart : System {
            exhibit state modes {
                state s0 { doc /* Storm Intake Mode @S118 */ }
            }
        }
        part treatmentScope : TreatmentScope;
        part uninterruptiblePowerSupplies : UninterruptiblePowerSupplies {
            perform action a0 { doc /* bridge transfer events @S216 */ }
            perform action a1 { doc /* allow orderly shutdown of servers, network switches, control processors, and communication equipment @S216 */ }
        }
        flow f0 of FinishedWaterItem from cedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem to highServicePumpHeader { doc /* @S003 */ }
        flow f1 of LocalEquipmentStatusHeadlossIndicationTurbidityMonitoringAndBackwashControlItem from northFilterGallery to plantStaff { doc /* @S010 */ }
        flow f2 of LocalEquipmentStatusHeadlossIndicationTurbidityMonitoringAndBackwashControlItem from southFilterGallery to plantStaff { doc /* @S010 */ }
        flow f3 of UnusualResultsItem from laboratoryTechnician to operations { doc /* @S018 */ }
        flow f4 of DemandChangesItem from distributionDispatcher to cedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem { doc /* @S022 */ }
        flow f5 of ResultsItem from laboratoryTechnician to operator { doc /* @S162 */ }
        flow f6 of DischargePressureTotalFlowAndPumpStatusItem from highServicePumpHeader to controlRoom { doc /* @S176 */ }
        flow f7 of AbnormalStartsFailuresOrValvePositionsItem from localControls to cedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem { doc /* @S181 */ }
        flow f8 of FilterServiceStatusIndicationItem from northFilterGallery to controlRoom { doc /* @S186 */ }
        flow f9 of NotificationItem from fieldCrews to controlRoom { doc /* @S192 */ }
        flow f10 of AnalyticalStatusItem from laboratorySampleReceivingBench to controlRoom { doc /* @S195 */ }
        flow f11 of TheAlumBatchTicketItem from coagulantDosingSkid to laboratoryTechnician { doc /* joined @S056,S083 */ }
        flow f12 of TheFilterRunExceptionNoteItem from southFilterGallery to chiefOperator { doc /* joined @S061,S153 */ }
        flow f13 of SampleChainSlipItem from laboratoryTechnician to sCADAHistorianServer { doc /* joined @S084,S188 */ }
        flow f14 of TheChlorineCylinderSealLogItem from chemicalSupplierDriver to dutyEngineer { doc /* joined @S112,S223 */ }
        flow f15 of TheBackwashSolidsManifestItem from chiefOperator to residualsHauler { doc /* joined @S173,S245 */ }
    }
    requirement def R0 { doc /* A high-high level condition at the Raw Water Screen Channel requires immediate field confirmation @S036 */ subject s : RawWaterScreenChannel; }
    requirement def R1 { doc /* A pump is not permitted to start when the Raw Water Screen Channel downstream level is below the established low-level limit. @S043 */ subject s : RiverIntakePumpStation; }
    requirement def R2 { doc /* Lantern must retain accepted laboratory result timestamps with the associated process trend interval so that reconciliation can be repeated during audits. @S086 */ subject s : SCADAHistorianServer; }
    requirement def R3 { doc /* Ironwood shall remain unavailable for routine maintenance release until isolation points are tagged, verified locally, and acknowledged in the shift turnover record. @S109 */ subject s : RiverIntakePumpStation; }
    requirement def R4 { doc /* Any planned change affecting the Clearwell Level Controller requires coordination with the High Service Pump Header operating plan before the change is applied. @S111 */ subject s : ClearwellLevelController; }
    requirement def R5 { doc /* review the operating condition before setpoints are changed outside normal ranges @S146 */ subject s : DutyEngineer; }
    requirement def R6 { doc /* hold the last operator-approved dose if the supporting process quality indications become inconsistent or unavailable @S160 */ subject s : CoagulantDosingSkid; }
    requirement def R7 { doc /* Cobalt shall provide a reliable filter service status indication before the control room treats increased distribution demand as available finished-water capacity. @S186 */ subject s : NorthFilterGallery; }
    requirement def R8 { doc /* The control system for the Cedar Falls Municipal Drinking Water Treatment Plant shall use role-based access control with named accounts for operators, engineering users, maintenance users, and read-only review users. @S200 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R9 { doc /* Operator privileges shall be limited to the actions needed to run assigned plant areas @S202 */ subject s : OperatorPrivileges; }
    requirement def R10 { doc /* engineering privileges shall require separate approval before setpoints, control logic, alarm limits, or historian configuration are changed @S202 */ subject s : EngineeringPrivileges; }
    requirement def R11 { doc /* Remote access to the control network shall require multi-factor authentication, encrypted connectivity, a recorded business reason, and approval by the Chief Operator or Duty Engineer. @S203 */ subject s : ControlNetwork; }
    requirement def R12 { doc /* The SCADA Historian Server shall be protected as a critical asset @S205 */ subject s : SCADAHistorianServer; }
    requirement def R13 { doc /* The control network shall be segmented from administrative networks @S206 */ subject s : ControlNetwork; }
    requirement def R14 { doc /* only documented pathways shall be allowed between the SCADA Historian Server, operator workstations, controllers, and approved support systems @S206 */ subject s : ControlNetwork; }
    requirement def R15 { doc /* Alarm priorities shall reflect consequence, response time, operator action, and the risk of losing treatment, storage, or distribution capability. @S209 */ subject s : AlarmPriorities; }
    requirement def R16 { doc /* A Chlorine Residual Alarm shall remain configured as a high-priority condition when residual concentration indicates a potential treatment compliance or public health concern. @S210 */ subject s : ChlorineResidualAlarm; }
    requirement def R17 { doc /* Alarm shelving, suppression, and disabling shall require a documented reason, a time limit, and review at the end of the operating shift. @S211 */ subject s : AlarmShelvingSuppressionAndDisabling; }
    requirement def R18 { doc /* Standing alarms shall be reviewed during each shift turnover so that unresolved equipment failures are not hidden by routine acknowledgement. @S212 */ subject s : StandingAlarms; }
    requirement def R19 { doc /* During Storm Intake Mode, alarm response expectations shall account for higher debris load, faster raw water quality changes, and increased dependence on intake screening and chemical dose verification. @S213 */ subject s : StormIntakeMode; }
    requirement def R20 { doc /* Backup power shall support safe operation or controlled shutdown of the River Intake Pump Station, Raw Water Screen Channel, Chlorine Contact Basin, Clearwell Level Controller, SCADA Historian Server, High Service Pump Header, and essential control-room equipment. @S214 */ subject s : BackupPower; }
    requirement def R21 { doc /* The plant shall maintain written expectations for generator start time, automatic transfer performance, fuel availability, and operator checks during extended utility outages. @S215 */ subject s : Plant; }
    requirement def R22 { doc /* Uninterruptible power supplies shall be sized to bridge transfer events and allow orderly shutdown of servers, network switches, control processors, and communication equipment. @S216 */ subject s : UninterruptiblePowerSupplies; }
    requirement def R23 { doc /* the workaround shall be logged, bounded by time or condition, and removed when normal control is restored @S219 */ subject s : DutyEngineer; }
    requirement def R24 { doc /* The Distribution Dispatcher shall be informed when failures at the High Service Pump Header, North Distribution Pressure Station, or South Distribution Pressure Station may affect pressure zones or fire-flow readiness. @S220 */ subject s : DistributionDispatcher; }
    requirement def R25 { doc /* The Laboratory Technician shall retain access needed for sample status review and reporting, but laboratory accounts shall not allow control actions on plant equipment. @S221 */ subject s : LaboratoryTechnician; }
    requirement def R26 { doc /* Reliability targets for critical plant services shall include prompt detection of failed sensors, redundant communication paths where practical, recoverable configuration backups, and periodic restoration testing. @S224 */ subject s : ReliabilityTargets; }
    requirement def R27 { doc /* After any cybersecurity event, major alarm failure, or emergency control action, the Chief Operator shall require a brief operational review that identifies the cause, affected services, corrective actions, and any needed procedure changes. @S225 */ subject s : ChiefOperator; }
    requirement def R28 { doc /* Commissioning shall be planned as a controlled sequence that proves each control function before the plant relies on it for normal service. @S226 */ subject s : Commissioning; }
    requirement def R29 { doc /* Each commissioning test shall have defined starting conditions, expected responses, acceptance limits, and a responsible reviewer. @S227 */ subject s : CommissioningTest; }
    requirement def R30 { doc /* Before wet commissioning begins, the Duty Engineer shall confirm that temporary controls, bypasses, and manual operating instructions are understood by the affected staff. @S228 */ subject s : DutyEngineer; }
    requirement def R31 { doc /* Functional testing shall verify that the River Intake Pump Station, Raw Water Screen Channel, North Filter Gallery, South Filter Gallery, and Coagulant Dosing Skid respond correctly to local and supervisory commands. @S229 */ subject s : FunctionalTesting; }
    requirement def R32 { doc /* During integrated testing, Juniper shall demonstrate stable pressure control through startup, lead-lag transfer, and controlled shutdown. @S230 */ subject s : HighServicePumpHeader; }
    requirement def R33 { doc /* The SCADA Historian Server shall be checked for correct time synchronization, tag naming, data retention, and retrieval of key commissioning trends. @S231 */ subject s : SCADAHistorianServer; }
    requirement def R34 { doc /* The Chlorine Contact Basin and Clearwell Level Controller shall be tested under representative level, flow, and residual control conditions before treated water is released for routine distribution. @S232 */ subject s : ChlorineContactBasinAndClearwellLevelController; }
    requirement def R35 { doc /* Storm Intake Mode shall be exercised in a planned drill that confirms operator prompts, intake constraints, and return-to-normal steps. @S233 */ subject s : StormIntakeMode; }
    requirement def R36 { doc /* A Chlorine Residual Alarm test shall verify annunciation, operator response guidance, acknowledgement behavior, and escalation to the appropriate duty staff. @S234 */ subject s : ChlorineResidualAlarm; }
    requirement def R37 { doc /* The Chief Operator shall coordinate training so that operators understand the control concept, normal sequencing, manual fallback methods, and alarm response expectations. @S235 */ subject s : ChiefOperator; }
    requirement def R38 { doc /* Operator training shall include classroom review, simulator or dry-run practice where practical, field walkdowns, and supervised operation during early service. @S236 */ subject s : Operator; }
    requirement def R39 { doc /* The Laboratory Technician shall be trained on sample timing, result entry, data review responsibilities, and communication of unusual water quality findings. @S237 */ subject s : LaboratoryTechnician; }
    requirement def R40 { doc /* The Maintenance Planner shall review commissioning defects, recurring nuisance alarms, calibration drift, and equipment access problems before preventive maintenance intervals are finalized. @S238 */ subject s : MaintenancePlanner; }
    requirement def R41 { doc /* The Maintenance Planner shall use the clip to compare observed pump condition with planned inspection intervals and corrective work priorities. @S239 */ subject s : MaintenancePlanner; }
    requirement def R42 { doc /* Falcon shall confirm that distribution readiness messages are acknowledged before any planned change in pressure zone operating status. @S242 */ subject s : DistributionDispatcher; }
    requirement def R43 { doc /* Before distribution readiness is declared, the South Distribution Pressure Station shall use the card to confirm zone status, valve lineup, and communication checks. @S243 */ subject s : SouthDistributionPressureStation; }
    requirement def R44 { doc /* The North Distribution Pressure Station shall be included in readiness checks for telemetry validity, pump permissives, local alarm indication, and operator communications. @S244 */ subject s : NorthDistributionPressureStation; }
    requirement def R45 { doc /* During commissioning of residuals handling, the Residuals Hauler shall use the Backwash Solids Manifest to confirm load identity, destination, and acceptance requirements. @S245 */ subject s : ResidualsHauler; }
    requirement def R46 { doc /* The Chemical Supplier Driver shall follow site access, unloading, verification, and communication procedures established during commissioning and confirmed during training. @S246 */ subject s : ChemicalSupplierDriver; }
}
