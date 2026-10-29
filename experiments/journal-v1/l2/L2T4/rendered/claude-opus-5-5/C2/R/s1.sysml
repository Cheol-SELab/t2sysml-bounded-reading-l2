package L2Model {
    item def AlarmAcknowledgementSlipItem { doc /* @S152 */ }
    item def ArchivedEventSequencesItem { doc /* @S107 */ }
    item def AvailableControlsAndIndicationsItem { doc /* @S174 */ }
    item def AvailableEquipmentIndicationsItem { doc /* @S090 */ }
    item def BatteryLoadTestRecordItem { doc /* @S207 */ }
    item def BayLevelStatusIndicationsItem { doc /* @S155 */ }
    item def BayStatusDigestItem { doc /* @S139 */ }
    item def BreakerInspectionTagItem { doc /* @S179 */ }
    item def BreakerOperationsItem { doc /* @S012 */ }
    item def ClearanceHandoffMemoItem { doc /* @S235 */ }
    item def ClockDriftSnapshotItem { doc /* @S140 */ }
    item def ControlIndicationsAndCommandResultsItem { doc /* @S226 */ }
    item def IndicationQualityAndStaleDataStatusItem { doc /* @S181 */ }
    item def IndicationsItem { doc /* @S159 */ }
    item def IsolationBoundaryCardItem { doc /* @S233 */ }
    item def OperatingPowerItem { doc /* @S046 */ }
    item def PositionAndCircuitHealthIndicationsItem { doc /* @S178 */ }
    item def ProtocolRetrySummaryItem { doc /* @S208 */ }
    item def RelayDiagnosticNoteItem { doc /* @S109 */ }
    item def SettingsReviewReceiptItem { doc /* @S206 */ }
    item def StateChangingRequestsItem { doc /* @S175 */ }
    item def SwitchingRequestItem { doc /* @S125 */ }
    item def TimeItem { doc /* @S039 */ }
    item def TimeSynchronizationReferenceItem { doc /* @S017 */ }
    part def AlderCreekElectricalDistributionSubstation { doc /* @S001,S017,S119 */ }
    part def ApprovedSettingGroup { doc /* @S053 */ }
    part def ArchiveReceiptTime { doc /* @S101 */ }
    part def AuthorizedOperatingPersonnel { doc /* @S174 */ }
    part def BayAutomationController { doc /* @S005,S006,S012,S091,S121,S135,S139,S155,S176,S178,S179,S184,S207,S223 */ }
    part def BreakerControlUnit { doc /* @S011,S012,S136,S177,S178,S232 */ }
    part def Communications { doc /* @S215 */ }
    part def ControlRoom { doc /* @S080 */ }
    part def ControlRoomOperator { doc /* @S022,S032,S036,S077,S083,S090,S093,S107,S125,S148,S149,S150,S151,S152,S153,S155,S159,S162,S168,S170,S175,S181,S199,S215,S222,S226,S235,S238 */ }
    part def EngineeringWorkstation { doc /* @S019,S056,S057,S064,S110,S164,S191,S205,S206,S228 */ }
    part def EquipmentSharedAcrossTheBoundary { doc /* @S134 */ }
    part def EventRecord { doc /* @S101 */ }
    part def EventTime { doc /* @S101 */ }
    part def FeederProtectionRelay { doc /* @S008,S009,S052,S109,S186,S224 */ }
    part def Logic { doc /* @S053 */ }
    part def MaintenanceRemoteTerminal { doc /* @S206,S240 */ }
    part def NorthBayController { doc /* @S007,S129,S130,S189,S241 */ }
    part def NorthProtectionPanel { doc /* @S137,S158,S159,S187,S243 */ }
    part def PeriodicOperationalReviews { doc /* @S245 */ }
    part def PickupLevels { doc /* @S053 */ }
    part def ProtectionEquipment { doc /* @S158 */ }
    part def ProtectionFunction { doc /* @S212 */ }
    part def ProtectionRelayEngineer { doc /* @S023,S054,S055,S059,S066,S108,S109,S143,S165,S194,S203,S225,S239 */ }
    part def QualityIndications { doc /* @S101 */ }
    part def SatelliteTimeReceiver { doc /* @S017,S038,S039,S044,S045,S103,S140,S144,S183,S229 */ }
    part def SecondQualifiedReviewer { doc /* @S060 */ }
    part def SequenceEventArchive { doc /* @S018,S100,S102,S105,S107,S115,S140,S157,S182,S210,S227 */ }
    part def SourceIdentity { doc /* @S101 */ }
    part def SouthBayController { doc /* @S007,S131,S190,S242 */ }
    part def StationAutomationEquipment { doc /* @S046 */ }
    part def StationDCSystem { doc /* @S021,S046,S120,S193,S207,S231 */ }
    part def StationEquipment { doc /* @S039 */ }
    part def StationGateway { doc /* @S016,S029,S142,S172,S180,S185,S208,S230 */ }
    part def StationSupervisoryControlSystem { doc /* @S015,S027,S028,S048,S090,S106,S139,S152,S156,S174,S175,S181,S208,S226 */ }
    part def SubstationFieldCrew { doc /* @S024,S069,S075,S079,S084,S088,S089,S094,S095,S145,S166,S179,S196,S201,S209,S216,S233,S234 */ }
    part def SubstationSupervisor { doc /* @S049,S073,S078,S127,S195,S198,S220,S237 */ }
    part def SwitchingDeskCoordinator { doc /* @S082,S097,S122,S124,S125,S126,S141,S146,S169,S200,S233,S235,S236 */ }
    part def TimeDelays { doc /* @S053 */ }
    part def TransformerProtectionPanel { doc /* @S138,S161,S188,S244 */ }
    part system {
        part alderCreekElectricalDistributionSubstation : AlderCreekElectricalDistributionSubstation {
            perform action a0 { doc /* supplies distribution circuits through transformer and feeder bays @S001 */ }
            perform action a1 { doc /* preserves an additional protected copy of essential event evidence @S119 */ }
        }
        part approvedSettingGroup : ApprovedSettingGroup {
            perform action a0 { doc /* defines the pickup levels, time delays, and logic required for the feeder protection scheme @S053 */ }
        }
        part archiveReceiptTime : ArchiveReceiptTime;
        part authorizedOperatingPersonnel : AuthorizedOperatingPersonnel;
        part bayAutomationController : BayAutomationController {
            perform action a0 { doc /* performs bay-level sequencing, status evaluation, and control permissive checks @S005 */ }
            perform action a1 { doc /* produces a Bay Status Digest @S006 */ }
            perform action a2 { doc /* requests breaker operations @S012 */ }
            perform action a3 { doc /* applies configured permissives and interlocks to supported automated operations @S091 */ }
            perform action a4 { doc /* timestamps locally generated state changes @S121 */ }
            perform action a5 { doc /* presents bay control status @S135 */ }
            perform action a6 { doc /* provides bay-level status indications @S155 */ }
            perform action a7 { doc /* validates each received request against local mode, interlocks, command authority, and equipment availability @S176 */ }
            perform action a8 { doc /* issuing bay-level outputs @S176 */ }
            perform action a9 { doc /* compares returned indications with the requested state @S178 */ }
            perform action a10 { doc /* identifies incomplete or contradictory operation @S178 */ }
            perform action a11 { doc /* uses the inspection tag to associate the applicable equipment context with an authorized record @S179 */ }
            perform action a12 { doc /* monitors communication health @S184 */ }
            perform action a13 { doc /* places affected points in a defined degraded state @S184 */ }
            perform action a14 { doc /* uses the load test record to support maintenance review @S207 */ }
            perform action a15 { doc /* execute only commands permitted by its approved logic and configured interlocks @S223 */ }
            exhibit state modes {
                state s0 { doc /* degraded state @S184 */ }
            }
        }
        part breakerControlUnit : BreakerControlUnit {
            perform action a0 { doc /* executes authorized breaker operations @S011 */ }
            perform action a1 { doc /* enforces its local electrical and mechanical interlocks @S011 */ }
            perform action a2 { doc /* executes permitted breaker commands @S136 */ }
            perform action a3 { doc /* applies accepted output commands at the breaker interface @S177 */ }
            perform action a4 { doc /* returns the resulting position and circuit-health indications @S177 */ }
            perform action a5 { doc /* reject commands that do not satisfy its configured permissive conditions @S232 */ }
        }
        part communications : Communications {
            exhibit state modes {
                state s0 { doc /* degraded @S215 */ }
            }
        }
        part controlRoom : ControlRoom {
            perform action a0 { doc /* account for field staff @S080 */ }
        }
        part controlRoomOperator : ControlRoomOperator {
            perform action a0 { doc /* directs routine station operation @S022 */ }
            perform action a1 { doc /* verifies that commanded equipment states are appropriate @S022 */ }
            perform action a2 { doc /* uses the supervisory displays to assess station conditions and coordinate operating actions @S032 */ }
            perform action a3 { doc /* confirm that indications are current @S036 */ }
            perform action a4 { doc /* coordinates operational access with the Switching Desk Coordinator @S077 */ }
            perform action a5 { doc /* retains authority to suspend work @S083 */ }
            perform action a6 { doc /* evaluates reported field conditions @S093 */ }
            perform action a7 { doc /* authorizing a return to automated operation @S093 */ }
            perform action a8 { doc /* reviews archived event sequences @S107 */ }
            perform action a9 { doc /* submits switching requests @S125 */ }
            perform action a10 { doc /* reviews the alarm priority, source, time, and associated bay indications @S148 */ }
            perform action a11 { doc /* deciding on a response @S148 */ }
            perform action a12 { doc /* distinguishes a new alarm from a standing condition @S149 */ }
            perform action a13 { doc /* checks whether related indications support the same assessment @S149 */ }
            perform action a14 { doc /* treats the condition as requiring prompt investigation @S150 */ }
            perform action a15 { doc /* acknowledges alarms @S151 */ }
            perform action a16 { doc /* reviewing the indication @S151 */ }
            perform action a17 { doc /* retains awareness of any condition that remains unresolved @S151 */ }
            perform action a18 { doc /* record the alarm response and any outstanding action @S152 */ }
            perform action a19 { doc /* checks available device status and sequence information @S153 */ }
            perform action a20 { doc /* assess feeder protection operations and related alarms @S159 */ }
            perform action a21 { doc /* considers the condition of the Station DC System @S162 */ }
            perform action a22 { doc /* produces the Clearance Handoff Memo @S168 */ }
            perform action a23 { doc /* verifies that alarm status, equipment status, and recorded evidence are consistent @S170 */ }
            perform action a24 { doc /* closing the response @S170 */ }
            perform action a25 { doc /* issues state-changing requests @S175 */ }
            perform action a26 { doc /* reviews the equipment affected by each work package @S199 */ }
            perform action a27 { doc /* identifies any required operating restrictions @S199 */ }
            perform action a28 { doc /* treats remote indications as unavailable until their reliability is established @S215 */ }
            perform action a29 { doc /* deciding whether an automation request is appropriate for current operating conditions @S222 */ }
            perform action a30 { doc /* confirms indications locally @S238 */ }
        }
        part engineeringWorkstation : EngineeringWorkstation {
            perform action a0 { doc /* supports authorized configuration and maintenance activities @S019 */ }
            perform action a1 { doc /* maintains the working configuration under revision control @S056 */ }
            perform action a2 { doc /* produces the Settings Review Receipt @S057 */ }
            perform action a3 { doc /* retains the approved configuration and its revision history for controlled access @S064 */ }
            perform action a4 { doc /* provides approved tools for searching, filtering, and exporting event records @S110 */ }
            perform action a5 { doc /* is used for authorized review of protection and event information @S164 */ }
            perform action a6 { doc /* supports approved configuration review @S191 */ }
            perform action a7 { doc /* is used for authorized configuration review @S205 */ }
        }
        part equipmentSharedAcrossTheBoundary : EquipmentSharedAcrossTheBoundary;
        part eventRecord : EventRecord;
        part eventTime : EventTime;
        part feederProtectionRelay : FeederProtectionRelay {
            perform action a0 { doc /* detects feeder faults @S008 */ }
            perform action a1 { doc /* initiates protection actions @S008 */ }
            perform action a2 { doc /* produces a Relay Diagnostic Note @S009 */ }
            perform action a3 { doc /* provides local protection for its assigned feeder @S052 */ }
            perform action a4 { doc /* operates independently of supervisory control availability @S052 */ }
            perform action a5 { doc /* evaluates electrical quantities against approved settings @S186 */ }
            perform action a6 { doc /* issues protective trip outputs @S186 */ }
            perform action a7 { doc /* retain its protective function @S224 */ }
        }
        part logic : Logic;
        part maintenanceRemoteTerminal : MaintenanceRemoteTerminal {
            perform action a0 { doc /* uses the review receipt to support controlled maintenance review @S206 */ }
            perform action a1 { doc /* use controlled access @S240 */ }
        }
        part northBayController : NorthBayController {
            perform action a0 { doc /* provide bay-specific automation @S007 */ }
            perform action a1 { doc /* manages control and interlocking functions assigned to the north bay @S129 */ }
            perform action a2 { doc /* blocks a close command @S130 */ }
            perform action a3 { doc /* maintains local bay control within the approved operating mode @S189 */ }
            exhibit state modes {
                state s0 { doc /* approved operating mode @S189 */ }
            }
        }
        part northProtectionPanel : NorthProtectionPanel {
            perform action a0 { doc /* supports protection functions for the north-side equipment @S137 */ }
            perform action a1 { doc /* applies its assigned zone logic @S187 */ }
            perform action a2 { doc /* maintains trip paths independently of supervisory network availability @S187 */ }
            perform action a3 { doc /* remain available for independent protection functions @S243 */ }
        }
        part periodicOperationalReviews : PeriodicOperationalReviews {
            perform action a0 { doc /* examine command outcomes, event records, exceptions, and corrective actions @S245 */ }
        }
        part pickupLevels : PickupLevels;
        part protectionEquipment : ProtectionEquipment;
        part protectionFunction : ProtectionFunction {
            exhibit state modes {
                state s0 { doc /* out of service @S212 */ }
            }
        }
        part protectionRelayEngineer : ProtectionRelayEngineer {
            perform action a0 { doc /* maintains protection settings @S023 */ }
            perform action a1 { doc /* evaluates relay performance @S023 */ }
            perform action a2 { doc /* develops setting changes against the approved protection study and the current equipment data @S054 */ }
            perform action a3 { doc /* documents the engineering basis and expected operational effect for each proposed change @S055 */ }
            perform action a4 { doc /* verifies that proposed values agree with the approved coordination objectives @S059 */ }
            perform action a5 { doc /* records the approval status @S066 */ }
            perform action a6 { doc /* compares event times and relay indications @S108 */ }
            perform action a7 { doc /* uses the Relay Diagnostic Note @S109 */ }
            perform action a8 { doc /* reviews protection coordination questions @S143 */ }
            perform action a9 { doc /* supports investigation @S165 */ }
            perform action a10 { doc /* reviews protection event records @S194 */ }
            perform action a11 { doc /* verifies that approved settings remain consistent with coordination requirements @S194 */ }
            perform action a12 { doc /* reviews test scope, approved settings, and restoration criteria @S203 */ }
            perform action a13 { doc /* reviews protection behavior after material changes @S225 */ }
            perform action a14 { doc /* records any unresolved concerns for operational follow-up @S225 */ }
            perform action a15 { doc /* assesses unexplained trips and abnormal protection indications @S239 */ }
        }
        part qualityIndications : QualityIndications;
        part satelliteTimeReceiver : SatelliteTimeReceiver {
            perform action a0 { doc /* provides the station with a reference for time synchronization @S017 */ }
            perform action a1 { doc /* acquires a reference from supported satellite timing signals @S038 */ }
            perform action a2 { doc /* distributes time to station equipment over the configured time-distribution network @S039 */ }
            perform action a3 { doc /* produces the Clock Drift Snapshot @S044 */ }
            perform action a4 { doc /* supports station time alignment @S103 */ }
            perform action a5 { doc /* provides the station time reference @S144 */ }
            perform action a6 { doc /* supplies the station time reference @S183 */ }
            perform action a7 { doc /* supports consistent event timing @S229 */ }
            exhibit state modes {
                state s0 { doc /* degraded timing @S045 */ }
                state s1 { doc /* synchronized operation @S045 */ }
                state s2 { doc /* unavailable timing @S045 */ }
            }
        }
        part secondQualifiedReviewer : SecondQualifiedReviewer {
            perform action a0 { doc /* independently checks calculations, logic changes, and device applicability @S060 */ }
        }
        part sequenceEventArchive : SequenceEventArchive {
            perform action a0 { doc /* retains operational event information @S018 */ }
            perform action a1 { doc /* preserves event records in their received form @S100 */ }
            perform action a2 { doc /* preserves original event ordering @S102 */ }
            perform action a3 { doc /* marks records whose time quality or sequence continuity is uncertain @S102 */ }
            perform action a4 { doc /* retains configuration and access history associated with archive administration @S105 */ }
            perform action a5 { doc /* retains records under the station records schedule @S115 */ }
            perform action a6 { doc /* receives the Clock Drift Snapshot @S140 */ }
            perform action a7 { doc /* provides time-ordered evidence @S157 */ }
            perform action a8 { doc /* retains time-tagged changes and control outcomes @S182 */ }
            perform action a9 { doc /* retains event information needed to review testing and restoration activity @S210 */ }
            perform action a10 { doc /* retains time-ordered records @S227 */ }
        }
        part sourceIdentity : SourceIdentity;
        part southBayController : SouthBayController {
            perform action a0 { doc /* provide bay-specific automation @S007 */ }
            perform action a1 { doc /* manages the corresponding control and interlocking functions assigned to the south bay @S131 */ }
            perform action a2 { doc /* reports local mode and control availability @S190 */ }
            exhibit state modes {
                state s0 { doc /* local mode @S190 */ }
            }
        }
        part stationAutomationEquipment : StationAutomationEquipment;
        part stationDCSystem : StationDCSystem {
            perform action a0 { doc /* supplies control power to automation and protection equipment @S021 */ }
            perform action a1 { doc /* supplies operating power to station automation equipment @S046 */ }
            perform action a2 { doc /* produces a Battery Load Test Record @S120 */ }
            perform action a3 { doc /* supports control and protection functions through monitored station supply circuits @S193 */ }
        }
        part stationEquipment : StationEquipment;
        part stationGateway : StationGateway {
            perform action a0 { doc /* defines the communications boundary @S016 */ }
            perform action a1 { doc /* carries supervisory communications between station-level functions and remote operations interfaces @S029 */ }
            perform action a2 { doc /* produces the Protocol Retry Summary @S142 */ }
            perform action a3 { doc /* brokers authorized station traffic across control-room and bay networks @S172 */ }
            perform action a4 { doc /* applying configured protocol mappings, addressing, and access controls @S172 */ }
            perform action a5 { doc /* carries updated indications through the station interface @S180 */ }
            perform action a6 { doc /* reports link condition and protocol errors @S185 */ }
            perform action a7 { doc /* maintain the defined boundary between station automation and external communications @S230 */ }
        }
        part stationSupervisoryControlSystem : StationSupervisoryControlSystem {
            perform action a0 { doc /* provides the station-level operating interface and supervisory coordination @S015 */ }
            perform action a1 { doc /* presents available station and bay indications through a consolidated operator interface @S027 */ }
            perform action a2 { doc /* show operating conditions and communication quality @S028 */ }
            perform action a3 { doc /* produces the Alarm Acknowledgement Slip @S048 */ }
            perform action a4 { doc /* presents available equipment indications for operator review @S090 */ }
            perform action a5 { doc /* presents current operating indications separately from the long-term evidence held by the archive @S106 */ }
            perform action a6 { doc /* review current station operating conditions @S139 */ }
            perform action a7 { doc /* retain alarm state and event information @S156 */ }
            perform action a8 { doc /* presents available controls and indications to authorized operating personnel @S174 */ }
            perform action a9 { doc /* displays indication quality and stale-data status @S181 */ }
            perform action a10 { doc /* receives the Protocol Retry Summary for operational review @S208 */ }
            perform action a11 { doc /* presents control indications and command results @S226 */ }
            exhibit state modes {
                state s0 { doc /* normal operation @S090 */ }
            }
        }
        part substationFieldCrew : SubstationFieldCrew {
            perform action a0 { doc /* performs field checks and equipment work @S024 */ }
            perform action a1 { doc /* follows the authorized work instructions during device access and setting transfer @S069 */ }
            perform action a2 { doc /* performs inspections, maintenance, and switching support within the boundaries of approved work @S075 */ }
            perform action a3 { doc /* reviews the work scope, access route, known hazards, and communication arrangements @S079 */ }
            perform action a4 { doc /* entering the yard @S079 */ }
            perform action a5 { doc /* verifies equipment identity at the point of work against the approved work documentation @S084 */ }
            perform action a6 { doc /* reports uncertain equipment conditions through the designated operational communication channel @S088 */ }
            perform action a7 { doc /* recording the observed breaker condition and inspection time @S089 */ }
            perform action a8 { doc /* completes and sends the Breaker Inspection Tag @S089 */ }
            perform action a9 { doc /* maintain communications with the control room @S094 */ }
            perform action a10 { doc /* stops affected work @S095 */ }
            perform action a11 { doc /* follows the approved hold and escalation procedure @S095 */ }
            perform action a12 { doc /* confirms device identity and local conditions @S145 */ }
            perform action a13 { doc /* carrying out an authorized operation @S145 */ }
            perform action a14 { doc /* confirms device identity and local conditions @S166 */ }
            perform action a15 { doc /* carrying out an authorized operation @S166 */ }
            perform action a16 { doc /* verifies equipment indications locally @S196 */ }
            perform action a17 { doc /* reports discrepancies through established operating channels @S196 */ }
            perform action a18 { doc /* performs work @S201 */ }
            perform action a19 { doc /* verifies that field work remains within the approved work boundary @S209 */ }
            perform action a20 { doc /* reports any unsafe condition through established channels @S209 */ }
            perform action a21 { doc /* verifies equipment indications locally @S216 */ }
            perform action a22 { doc /* reports discrepancies through established operating channels @S216 */ }
            perform action a23 { doc /* uses the Isolation Boundary Card to verify the approved work boundary @S233 */ }
            perform action a24 { doc /* entering the controlled area @S233 */ }
            perform action a25 { doc /* reports unexpected equipment conditions @S234 */ }
            perform action a26 { doc /* pauses work @S234 */ }
        }
        part substationSupervisor : SubstationSupervisor {
            perform action a0 { doc /* oversees operational use of the supervisory system and escalation of unresolved availability concerns @S049 */ }
            perform action a1 { doc /* ensures that engineering changes follow the established authorization and operational control process @S073 */ }
            perform action a2 { doc /* confirms that the requested work is consistent with current operating conditions and approved procedures @S078 */ }
            perform action a3 { doc /* resolves priority conflicts @S127 */ }
            perform action a4 { doc /* confirms the operational authority for exceptional switching conditions @S127 */ }
            perform action a5 { doc /* ensures communication changes, point mapping changes, and control logic changes are managed through station change control @S195 */ }
            perform action a6 { doc /* coordinates work timing with the Switching Desk Coordinator @S198 */ }
            perform action a7 { doc /* confirms that operating responsibilities are understood @S198 */ }
            perform action a8 { doc /* confirms that required records are complete and that operating restrictions are formally cleared @S220 */ }
            perform action a9 { doc /* verifies that unresolved risks have an assigned owner and an agreed disposition @S237 */ }
        }
        part switchingDeskCoordinator : SwitchingDeskCoordinator {
            perform action a0 { doc /* confirms the applicable switching and clearance arrangements @S082 */ }
            perform action a1 { doc /* confirms the operational handback arrangements @S097 */ }
            perform action a2 { doc /* confirms operational handback @S122 */ }
            perform action a3 { doc /* maintains the station-wide switching plan @S124 */ }
            perform action a4 { doc /* coordinates work across the two bay boundaries @S124 */ }
            perform action a5 { doc /* checks each request for conflicts with active clearances and other approved work @S126 */ }
            perform action a6 { doc /* produces the Isolation Boundary Card @S141 */ }
            perform action a7 { doc /* confirms operational handback @S146 */ }
            perform action a8 { doc /* confirms operational handback @S169 */ }
            perform action a9 { doc /* confirms switching prerequisites @S200 */ }
            perform action a10 { doc /* keeps the approved switching sequence current @S200 */ }
            perform action a11 { doc /* receives the Clearance Handoff Memo @S235 */ }
            perform action a12 { doc /* confirms that its clearance status agrees with the active switching record @S235 */ }
            perform action a13 { doc /* confirm that switching authority, equipment state, and communication limits are understood @S236 */ }
            perform action a14 { doc /* coordinating any automation-enabled action @S236 */ }
        }
        part timeDelays : TimeDelays;
        part transformerProtectionPanel : TransformerProtectionPanel {
            perform action a0 { doc /* retains its protection authority @S138 */ }
            perform action a1 { doc /* provides local indication of transformer protection operation @S161 */ }
            perform action a2 { doc /* applies its assigned protective logic @S188 */ }
            perform action a3 { doc /* reports abnormal protection conditions @S188 */ }
            perform action a4 { doc /* remain within its approved settings and operating constraints @S244 */ }
        }
        flow f0 of BreakerOperationsItem from bayAutomationController to breakerControlUnit { doc /* @S012 */ }
        flow f1 of TimeSynchronizationReferenceItem from satelliteTimeReceiver to alderCreekElectricalDistributionSubstation { doc /* @S017 */ }
        flow f2 of TimeItem from satelliteTimeReceiver to stationEquipment { doc /* @S039 */ }
        flow f3 of OperatingPowerItem from stationDCSystem to stationAutomationEquipment { doc /* @S046 */ }
        flow f4 of AvailableEquipmentIndicationsItem from stationSupervisoryControlSystem to controlRoomOperator { doc /* @S090 */ }
        flow f5 of ArchivedEventSequencesItem from sequenceEventArchive to controlRoomOperator { doc /* @S107 */ }
        flow f6 of RelayDiagnosticNoteItem from feederProtectionRelay to protectionRelayEngineer { doc /* @S109 */ }
        flow f7 of SwitchingRequestItem from controlRoomOperator to switchingDeskCoordinator { doc /* @S125 */ }
        flow f8 of BayStatusDigestItem from bayAutomationController to stationSupervisoryControlSystem { doc /* @S139 */ }
        flow f9 of ClockDriftSnapshotItem from satelliteTimeReceiver to sequenceEventArchive { doc /* @S140 */ }
        flow f10 of AlarmAcknowledgementSlipItem from stationSupervisoryControlSystem to controlRoomOperator { doc /* @S152 */ }
        flow f11 of BayLevelStatusIndicationsItem from bayAutomationController to controlRoomOperator { doc /* @S155 */ }
        flow f12 of IndicationsItem from northProtectionPanel to controlRoomOperator { doc /* @S159 */ }
        flow f13 of AvailableControlsAndIndicationsItem from stationSupervisoryControlSystem to authorizedOperatingPersonnel { doc /* @S174 */ }
        flow f14 of StateChangingRequestsItem from controlRoomOperator to stationSupervisoryControlSystem { doc /* @S175 */ }
        flow f15 of PositionAndCircuitHealthIndicationsItem from breakerControlUnit to bayAutomationController { doc /* @S178 */ }
        flow f16 of BreakerInspectionTagItem from substationFieldCrew to bayAutomationController { doc /* @S179 */ }
        flow f17 of IndicationQualityAndStaleDataStatusItem from stationSupervisoryControlSystem to controlRoomOperator { doc /* @S181 */ }
        flow f18 of SettingsReviewReceiptItem from engineeringWorkstation to maintenanceRemoteTerminal { doc /* @S206 */ }
        flow f19 of BatteryLoadTestRecordItem from stationDCSystem to bayAutomationController { doc /* @S207 */ }
        flow f20 of ProtocolRetrySummaryItem from stationGateway to stationSupervisoryControlSystem { doc /* @S208 */ }
        flow f21 of ControlIndicationsAndCommandResultsItem from stationSupervisoryControlSystem to controlRoomOperator { doc /* @S226 */ }
        flow f22 of IsolationBoundaryCardItem from switchingDeskCoordinator to substationFieldCrew { doc /* @S233 */ }
        flow f23 of ClearanceHandoffMemoItem from controlRoomOperator to switchingDeskCoordinator { doc /* @S235 */ }
    }
    requirement def R0 { doc /* requires explicit coordination before a switching action can affect either bay @S134 */ subject s : EquipmentSharedAcrossTheBoundary; }
    requirement def R1 { doc /* Glasswing shall retain alarm state and event information for operator review after an indication has cleared. @S156 */ subject s : StationSupervisoryControlSystem; }
    requirement def R2 { doc /* The Bay Automation Controller shall execute only commands permitted by its approved logic and configured interlocks. @S223 */ subject s : BayAutomationController; }
    requirement def R3 { doc /* The Feeder Protection Relay shall retain its protective function independently of supervisory communications. @S224 */ subject s : FeederProtectionRelay; }
    requirement def R4 { doc /* The Engineering Workstation shall be used for authorized configuration work under established change control. @S228 */ subject s : EngineeringWorkstation; }
    requirement def R5 { doc /* time-quality concerns shall be investigated before records are relied upon for sequence analysis. @S229 */ subject s : SatelliteTimeReceiver; }
    requirement def R6 { doc /* The Station Gateway shall maintain the defined boundary between station automation and external communications. @S230 */ subject s : StationGateway; }
    requirement def R7 { doc /* The Station DC System shall be confirmed available before switching that depends on station control power. @S231 */ subject s : StationDCSystem; }
    requirement def R8 { doc /* The Breaker Control Unit shall reject commands that do not satisfy its configured permissive conditions. @S232 */ subject s : BreakerControlUnit; }
    requirement def R9 { doc /* Keystone shall confirm that switching authority, equipment state, and communication limits are understood before coordinating any automation-enabled action. @S236 */ subject s : SwitchingDeskCoordinator; }
    requirement def R10 { doc /* The Maintenance Remote Terminal shall use controlled access, and each maintenance session shall be attributable to an authorized user. @S240 */ subject s : MaintenanceRemoteTerminal; }
    requirement def R11 { doc /* The North Bay Controller shall be checked for expected local behavior after approved configuration work. @S241 */ subject s : NorthBayController; }
    requirement def R12 { doc /* The South Bay Controller shall be checked for expected local behavior after approved configuration work. @S242 */ subject s : SouthBayController; }
    requirement def R13 { doc /* The North Protection Panel shall remain available for independent protection functions during supervisory control interruptions. @S243 */ subject s : NorthProtectionPanel; }
    requirement def R14 { doc /* The Transformer Protection Panel shall remain within its approved settings and operating constraints during handover. @S244 */ subject s : TransformerProtectionPanel; }
    requirement def R15 { doc /* Periodic operational reviews shall examine command outcomes, event records, exceptions, and corrective actions so that automation decisions remain traceable and safe. @S245 */ subject s : PeriodicOperationalReviews; }
}
