package L2Model {
    item def AcknowledgementsItem { doc /* @S044 */ }
    item def AlarmsItem { doc /* @S022 */ }
    item def ApprovedServiceMessagesItem { doc /* @S015 */ }
    item def AxleCounterResetRequestItem { doc /* @S189 */ }
    item def BrakeCurveChecksumLogItem { doc /* @S154 */ }
    item def ClockDriftSampleReportItem { doc /* @S123 */ }
    item def CommandedRouteLockedRoutePointStateAndTrackOccupancyStateItem { doc /* @S098 */ }
    item def ConflictOrUnavailableRouteConditionItem { doc /* @S105 */ }
    item def ConsolidatedTrainPositionsAlarmsItem { doc /* @S009 */ }
    item def CrewLoginTokenBundleItem { doc /* @S095 */ }
    item def DataItem { doc /* @S012 */ }
    item def DirectVerbalInstructionItem { doc /* @S117 */ }
    item def DoorClosedAndLockedIndicationsItem { doc /* @S093 */ }
    item def EquipmentRecoveryOptionsItem { doc /* @S120 */ }
    item def ExceptionsItem { doc /* @S018 */ }
    item def LinkQualityRegistrationStateAndSessionContinuityInformationItem { doc /* @S039 */ }
    item def LossOfSafeDataConnectivityItem { doc /* @S181 */ }
    item def MessagesCarryingRouteStatusItem { doc /* @S096 */ }
    item def MovementAuthorityDataItem { doc /* @S029 */ }
    item def NonVitalTrendDataItem { doc /* @S119 */ }
    item def PlatformDoorStatusSnapshotItem { doc /* @S129,S233 */ }
    item def PlatformInterfaceIndicationsItem { doc /* @S017,S075 */ }
    item def ProposedRegulatingActionAffectedTrainIdentitiesAndPredictedRecoveryTimeItem { doc /* @S104 */ }
    item def RadioHandoverAuditFileItem { doc /* @S206 */ }
    item def RadioQualityChangesItem { doc /* @S055 */ }
    item def RecordedHandbackItem { doc /* @S199 */ }
    item def RouteReleaseExceptionListItem { doc /* @S091,S157 */ }
    item def RouteRequestsItem { doc /* @S079 */ }
    item def RouteStateIndicationsItem { doc /* @S108 */ }
    item def ScheduleContextItem { doc /* @S048 */ }
    item def SecurityEventsItem { doc /* @S202 */ }
    item def SelectedFaultSummariesItem { doc /* @S165 */ }
    item def SpeedAndDistanceMeasurementsItem { doc /* @S032 */ }
    item def StationInterfaceFaultsRejectedCommandsAndInconsistentIndicationsItem { doc /* @S148 */ }
    item def SwitchStateTrackOccupancyAndRouteLockingStatusItem { doc /* @S068 */ }
    item def TestTrainClearanceMemoItem { doc /* @S216 */ }
    item def TrainPositionItem { doc /* @S066 */ }
    item def TrainPredictionDataStoppingPatternChangesAndPlatformAllocationUpdatesItem { doc /* @S136 */ }
    item def UnsafeDoorInterfaceStateItem { doc /* @S132 */ }
    item def ZoneStatusRadioCoverageAlarmsAndTrainSupervisionStatesItem { doc /* @S071 */ }
    part def AtlasOnboardController { doc /* @S012,S025,S027,S028,S029,S032,S033,S036,S037,S039,S044,S055,S057,S066,S095,S111,S144,S154,S161,S178,S181,S222,S227 */ }
    part def AuditRecords { doc /* @S218 */ }
    part def AuthorizedTechnicalStaff { doc /* @S060 */ }
    part def AutomaticSupervision { doc /* @S018 */ }
    part def CBTCSupervision { doc /* @S082 */ }
    part def CBTCSystem { doc /* @S086,S136,S137 */ }
    part def CommunicationsBasedTrainControlSystem { doc /* @S002,S127,S129,S150,S200 */ }
    part def ControlRoom { doc /* @S009 */ }
    part def ControlStaff { doc /* @S098 */ }
    part def CryptographicKeyManagementAppliance { doc /* @S023,S042,S060,S123,S124,S171,S196,S207,S213,S239 */ }
    part def CustomerInformationSystems { doc /* @S015 */ }
    part def CyberSecurityOfficer { doc /* @S023,S125,S149,S156,S195,S202,S206,S214,S242 */ }
    part def DualChannelOdometer { doc /* @S012,S031,S032,S066,S112,S162,S180,S222 */ }
    part def EastJunctionInterlocking { doc /* @S011,S030,S068,S079,S087,S107,S160,S185,S189,S210,S229 */ }
    part def GreenvaleMetro { doc /* @S127,S175,S176 */ }
    part def LineTrafficController { doc /* @S006,S018,S071,S099,S101,S103,S104,S105,S109,S110,S116,S120,S121,S142,S157,S165,S168,S176,S187,S193,S205,S226,S244 */ }
    part def LocalStationStaff { doc /* @S133 */ }
    part def MaintenanceControl { doc /* @S199 */ }
    part def MaintenanceDiagnosticServer { doc /* @S050,S072,S100,S119,S148,S153,S154,S169,S194,S212,S238 */ }
    part def Management { doc /* @S247 */ }
    part def MetroOperationsControlSystem { doc /* @S009,S022,S024,S048,S071,S095,S098,S102,S104,S135,S140,S165,S177,S202,S216,S233 */ }
    part def NorthDistrictZoneController { doc /* @S010,S029,S063,S079,S091,S105,S132,S158,S183,S227 */ }
    part def OperationsControl { doc /* @S199 */ }
    part def OperationsControlCentre { doc /* @S108 */ }
    part def PassengerInformationGateway { doc /* @S015,S047,S076,S122,S136,S137,S138,S198,S219,S236 */ }
    part def PlatformScreenDoorController { doc /* @S017,S046,S075,S093,S129,S130,S132,S192,S221,S233,S234 */ }
    part def ReadinessReviewAuthority { doc /* @S246 */ }
    part def ReceivingZone { doc /* @S067 */ }
    part def ResponsibleZoneController { doc /* @S068 */ }
    part def RevenueTrainOperator { doc /* @S007,S043,S044,S117,S118,S166,S179,S191,S197,S215,S216,S226,S244 */ }
    part def SafetyDataCommunicationNetwork { doc /* @S014,S040,S041,S058,S097,S123,S147,S164,S202,S232 */ }
    part def SafetyRelatedPart { doc /* @S152 */ }
    part def SecurityMonitoring { doc /* @S203 */ }
    part def ServiceTimetableServer { doc /* @S015,S048,S076,S139,S219,S235 */ }
    part def SignalMaintenanceEngineer { doc /* @S022,S050,S072,S089,S119,S120,S148,S155,S168,S188,S189,S214,S241 */ }
    part def SouthDistrictZoneController { doc /* @S010,S029,S064,S080,S106,S159,S184,S228 */ }
    part def StationStatusIndications { doc /* @S134 */ }
    part def SupervisingWaysideSystems { doc /* @S075,S093 */ }
    part def System { doc /* @S018,S019 */ }
    part def TrainControlEnvironment { doc /* @S017 */ }
    part def TrainRadioModem { doc /* @S013,S038,S039,S053,S055,S096,S113,S146,S163,S181 */ }
    part def VoiceDispatchConsole { doc /* @S016,S045,S074,S117,S141,S190,S220,S237 */ }
    part def WaysideRadioAccessNetwork { doc /* @S013,S053,S073,S096,S145,S164,S202,S206,S232 */ }
    part def WaysideSupervision { doc /* @S069 */ }
    part def WestJunctionInterlocking { doc /* @S011,S030,S068,S090,S091,S108,S157,S160,S186,S229 */ }
    part system {
        part atlasOnboardController : AtlasOnboardController {
            perform action a0 { doc /* supervises automatic train protection functions @S012 */ }
            perform action a1 { doc /* maintain a validated estimate of train position and speed @S012 */ }
            perform action a2 { doc /* assumes the active train control role @S025 */ }
            perform action a3 { doc /* supervises movement authority processing, onboard speed enforcement, door enable logic, and train interface commands @S027 */ }
            perform action a4 { doc /* maintains a safety-critical state machine @S028 */ }
            perform action a5 { doc /* compares the two odometry channels continuously @S032 */ }
            perform action a6 { doc /* degrades the operating mode @S032 */ }
            perform action a7 { doc /* increase position uncertainty @S033 */ }
            perform action a8 { doc /* request operating actions that preserve separation from other trains @S033 */ }
            perform action a9 { doc /* recalculates the braking demand needed to keep the train within the authorized movement limits @S036 */ }
            perform action a10 { doc /* produces the Brake Curve Checksum Log @S037 */ }
            perform action a11 { doc /* validating the active enforcement data set @S037 */ }
            perform action a12 { doc /* falls back to the last validated movement authority rules @S057 */ }
            perform action a13 { doc /* confirms train position from the Dual Channel Odometer @S066 */ }
            perform action a14 { doc /* accepting the next authority source @S066 */ }
            perform action a15 { doc /* uses the token bundle to validate that onboard operating context is current @S095 */ }
            perform action a16 { doc /* accepting supervised route-related data @S095 */ }
            perform action a17 { doc /* enforces the active movement profile on each equipped train @S111 */ }
            perform action a18 { doc /* presents any onboard rejection or degraded mode indication @S111 */ }
            perform action a19 { doc /* report train door enable side, berth identity, and departure readiness @S144 */ }
            perform action a20 { doc /* stores onboard fault codes, movement authority acceptance records, propulsion cutback requests, and train interface exceptions @S161 */ }
            perform action a21 { doc /* report security-relevant diagnostic conditions @S222 */ }
            perform action a22 { doc /* demonstrate stable supervision @S227 */ }
            exhibit state modes {
                state s0 { doc /* automatic train operation @S028 */ }
                state s1 { doc /* cutout @S028 */ }
                state s2 { doc /* degraded mode @S111 */ }
                state s3 { doc /* fallback operation @S028 */ }
                state s4 { doc /* initialization @S028 */ }
                state s5 { doc /* protected manual operation @S028 */ }
                state s6 { doc /* restricted manual operation @S178 */ }
            }
        }
        part auditRecords : AuditRecords;
        part authorizedTechnicalStaff : AuthorizedTechnicalStaff {
            perform action a0 { doc /* managed under controlled access @S060 */ }
        }
        part automaticSupervision : AutomaticSupervision {
            perform action a0 { doc /* regulate headways @S018 */ }
            perform action a1 { doc /* enforce safe separation @S018 */ }
            perform action a2 { doc /* present the Line Traffic Controller with exceptions @S018 */ }
        }
        part cBTCSupervision : CBTCSupervision {
            perform action a0 { doc /* treats a route as available @S082 */ }
        }
        part cBTCSystem : CBTCSystem {
            perform action a0 { doc /* train location estimated @S086 */ }
            perform action a1 { doc /* reconciled them with the active timetable @S136 */ }
            perform action a2 { doc /* confirmed the underlying train identity and route @S137 */ }
        }
        part communicationsBasedTrainControlSystem : CommunicationsBasedTrainControlSystem {
            perform action a0 { doc /* supervising train separation, movement authority, and service regulation @S002 */ }
            perform action a1 { doc /* favours restrictive platform states @S150 */ }
            perform action a2 { doc /* requires explicit controller action before restoring automatic departure support at the affected station @S150 */ }
            exhibit state modes {
                state s0 { doc /* degraded operation @S150 */ }
            }
        }
        part controlRoom : ControlRoom;
        part controlStaff : ControlStaff {
            perform action a0 { doc /* identify mismatches @S098 */ }
        }
        part cryptographicKeyManagementAppliance : CryptographicKeyManagementAppliance {
            perform action a0 { doc /* supports key-management processes @S023 */ }
            perform action a1 { doc /* supports the security material used by onboard communications @S042 */ }
            perform action a2 { doc /* supports the authentication framework used on the safety data paths @S060 */ }
            perform action a3 { doc /* uses the sample report to verify that certificate validity windows and controller clocks remain within the permitted tolerance @S123 */ }
            perform action a4 { doc /* produces the Encryption Certificate Renewal Pack @S124 */ }
            perform action a5 { doc /* records the change reference @S124 */ }
            perform action a6 { doc /* maintains certificate and key status records @S171 */ }
            perform action a7 { doc /* be the controlled source for operational certificates @S207 */ }
            perform action a8 { doc /* supporting commissioning operations without manual workarounds @S239 */ }
        }
        part customerInformationSystems : CustomerInformationSystems;
        part cyberSecurityOfficer : CyberSecurityOfficer {
            perform action a0 { doc /* oversees access controls @S023 */ }
            perform action a1 { doc /* oversees key-management processes @S023 */ }
            perform action a2 { doc /* oversees the response to security events @S023 */ }
            perform action a3 { doc /* reviews certificate change records, access events, and unusual authentication failures @S125 */ }
            perform action a4 { doc /* authorising normal operational reliance on the renewed security configuration @S125 */ }
            perform action a5 { doc /* reviews access rights for passenger information and dispatch integration workstations @S149 */ }
            perform action a6 { doc /* reviews privileged diagnostic access logs @S156 */ }
            perform action a7 { doc /* confirms that remote connections use current credentials and approved encryption settings @S156 */ }
            perform action a8 { doc /* review any degraded condition that involves authentication failure, unexpected lockout, or abnormal network access behavior @S195 */ }
            perform action a9 { doc /* maintain continuous monitoring of security events @S202 */ }
            perform action a10 { doc /* uses the audit file to investigate radio session continuity @S206 */ }
            perform action a11 { doc /* confirm that security monitoring records are complete @S206 */ }
            perform action a12 { doc /* approve security-sensitive permissions @S214 */ }
            perform action a13 { doc /* confirm that access controls, event monitoring, operator accounts, and security incident escalation paths are effective @S242 */ }
        }
        part dualChannelOdometer : DualChannelOdometer {
            perform action a0 { doc /* provides independent speed and distance measurements @S031 */ }
            perform action a1 { doc /* providing independent distance measurement inputs @S112 */ }
            perform action a2 { doc /* provides distance and speed plausibility information @S162 */ }
            perform action a3 { doc /* cause the train location to be treated as uncertain @S180 */ }
            perform action a4 { doc /* report security-relevant diagnostic conditions @S222 */ }
        }
        part eastJunctionInterlocking : EastJunctionInterlocking {
            perform action a0 { doc /* maintain vital control of points and signals @S011 */ }
            perform action a1 { doc /* only accept commands that satisfy their configured safety rules @S011 */ }
            perform action a2 { doc /* report switch state, track occupancy, and route locking status @S068 */ }
            perform action a3 { doc /* sends the Axle Counter Reset Request @S087 */ }
            perform action a4 { doc /* holds the route locked @S107 */ }
            perform action a5 { doc /* report route command histories, point detection changes, and protective lock status @S160 */ }
            perform action a6 { doc /* hold commanded points locked @S185 */ }
            perform action a7 { doc /* reject any control message with an invalid signature, an expired certificate, or a sequence value outside the accepted window @S210 */ }
            exhibit state modes {
                state s0 { doc /* route locked @S107 */ }
            }
        }
        part greenvaleMetro : GreenvaleMetro {
            perform action a0 { doc /* keeps trains stationary or moving at controlled speed @S175 */ }
            exhibit state modes {
                state s0 { doc /* degraded mode @S176 */ }
                state s1 { doc /* degraded operation @S175 */ }
            }
        }
        part lineTrafficController : LineTrafficController {
            perform action a0 { doc /* monitoring service performance @S006 */ }
            perform action a1 { doc /* authorizing planned operational changes @S006 */ }
            perform action a2 { doc /* coordinating incident response @S006 */ }
            perform action a3 { doc /* directing recovery actions @S006 */ }
            perform action a4 { doc /* manage service @S071 */ }
            perform action a5 { doc /* request a regulating action @S099 */ }
            perform action a6 { doc /* maintaining a live view of train positions, route status, alarms, and service performance @S101 */ }
            perform action a7 { doc /* selects holding, skip-stop, turnback, or run-through measures @S103 */ }
            perform action a8 { doc /* checking that passenger impact and downstream recovery have been assessed @S103 */ }
            perform action a9 { doc /* confirms the command @S104 */ }
            perform action a10 { doc /* produces the Temporary Speed Restriction Notice @S109 */ }
            perform action a11 { doc /* confirming the limits, speed value, start time, and expected removal condition @S109 */ }
            perform action a12 { doc /* monitors actual train performance against the expected delay allowance @S110 */ }
            perform action a13 { doc /* adjusts regulation plans @S110 */ }
            perform action a14 { doc /* records the initial event time, train identifier, location, passenger impact, and the first safe operating instruction issued @S116 */ }
            perform action a15 { doc /* remains responsible for service regulation decisions @S120 */ }
            perform action a16 { doc /* verifies that the revised plan is visible @S121 */ }
            perform action a17 { doc /* relying on it for regulation @S121 */ }
            perform action a18 { doc /* apply a station hold through dispatch controls @S142 */ }
            perform action a19 { doc /* receives the Route Release Exception List @S157 */ }
            perform action a20 { doc /* uses it to check whether a release anomaly could affect service recovery decisions @S157 */ }
            perform action a21 { doc /* confirms the operating restriction @S168 */ }
            perform action a22 { doc /* declared a degraded mode @S176 */ }
            perform action a23 { doc /* confirms train positions through independent indications and direct verbal reports @S187 */ }
            perform action a24 { doc /* supported test train @S226 */ }
            perform action a25 { doc /* stop the trial @S226 */ }
            perform action a26 { doc /* maintain safe service regulation @S244 */ }
        }
        part localStationStaff : LocalStationStaff;
        part maintenanceControl : MaintenanceControl;
        part maintenanceDiagnosticServer : MaintenanceDiagnosticServer {
            perform action a0 { doc /* collects non-vital health indications from trainborne equipment @S050 */ }
            perform action a1 { doc /* receives non-vital summaries of radio and network health @S072 */ }
            perform action a2 { doc /* records route command outcomes, point operation timing, and detection transitions @S100 */ }
            perform action a3 { doc /* provides non-vital trend data @S119 */ }
            perform action a4 { doc /* records station interface faults, rejected commands, and inconsistent indications @S148 */ }
            perform action a5 { doc /* receives event streams from fixed and onboard equipment @S153 */ }
            perform action a6 { doc /* uses the checksum log to compare stored braking data identifiers against the expected maintenance baseline for the affected train @S154 */ }
            perform action a7 { doc /* preserves raw events, normalised event records, diagnostic session notes, and file integrity values @S169 */ }
            perform action a8 { doc /* mark each degraded-mode diagnostic session with the incident identifier @S194 */ }
            perform action a9 { doc /* collect commissioning diagnostics @S238 */ }
        }
        part management : Management {
            perform action a0 { doc /* confirms that training, documentation, staffing, spare equipment, monitoring arrangements, and emergency procedures are in place for sustained operation @S247 */ }
        }
        part metroOperationsControlSystem : MetroOperationsControlSystem {
            perform action a0 { doc /* provides the control room with consolidated train positions, service regulation functions, alarms, and operator command interfaces @S009 */ }
            perform action a1 { doc /* sends the Crew Login Token Bundle @S024 */ }
            perform action a2 { doc /* displays zone status, radio coverage alarms, and train supervision states @S071 */ }
            perform action a3 { doc /* displays the commanded route, locked route, point state, and track occupancy state as separate indications @S098 */ }
            perform action a4 { doc /* presents regulating options @S102 */ }
            perform action a5 { doc /* displays the proposed regulating action, affected train identities, and predicted recovery time @S104 */ }
            perform action a6 { doc /* displays station and platform states @S135 */ }
            perform action a7 { doc /* coordinates timetable deviation, platform closure, and station crowding information @S140 */ }
            perform action a8 { doc /* displays selected fault summaries to the Line Traffic Controller @S165 */ }
            perform action a9 { doc /* does not expose detailed maintenance commands at the traffic control workstation @S165 */ }
            perform action a10 { doc /* present the affected limits, the selected fallback mode, and any pending operator actions @S177 */ }
            perform action a11 { doc /* uses the Test Train Clearance Memo as a controlled prerequisite @S216 */ }
            perform action a12 { doc /* accepting security exceptions for non-revenue movement in protected territory @S216 */ }
            perform action a13 { doc /* uses the status snapshot to confirm that platform interface conditions are suitable @S233 */ }
            perform action a14 { doc /* authorizing the associated commissioning scenario @S233 */ }
        }
        part northDistrictZoneController : NorthDistrictZoneController {
            perform action a0 { doc /* calculate safe movement authority limits @S010 */ }
            perform action a1 { doc /* supervises the northern main line, the northern turnback, and the approach to East Junction Interlocking @S063 */ }
            perform action a2 { doc /* requests routes through East Junction Interlocking @S079 */ }
            perform action a3 { doc /* treats any release exception as a retained hazard @S091 */ }
            perform action a4 { doc /* applies movement authority constraints @S105 */ }
            perform action a5 { doc /* reports any conflict or unavailable route condition @S105 */ }
            perform action a6 { doc /* suppresses platform departure authority @S132 */ }
            perform action a7 { doc /* records controller health, interface state, and fallback mode transitions @S158 */ }
            perform action a8 { doc /* validating the affected track limits against its degraded-mode map @S183 */ }
            perform action a9 { doc /* applies the Temporary Speed Restriction Notice @S183 */ }
            perform action a10 { doc /* demonstrate stable supervision @S227 */ }
            exhibit state modes {
                state s0 { doc /* fallback mode @S158 */ }
            }
        }
        part operationsControl : OperationsControl;
        part operationsControlCentre : OperationsControlCentre {
            perform action a0 { doc /* distinguish an operational delay from a signalling equipment fault @S108 */ }
        }
        part passengerInformationGateway : PassengerInformationGateway {
            perform action a0 { doc /* distributes approved service messages to customer information systems @S015 */ }
            perform action a1 { doc /* receives non-vital train position and service state data @S047 */ }
            perform action a2 { doc /* receive selected service information @S076 */ }
            perform action a3 { doc /* receives the operational service state @S122 */ }
            perform action a4 { doc /* align platform messages and train destination information with the current regulating plan @S122 */ }
            perform action a5 { doc /* receives train prediction data, stopping pattern changes, and platform allocation updates @S136 */ }
            perform action a6 { doc /* publish a revised destination or skip-stop message @S137 */ }
            perform action a7 { doc /* marks the affected train movements as unavailable for boarding @S138 */ }
            perform action a8 { doc /* retaining their operational tracking in the control center @S138 */ }
            perform action a9 { doc /* issue disruption messages that are consistent with the operating limits accepted by the Line Traffic Controller @S198 */ }
        }
        part platformScreenDoorController : PlatformScreenDoorController {
            perform action a0 { doc /* exchanges platform interface indications with the train control environment @S017 */ }
            perform action a1 { doc /* exchanges door enable and closed-and-locked indications with the train interface @S046 */ }
            perform action a2 { doc /* exchanges only the permitted interface indications with the supervising wayside systems @S075 */ }
            perform action a3 { doc /* provides door closed and locked indications @S093 */ }
            perform action a4 { doc /* produces the Platform Door Status Snapshot @S129 */ }
            perform action a5 { doc /* reports closed, locked, bypassed, inhibited, and faulted conditions @S130 */ }
            perform action a6 { doc /* accept only authenticated interfaces @S221 */ }
            exhibit state modes {
                state s0 { doc /* bypassed @S130 */ }
                state s1 { doc /* closed @S130 */ }
                state s2 { doc /* faulted @S130 */ }
                state s3 { doc /* inhibited @S130 */ }
                state s4 { doc /* locked @S130 */ }
                state s5 { doc /* protected local state @S192 */ }
            }
        }
        part readinessReviewAuthority : ReadinessReviewAuthority {
            perform action a0 { doc /* assessed and approved operational restriction, maintenance response, and passenger impact @S246 */ }
        }
        part receivingZone : ReceivingZone {
            perform action a0 { doc /* validates route state, train identity, and the expected boundary track section @S067 */ }
            perform action a1 { doc /* extending authority beyond the transfer point @S067 */ }
        }
        part responsibleZoneController : ResponsibleZoneController;
        part revenueTrainOperator : RevenueTrainOperator {
            perform action a0 { doc /* compliance with instructions issued through approved operational channels @S007 */ }
            perform action a1 { doc /* entered Acknowledgements @S044 */ }
            perform action a2 { doc /* repeated back the instruction @S117 */ }
            perform action a3 { doc /* reports train condition, cab indications, passenger issues, and any local hazard @S118 */ }
            perform action a4 { doc /* reports observed cab indications, train handling effects, and passenger service impacts @S166 */ }
            perform action a5 { doc /* remains responsible for speed control, stopping accuracy, door release discipline, and compliance with verbal movement limits @S179 */ }
            perform action a6 { doc /* repeat back the movement limit, maximum permitted speed, stopping point, and any instruction to remain clear of a platform interface @S191 */ }
            perform action a7 { doc /* sends the Test Train Clearance Memo @S197 */ }
            perform action a8 { doc /* completing the prescribed proving run under restricted manual control @S197 */ }
            perform action a9 { doc /* crewed test train @S226 */ }
            perform action a10 { doc /* follows onboard indications and rulebook instructions @S244 */ }
        }
        part safetyDataCommunicationNetwork : SafetyDataCommunicationNetwork {
            perform action a0 { doc /* carries safety-related messages between approved control components @S014 */ }
            perform action a1 { doc /* provides the protected communications transport @S040 */ }
            perform action a2 { doc /* sends the Clock Drift Sample Report @S041 */ }
            perform action a3 { doc /* carries vital messages between zone controllers, interlockings, and approved interfaces @S058 */ }
            perform action a4 { doc /* carries safety-relevant station interface messages @S147 */ }
            perform action a5 { doc /* provide communication performance records @S164 */ }
        }
        part safetyRelatedPart : SafetyRelatedPart {
            perform action a0 { doc /* records time-stamped events for state changes, command acceptance, rejected commands, communication loss, and local protective actions @S152 */ }
        }
        part securityMonitoring : SecurityMonitoring;
        part serviceTimetableServer : ServiceTimetableServer {
            perform action a0 { doc /* supplies planned service data @S015 */ }
            perform action a1 { doc /* provides schedule context to Metro Operations Control System @S048 */ }
            perform action a2 { doc /* receive selected service information @S076 */ }
            perform action a3 { doc /* provides planned service context @S139 */ }
            perform action a4 { doc /* provide trial schedules @S235 */ }
        }
        part signalMaintenanceEngineer : SignalMaintenanceEngineer {
            perform action a0 { doc /* uses Maintenance Diagnostic Server to review equipment health @S022 */ }
            perform action a1 { doc /* correlate alarms @S022 */ }
            perform action a2 { doc /* support restoration without bypassing required operational authority @S022 */ }
            perform action a3 { doc /* review faults @S050 */ }
            perform action a4 { doc /* investigate degraded coverage trends @S072 */ }
            perform action a5 { doc /* verifies local track clearance evidence @S089 */ }
            perform action a6 { doc /* records the result @S089 */ }
            perform action a7 { doc /* authorising restoration of normal route setting @S089 */ }
            perform action a8 { doc /* determine whether an incident has an equipment cause or an operational cause @S119 */ }
            perform action a9 { doc /* advises the Line Traffic Controller on equipment recovery options @S120 */ }
            perform action a10 { doc /* initiates remote diagnostic sessions @S155 */ }
            perform action a11 { doc /* confirms the engineering status @S168 */ }
            perform action a12 { doc /* verifies point condition, track vacancy, and local protection using approved field procedures @S188 */ }
            perform action a13 { doc /* uses the Axle Counter Reset Request as the controlling authority for restoring a failed section @S189 */ }
            perform action a14 { doc /* request access needed for fault isolation @S214 */ }
            perform action a15 { doc /* verify that field defects raised during test running have been closed, deferred with approved controls, or assigned to a post-commissioning monitoring plan @S241 */ }
        }
        part southDistrictZoneController : SouthDistrictZoneController {
            perform action a0 { doc /* calculate safe movement authority limits @S010 */ }
            perform action a1 { doc /* supervises the southern main line, the southern turnback, and the approach to West Junction Interlocking @S064 */ }
            perform action a2 { doc /* applies the same route protection principles for interfaces with West Junction Interlocking @S080 */ }
            perform action a3 { doc /* applies the same operating principles for the southern section @S106 */ }
            perform action a4 { doc /* preserving separation margins and route locking conditions @S106 */ }
            perform action a5 { doc /* maintains comparable diagnostic coverage @S159 */ }
            perform action a6 { doc /* inhibit automatic route setting within any block whose occupancy state is under manual confirmation @S184 */ }
        }
        part stationStatusIndications : StationStatusIndications {
            exhibit state modes {
                state s0 { doc /* door interlock fault @S134 */ }
                state s1 { doc /* emergency stop active @S134 */ }
                state s2 { doc /* evacuation support @S134 */ }
                state s3 { doc /* held train @S134 */ }
                state s4 { doc /* normal service @S134 */ }
                state s5 { doc /* radio degraded @S134 */ }
            }
        }
        part supervisingWaysideSystems : SupervisingWaysideSystems;
        part systemPart : System {
            exhibit state modes {
                state s0 { doc /* degraded operation @S019 */ }
                state s1 { doc /* normal operation @S018 */ }
                state s2 { doc /* safe state @S019 */ }
            }
        }
        part trainControlEnvironment : TrainControlEnvironment;
        part trainRadioModem : TrainRadioModem {
            perform action a0 { doc /* connects each train to the Wayside Radio Access Network @S013 */ }
            perform action a1 { doc /* provides the onboard data radio function @S038 */ }
            perform action a2 { doc /* maintains CBTC sessions over Wayside Radio Access Network coverage areas @S038 */ }
            perform action a3 { doc /* reports link quality, registration state, and session continuity information @S039 */ }
            perform action a4 { doc /* maintain a stable session during normal operation @S053 */ }
            perform action a5 { doc /* maintains the active bearer used by the Atlas Onboard Controller @S055 */ }
            perform action a6 { doc /* reports radio quality changes @S055 */ }
            perform action a7 { doc /* supports continuous operational messaging @S113 */ }
            perform action a8 { doc /* uses the Encryption Certificate Renewal Pack @S146 */ }
            perform action a9 { doc /* accepting renewed secure sessions @S146 */ }
            perform action a10 { doc /* records bearer loss, reconnection timing, signal quality indicators, and message retry counts @S163 */ }
            perform action a11 { doc /* report loss of safe data connectivity @S181 */ }
            perform action a12 { doc /* not mask intermittent communication failures from the cab display @S181 */ }
            exhibit state modes {
                state s0 { doc /* normal operation @S053 */ }
            }
        }
        part voiceDispatchConsole : VoiceDispatchConsole {
            perform action a0 { doc /* provides the fallback voice coordination path @S016 */ }
            perform action a1 { doc /* provides a means for voice coordination during degraded service @S045 */ }
            perform action a2 { doc /* displays train calling identity, current platform association, and the latest operational hold reason @S141 */ }
            exhibit state modes {
                state s0 { doc /* available @S074 */ }
            }
        }
        part waysideRadioAccessNetwork : WaysideRadioAccessNetwork {
            perform action a0 { doc /* provides the radio bearer for train-to-wayside control communications @S013 */ }
            perform action a1 { doc /* provides overlapping cell coverage through stations, tunnels, crossovers, and depot approach tracks @S053 */ }
            perform action a2 { doc /* sends the Radio Handover Audit File @S073 */ }
            perform action a3 { doc /* maintain message delivery paths for station interface traffic @S145 */ }
            perform action a4 { doc /* provide communication performance records @S164 */ }
        }
        part waysideSupervision : WaysideSupervision {
            perform action a0 { doc /* compares interlocking indications, train position reports, and radio session state @S069 */ }
            perform action a1 { doc /* detect inconsistent conditions @S069 */ }
        }
        part westJunctionInterlocking : WestJunctionInterlocking {
            perform action a0 { doc /* maintain vital control of points and signals @S011 */ }
            perform action a1 { doc /* only accept commands that satisfy their configured safety rules @S011 */ }
            perform action a2 { doc /* report switch state, track occupancy, and route locking status @S068 */ }
            perform action a3 { doc /* sends the Route Release Exception List @S090 */ }
            perform action a4 { doc /* provides route state indications @S108 */ }
            perform action a5 { doc /* report route command histories, point detection changes, and protective lock status @S160 */ }
            perform action a6 { doc /* reject a route command that conflicts with a manually protected train movement @S186 */ }
        }
        flow f0 of ConsolidatedTrainPositionsAlarmsItem from metroOperationsControlSystem to controlRoom { doc /* @S009 */ }
        flow f1 of DataItem from dualChannelOdometer to atlasOnboardController { doc /* @S012 */ }
        flow f2 of ApprovedServiceMessagesItem from passengerInformationGateway to customerInformationSystems { doc /* @S015 */ }
        flow f3 of PlatformInterfaceIndicationsItem from platformScreenDoorController to trainControlEnvironment { doc /* @S017 */ }
        flow f4 of ExceptionsItem from automaticSupervision to lineTrafficController { doc /* @S018 */ }
        flow f5 of AlarmsItem from metroOperationsControlSystem to signalMaintenanceEngineer { doc /* @S022 */ }
        flow f6 of MovementAuthorityDataItem from northDistrictZoneController to atlasOnboardController { doc /* @S029 */ }
        flow f7 of MovementAuthorityDataItem from southDistrictZoneController to atlasOnboardController { doc /* @S029 */ }
        flow f8 of SpeedAndDistanceMeasurementsItem from dualChannelOdometer to atlasOnboardController { doc /* @S032 */ }
        flow f9 of LinkQualityRegistrationStateAndSessionContinuityInformationItem from trainRadioModem to atlasOnboardController { doc /* @S039 */ }
        flow f10 of AcknowledgementsItem from revenueTrainOperator to atlasOnboardController { doc /* @S044 */ }
        flow f11 of ScheduleContextItem from serviceTimetableServer to metroOperationsControlSystem { doc /* @S048 */ }
        flow f12 of RadioQualityChangesItem from trainRadioModem to atlasOnboardController { doc /* @S055 */ }
        flow f13 of TrainPositionItem from dualChannelOdometer to atlasOnboardController { doc /* @S066 */ }
        flow f14 of SwitchStateTrackOccupancyAndRouteLockingStatusItem from eastJunctionInterlocking to responsibleZoneController { doc /* @S068 */ }
        flow f15 of SwitchStateTrackOccupancyAndRouteLockingStatusItem from westJunctionInterlocking to responsibleZoneController { doc /* @S068 */ }
        flow f16 of ZoneStatusRadioCoverageAlarmsAndTrainSupervisionStatesItem from metroOperationsControlSystem to lineTrafficController { doc /* @S071 */ }
        flow f17 of PlatformInterfaceIndicationsItem from platformScreenDoorController to supervisingWaysideSystems { doc /* @S075 */ }
        flow f18 of RouteRequestsItem from northDistrictZoneController to eastJunctionInterlocking { doc /* @S079 */ }
        flow f19 of RouteReleaseExceptionListItem from westJunctionInterlocking to northDistrictZoneController { doc /* @S091 */ }
        flow f20 of DoorClosedAndLockedIndicationsItem from platformScreenDoorController to supervisingWaysideSystems { doc /* @S093 */ }
        flow f21 of CrewLoginTokenBundleItem from metroOperationsControlSystem to atlasOnboardController { doc /* @S095 */ }
        flow f22 of MessagesCarryingRouteStatusItem from trainRadioModem to waysideRadioAccessNetwork { doc /* @S096 */ }
        flow f23 of CommandedRouteLockedRoutePointStateAndTrackOccupancyStateItem from metroOperationsControlSystem to controlStaff { doc /* @S098 */ }
        flow f24 of ProposedRegulatingActionAffectedTrainIdentitiesAndPredictedRecoveryTimeItem from metroOperationsControlSystem to lineTrafficController { doc /* @S104 */ }
        flow f25 of ConflictOrUnavailableRouteConditionItem from northDistrictZoneController to lineTrafficController { doc /* @S105 */ }
        flow f26 of RouteStateIndicationsItem from westJunctionInterlocking to operationsControlCentre { doc /* @S108 */ }
        flow f27 of DirectVerbalInstructionItem from voiceDispatchConsole to revenueTrainOperator { doc /* @S117 */ }
        flow f28 of NonVitalTrendDataItem from maintenanceDiagnosticServer to signalMaintenanceEngineer { doc /* @S119 */ }
        flow f29 of EquipmentRecoveryOptionsItem from signalMaintenanceEngineer to lineTrafficController { doc /* @S120 */ }
        flow f30 of ClockDriftSampleReportItem from safetyDataCommunicationNetwork to cryptographicKeyManagementAppliance { doc /* @S123 */ }
        flow f31 of PlatformDoorStatusSnapshotItem from platformScreenDoorController to communicationsBasedTrainControlSystem { doc /* @S129 */ }
        flow f32 of UnsafeDoorInterfaceStateItem from platformScreenDoorController to northDistrictZoneController { doc /* @S132 */ }
        flow f33 of TrainPredictionDataStoppingPatternChangesAndPlatformAllocationUpdatesItem from cBTCSystem to passengerInformationGateway { doc /* @S136 */ }
        flow f34 of StationInterfaceFaultsRejectedCommandsAndInconsistentIndicationsItem from maintenanceDiagnosticServer to signalMaintenanceEngineer { doc /* @S148 */ }
        flow f35 of BrakeCurveChecksumLogItem from atlasOnboardController to maintenanceDiagnosticServer { doc /* @S154 */ }
        flow f36 of RouteReleaseExceptionListItem from westJunctionInterlocking to lineTrafficController { doc /* @S157 */ }
        flow f37 of SelectedFaultSummariesItem from metroOperationsControlSystem to lineTrafficController { doc /* @S165 */ }
        flow f38 of LossOfSafeDataConnectivityItem from trainRadioModem to atlasOnboardController { doc /* @S181 */ }
        flow f39 of AxleCounterResetRequestItem from eastJunctionInterlocking to signalMaintenanceEngineer { doc /* @S189 */ }
        flow f40 of RecordedHandbackItem from maintenanceControl to operationsControl { doc /* @S199 */ }
        flow f41 of SecurityEventsItem from safetyDataCommunicationNetwork to cyberSecurityOfficer { doc /* @S202 */ }
        flow f42 of SecurityEventsItem from waysideRadioAccessNetwork to cyberSecurityOfficer { doc /* @S202 */ }
        flow f43 of SecurityEventsItem from metroOperationsControlSystem to cyberSecurityOfficer { doc /* @S202 */ }
        flow f44 of RadioHandoverAuditFileItem from waysideRadioAccessNetwork to cyberSecurityOfficer { doc /* @S206 */ }
        flow f45 of TestTrainClearanceMemoItem from revenueTrainOperator to metroOperationsControlSystem { doc /* @S216 */ }
        flow f46 of PlatformDoorStatusSnapshotItem from platformScreenDoorController to metroOperationsControlSystem { doc /* @S233 */ }
    }
    requirement def R0 { doc /* During normal operation, automatic supervision is expected to regulate headways, enforce safe separation, and present the Line Traffic Controller with exceptions rather than routine control steps. @S018 */ subject s : AutomaticSupervision; }
    requirement def R1 { doc /* its state is not allowed to override movement authority logic @S075 */ subject s : PlatformScreenDoorController; }
    requirement def R2 { doc /* The Passenger Information Gateway shall not publish a revised destination or skip-stop message until the underlying train identity and route have been confirmed by the CBTC system. @S137 */ subject s : PassengerInformationGateway; }
    requirement def R3 { doc /* Kestrel shall report train door enable side, berth identity, and departure readiness to support platform interface checks during dwell and dispatch. @S144 */ subject s : AtlasOnboardController; }
    requirement def R4 { doc /* Saffron shall maintain message delivery paths for station interface traffic during normal radio coverage transitions and degraded coverage recovery. @S145 */ subject s : WaysideRadioAccessNetwork; }
    requirement def R5 { doc /* The Metro Operations Control System shall present the affected limits, the selected fallback mode, and any pending operator actions without obscuring safety alarms. @S177 */ subject s : MetroOperationsControlSystem; }
    requirement def R6 { doc /* The Dual Channel Odometer shall cause the train location to be treated as uncertain when its channels disagree beyond the permitted tolerance. @S180 */ subject s : DualChannelOdometer; }
    requirement def R7 { doc /* The Train Radio Modem shall report loss of safe data connectivity to the Atlas Onboard Controller and shall not mask intermittent communication failures from the cab display. @S181 */ subject s : TrainRadioModem; }
    requirement def R8 { doc /* Orchid shall inhibit automatic route setting within any block whose occupancy state is under manual confirmation. @S184 */ subject s : SouthDistrictZoneController; }
    requirement def R9 { doc /* The East Junction Interlocking shall hold commanded points locked until field confirmation or a verified diagnostic indication supports a safe release. @S185 */ subject s : EastJunctionInterlocking; }
    requirement def R10 { doc /* The West Junction Interlocking shall reject a route command that conflicts with a manually protected train movement. @S186 */ subject s : WestJunctionInterlocking; }
    requirement def R11 { doc /* Restricted manual movements shall be authorized through the Voice Dispatch Console unless the contingency communications procedure has been formally invoked. @S190 */ subject s : VoiceDispatchConsole; }
    requirement def R12 { doc /* The Revenue Train Operator shall repeat back the movement limit, maximum permitted speed, stopping point, and any instruction to remain clear of a platform interface. @S191 */ subject s : RevenueTrainOperator; }
    requirement def R13 { doc /* Reset authorizations require concurrence between the Line Traffic Controller and the Signal Maintenance Engineer when the reset can change route availability or occupancy status. @S193 */ subject s : LineTrafficController; }
    requirement def R14 { doc /* Quarry shall mark each degraded-mode diagnostic session with the incident identifier before any component restart is attempted. @S194 */ subject s : MaintenanceDiagnosticServer; }
    requirement def R15 { doc /* The Cyber Security Officer shall review any degraded condition that involves authentication failure, unexpected lockout, or abnormal network access behavior. @S195 */ subject s : CyberSecurityOfficer; }
    requirement def R16 { doc /* The Cryptographic Key Management Appliance shall not be bypassed to accelerate service recovery unless the approved emergency security procedure is active. @S196 */ subject s : CryptographicKeyManagementAppliance; }
    requirement def R17 { doc /* The Passenger Information Gateway shall issue disruption messages that are consistent with the operating limits accepted by the Line Traffic Controller. @S198 */ subject s : PassengerInformationGateway; }
    requirement def R18 { doc /* Cybersecurity controls for the Greenvale Metro Communications-Based Train Control System shall be treated as operating prerequisites for safe automatic train movement after any maintenance handback. @S200 */ subject s : CommunicationsBasedTrainControlSystem; }
    requirement def R19 { doc /* The Cyber Security Officer shall maintain continuous monitoring of security events from the Safety Data Communication Network, the Wayside Radio Access Network, and the Metro Operations Control System. @S202 */ subject s : CyberSecurityOfficer; }
    requirement def R20 { doc /* Security monitoring shall correlate authentication failures, session resets, rejected messages, configuration changes, and abnormal timing patterns without altering any safety command path. @S203 */ subject s : SecurityMonitoring; }
    requirement def R21 { doc /* The Line Traffic Controller shall be notified when a cybersecurity event requires a restriction on automatic operation or a change in communications mode. @S205 */ subject s : LineTrafficController; }
    requirement def R22 { doc /* The Cryptographic Key Management Appliance shall be the controlled source for operational certificates used by trainborne, wayside, control center, and maintenance components. @S207 */ subject s : CryptographicKeyManagementAppliance; }
    requirement def R23 { doc /* Falcon shall reject any control message with an invalid signature, an expired certificate, or a sequence value outside the accepted window. @S210 */ subject s : EastJunctionInterlocking; }
    requirement def R24 { doc /* The Maintenance Diagnostic Server shall not be used to bypass certificate checks or to create alternate trust paths into safety-related communications. @S212 */ subject s : MaintenanceDiagnosticServer; }
    requirement def R25 { doc /* Administrative access to the Cryptographic Key Management Appliance shall require named accounts, multifactor authentication, separation of duties, and recorded approval for privileged changes. @S213 */ subject s : CryptographicKeyManagementAppliance; }
    requirement def R26 { doc /* The Cyber Security Officer shall approve security-sensitive permissions before they are enabled. @S214 */ subject s : CyberSecurityOfficer; }
    requirement def R27 { doc /* The Revenue Train Operator shall not be assigned cybersecurity administration duties during passenger service, although security warnings presented in the cab shall remain part of normal operating awareness. @S215 */ subject s : RevenueTrainOperator; }
    requirement def R28 { doc /* Audit records shall be protected from local alteration by the component that generates them and shall be retained for the period defined by Greenvale Metro governance. @S218 */ subject s : AuditRecords; }
    requirement def R29 { doc /* The Service Timetable Server and Passenger Information Gateway shall be monitored for compromise because incorrect operational context can influence control room decisions even when safety commands remain valid. @S219 */ subject s : ServiceTimetableServer; }
    requirement def R30 { doc /* The Service Timetable Server and Passenger Information Gateway shall be monitored for compromise because incorrect operational context can influence control room decisions even when safety commands remain valid. @S219 */ subject s : PassengerInformationGateway; }
    requirement def R31 { doc /* The Voice Dispatch Console shall be included in security incident procedures when a cyber event changes the normal method for issuing operational instructions. @S220 */ subject s : VoiceDispatchConsole; }
    requirement def R32 { doc /* The Platform Screen Door Controller shall accept only authenticated interfaces approved for passenger service coordination and maintenance testing. @S221 */ subject s : PlatformScreenDoorController; }
    requirement def R33 { doc /* The Dual Channel Odometer and Atlas Onboard Controller shall report security-relevant diagnostic conditions in a manner that supports investigation without exposing cryptographic material. @S222 */ subject s : DualChannelOdometer; }
    requirement def R34 { doc /* The Dual Channel Odometer and Atlas Onboard Controller shall report security-relevant diagnostic conditions in a manner that supports investigation without exposing cryptographic material. @S222 */ subject s : AtlasOnboardController; }
    requirement def R35 { doc /* Each test train shall be crewed by a Revenue Train Operator qualified for commissioning duties and supported by a Line Traffic Controller with authority to stop the trial when observed conditions depart from the approved script. @S226 */ subject s : RevenueTrainOperator; }
    requirement def R36 { doc /* The South District Zone Controller shall be commissioned under the same test regime so that boundary behavior is verified before whole-line operation is attempted. @S228 */ subject s : SouthDistrictZoneController; }
    requirement def R37 { doc /* East Junction Interlocking and West Junction Interlocking shall remain under enhanced monitoring during migration because route setting, point detection, and authority release behavior are critical to mixed-mode operation. @S229 */ subject s : EastJunctionInterlocking; }
    requirement def R38 { doc /* East Junction Interlocking and West Junction Interlocking shall remain under enhanced monitoring during migration because route setting, point detection, and authority release behavior are critical to mixed-mode operation. @S229 */ subject s : WestJunctionInterlocking; }
    requirement def R39 { doc /* Before any cutover stage, the Safety Data Communication Network and Wayside Radio Access Network shall be verified for coverage, latency, redundancy, and alarm presentation at the control center. @S232 */ subject s : SafetyDataCommunicationNetwork; }
    requirement def R40 { doc /* Before any cutover stage, the Safety Data Communication Network and Wayside Radio Access Network shall be verified for coverage, latency, redundancy, and alarm presentation at the control center. @S232 */ subject s : WaysideRadioAccessNetwork; }
    requirement def R41 { doc /* The Platform Screen Door Controller shall be included in end-to-end tests that confirm safe coordination between platform equipment, train stopping position, and supervised door enablement. @S234 */ subject s : PlatformScreenDoorController; }
    requirement def R42 { doc /* The Service Timetable Server shall provide trial schedules that exercise normal headways, recovery margins, terminal reversals, and junction conflicts without carrying passengers. @S235 */ subject s : ServiceTimetableServer; }
    requirement def R43 { doc /* The Passenger Information Gateway shall be observed during operational rehearsal to confirm that public-facing messages remain consistent with the planned commissioning condition. @S236 */ subject s : PassengerInformationGateway; }
    requirement def R44 { doc /* Voice Dispatch Console procedures shall be rehearsed for test-train dispatch, abnormal stop instructions, evacuation coordination, and return to depot instructions. @S237 */ subject s : VoiceDispatchConsole; }
    requirement def R45 { doc /* The Maintenance Diagnostic Server shall collect commissioning diagnostics so that intermittent radio, odometry, controller, and interlocking events can be reviewed before acceptance. @S238 */ subject s : MaintenanceDiagnosticServer; }
    requirement def R46 { doc /* The Cryptographic Key Management Appliance shall be confirmed as available, synchronized with the approved security baseline, and capable of supporting commissioning operations without manual workarounds. @S239 */ subject s : CryptographicKeyManagementAppliance; }
    requirement def R47 { doc /* A Signal Maintenance Engineer shall verify that field defects raised during test running have been closed, deferred with approved controls, or assigned to a post-commissioning monitoring plan. @S241 */ subject s : SignalMaintenanceEngineer; }
    requirement def R48 { doc /* A Cyber Security Officer shall confirm that access controls, event monitoring, operator accounts, and security incident escalation paths are effective before revenue operation is recommended. @S242 */ subject s : CyberSecurityOfficer; }
    requirement def R49 { doc /* The rehearsal shall demonstrate that the Line Traffic Controller can maintain safe service regulation while the Revenue Train Operator follows onboard indications and rulebook instructions. @S244 */ subject s : LineTrafficController; }
    requirement def R50 { doc /* No open defect shall be accepted for revenue service unless its operational restriction, maintenance response, and passenger impact have been assessed and approved by the readiness review authority. @S246 */ subject s : ReadinessReviewAuthority; }
}
