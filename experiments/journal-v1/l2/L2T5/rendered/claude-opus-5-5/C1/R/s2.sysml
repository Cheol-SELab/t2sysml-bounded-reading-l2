package L2Model {
    item def AbnormalStartsFailuresOrValvePositionsItem { doc /* @S181 */ }
    item def AnalyticalStatusItem { doc /* @S195 */ }
    item def DischargePressureTotalFlowAndPumpStatusItem { doc /* @S176 */ }
    item def FilterServiceStatusIndicationItem { doc /* @S186 */ }
    item def LocalEquipmentStatusHeadlossIndicationTurbidityMonitoringAndBackwashControlItem { doc /* @S010 */ }
    item def NotificationItem { doc /* @S192 */ }
    item def UnusualResultsItem { doc /* @S018 */ }
    part def AbsenceOfActiveProtectiveTrips { doc /* @S042 */ }
    part def AdequateSuctionLevel { doc /* @S042 */ }
    part def AdvisoryUpset { doc /* @S166 */ }
    part def AutomaticControl { doc /* @S149 */ }
    part def AvailableDischargePath { doc /* @S042 */ }
    part def BackupPower { doc /* @S214 */ }
    part def BackwashRecoveryTank { doc /* @S008,S151,S154 */ }
    part def CedarFallsMunicipalDrinkingWaterTreatmentPlant { doc /* @S200 */ }
    part def CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem { doc /* @S008,S045,S134,S181,S200 */ }
    part def ChemicalSupplierDriver { doc /* @S016,S112,S246 */ }
    part def ChiefOperator { doc /* @S018,S019,S030,S038,S046,S054,S058,S070,S076,S078,S096,S102,S124,S126,S138,S153,S154,S164,S165,S173,S175,S184,S203,S208,S217,S218,S225,S235,S250 */ }
    part def ChlorineContactBasin { doc /* @S008,S011 */ }
    part def ChlorineContactBasinAndClearwellLevelController { doc /* @S232 */ }
    part def ChlorineResidualAlarm { doc /* @S095,S119,S210,S234 */ }
    part def ClearwellLevelController { doc /* @S008,S011,S074,S111,S131,S134 */ }
    part def CoagulantDosingSkid { doc /* @S008,S009,S055,S056,S158,S159,S160,S229 */ }
    part def ControlNetwork { doc /* @S203,S206 */ }
    part def ControlRoom { doc /* @S129,S176,S186,S191,S192,S195 */ }
    part def ControlledUpset { doc /* @S167 */ }
    part def CraftWorker { doc /* @S108 */ }
    part def CriticalUpset { doc /* @S168 */ }
    part def DistributionDispatcher { doc /* @S022,S075,S117,S144,S177,S182,S189,S193,S197,S220,S242 */ }
    part def Drive { doc /* @S044 */ }
    part def DutyEngineer { doc /* @S020,S048,S058,S092,S106,S146,S155,S168,S185,S203,S208,S217,S219,S223,S228,S250 */ }
    part def FieldCrews { doc /* @S192 */ }
    part def GravityFilters { doc /* @S059 */ }
    part def HealthyMotorStatus { doc /* @S042 */ }
    part def HighServicePumpHeader { doc /* @S137,S140,S176,S230 */ }
    part def LaboratorySampleReceivingBench { doc /* @S017,S066,S085,S187,S195 */ }
    part def LaboratoryTechnician { doc /* @S018,S039,S065,S081,S083,S084,S088,S093,S094,S100,S120,S130,S161,S221,S237 */ }
    part def LeadBoosterPump { doc /* @S180 */ }
    part def LocalControls { doc /* @S181 */ }
    part def MaintenancePlanner { doc /* @S021,S052,S104,S105,S204,S222,S238,S239 */ }
    part def NorthDistributionPressureStation { doc /* @S142,S244 */ }
    part def NorthFilterGallery { doc /* @S008,S010,S059,S060,S063,S150,S186,S229 */ }
    part def OpenIsolationValves { doc /* @S042 */ }
    part def OperatingStaff { doc /* @S064,S071 */ }
    part def Operations { doc /* @S108,S119 */ }
    part def Operator { doc /* @S069 */ }
    part def Operators { doc /* @S128,S235,S236 */ }
    part def Plant { doc /* @S213,S215,S217,S226 */ }
    part def PlantStaff { doc /* @S010,S026,S031,S035 */ }
    part def RawWaterScreenChannel { doc /* @S034,S036,S229 */ }
    part def ResidualsHauler { doc /* @S245 */ }
    part def RiverIntakePumpStation { doc /* @S005,S007,S027,S028,S042,S043,S044,S046,S051,S109,S229 */ }
    part def SCADAHistorianServer { doc /* @S013,S047,S067,S086,S125,S147,S152,S188,S196,S205,S231 */ }
    part def SouthDistributionPressureStation { doc /* @S142,S180,S243 */ }
    part def SouthFilterGallery { doc /* @S008,S010,S061,S150,S229 */ }
    part def StormIntakeMode { doc /* @S233 */ }
    part def UninterruptiblePowerSupplies { doc /* @S216 */ }
    part system {
        part absenceOfActiveProtectiveTrips : AbsenceOfActiveProtectiveTrips;
        part adequateSuctionLevel : AdequateSuctionLevel;
        part advisoryUpset : AdvisoryUpset;
        part automaticControl : AutomaticControl;
        part availableDischargePath : AvailableDischargePath;
        part backupPower : BackupPower {
            perform action a0 { doc /* support safe operation or controlled shutdown @S214 */ }
        }
        part backwashRecoveryTank : BackwashRecoveryTank {
            perform action a0 { doc /* receives spent washwater @S151 */ }
            exhibit state modes {
                state s0 { doc /* settle-and-decant @S154 */ }
            }
        }
        part cedarFallsMunicipalDrinkingWaterTreatmentPlant : CedarFallsMunicipalDrinkingWaterTreatmentPlant;
        part cedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem {
            perform action a0 { doc /* alarms the condition @S045 */ }
            perform action a1 { doc /* stops the affected pump @S045 */ }
            perform action a2 { doc /* level and isolation prerequisites have been verified @S134 */ }
            perform action a3 { doc /* use role-based access control with named accounts @S200 */ }
        }
        part chemicalSupplierDriver : ChemicalSupplierDriver {
            perform action a0 { doc /* interacts with the plant through controlled delivery procedures @S016 */ }
            perform action a1 { doc /* sends the Chlorine Cylinder Seal Log @S112 */ }
            perform action a2 { doc /* unloading any replacement cylinders at the plant @S112 */ }
            perform action a3 { doc /* follow site access, unloading, verification, and communication procedures @S246 */ }
        }
        part chiefOperator : ChiefOperator {
            perform action a0 { doc /* has overall operating authority for plant mode selection @S019 */ }
            perform action a1 { doc /* authorizes entry into Storm Intake Mode @S030 */ }
            perform action a2 { doc /* determines whether to adjust pumping rate, request additional laboratory testing, or increase downstream process monitoring @S038 */ }
            perform action a3 { doc /* authorize temporary manual operation @S046 */ }
            perform action a4 { doc /* establishes the starting coagulant dose @S054 */ }
            perform action a5 { doc /* confirms the sustained control point @S058 */ }
            perform action a6 { doc /* approve larger correction @S070 */ }
            perform action a7 { doc /* reviews trends from the affected operating period @S076 */ }
            perform action a8 { doc /* confirms that corrective actions restored stable clarified and filtered water quality @S076 */ }
            perform action a9 { doc /* establishes daily sampling priorities @S078 */ }
            perform action a10 { doc /* reviews the next-day schedule with operations staff @S102 */ }
            perform action a11 { doc /* determines whether the equipment remains isolated or can be operated under restriction @S124 */ }
            perform action a12 { doc /* confirms that the chlorine feed controls, residual instruments, and level indications are responding consistently @S126 */ }
            perform action a13 { doc /* entered operating restriction @S138 */ }
            perform action a14 { doc /* uses the Filter Run Exception Note @S153 */ }
            perform action a15 { doc /* holds the return path out of service @S154 */ }
            perform action a16 { doc /* keeps the Backwash Recovery Tank in a settle-and-decant condition @S154 */ }
            perform action a17 { doc /* approves return to service @S164 */ }
            perform action a18 { doc /* classifies upsets as advisory, controlled, or critical @S165 */ }
            perform action a19 { doc /* produces the Backwash Solids Manifest @S173 */ }
            perform action a20 { doc /* confirms that the upset classification can be closed @S175 */ }
            perform action a21 { doc /* direct a conservative pumping posture @S184 */ }
            perform action a22 { doc /* approval of remote access @S203 */ }
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
            perform action a3 { doc /* adjusts feed response @S158 */ }
            perform action a4 { doc /* confirm the selected dose response @S159 */ }
            perform action a5 { doc /* hold the last operator-approved dose @S160 */ }
            perform action a6 { doc /* respond correctly to local and supervisory commands @S229 */ }
            exhibit state modes {
                state s0 { doc /* automatic control @S055 */ }
            }
        }
        part controlNetwork : ControlNetwork;
        part controlRoom : ControlRoom {
            perform action a0 { doc /* verifies analyzer sample flow @S129 */ }
            perform action a1 { doc /* compares the reading with a grab sample result @S129 */ }
            perform action a2 { doc /* holds any planned production increase @S129 */ }
            perform action a3 { doc /* assumes the last confirmed operating mode remains in effect @S191 */ }
            perform action a4 { doc /* uses that status to interpret pressure-zone complaints @S195 */ }
        }
        part controlledUpset : ControlledUpset;
        part craftWorker : CraftWorker {
            perform action a0 { doc /* Field isolation is verified locally @S108 */ }
        }
        part criticalUpset : CriticalUpset;
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
        part drive : Drive;
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
            perform action a11 { doc /* approval of remote access @S203 */ }
            perform action a12 { doc /* supports alarm limit review @S208 */ }
            perform action a13 { doc /* authorize temporary control workarounds @S219 */ }
            perform action a14 { doc /* reviews the Chlorine Cylinder Seal Log @S223 */ }
            perform action a15 { doc /* accepting a change in chlorine storage status @S223 */ }
            perform action a16 { doc /* confirm that temporary controls, bypasses, and manual operating instructions are understood @S228 */ }
            perform action a17 { doc /* reviewed by the Chief Operator and Duty Engineer @S250 */ }
        }
        part fieldCrews : FieldCrews {
            perform action a0 { doc /* notify the control room @S192 */ }
            perform action a1 { doc /* opening or closing major distribution valves @S192 */ }
        }
        part gravityFilters : GravityFilters;
        part healthyMotorStatus : HealthyMotorStatus;
        part highServicePumpHeader : HighServicePumpHeader {
            perform action a0 { doc /* sequences available pumps to meet distribution demand @S137 */ }
            perform action a1 { doc /* produces the Pump Bearing Vibration Clip @S140 */ }
            perform action a2 { doc /* provide the control room with the first indication of system demand changes @S176 */ }
            perform action a3 { doc /* demonstrate stable pressure control through startup, lead-lag transfer, and controlled shutdown @S230 */ }
        }
        part laboratorySampleReceivingBench : LaboratorySampleReceivingBench {
            perform action a0 { doc /* receiving process and compliance samples @S017 */ }
            perform action a1 { doc /* custody-controlled receipt of compliance and process samples @S066 */ }
            perform action a2 { doc /* sends the Jar Test Photograph Set @S085 */ }
            perform action a3 { doc /* records incoming distribution check samples @S187 */ }
            perform action a4 { doc /* provides analytical status @S195 */ }
        }
        part laboratoryTechnician : LaboratoryTechnician {
            perform action a0 { doc /* provides analytical confirmation @S018 */ }
            perform action a1 { doc /* communicates unusual results to operations @S018 */ }
            perform action a2 { doc /* helps determine whether process adjustments require additional verification @S018 */ }
            perform action a3 { doc /* prioritizing raw-water checks @S039 */ }
            perform action a4 { doc /* supports intake decisions @S039 */ }
            perform action a5 { doc /* provides confirmation testing @S065 */ }
            perform action a6 { doc /* checks container type, holding time, temperature, preservative status, and seal condition @S081 */ }
            perform action a7 { doc /* logging a sample for analysis @S081 */ }
            perform action a8 { doc /* uses the Alum Batch Ticket to verify chemical lot identity @S083 */ }
            perform action a9 { doc /* recording related laboratory observations @S083 */ }
            perform action a10 { doc /* verifying that custody entries are complete and legible @S084 */ }
            perform action a11 { doc /* prepares and sends the Sample Chain Slip @S084 */ }
            perform action a12 { doc /* records any mismatch between bottle labels, bench log entries, and operator notes @S088 */ }
            perform action a13 { doc /* assigning an acceptance status to the sample @S088 */ }
            perform action a14 { doc /* confirms that sample mixing, settling time, and instrument range are appropriate @S093 */ }
            perform action a15 { doc /* confirms reagent condition, sample contact time, and measurement timing @S094 */ }
            perform action a16 { doc /* accepting the result @S094 */ }
            perform action a17 { doc /* preserves all custody and acceptance records @S100 */ }
            perform action a18 { doc /* confirming sampling needs @S120 */ }
            perform action a19 { doc /* reporting any acceptance concern that could delay equipment return @S120 */ }
            perform action a20 { doc /* provides confirmatory residual results @S130 */ }
            perform action a21 { doc /* prioritizes turbidity, apparent color, alkalinity, and disinfectant residual checks @S161 */ }
            perform action a22 { doc /* sample status review and reporting @S221 */ }
        }
        part leadBoosterPump : LeadBoosterPump;
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
            perform action a11 { doc /* use the clip @S239 */ }
            perform action a12 { doc /* compare observed pump condition with planned inspection intervals and corrective work priorities @S239 */ }
        }
        part northDistributionPressureStation : NorthDistributionPressureStation {
            perform action a0 { doc /* receive pressure support through coordinated setpoints @S142 */ }
        }
        part northFilterGallery : NorthFilterGallery {
            perform action a0 { doc /* records individual filter effluent turbidity and headloss @S060 */ }
            perform action a1 { doc /* completes a backwash cycle @S150 */ }
            perform action a2 { doc /* provide a reliable filter service status indication @S186 */ }
            perform action a3 { doc /* respond correctly to local and supervisory commands @S229 */ }
        }
        part openIsolationValves : OpenIsolationValves;
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
            perform action a1 { doc /* monitor the affected process variable @S069 */ }
            perform action a2 { doc /* restore automatic control @S069 */ }
        }
        part operators : Operators {
            perform action a0 { doc /* adjust chlorine feed gradually @S128 */ }
            perform action a1 { doc /* understand the control concept, normal sequencing, manual fallback methods, and alarm response expectations @S235 */ }
        }
        part plant : Plant {
            perform action a0 { doc /* maintain written expectations for generator start time, automatic transfer performance, fuel availability, and operator checks @S215 */ }
            perform action a1 { doc /* relies on it for normal service @S226 */ }
            exhibit state modes {
                state s0 { doc /* Storm Intake Mode @S213 */ }
                state s1 { doc /* emergency operating condition @S217 */ }
            }
        }
        part plantStaff : PlantStaff {
            perform action a0 { doc /* supervise automatic control @S026 */ }
            perform action a1 { doc /* place equipment in safe manual operation @S026 */ }
            perform action a2 { doc /* document deviations through approved plant procedures @S026 */ }
            perform action a3 { doc /* increase observation of river level, screen loading, turbidity, and pump cycling frequency @S031 */ }
            perform action a4 { doc /* verify that the cleaning mechanism is running @S035 */ }
        }
        part rawWaterScreenChannel : RawWaterScreenChannel {
            perform action a0 { doc /* sends the Rake Torque Snapshot @S034 */ }
            perform action a1 { doc /* respond correctly to local and supervisory commands @S229 */ }
            exhibit state modes {
                state s0 { doc /* high-high level condition @S036 */ }
            }
        }
        part residualsHauler : ResidualsHauler {
            perform action a0 { doc /* use the Backwash Solids Manifest to confirm load identity, destination, and acceptance requirements @S245 */ }
        }
        part riverIntakePumpStation : RiverIntakePumpStation {
            perform action a0 { doc /* provides the first controlled pumping function @S005 */ }
            perform action a1 { doc /* respond correctly to local and supervisory commands @S229 */ }
            exhibit state modes {
                state s0 { doc /* Reduced-capacity service @S028 */ }
                state s1 { doc /* Storm Intake Mode @S007 */ }
                state s2 { doc /* automatic service @S027 */ }
                state s3 { doc /* local control @S044 */ }
                state s4 { doc /* normal service @S051 */ }
                state s5 { doc /* temporary manual operation @S046 */ }
            }
        }
        part sCADAHistorianServer : SCADAHistorianServer {
            perform action a0 { doc /* stores operating data @S013 */ }
            perform action a1 { doc /* retains river level, screen differential, pump status, and raw-water quality trends @S047 */ }
            perform action a2 { doc /* retains dose changes, analyzer values, filter status changes, wash sequences, and operator comments @S067 */ }
            perform action a3 { doc /* retain accepted laboratory result timestamps @S086 */ }
            perform action a4 { doc /* retains operating data needed to compare pre-work and post-work performance @S125 */ }
            perform action a5 { doc /* stores residual, level, pressure, and pump status data @S147 */ }
            perform action a6 { doc /* records recovery volume, tank level, turbidity trend, and return timing @S152 */ }
            perform action a7 { doc /* uses the Sample Chain Slip to associate distribution water-quality entries with the operating period @S188 */ }
            perform action a8 { doc /* retains pressure, flow, pump status, and alarm data @S196 */ }
            perform action a9 { doc /* supports compliance review, alarm analysis, operational trending, and event reconstruction @S205 */ }
        }
        part southDistributionPressureStation : SouthDistributionPressureStation {
            perform action a0 { doc /* receive pressure support through coordinated setpoints @S142 */ }
            perform action a1 { doc /* starts its lead booster pump @S180 */ }
            perform action a2 { doc /* use the card to confirm zone status, valve lineup, and communication checks @S243 */ }
        }
        part southFilterGallery : SouthFilterGallery {
            perform action a0 { doc /* sends the Filter Run Exception Note @S061 */ }
            perform action a1 { doc /* completes a backwash cycle @S150 */ }
            perform action a2 { doc /* respond correctly to local and supervisory commands @S229 */ }
        }
        part stormIntakeMode : StormIntakeMode;
        part uninterruptiblePowerSupplies : UninterruptiblePowerSupplies {
            perform action a0 { doc /* bridge transfer events @S216 */ }
            perform action a1 { doc /* allow orderly shutdown of servers, network switches, control processors, and communication equipment @S216 */ }
        }
        flow f0 of LocalEquipmentStatusHeadlossIndicationTurbidityMonitoringAndBackwashControlItem from northFilterGallery to plantStaff { doc /* @S010 */ }
        flow f1 of LocalEquipmentStatusHeadlossIndicationTurbidityMonitoringAndBackwashControlItem from southFilterGallery to plantStaff { doc /* @S010 */ }
        flow f2 of UnusualResultsItem from laboratoryTechnician to chiefOperator { doc /* @S018 */ }
        flow f3 of DischargePressureTotalFlowAndPumpStatusItem from highServicePumpHeader to controlRoom { doc /* @S176 */ }
        flow f4 of AbnormalStartsFailuresOrValvePositionsItem from localControls to cedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem { doc /* @S181 */ }
        flow f5 of FilterServiceStatusIndicationItem from northFilterGallery to controlRoom { doc /* @S186 */ }
        flow f6 of NotificationItem from fieldCrews to controlRoom { doc /* @S192 */ }
        flow f7 of AnalyticalStatusItem from laboratorySampleReceivingBench to controlRoom { doc /* @S195 */ }
    }
    requirement def R0 { doc /* A high-high level condition at the Raw Water Screen Channel requires immediate field confirmation @S036 */ subject s : RawWaterScreenChannel; }
    requirement def R1 { doc /* A pump is not permitted to start when the Raw Water Screen Channel downstream level is below the established low-level limit. @S043 */ subject s : RiverIntakePumpStation; }
    requirement def R2 { doc /* A pump start is also blocked when the associated drive reports a fault, when local control is selected, or when a safety interlock is not proven. @S044 */ subject s : RiverIntakePumpStation; }
    requirement def R3 { doc /* A filter is not returned to service after washing until rinse-to-waste quality meets the operating target and the turbidity trend is stable. @S063 */ subject s : NorthFilterGallery; }
    requirement def R4 { doc /* An operator placing equipment in manual control is expected to state the reason, monitor the affected process variable closely, and restore automatic control as soon as practicable. @S069 */ subject s : Operator; }
    requirement def R5 { doc /* Lantern must retain accepted laboratory result timestamps with the associated process trend interval so that reconciliation can be repeated during audits. @S086 */ subject s : SCADAHistorianServer; }
    requirement def R6 { doc /* Ironwood shall remain unavailable for routine maintenance release until isolation points are tagged, verified locally, and acknowledged in the shift turnover record. @S109 */ subject s : RiverIntakePumpStation; }
    requirement def R7 { doc /* Any planned change affecting the Clearwell Level Controller requires coordination with the High Service Pump Header operating plan before the change is applied. @S111 */ subject s : ClearwellLevelController; }
    requirement def R8 { doc /* Abnormal clearwell level, loss of residual, loss of pump header pressure, or conflicting instrument readings require the Duty Engineer to review the operating condition before setpoints are changed outside normal ranges. @S146 */ subject s : DutyEngineer; }
    requirement def R9 { doc /* Return to automatic control requires stable chlorine residual, stable clearwell level response, and confirmed high-service pressure control for a period set by the Chief Operator. @S149 */ subject s : AutomaticControl; }
    requirement def R10 { doc /* Marigold shall hold the last operator-approved dose if the supporting process quality indications become inconsistent or unavailable. @S160 */ subject s : CoagulantDosingSkid; }
    requirement def R11 { doc /* An advisory upset requires closer monitoring and documented operator awareness but does not require immediate removal of treatment capacity. @S166 */ subject s : AdvisoryUpset; }
    requirement def R12 { doc /* A controlled upset requires an operator-directed change, such as reducing filter loading, extending filter-to-waste operation, increasing verification sampling, or holding recovered washwater. @S167 */ subject s : ControlledUpset; }
    requirement def R13 { doc /* A critical upset requires immediate protection of treated water quality, and the Duty Engineer is notified when automatic control cannot maintain the required operating envelope. @S168 */ subject s : CriticalUpset; }
    requirement def R14 { doc /* local controls are expected to sequence pumps within approved limits and report abnormal starts, failures, or valve positions to the control system @S181 */ subject s : LocalControls; }
    requirement def R15 { doc /* Cobalt shall provide a reliable filter service status indication before the control room treats increased distribution demand as available finished-water capacity. @S186 */ subject s : NorthFilterGallery; }
    requirement def R16 { doc /* The control system shall use role-based access control with named accounts for operators, engineering users, maintenance users, and read-only review users. @S200 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R17 { doc /* Remote access to the control network shall require multi-factor authentication, encrypted connectivity, a recorded business reason, and approval by the Chief Operator or Duty Engineer. @S203 */ subject s : ControlNetwork; }
    requirement def R18 { doc /* The SCADA Historian Server shall be protected as a critical asset @S205 */ subject s : SCADAHistorianServer; }
    requirement def R19 { doc /* The control network shall be segmented from administrative networks, and only documented pathways shall be allowed between the SCADA Historian Server, operator workstations, controllers, and approved support systems. @S206 */ subject s : ControlNetwork; }
    requirement def R20 { doc /* A Chlorine Residual Alarm shall remain configured as a high-priority condition when residual concentration indicates a potential treatment compliance or public health concern. @S210 */ subject s : ChlorineResidualAlarm; }
    requirement def R21 { doc /* Backup power shall support safe operation or controlled shutdown of the River Intake Pump Station, Raw Water Screen Channel, Chlorine Contact Basin, Clearwell Level Controller, SCADA Historian Server, High Service Pump Header, and essential control-room equipment. @S214 */ subject s : BackupPower; }
    requirement def R22 { doc /* The plant shall maintain written expectations for generator start time, automatic transfer performance, fuel availability, and operator checks during extended utility outages. @S215 */ subject s : Plant; }
    requirement def R23 { doc /* Uninterruptible power supplies shall be sized to bridge transfer events and allow orderly shutdown of servers, network switches, control processors, and communication equipment. @S216 */ subject s : UninterruptiblePowerSupplies; }
    requirement def R24 { doc /* the workaround shall be logged, bounded by time or condition, and removed when normal control is restored @S219 */ subject s : DutyEngineer; }
    requirement def R25 { doc /* The Distribution Dispatcher shall be informed when failures at the High Service Pump Header, North Distribution Pressure Station, or South Distribution Pressure Station may affect pressure zones or fire-flow readiness. @S220 */ subject s : DistributionDispatcher; }
    requirement def R26 { doc /* The Laboratory Technician shall retain access needed for sample status review and reporting, but laboratory accounts shall not allow control actions on plant equipment. @S221 */ subject s : LaboratoryTechnician; }
    requirement def R27 { doc /* After any cybersecurity event, major alarm failure, or emergency control action, the Chief Operator shall require a brief operational review that identifies the cause, affected services, corrective actions, and any needed procedure changes. @S225 */ subject s : ChiefOperator; }
    requirement def R28 { doc /* Before wet commissioning begins, the Duty Engineer shall confirm that temporary controls, bypasses, and manual operating instructions are understood by the affected staff. @S228 */ subject s : DutyEngineer; }
    requirement def R29 { doc /* During integrated testing, Juniper shall demonstrate stable pressure control through startup, lead-lag transfer, and controlled shutdown. @S230 */ subject s : HighServicePumpHeader; }
    requirement def R30 { doc /* The SCADA Historian Server shall be checked for correct time synchronization, tag naming, data retention, and retrieval of key commissioning trends. @S231 */ subject s : SCADAHistorianServer; }
    requirement def R31 { doc /* The Chlorine Contact Basin and Clearwell Level Controller shall be tested under representative level, flow, and residual control conditions before treated water is released for routine distribution. @S232 */ subject s : ChlorineContactBasinAndClearwellLevelController; }
    requirement def R32 { doc /* Storm Intake Mode shall be exercised in a planned drill that confirms operator prompts, intake constraints, and return-to-normal steps. @S233 */ subject s : StormIntakeMode; }
    requirement def R33 { doc /* A Chlorine Residual Alarm test shall verify annunciation, operator response guidance, acknowledgement behavior, and escalation to the appropriate duty staff. @S234 */ subject s : ChlorineResidualAlarm; }
    requirement def R34 { doc /* The Chief Operator shall coordinate training so that operators understand the control concept, normal sequencing, manual fallback methods, and alarm response expectations. @S235 */ subject s : ChiefOperator; }
    requirement def R35 { doc /* Operator training shall include classroom review, simulator or dry-run practice where practical, field walkdowns, and supervised operation during early service. @S236 */ subject s : Operators; }
    requirement def R36 { doc /* The Laboratory Technician shall be trained on sample timing, result entry, data review responsibilities, and communication of unusual water quality findings. @S237 */ subject s : LaboratoryTechnician; }
    requirement def R37 { doc /* The Maintenance Planner shall review commissioning defects, recurring nuisance alarms, calibration drift, and equipment access problems before preventive maintenance intervals are finalized. @S238 */ subject s : MaintenancePlanner; }
    requirement def R38 { doc /* The Maintenance Planner shall use the clip to compare observed pump condition with planned inspection intervals and corrective work priorities. @S239 */ subject s : MaintenancePlanner; }
    requirement def R39 { doc /* Falcon shall confirm that distribution readiness messages are acknowledged before any planned change in pressure zone operating status. @S242 */ subject s : DistributionDispatcher; }
    requirement def R40 { doc /* Before distribution readiness is declared, the South Distribution Pressure Station shall use the card to confirm zone status, valve lineup, and communication checks. @S243 */ subject s : SouthDistributionPressureStation; }
    requirement def R41 { doc /* The North Distribution Pressure Station shall be included in readiness checks for telemetry validity, pump permissives, local alarm indication, and operator communications. @S244 */ subject s : NorthDistributionPressureStation; }
    requirement def R42 { doc /* During commissioning of residuals handling, the Residuals Hauler shall use the Backwash Solids Manifest to confirm load identity, destination, and acceptance requirements. @S245 */ subject s : ResidualsHauler; }
    requirement def R43 { doc /* The Chemical Supplier Driver shall follow site access, unloading, verification, and communication procedures established during commissioning and confirmed during training. @S246 */ subject s : ChemicalSupplierDriver; }
}
