package L2Model {
    item def AlumBatchTicketItem { doc /* @S083 */ }
    item def AnalyticalStatusItem { doc /* @S195 */ }
    item def BackwashSolidsManifestItem { doc /* @S245 */ }
    item def ChlorineCylinderSealLogItem { doc /* @S223 */ }
    item def ClearwellDiverEntryPermitItem { doc /* @S222 */ }
    item def FilterRunExceptionNoteItem { doc /* @S153 */ }
    item def JarTestPhotographSetItem { doc /* @S159 */ }
    item def PressureZoneHandoffCardItem { doc /* @S243 */ }
    item def PumpBearingVibrationClipItem { doc /* @S239 */ }
    item def RakeTorqueSnapshotItem { doc /* @S105 */ }
    item def SampleChainSlipItem { doc /* @S188 */ }
    part def BackwashRecoveryTank { doc /* @S008,S151 */ }
    part def CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem { doc /* @S007,S008,S045,S051,S068,S149,S200,S202,S203,S206,S207,S209,S211,S212,S214,S215,S216,S217,S224,S226,S227,S229,S236,S240,S241,S247,S248,S249,S250 */ }
    part def ChemicalSupplierDriver { doc /* @S112,S223,S246 */ }
    part def ChiefOperator { doc /* @S030,S038,S054,S058,S076,S078,S153,S154,S165,S173,S225,S235,S245 */ }
    part def ChlorineContactBasin { doc /* @S008,S232 */ }
    part def ChlorineResidualAlarm { doc /* @S210,S234 */ }
    part def ClearwellLevelController { doc /* @S008,S131,S134,S222 */ }
    part def CoagulantDosingSkid { doc /* @S008,S009,S055,S056,S083,S158,S159,S160 */ }
    part def ControlRoom { doc /* @S129,S195 */ }
    part def DistributionDispatcher { doc /* @S022,S144,S182,S189,S220,S242,S243 */ }
    part def DutyEngineer { doc /* @S020,S048,S058,S092,S106,S155,S219,S223,S228 */ }
    part def GravityFilters { doc /* @S059 */ }
    part def HighServicePumpHeader { doc /* @S137,S140,S230,S239 */ }
    part def LaboratorySampleReceivingBench { doc /* @S085,S159,S187,S195 */ }
    part def LaboratoryTechnician { doc /* @S018,S039,S065,S081,S083,S084,S088,S100,S130,S161,S188,S221,S237 */ }
    part def MaintenancePlanner { doc /* @S021,S052,S104,S105,S204,S222,S238,S239 */ }
    part def NorthDistributionPressureStation { doc /* @S244 */ }
    part def NorthFilterGallery { doc /* @S008,S059,S060,S186 */ }
    part def RawWaterScreenChannel { doc /* @S034,S105 */ }
    part def ResidualsHauler { doc /* @S245 */ }
    part def RiverIntakePumpStation { doc /* @S005,S027,S028,S109 */ }
    part def SCADAHistorianServer { doc /* @S013,S047,S067,S086,S125,S147,S152,S188,S196,S205,S231 */ }
    part def SouthDistributionPressureStation { doc /* @S180,S243 */ }
    part def SouthFilterGallery { doc /* @S008,S061,S153 */ }
    part def StormIntakeMode { doc /* @S213,S233 */ }
    part system {
        part backwashRecoveryTank : BackwashRecoveryTank {
            perform action a0 { doc /* receives spent washwater @S151 */ }
        }
        part cedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem {
            perform action a0 { doc /* alarms the condition or stops the affected pump @S045 */ }
            exhibit state modes {
                state s0 { doc /* Storm Intake Mode @S007 */ }
                state s1 { doc /* automatic control @S149 */ }
                state s2 { doc /* manual override @S068 */ }
                state s3 { doc /* normal service @S051 */ }
            }
        }
        part chemicalSupplierDriver : ChemicalSupplierDriver {
            perform action a0 { doc /* sends the Chlorine Cylinder Seal Log @S112 */ }
        }
        part chiefOperator : ChiefOperator {
            perform action a0 { doc /* authorizes entry into Storm Intake Mode @S030 */ }
            perform action a1 { doc /* determines whether to adjust pumping rate @S038 */ }
            perform action a2 { doc /* establishes the starting coagulant dose @S054 */ }
            perform action a3 { doc /* confirms the sustained control point @S058 */ }
            perform action a4 { doc /* reviews trends from the affected operating period @S076 */ }
            perform action a5 { doc /* establishes daily sampling priorities @S078 */ }
            perform action a6 { doc /* uses the Filter Run Exception Note to determine whether follow-up is required @S153 */ }
            perform action a7 { doc /* holds the return path out of service @S154 */ }
            perform action a8 { doc /* classifies upsets as advisory, controlled, or critical @S165 */ }
            perform action a9 { doc /* produces the Backwash Solids Manifest @S173 */ }
        }
        part chlorineContactBasin : ChlorineContactBasin;
        part chlorineResidualAlarm : ChlorineResidualAlarm;
        part clearwellLevelController : ClearwellLevelController {
            perform action a0 { doc /* maintains normal storage within established operating limits @S131 */ }
            perform action a1 { doc /* sends the Clearwell Diver Entry Permit @S134 */ }
        }
        part coagulantDosingSkid : CoagulantDosingSkid {
            perform action a0 { doc /* supports chemical feed control @S009 */ }
            perform action a1 { doc /* meters the primary coagulant @S055 */ }
            perform action a2 { doc /* sends the Alum Batch Ticket @S056 */ }
            perform action a3 { doc /* adjusts feed response @S158 */ }
            perform action a4 { doc /* confirm the selected dose response @S159 */ }
        }
        part controlRoom : ControlRoom {
            perform action a0 { doc /* verifies analyzer sample flow @S129 */ }
        }
        part distributionDispatcher : DistributionDispatcher {
            perform action a0 { doc /* communicates demand changes @S022 */ }
            perform action a1 { doc /* communicates expected demand changes, main break impacts, and pressure complaints @S144 */ }
            perform action a2 { doc /* records the reason, the expected duration, and the field contact @S182 */ }
            perform action a3 { doc /* sends the Pressure Zone Handoff Card @S189 */ }
        }
        part dutyEngineer : DutyEngineer {
            perform action a0 { doc /* approves engineering changes @S020 */ }
            perform action a1 { doc /* reviews storm forecasts and river-stage information @S048 */ }
            perform action a2 { doc /* authorize a temporary dose adjustment @S058 */ }
            perform action a3 { doc /* reviews significant differences between field readings and laboratory values @S092 */ }
            perform action a4 { doc /* checks proposed work against current operating constraints @S106 */ }
            perform action a5 { doc /* reviews repeated abnormal wash recovery trends @S155 */ }
            perform action a6 { doc /* reviews the Chlorine Cylinder Seal Log @S223 */ }
        }
        part gravityFilters : GravityFilters;
        part highServicePumpHeader : HighServicePumpHeader {
            perform action a0 { doc /* sequences available pumps to meet distribution demand @S137 */ }
            perform action a1 { doc /* produces the Pump Bearing Vibration Clip @S140 */ }
        }
        part laboratorySampleReceivingBench : LaboratorySampleReceivingBench {
            perform action a0 { doc /* sends the Jar Test Photograph Set @S085 */ }
            perform action a1 { doc /* records incoming distribution check samples @S187 */ }
        }
        part laboratoryTechnician : LaboratoryTechnician {
            perform action a0 { doc /* provides analytical confirmation @S018 */ }
            perform action a1 { doc /* communicates unusual results to operations @S018 */ }
            perform action a2 { doc /* prioritizing raw-water checks @S039 */ }
            perform action a3 { doc /* provides confirmation testing @S065 */ }
            perform action a4 { doc /* checks container type, holding time, temperature, preservative status, and seal condition @S081 */ }
            perform action a5 { doc /* verify chemical lot identity @S083 */ }
            perform action a6 { doc /* prepares and sends the Sample Chain Slip @S084 */ }
            perform action a7 { doc /* records any mismatch between bottle labels, bench log entries, and operator notes @S088 */ }
            perform action a8 { doc /* preserves all custody and acceptance records @S100 */ }
            perform action a9 { doc /* provides confirmatory residual results @S130 */ }
            perform action a10 { doc /* prioritizes turbidity, apparent color, alkalinity, and disinfectant residual checks @S161 */ }
        }
        part maintenancePlanner : MaintenancePlanner {
            perform action a0 { doc /* converts equipment condition information into planned work @S021 */ }
            perform action a1 { doc /* reviews intake equipment condition @S052 */ }
            perform action a2 { doc /* schedules cleaning or inspection work @S052 */ }
            perform action a3 { doc /* verifies that each work order identifies affected equipment, required isolations, parts staging, and evidence @S104 */ }
            perform action a4 { doc /* compare planned rake work against recent mechanical loading @S105 */ }
            perform action a5 { doc /* maintains the weekly access review for maintenance accounts @S204 */ }
            perform action a6 { doc /* disables privileges after reassignment @S204 */ }
            perform action a7 { doc /* verify isolation boundaries @S222 */ }
        }
        part northDistributionPressureStation : NorthDistributionPressureStation;
        part northFilterGallery : NorthFilterGallery {
            perform action a0 { doc /* records individual filter effluent turbidity and headloss @S060 */ }
        }
        part rawWaterScreenChannel : RawWaterScreenChannel {
            perform action a0 { doc /* sends the Rake Torque Snapshot @S034 */ }
        }
        part residualsHauler : ResidualsHauler;
        part riverIntakePumpStation : RiverIntakePumpStation {
            perform action a0 { doc /* provides the first controlled pumping function @S005 */ }
            exhibit state modes {
                state s0 { doc /* Reduced-capacity service @S028 */ }
                state s1 { doc /* automatic service @S027 */ }
            }
        }
        part sCADAHistorianServer : SCADAHistorianServer {
            perform action a0 { doc /* stores operating data @S013 */ }
            perform action a1 { doc /* retains river level, screen differential, pump status, and raw-water quality trends @S047 */ }
            perform action a2 { doc /* retains dose changes, analyzer values, filter status changes, wash sequences, and operator comments @S067 */ }
            perform action a3 { doc /* retains operating data needed to compare pre-work and post-work performance @S125 */ }
            perform action a4 { doc /* stores residual, level, pressure, and pump status data @S147 */ }
            perform action a5 { doc /* records recovery volume, tank level, turbidity trend, and return timing @S152 */ }
            perform action a6 { doc /* associate distribution water-quality entries with the operating period @S188 */ }
            perform action a7 { doc /* retains pressure, flow, pump status, and alarm data @S196 */ }
        }
        part southDistributionPressureStation : SouthDistributionPressureStation {
            perform action a0 { doc /* starts its lead booster pump @S180 */ }
        }
        part southFilterGallery : SouthFilterGallery {
            perform action a0 { doc /* sends the Filter Run Exception Note @S061 */ }
        }
        part stormIntakeMode : StormIntakeMode;
        flow f0 of AlumBatchTicketItem from coagulantDosingSkid to laboratoryTechnician { doc /* @S083 */ }
        flow f1 of RakeTorqueSnapshotItem from rawWaterScreenChannel to maintenancePlanner { doc /* @S105 */ }
        flow f2 of FilterRunExceptionNoteItem from southFilterGallery to chiefOperator { doc /* @S153 */ }
        flow f3 of JarTestPhotographSetItem from laboratorySampleReceivingBench to coagulantDosingSkid { doc /* @S159 */ }
        flow f4 of SampleChainSlipItem from laboratoryTechnician to sCADAHistorianServer { doc /* @S188 */ }
        flow f5 of AnalyticalStatusItem from laboratorySampleReceivingBench to controlRoom { doc /* @S195 */ }
        flow f6 of ClearwellDiverEntryPermitItem from clearwellLevelController to maintenancePlanner { doc /* @S222 */ }
        flow f7 of ChlorineCylinderSealLogItem from chemicalSupplierDriver to dutyEngineer { doc /* @S223 */ }
        flow f8 of PumpBearingVibrationClipItem from highServicePumpHeader to maintenancePlanner { doc /* @S239 */ }
        flow f9 of PressureZoneHandoffCardItem from distributionDispatcher to southDistributionPressureStation { doc /* @S243 */ }
        flow f10 of BackwashSolidsManifestItem from chiefOperator to residualsHauler { doc /* @S245 */ }
    }
    requirement def R0 { doc /* Lantern must retain accepted laboratory result timestamps with the associated process trend interval so that reconciliation can be repeated during audits. @S086 */ subject s : SCADAHistorianServer; }
    requirement def R1 { doc /* Ironwood shall remain unavailable for routine maintenance release until isolation points are tagged, verified locally, and acknowledged in the shift turnover record. @S109 */ subject s : RiverIntakePumpStation; }
    requirement def R2 { doc /* Marigold shall hold the last operator-approved dose if the supporting process quality indications become inconsistent or unavailable. @S160 */ subject s : CoagulantDosingSkid; }
    requirement def R3 { doc /* Cobalt shall provide a reliable filter service status indication before the control room treats increased distribution demand as available finished-water capacity. @S186 */ subject s : NorthFilterGallery; }
    requirement def R4 { doc /* The control system shall use role-based access control with named accounts for operators, engineering users, maintenance users, and read-only review users. @S200 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R5 { doc /* Operator privileges shall be limited to the actions needed to run assigned plant areas, and engineering privileges shall require separate approval before setpoints, control logic, alarm limits, or historian configuration are changed. @S202 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R6 { doc /* Remote access to the control network shall require multi-factor authentication, encrypted connectivity, a recorded business reason, and approval by the Chief Operator or Duty Engineer. @S203 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R7 { doc /* The SCADA Historian Server shall be protected as a critical asset. @S205 */ subject s : SCADAHistorianServer; }
    requirement def R8 { doc /* The control network shall be segmented from administrative networks, and only documented pathways shall be allowed between the SCADA Historian Server, operator workstations, controllers, and approved support systems. @S206 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R9 { doc /* Security patches, firmware updates, and antivirus changes shall be tested in a controlled manner before deployment to equipment that affects water production or distribution pressure. @S207 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R10 { doc /* Alarm priorities shall reflect consequence, response time, operator action, and the risk of losing treatment, storage, or distribution capability. @S209 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R11 { doc /* A Chlorine Residual Alarm shall remain configured as a high-priority condition when residual concentration indicates a potential treatment compliance or public health concern. @S210 */ subject s : ChlorineResidualAlarm; }
    requirement def R12 { doc /* Alarm shelving, suppression, and disabling shall require a documented reason, a time limit, and review at the end of the operating shift. @S211 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R13 { doc /* Standing alarms shall be reviewed during each shift turnover. @S212 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R14 { doc /* During Storm Intake Mode, alarm response expectations shall account for higher debris load, faster raw water quality changes, and increased dependence on intake screening and chemical dose verification. @S213 */ subject s : StormIntakeMode; }
    requirement def R15 { doc /* Backup power shall support safe operation or controlled shutdown of the River Intake Pump Station, Raw Water Screen Channel, Chlorine Contact Basin, Clearwell Level Controller, SCADA Historian Server, High Service Pump Header, and essential control-room equipment. @S214 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R16 { doc /* The plant shall maintain written expectations for generator start time, automatic transfer performance, fuel availability, and operator checks during extended utility outages. @S215 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R17 { doc /* Uninterruptible power supplies shall be sized to bridge transfer events and allow orderly shutdown of servers, network switches, control processors, and communication equipment. @S216 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R18 { doc /* Loss of both normal and standby power to a critical service shall be treated as an emergency operating condition requiring immediate notification of the Chief Operator and Duty Engineer. @S217 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R19 { doc /* The workaround shall be logged, bounded by time or condition, and removed when normal control is restored. @S219 */ subject s : DutyEngineer; }
    requirement def R20 { doc /* The Distribution Dispatcher shall be informed when failures at the High Service Pump Header, North Distribution Pressure Station, or South Distribution Pressure Station may affect pressure zones or fire-flow readiness. @S220 */ subject s : DistributionDispatcher; }
    requirement def R21 { doc /* The Laboratory Technician shall retain access needed for sample status review and reporting, but laboratory accounts shall not allow control actions on plant equipment. @S221 */ subject s : LaboratoryTechnician; }
    requirement def R22 { doc /* Reliability targets for critical plant services shall include prompt detection of failed sensors, redundant communication paths where practical, recoverable configuration backups, and periodic restoration testing. @S224 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R23 { doc /* After any cybersecurity event, major alarm failure, or emergency control action, the Chief Operator shall require a brief operational review that identifies the cause, affected services, corrective actions, and any needed procedure changes. @S225 */ subject s : ChiefOperator; }
    requirement def R24 { doc /* Commissioning shall be planned as a controlled sequence that proves each control function before the plant relies on it for normal service. @S226 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R25 { doc /* Each commissioning test shall have defined starting conditions, expected responses, acceptance limits, and a responsible reviewer. @S227 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R26 { doc /* Before wet commissioning begins, the Duty Engineer shall confirm that temporary controls, bypasses, and manual operating instructions are understood by the affected staff. @S228 */ subject s : DutyEngineer; }
    requirement def R27 { doc /* Functional testing shall verify that the River Intake Pump Station, Raw Water Screen Channel, North Filter Gallery, South Filter Gallery, and Coagulant Dosing Skid respond correctly to local and supervisory commands. @S229 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R28 { doc /* During integrated testing, Juniper shall demonstrate stable pressure control through startup, lead-lag transfer, and controlled shutdown. @S230 */ subject s : HighServicePumpHeader; }
    requirement def R29 { doc /* The SCADA Historian Server shall be checked for correct time synchronization, tag naming, data retention, and retrieval of key commissioning trends. @S231 */ subject s : SCADAHistorianServer; }
    requirement def R30 { doc /* The Chlorine Contact Basin and Clearwell Level Controller shall be tested under representative level, flow, and residual control conditions before treated water is released for routine distribution. @S232 */ subject s : ChlorineContactBasin; }
    requirement def R31 { doc /* Storm Intake Mode shall be exercised in a planned drill that confirms operator prompts, intake constraints, and return-to-normal steps. @S233 */ subject s : StormIntakeMode; }
    requirement def R32 { doc /* A Chlorine Residual Alarm test shall verify annunciation, operator response guidance, acknowledgement behavior, and escalation to the appropriate duty staff. @S234 */ subject s : ChlorineResidualAlarm; }
    requirement def R33 { doc /* The Chief Operator shall coordinate training so that operators understand the control concept, normal sequencing, manual fallback methods, and alarm response expectations. @S235 */ subject s : ChiefOperator; }
    requirement def R34 { doc /* Operator training shall include classroom review, simulator or dry-run practice where practical, field walkdowns, and supervised operation during early service. @S236 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R35 { doc /* The Laboratory Technician shall be trained on sample timing, result entry, data review responsibilities, and communication of unusual water quality findings. @S237 */ subject s : LaboratoryTechnician; }
    requirement def R36 { doc /* The Maintenance Planner shall review commissioning defects, recurring nuisance alarms, calibration drift, and equipment access problems before preventive maintenance intervals are finalized. @S238 */ subject s : MaintenancePlanner; }
    requirement def R37 { doc /* The Maintenance Planner shall use the clip to compare observed pump condition with planned inspection intervals and corrective work priorities. @S239 */ subject s : MaintenancePlanner; }
    requirement def R38 { doc /* Feedback from maintenance work orders shall be reviewed with operations so that control changes do not mask equipment degradation or create avoidable field effort. @S240 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R39 { doc /* Distribution readiness shall be declared only after pressure control, reservoir or clearwell constraints, communications, and emergency contact paths have been verified. @S241 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R40 { doc /* Falcon shall confirm that distribution readiness messages are acknowledged before any planned change in pressure zone operating status. @S242 */ subject s : DistributionDispatcher; }
    requirement def R41 { doc /* Before distribution readiness is declared, the South Distribution Pressure Station shall use the card to confirm zone status, valve lineup, and communication checks. @S243 */ subject s : SouthDistributionPressureStation; }
    requirement def R42 { doc /* The North Distribution Pressure Station shall be included in readiness checks for telemetry validity, pump permissives, local alarm indication, and operator communications. @S244 */ subject s : NorthDistributionPressureStation; }
    requirement def R43 { doc /* During commissioning of residuals handling, the Residuals Hauler shall use the Backwash Solids Manifest to confirm load identity, destination, and acceptance requirements. @S245 */ subject s : ResidualsHauler; }
    requirement def R44 { doc /* The Chemical Supplier Driver shall follow site access, unloading, verification, and communication procedures established during commissioning and confirmed during training. @S246 */ subject s : ChemicalSupplierDriver; }
    requirement def R45 { doc /* Records generated during commissioning and early operation shall be complete enough to support troubleshooting, regulatory review, warranty claims, and future operator training. @S247 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R46 { doc /* Records retention shall follow municipal policy and applicable drinking water requirements, with electronic records protected against unauthorized change and accidental loss. @S248 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R47 { doc /* Periodic performance reviews shall compare actual plant operation with the control concept, including alarm burden, manual interventions, water quality stability, chemical use, and energy use. @S249 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
    requirement def R48 { doc /* Continuous improvement actions shall be prioritized by risk, reviewed by the Chief Operator and Duty Engineer, tested before release, and incorporated into updated procedures and training materials. @S250 */ subject s : CedarFallsMunicipalDrinkingWaterTreatmentPlantControlSystem; }
}
