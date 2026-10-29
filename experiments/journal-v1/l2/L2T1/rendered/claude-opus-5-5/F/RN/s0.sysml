package L2Model {
    item def AcknowledgementsItem { doc /* @S044 */ }
    item def AxleCounterResetRequestItem { doc /* @S189 */ }
    item def BrakeCurveChecksumLogItem { doc /* @S154 */ }
    item def ClockDriftSampleReportItem { doc /* @S123 */ }
    item def CrewLoginTokenBundleItem { doc /* @S095 */ }
    item def DataItem { doc /* @S012 */ }
    item def EncryptionCertificateRenewalPackItem { doc /* @S146 */ }
    item def LinkQualityRegistrationStateAndSessionContinuityInformationItem { doc /* @S039 */ }
    item def LossOfSafeDataConnectivityItem { doc /* @S181 */ }
    item def MovementAuthorityDataItem { doc /* @S029 */ }
    item def NonVitalTrendDataItem { doc /* @S119 */ }
    item def PlatformDoorStatusSnapshotItem { doc /* @S233 */ }
    item def ProposedRegulatingActionAffectedTrainIdentitiesAndPredictedRecoveryTimeItem { doc /* @S104 */ }
    item def RadioHandoverAuditFileItem { doc /* @S206 */ }
    item def RouteReleaseExceptionListItem { doc /* @S157 */ }
    item def ScheduleContextItem { doc /* @S048 */ }
    item def SelectedFaultSummariesItem { doc /* @S165 */ }
    item def TemporarySpeedRestrictionNoticeItem { doc /* @S183 */ }
    item def TestTrainClearanceMemoItem { doc /* @S216 */ }
    item def TrainPositionItem { doc /* @S066 */ }
    item def TrainPredictionDataStoppingPatternChangesAndPlatformAllocationUpdatesItem { doc /* @S136 */ }
    item def ZoneStatusRadioCoverageAlarmsAndTrainSupervisionStatesItem { doc /* @S071 */ }
    part def AtlasOnboardController { doc /* @S012,S025,S027,S028,S029,S032,S036,S037,S039,S044,S057,S066,S095,S111,S144,S154,S161,S178,S181,S222 */ }
    part def CommunicationsBasedTrainControlSystem { doc /* @S002,S018,S019,S136,S150,S200 */ }
    part def CryptographicKeyManagementAppliance { doc /* @S123,S124,S146,S196,S207,S213,S239 */ }
    part def CyberSecurityOfficer { doc /* @S023,S149,S156,S195,S202,S206,S214,S242 */ }
    part def DualChannelOdometer { doc /* @S012,S031,S066,S180,S222 */ }
    part def EastJunctionInterlocking { doc /* @S011,S068,S087,S107,S185,S189,S210,S229 */ }
    part def LineTrafficController { doc /* @S006,S071,S103,S104,S109,S110,S116,S142,S157,S165,S176,S183,S205,S244 */ }
    part def MaintenanceDiagnosticServer { doc /* @S050,S072,S100,S119,S148,S154,S194,S212,S238 */ }
    part def MetroOperationsControlSystem { doc /* @S009,S024,S048,S071,S095,S098,S102,S104,S135,S140,S165,S177,S216,S233 */ }
    part def NorthDistrictZoneController { doc /* @S010,S029,S063,S079,S105,S132,S158,S183 */ }
    part def PassengerInformationGateway { doc /* @S015,S047,S136,S137,S198,S219,S236 */ }
    part def PlatformScreenDoorController { doc /* @S017,S046,S093,S129,S221,S233,S234 */ }
    part def RevenueTrainOperator { doc /* @S043,S044,S118,S191,S197,S215,S216 */ }
    part def SafetyDataCommunicationNetwork { doc /* @S014,S041,S058,S123,S232 */ }
    part def ServiceTimetableServer { doc /* @S015,S048,S219,S235 */ }
    part def SignalMaintenanceEngineer { doc /* @S022,S089,S119,S120,S155,S189,S241 */ }
    part def SouthDistrictZoneController { doc /* @S010,S029,S064,S080,S184,S228 */ }
    part def TrainRadioModem { doc /* @S013,S038,S039,S055,S146,S163,S181 */ }
    part def VoiceDispatchConsole { doc /* @S016,S141,S190,S220,S237 */ }
    part def WaysideRadioAccessNetwork { doc /* @S053,S073,S145,S206,S232 */ }
    part def WestJunctionInterlocking { doc /* @S011,S068,S090,S108,S157,S186,S229 */ }
    part system {
        part atlasOnboardController : AtlasOnboardController {
            perform action a0 { doc /* supervises automatic train protection functions @S012 */ }
            perform action a1 { doc /* assumes the active train control role @S025 */ }
            perform action a2 { doc /* supervises movement authority processing, onboard speed enforcement, door enable logic @S027 */ }
            perform action a3 { doc /* compares the two odometry channels @S032 */ }
            perform action a4 { doc /* degrades the operating mode @S032 */ }
            perform action a5 { doc /* recalculates the braking demand @S036 */ }
            perform action a6 { doc /* produces the Brake Curve Checksum Log @S037 */ }
            perform action a7 { doc /* falls back to the last validated movement authority rules @S057 */ }
            perform action a8 { doc /* confirms train position @S066 */ }
            perform action a9 { doc /* validate that onboard operating context is current @S095 */ }
            perform action a10 { doc /* enforces the active movement profile @S111 */ }
            perform action a11 { doc /* stores onboard fault codes @S161 */ }
            exhibit state modes {
                state s0 { doc /* automatic train operation @S028 */ }
                state s1 { doc /* cutout @S028 */ }
                state s2 { doc /* fallback operation @S028 */ }
                state s3 { doc /* initialization @S028 */ }
                state s4 { doc /* protected manual operation @S028 */ }
                state s5 { doc /* restricted manual operation @S178 */ }
            }
        }
        part communicationsBasedTrainControlSystem : CommunicationsBasedTrainControlSystem {
            perform action a0 { doc /* supervising train separation, movement authority, and service regulation @S002 */ }
            exhibit state modes {
                state s0 { doc /* degraded operation @S019 */ }
                state s1 { doc /* normal operation @S018 */ }
            }
        }
        part cryptographicKeyManagementAppliance : CryptographicKeyManagementAppliance {
            perform action a0 { doc /* produces the Encryption Certificate Renewal Pack @S124 */ }
        }
        part cyberSecurityOfficer : CyberSecurityOfficer {
            perform action a0 { doc /* oversees access controls @S023 */ }
            perform action a1 { doc /* reviews access rights @S149 */ }
            perform action a2 { doc /* reviews privileged diagnostic access logs @S156 */ }
        }
        part dualChannelOdometer : DualChannelOdometer;
        part eastJunctionInterlocking : EastJunctionInterlocking {
            perform action a0 { doc /* maintain vital control of points and signals @S011 */ }
            perform action a1 { doc /* holds the route locked @S107 */ }
        }
        part lineTrafficController : LineTrafficController {
            perform action a0 { doc /* monitoring service performance @S006 */ }
            perform action a1 { doc /* coordinating incident response @S006 */ }
            perform action a2 { doc /* selects holding, skip-stop, turnback, or run-through measures @S103 */ }
            perform action a3 { doc /* produces the Temporary Speed Restriction Notice @S109 */ }
            perform action a4 { doc /* monitors actual train performance @S110 */ }
            perform action a5 { doc /* records the initial event time, train identifier, location, passenger impact @S116 */ }
            perform action a6 { doc /* apply a station hold @S142 */ }
            perform action a7 { doc /* declared a degraded mode @S176 */ }
        }
        part maintenanceDiagnosticServer : MaintenanceDiagnosticServer {
            perform action a0 { doc /* collects non-vital health indications @S050 */ }
            perform action a1 { doc /* records route command outcomes, point operation timing, and detection transitions @S100 */ }
            perform action a2 { doc /* records station interface faults, rejected commands, and inconsistent indications @S148 */ }
        }
        part metroOperationsControlSystem : MetroOperationsControlSystem {
            perform action a0 { doc /* presents regulating options @S102 */ }
            perform action a1 { doc /* coordinates timetable deviation, platform closure, and station crowding information @S140 */ }
        }
        part northDistrictZoneController : NorthDistrictZoneController {
            perform action a0 { doc /* calculate safe movement authority limits @S010 */ }
            perform action a1 { doc /* supervises the northern main line @S063 */ }
            perform action a2 { doc /* requests routes through East Junction Interlocking @S079 */ }
            perform action a3 { doc /* applies movement authority constraints @S105 */ }
            perform action a4 { doc /* suppresses platform departure authority @S132 */ }
            perform action a5 { doc /* records controller health, interface state, and fallback mode transitions @S158 */ }
        }
        part passengerInformationGateway : PassengerInformationGateway;
        part platformScreenDoorController : PlatformScreenDoorController {
            perform action a0 { doc /* exchanges platform interface indications @S017 */ }
            perform action a1 { doc /* exchanges door enable and closed-and-locked indications @S046 */ }
            perform action a2 { doc /* produces the Platform Door Status Snapshot @S129 */ }
        }
        part revenueTrainOperator : RevenueTrainOperator {
            perform action a0 { doc /* sends the Test Train Clearance Memo @S197 */ }
        }
        part safetyDataCommunicationNetwork : SafetyDataCommunicationNetwork {
            perform action a0 { doc /* carries safety-related messages @S014 */ }
            perform action a1 { doc /* carries vital messages @S058 */ }
        }
        part serviceTimetableServer : ServiceTimetableServer {
            perform action a0 { doc /* supplies planned service data @S015 */ }
        }
        part signalMaintenanceEngineer : SignalMaintenanceEngineer {
            perform action a0 { doc /* review equipment health, correlate alarms @S022 */ }
            perform action a1 { doc /* verifies local track clearance evidence and records the result @S089 */ }
            perform action a2 { doc /* advises the Line Traffic Controller on equipment recovery options @S120 */ }
            perform action a3 { doc /* initiated Remote diagnostic sessions @S155 */ }
        }
        part southDistrictZoneController : SouthDistrictZoneController {
            perform action a0 { doc /* calculate safe movement authority limits @S010 */ }
            perform action a1 { doc /* supervises the southern main line @S064 */ }
            perform action a2 { doc /* applies the same route protection principles @S080 */ }
        }
        part trainRadioModem : TrainRadioModem {
            perform action a0 { doc /* connects each train to the Wayside Radio Access Network @S013 */ }
            perform action a1 { doc /* maintains CBTC sessions @S038 */ }
            perform action a2 { doc /* records bearer loss, reconnection timing, signal quality indicators, and message retry counts @S163 */ }
        }
        part voiceDispatchConsole : VoiceDispatchConsole {
            perform action a0 { doc /* provides the fallback voice coordination path @S016 */ }
        }
        part waysideRadioAccessNetwork : WaysideRadioAccessNetwork {
            perform action a0 { doc /* provides overlapping cell coverage @S053 */ }
        }
        part westJunctionInterlocking : WestJunctionInterlocking {
            perform action a0 { doc /* maintain vital control of points and signals @S011 */ }
        }
        flow f0 of DataItem from dualChannelOdometer to atlasOnboardController { doc /* @S012 */ }
        flow f1 of MovementAuthorityDataItem from northDistrictZoneController to atlasOnboardController { doc /* @S029 */ }
        flow f2 of MovementAuthorityDataItem from southDistrictZoneController to atlasOnboardController { doc /* @S029 */ }
        flow f3 of LinkQualityRegistrationStateAndSessionContinuityInformationItem from trainRadioModem to atlasOnboardController { doc /* @S039 */ }
        flow f4 of AcknowledgementsItem from revenueTrainOperator to atlasOnboardController { doc /* @S044 */ }
        flow f5 of ScheduleContextItem from serviceTimetableServer to metroOperationsControlSystem { doc /* @S048 */ }
        flow f6 of TrainPositionItem from dualChannelOdometer to atlasOnboardController { doc /* @S066 */ }
        flow f7 of ZoneStatusRadioCoverageAlarmsAndTrainSupervisionStatesItem from metroOperationsControlSystem to lineTrafficController { doc /* @S071 */ }
        flow f8 of CrewLoginTokenBundleItem from metroOperationsControlSystem to atlasOnboardController { doc /* @S095 */ }
        flow f9 of ProposedRegulatingActionAffectedTrainIdentitiesAndPredictedRecoveryTimeItem from metroOperationsControlSystem to lineTrafficController { doc /* @S104 */ }
        flow f10 of NonVitalTrendDataItem from maintenanceDiagnosticServer to signalMaintenanceEngineer { doc /* @S119 */ }
        flow f11 of ClockDriftSampleReportItem from safetyDataCommunicationNetwork to cryptographicKeyManagementAppliance { doc /* @S123 */ }
        flow f12 of TrainPredictionDataStoppingPatternChangesAndPlatformAllocationUpdatesItem from communicationsBasedTrainControlSystem to passengerInformationGateway { doc /* @S136 */ }
        flow f13 of EncryptionCertificateRenewalPackItem from cryptographicKeyManagementAppliance to trainRadioModem { doc /* @S146 */ }
        flow f14 of BrakeCurveChecksumLogItem from atlasOnboardController to maintenanceDiagnosticServer { doc /* @S154 */ }
        flow f15 of RouteReleaseExceptionListItem from westJunctionInterlocking to lineTrafficController { doc /* @S157 */ }
        flow f16 of SelectedFaultSummariesItem from metroOperationsControlSystem to lineTrafficController { doc /* @S165 */ }
        flow f17 of LossOfSafeDataConnectivityItem from trainRadioModem to atlasOnboardController { doc /* @S181 */ }
        flow f18 of TemporarySpeedRestrictionNoticeItem from lineTrafficController to northDistrictZoneController { doc /* @S183 */ }
        flow f19 of AxleCounterResetRequestItem from eastJunctionInterlocking to signalMaintenanceEngineer { doc /* @S189 */ }
        flow f20 of RadioHandoverAuditFileItem from waysideRadioAccessNetwork to cyberSecurityOfficer { doc /* @S206 */ }
        flow f21 of TestTrainClearanceMemoItem from revenueTrainOperator to metroOperationsControlSystem { doc /* @S216 */ }
        flow f22 of PlatformDoorStatusSnapshotItem from platformScreenDoorController to metroOperationsControlSystem { doc /* @S233 */ }
    }
    requirement def R0 { doc /* shall not publish a revised destination or skip-stop message until the underlying train identity and route have been confirmed by the CBTC system @S137 */ subject s : PassengerInformationGateway; }
    requirement def R1 { doc /* shall report train door enable side, berth identity, and departure readiness @S144 */ subject s : AtlasOnboardController; }
    requirement def R2 { doc /* shall maintain message delivery paths for station interface traffic @S145 */ subject s : WaysideRadioAccessNetwork; }
    requirement def R3 { doc /* requires explicit controller action before restoring automatic departure support @S150 */ subject s : CommunicationsBasedTrainControlSystem; }
    requirement def R4 { doc /* shall present the affected limits, the selected fallback mode, and any pending operator actions without obscuring safety alarms @S177 */ subject s : MetroOperationsControlSystem; }
    requirement def R5 { doc /* shall cause the train location to be treated as uncertain when its channels disagree beyond the permitted tolerance @S180 */ subject s : DualChannelOdometer; }
    requirement def R6 { doc /* shall report loss of safe data connectivity to the Atlas Onboard Controller and shall not mask intermittent communication failures from the cab display @S181 */ subject s : TrainRadioModem; }
    requirement def R7 { doc /* shall inhibit automatic route setting within any block whose occupancy state is under manual confirmation @S184 */ subject s : SouthDistrictZoneController; }
    requirement def R8 { doc /* shall hold commanded points locked until field confirmation or a verified diagnostic indication supports a safe release @S185 */ subject s : EastJunctionInterlocking; }
    requirement def R9 { doc /* shall reject a route command that conflicts with a manually protected train movement @S186 */ subject s : WestJunctionInterlocking; }
    requirement def R10 { doc /* Restricted manual movements shall be authorized through the Voice Dispatch Console unless the contingency communications procedure has been formally invoked @S190 */ subject s : VoiceDispatchConsole; }
    requirement def R11 { doc /* shall repeat back the movement limit, maximum permitted speed, stopping point, and any instruction to remain clear of a platform interface @S191 */ subject s : RevenueTrainOperator; }
    requirement def R12 { doc /* shall mark each degraded-mode diagnostic session with the incident identifier before any component restart is attempted @S194 */ subject s : MaintenanceDiagnosticServer; }
    requirement def R13 { doc /* shall review any degraded condition that involves authentication failure, unexpected lockout, or abnormal network access behavior @S195 */ subject s : CyberSecurityOfficer; }
    requirement def R14 { doc /* shall not be bypassed to accelerate service recovery unless the approved emergency security procedure is active @S196 */ subject s : CryptographicKeyManagementAppliance; }
    requirement def R15 { doc /* shall issue disruption messages that are consistent with the operating limits accepted by the Line Traffic Controller @S198 */ subject s : PassengerInformationGateway; }
    requirement def R16 { doc /* Cybersecurity controls shall be treated as operating prerequisites for safe automatic train movement after any maintenance handback @S200 */ subject s : CommunicationsBasedTrainControlSystem; }
    requirement def R17 { doc /* shall maintain continuous monitoring of security events from the Safety Data Communication Network, the Wayside Radio Access Network, and the Metro Operations Control System @S202 */ subject s : CyberSecurityOfficer; }
    requirement def R18 { doc /* shall be notified when a cybersecurity event requires a restriction on automatic operation or a change in communications mode @S205 */ subject s : LineTrafficController; }
    requirement def R19 { doc /* shall be the controlled source for operational certificates @S207 */ subject s : CryptographicKeyManagementAppliance; }
    requirement def R20 { doc /* shall reject any control message with an invalid signature, an expired certificate, or a sequence value outside the accepted window @S210 */ subject s : EastJunctionInterlocking; }
    requirement def R21 { doc /* shall not be used to bypass certificate checks or to create alternate trust paths into safety-related communications @S212 */ subject s : MaintenanceDiagnosticServer; }
    requirement def R22 { doc /* Administrative access shall require named accounts, multifactor authentication, separation of duties, and recorded approval for privileged changes @S213 */ subject s : CryptographicKeyManagementAppliance; }
    requirement def R23 { doc /* shall approve security-sensitive permissions before they are enabled @S214 */ subject s : CyberSecurityOfficer; }
    requirement def R24 { doc /* shall not be assigned cybersecurity administration duties during passenger service @S215 */ subject s : RevenueTrainOperator; }
    requirement def R25 { doc /* shall be monitored for compromise @S219 */ subject s : ServiceTimetableServer; }
    requirement def R26 { doc /* shall be monitored for compromise @S219 */ subject s : PassengerInformationGateway; }
    requirement def R27 { doc /* shall be included in security incident procedures when a cyber event changes the normal method for issuing operational instructions @S220 */ subject s : VoiceDispatchConsole; }
    requirement def R28 { doc /* shall accept only authenticated interfaces approved for passenger service coordination and maintenance testing @S221 */ subject s : PlatformScreenDoorController; }
    requirement def R29 { doc /* shall report security-relevant diagnostic conditions without exposing cryptographic material @S222 */ subject s : DualChannelOdometer; }
    requirement def R30 { doc /* shall report security-relevant diagnostic conditions without exposing cryptographic material @S222 */ subject s : AtlasOnboardController; }
    requirement def R31 { doc /* shall be commissioned under the same test regime @S228 */ subject s : SouthDistrictZoneController; }
    requirement def R32 { doc /* shall remain under enhanced monitoring during migration @S229 */ subject s : EastJunctionInterlocking; }
    requirement def R33 { doc /* shall remain under enhanced monitoring during migration @S229 */ subject s : WestJunctionInterlocking; }
    requirement def R34 { doc /* shall be verified for coverage, latency, redundancy, and alarm presentation before any cutover stage @S232 */ subject s : SafetyDataCommunicationNetwork; }
    requirement def R35 { doc /* shall be verified for coverage, latency, redundancy, and alarm presentation before any cutover stage @S232 */ subject s : WaysideRadioAccessNetwork; }
    requirement def R36 { doc /* shall be included in end-to-end tests @S234 */ subject s : PlatformScreenDoorController; }
    requirement def R37 { doc /* shall provide trial schedules @S235 */ subject s : ServiceTimetableServer; }
    requirement def R38 { doc /* shall be observed during operational rehearsal @S236 */ subject s : PassengerInformationGateway; }
    requirement def R39 { doc /* procedures shall be rehearsed @S237 */ subject s : VoiceDispatchConsole; }
    requirement def R40 { doc /* shall collect commissioning diagnostics @S238 */ subject s : MaintenanceDiagnosticServer; }
    requirement def R41 { doc /* shall be confirmed as available, synchronized with the approved security baseline @S239 */ subject s : CryptographicKeyManagementAppliance; }
    requirement def R42 { doc /* shall verify that field defects raised during test running have been closed, deferred, or assigned @S241 */ subject s : SignalMaintenanceEngineer; }
    requirement def R43 { doc /* shall confirm that access controls, event monitoring, operator accounts, and security incident escalation paths are effective @S242 */ subject s : CyberSecurityOfficer; }
    requirement def R44 { doc /* The rehearsal shall demonstrate that the Line Traffic Controller can maintain safe service regulation @S244 */ subject s : LineTrafficController; }
}
