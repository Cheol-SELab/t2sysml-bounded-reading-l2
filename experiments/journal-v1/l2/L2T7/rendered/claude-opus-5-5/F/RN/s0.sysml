package L2Model {
    item def AntennaDeicingNoticeItem { doc /* @S044 */ }
    item def AntennaStatusLinkConfigurationTimingReferencesAndRoutingReadinessItem { doc /* @S079 */ }
    item def CalibrationPatchBundleItem { doc /* @S094 */ }
    item def CatalogueRecordsItem { doc /* @S181 */ }
    item def CommandAndTelemetryTrafficItem { doc /* @S054 */ }
    item def CommandPreparationPackageItem { doc /* @S118 */ }
    item def DopplerResidualReportItem { doc /* @S131 */ }
    item def EphemerisDeltaNoteItem { doc /* @S144 */ }
    item def LaserRetroreflectorWindowItem { doc /* @S145 */ }
    item def LatestSpacecraftStateItem { doc /* @S122 */ }
    item def LocalConstraintsNotificationItem { doc /* @S043 */ }
    item def ManeuverRecommendationPackageItem { doc /* @S137 */ }
    item def ObservationRequestsItem { doc /* @S101 */ }
    item def OperationalConstraintsItem { doc /* @S099 */ }
    item def OrbitPredictionsAndVisibilityAssumptionsItem { doc /* @S106 */ }
    item def OrbitQualityStateChangesItem { doc /* @S194 */ }
    item def PassReplayPacketItem { doc /* @S081 */ }
    item def PayloadDownlinkTrafficItem { doc /* @S055 */ }
    item def PlanningMetadataItem { doc /* @S110 */ }
    item def ProductHoldListItem { doc /* @S168 */ }
    item def ProductPackageAssociatedQualityMetadataAndChecksumEvidenceItem { doc /* @S178 */ }
    item def RoutineEphemeridesAndEventPredictionsItem { doc /* @S141 */ }
    item def SecurityExceptionTicketItem { doc /* @S074 */ }
    item def StarTrackerMaskFileItem { doc /* @S139 */ }
    item def StorageWatermarkSnapshotItem { doc /* @S174 */ }
    item def TimingAlarmsItem { doc /* @S072 */ }
    item def TransfersItem { doc /* @S065 */ }
    part def BackupProcessingCluster { doc /* @S004,S150,S173,S174,S241 */ }
    part def CommandValidationGateway { doc /* @S004,S012,S119,S121,S122,S139,S143,S206,S242 */ }
    part def ConsoleLead { doc /* @S084 */ }
    part def CybersecurityDesk { doc /* @S023,S074,S125,S200,S204,S212,S238 */ }
    part def FlightDynamicsFacility { doc /* @S004,S008,S040,S106,S132,S139,S141,S194,S231 */ }
    part def FlightDynamicsTeam { doc /* @S071,S088,S116,S131,S134,S136,S137,S144,S210,S236 */ }
    part def GroundNetworkManager { doc /* @S019,S038,S044,S067,S076,S112,S209,S222,S234 */ }
    part def GroundSegment { doc /* @S004,S005,S025,S218,S219 */ }
    part def KirunaXBandAntenna { doc /* @S005,S030,S055 */ }
    part def LocalStationTeams { doc /* @S042 */ }
    part def LongTermArchive { doc /* @S004,S065,S149,S174,S178,S181,S187,S191,S194,S196,S243 */ }
    part def MissionControlCenter { doc /* @S004,S007,S032,S043,S054,S079,S093,S099,S100,S118,S126,S140,S141,S203,S217,S230 */ }
    part def MissionPlanningSystem { doc /* @S004,S011,S099,S101,S102,S106,S107,S110,S114,S118,S141,S144,S145,S207,S216,S240 */ }
    part def NetworkControlSystem { doc /* @S004,S010,S033,S056,S072,S074,S079,S148,S170,S171,S205,S233 */ }
    part def NorthSBandAntenna { doc /* @S005,S028,S054 */ }
    part def Operators { doc /* @S083 */ }
    part def OrbitDeterminationEngine { doc /* @S004,S014,S041,S089,S123,S128,S131,S145 */ }
    part def PayloadCalibrationTeam { doc /* @S094,S117,S161,S193,S211,S237 */ }
    part def PayloadProcessingFacility { doc /* @S004,S009,S049,S055,S110,S141,S151,S178,S215,S232 */ }
    part def PrimaryProcessingCluster { doc /* @S004,S065,S155,S220 */ }
    part def Product { doc /* @S167 */ }
    part def ProductQualityService { doc /* @S004,S015,S094,S124,S130,S162,S165,S168,S195 */ }
    part def SouthSBandAntenna { doc /* @S005,S029,S054 */ }
    part def SpacecraftOperationsTeam { doc /* @S044,S072,S081,S082,S105,S113,S137,S198,S209,S235 */ }
    part def SpacecraftSystemsEngineer { doc /* @S086 */ }
    part def StationOperators { doc /* @S043 */ }
    part def SubsystemSpecialists { doc /* @S095 */ }
    part def SvalbardXBandAntenna { doc /* @S005,S031,S055 */ }
    part def TelemetryEngineer { doc /* @S085 */ }
    part def TelemetryIngestService { doc /* @S004,S013,S048,S080,S081,S122,S153 */ }
    part def UserServicesPortal { doc /* @S004,S018,S101,S104,S168,S181,S183,S201,S225,S239 */ }
    part system {
        part backupProcessingCluster : BackupProcessingCluster {
            perform action a0 { doc /* supports product generation @S150 */ }
            perform action a1 { doc /* writes provenance that identifies the fallback execution path @S173 */ }
            perform action a2 { doc /* uses the Storage Watermark Snapshot to verify that recovery capacity is sufficient @S241 */ }
        }
        part commandValidationGateway : CommandValidationGateway {
            perform action a0 { doc /* enforces rule checks before commands are made available for uplink @S012 */ }
            perform action a1 { doc /* performs independent validation of command stacks @S119 */ }
            perform action a2 { doc /* rejects command stacks that contain unapproved manual edits, missing provenance, expired configuration references, or activities outside the planning authority window @S121 */ }
            perform action a3 { doc /* checks maneuver command parameters against the screened burn plan @S143 */ }
            perform action a4 { doc /* accepts the mask file @S206 */ }
            perform action a5 { doc /* rejects any command request that lacks the approved authorization state @S242 */ }
        }
        part consoleLead : ConsoleLead {
            perform action a0 { doc /* declaring pass status @S084 */ }
            perform action a1 { doc /* authorizing planned command execution through the Command Validation Gateway @S084 */ }
            perform action a2 { doc /* pausing the activity @S084 */ }
        }
        part cybersecurityDesk : CybersecurityDesk {
            perform action a0 { doc /* provides continuous security monitoring @S023 */ }
            perform action a1 { doc /* sends a Security Exception Ticket @S074 */ }
            perform action a2 { doc /* reviews command preparation exceptions @S125 */ }
            perform action a3 { doc /* reviews public interface changes before deployment @S200 */ }
            perform action a4 { doc /* reviews privileged access daily @S204 */ }
            perform action a5 { doc /* assumes coordination authority @S212 */ }
            perform action a6 { doc /* validating alert routing, privileged access review, and incident coordination @S238 */ }
        }
        part flightDynamicsFacility : FlightDynamicsFacility {
            perform action a0 { doc /* provides orbit analysis, maneuver planning support, access prediction, and navigation products @S008 */ }
            perform action a1 { doc /* maintains the authoritative orbit catalog @S132 */ }
            perform action a2 { doc /* sends the Star Tracker Mask File @S139 */ }
            perform action a3 { doc /* publishes orbit quality state changes to the archive operations queue @S194 */ }
            perform action a4 { doc /* provides readiness evidence @S231 */ }
        }
        part flightDynamicsTeam : FlightDynamicsTeam {
            perform action a0 { doc /* monitors timing quality @S071 */ }
            perform action a1 { doc /* support orbit assessment @S088 */ }
            perform action a2 { doc /* reviews cases where orbital uncertainty or contact geometry could reduce the execution margin @S116 */ }
            perform action a3 { doc /* uses the residual report to separate station-related tracking biases from dynamic model errors @S131 */ }
            perform action a4 { doc /* computes expected state change, execution tolerance, recovery strategy, and the earliest time when the solution can be declared stable @S134 */ }
            perform action a5 { doc /* maintains screening rules @S136 */ }
            perform action a6 { doc /* produces the Ephemeris Delta Note @S144 */ }
            perform action a7 { doc /* assesses orbit and timing effects @S210 */ }
            perform action a8 { doc /* conducts a separate rehearsal for missed tracking data and late orbit update availability @S236 */ }
        }
        part groundNetworkManager : GroundNetworkManager {
            perform action a0 { doc /* coordinates availability of the antenna assets @S019 */ }
            perform action a1 { doc /* confirms that scheduled contact opportunities are compatible with station readiness @S019 */ }
            perform action a2 { doc /* arbitrates unresolved contact conflicts @S038 */ }
            perform action a3 { doc /* verifies that station commitments remain consistent with maintenance windows and staffing limits @S038 */ }
            perform action a4 { doc /* issues the Antenna Deicing Notice @S044 */ }
            perform action a5 { doc /* verifies carrier performance @S067 */ }
            perform action a6 { doc /* checks routing state, packet loss, queue depth, and security inspection delays @S067 */ }
            perform action a7 { doc /* coordinate before blocking traffic @S076 */ }
            perform action a8 { doc /* confirms that planned station use is compatible with network maintenance windows @S112 */ }
            perform action a9 { doc /* leads triage for antenna, link, and site-service indicators @S209 */ }
            perform action a10 { doc /* Cross-site failover is coordinated @S222 */ }
            perform action a11 { doc /* accepts the antenna readiness baseline @S234 */ }
        }
        part groundSegment : GroundSegment {
            exhibit state modes {
                state s0 { doc /* essential-service mode @S219 */ }
                state s1 { doc /* monitor-only mode @S218 */ }
            }
        }
        part kirunaXBandAntenna : KirunaXBandAntenna {
            perform action a0 { doc /* high-rate payload downlink @S030 */ }
        }
        part localStationTeams : LocalStationTeams {
            perform action a0 { doc /* antenna pre-pass configuration, frequency standard verification, time correlation checks, safety interlocks, and logging of any local anomalies @S042 */ }
        }
        part longTermArchive : LongTermArchive {
            perform action a0 { doc /* retains released orbit products, covariance data, maneuver records, and quality decisions @S149 */ }
            perform action a1 { doc /* sends the Storage Watermark Snapshot @S174 */ }
            perform action a2 { doc /* retains raw acquisition data @S187 */ }
            perform action a3 { doc /* preserves the replaced product version @S196 */ }
            perform action a4 { doc /* preserves the accepted archive baseline @S243 */ }
            perform action a5 { doc /* confirms that retrieval tests meet the service objective @S243 */ }
        }
        part missionControlCenter : MissionControlCenter {
            perform action a0 { doc /* release of validated command activities @S007 */ }
            perform action a1 { doc /* maintains the operational contact schedule @S032 */ }
            perform action a2 { doc /* coordinates with the Payload Processing Facility @S093 */ }
            perform action a3 { doc /* records unresolved actions, open engineering questions, and expected specialist responses @S100 */ }
            perform action a4 { doc /* maintains the authority boundary for routine spacecraft operations @S203 */ }
            perform action a5 { doc /* Continuity modes are declared @S217 */ }
            perform action a6 { doc /* demonstrates continuous console coverage @S230 */ }
        }
        part missionPlanningSystem : MissionPlanningSystem {
            perform action a0 { doc /* converts approved imaging demand and spacecraft constraints into executable activity plans @S011 */ }
            perform action a1 { doc /* assembling candidate observation timelines and associated ground contact activities @S102 */ }
            perform action a2 { doc /* combines request priority, instrument availability, contact opportunities, onboard storage margin, and downlink capacity into a draft activity schedule @S107 */ }
            perform action a3 { doc /* flags conflicts @S114 */ }
            perform action a4 { doc /* exports a command preparation package @S118 */ }
            perform action a5 { doc /* treats the retroreflector window as a constrained planning input @S207 */ }
            perform action a6 { doc /* suspends automatic schedule publication @S216 */ }
            perform action a7 { doc /* applies the delta note during schedule validation @S240 */ }
        }
        part networkControlSystem : NetworkControlSystem {
            perform action a0 { doc /* monitors communications availability @S010 */ }
            perform action a1 { doc /* routes operational traffic @S010 */ }
            perform action a2 { doc /* distributes station allocations @S033 */ }
            perform action a3 { doc /* confirms antenna readiness states @S033 */ }
            perform action a4 { doc /* records the actual start and end times of each contact @S033 */ }
            perform action a5 { doc /* maintains operational visibility of circuit state, path selection, and active maintenance windows @S056 */ }
            perform action a6 { doc /* prepare scheduled contacts and verify tracking readiness @S148 */ }
            perform action a7 { doc /* restrict affected transfer paths @S170 */ }
            perform action a8 { doc /* enforces approved routing paths @S205 */ }
            perform action a9 { doc /* records configuration changes in the operational log @S205 */ }
            perform action a10 { doc /* records rehearsal outcomes @S233 */ }
        }
        part northSBandAntenna : NorthSBandAntenna {
            perform action a0 { doc /* provides the nominal early-pass command uplink and low-rate telemetry return @S028 */ }
        }
        part operators : Operators;
        part orbitDeterminationEngine : OrbitDeterminationEngine {
            perform action a0 { doc /* processing tracking inputs and producing controlled orbit knowledge @S014 */ }
            perform action a1 { doc /* produces the Doppler Residual Report @S041 */ }
            perform action a2 { doc /* supports routine state updates @S089 */ }
            perform action a3 { doc /* fits dynamic orbit solutions @S128 */ }
            perform action a4 { doc /* produces the Laser Retroreflector Window @S145 */ }
        }
        part payloadCalibrationTeam : PayloadCalibrationTeam {
            perform action a0 { doc /* sends the Calibration Patch Bundle @S094 */ }
            perform action a1 { doc /* reviews planned calibration activities @S117 */ }
            perform action a2 { doc /* maintains the approved calibration baseline @S161 */ }
            perform action a3 { doc /* request a reprocessing campaign @S193 */ }
            perform action a4 { doc /* assesses product integrity @S211 */ }
            perform action a5 { doc /* validates that calibration operations are represented in the rehearsal schedule @S237 */ }
        }
        part payloadProcessingFacility : PayloadProcessingFacility {
            perform action a0 { doc /* provides the operational environment for payload data processing @S009 */ }
            perform action a1 { doc /* coordinates with Primary Processing Cluster and Backup Processing Cluster @S049 */ }
            perform action a2 { doc /* transforming downlinked payload telemetry into image products @S151 */ }
            perform action a3 { doc /* demonstrates that science product generation can be sustained @S232 */ }
        }
        part primaryProcessingCluster : PrimaryProcessingCluster {
            perform action a0 { doc /* generates Level 0 products @S155 */ }
            perform action a1 { doc /* pause nonessential production queues and reserve compute capacity @S220 */ }
        }
        part product : Product {
            exhibit state modes {
                state s0 { doc /* delivery hold state @S167 */ }
            }
        }
        part productQualityService : ProductQualityService {
            perform action a0 { doc /* performs automated and analyst-supported checks on generated products @S015 */ }
            perform action a1 { doc /* add planning feedback @S124 */ }
            perform action a2 { doc /* checks each orbit solution @S130 */ }
            perform action a3 { doc /* uses the patch bundle to update calibration applicability checks @S162 */ }
            perform action a4 { doc /* assigns quality flags @S165 */ }
            perform action a5 { doc /* produces the Product Hold List @S168 */ }
            perform action a6 { doc /* records the reason for any reprocessing decision @S195 */ }
        }
        part southSBandAntenna : SouthSBandAntenna {
            perform action a0 { doc /* provides the alternate S-band path @S029 */ }
        }
        part spacecraftOperationsTeam : SpacecraftOperationsTeam {
            perform action a0 { doc /* monitors spacecraft mode, power state, thermal margins, attitude indicators, command counters, onboard storage, and fault protection messages @S082 */ }
            perform action a1 { doc /* reviews late operational requests @S105 */ }
            perform action a2 { doc /* uses the Antenna Deicing Notice to assess whether planned support can proceed @S113 */ }
            perform action a3 { doc /* uses the Pass Replay Packet to confirm that archived downlink context can support anomaly reconstruction @S198 */ }
            perform action a4 { doc /* leads triage for spacecraft safety indicators @S209 */ }
            perform action a5 { doc /* conducts at least one integrated day-in-the-life rehearsal @S235 */ }
        }
        part spacecraftSystemsEngineer : SpacecraftSystemsEngineer {
            perform action a0 { doc /* interprets health telemetry @S086 */ }
            perform action a1 { doc /* records any anomaly context @S086 */ }
        }
        part stationOperators : StationOperators {
            perform action a0 { doc /* notify the Mission Control Center @S043 */ }
        }
        part subsystemSpecialists : SubsystemSpecialists;
        part svalbardXBandAntenna : SvalbardXBandAntenna {
            perform action a0 { doc /* extends northern contact opportunities @S031 */ }
        }
        part telemetryEngineer : TelemetryEngineer {
            perform action a0 { doc /* verifies reception quality, frame loss, latency, and stream continuity @S085 */ }
            perform action a1 { doc /* advises the console lead @S085 */ }
        }
        part telemetryIngestService : TelemetryIngestService {
            perform action a0 { doc /* receives spacecraft telemetry from scheduled contacts @S013 */ }
            perform action a1 { doc /* receives contact status and data-flow indicators @S048 */ }
            perform action a2 { doc /* accepts real-time frames @S080 */ }
            perform action a3 { doc /* validates basic framing and time continuity @S080 */ }
            perform action a4 { doc /* records reception metadata @S080 */ }
            perform action a5 { doc /* produces the Pass Replay Packet @S081 */ }
            perform action a6 { doc /* writes accepted raw data to immutable staging storage @S153 */ }
            perform action a7 { doc /* records the session identifier @S153 */ }
        }
        part userServicesPortal : UserServicesPortal {
            perform action a0 { doc /* provides the controlled external interface for product search, ordering, status communication, and user support workflows @S018 */ }
            perform action a1 { doc /* records the request state @S104 */ }
            perform action a2 { doc /* provides search, preview, order, and download functions @S183 */ }
            perform action a3 { doc /* displays a service status message @S201 */ }
            perform action a4 { doc /* communicates confirmed service impacts @S225 */ }
            perform action a5 { doc /* uses the Product Hold List to prevent release of affected products @S239 */ }
        }
        flow f0 of LocalConstraintsNotificationItem from stationOperators to missionControlCenter { doc /* @S043 */ }
        flow f1 of AntennaDeicingNoticeItem from groundNetworkManager to spacecraftOperationsTeam { doc /* @S044 */ }
        flow f2 of CommandAndTelemetryTrafficItem from northSBandAntenna to missionControlCenter { doc /* @S054 */ }
        flow f3 of CommandAndTelemetryTrafficItem from southSBandAntenna to missionControlCenter { doc /* @S054 */ }
        flow f4 of PayloadDownlinkTrafficItem from kirunaXBandAntenna to payloadProcessingFacility { doc /* @S055 */ }
        flow f5 of PayloadDownlinkTrafficItem from svalbardXBandAntenna to payloadProcessingFacility { doc /* @S055 */ }
        flow f6 of TransfersItem from primaryProcessingCluster to longTermArchive { doc /* @S065 */ }
        flow f7 of TimingAlarmsItem from networkControlSystem to spacecraftOperationsTeam { doc /* @S072 */ }
        flow f8 of SecurityExceptionTicketItem from cybersecurityDesk to networkControlSystem { doc /* @S074 */ }
        flow f9 of AntennaStatusLinkConfigurationTimingReferencesAndRoutingReadinessItem from networkControlSystem to missionControlCenter { doc /* @S079 */ }
        flow f10 of PassReplayPacketItem from telemetryIngestService to spacecraftOperationsTeam { doc /* @S081 */ }
        flow f11 of CalibrationPatchBundleItem from payloadCalibrationTeam to productQualityService { doc /* @S094 */ }
        flow f12 of OperationalConstraintsItem from missionControlCenter to missionPlanningSystem { doc /* @S099 */ }
        flow f13 of ObservationRequestsItem from userServicesPortal to missionPlanningSystem { doc /* @S101 */ }
        flow f14 of OrbitPredictionsAndVisibilityAssumptionsItem from flightDynamicsFacility to missionPlanningSystem { doc /* @S106 */ }
        flow f15 of PlanningMetadataItem from missionPlanningSystem to payloadProcessingFacility { doc /* @S110 */ }
        flow f16 of CommandPreparationPackageItem from missionPlanningSystem to missionControlCenter { doc /* @S118 */ }
        flow f17 of LatestSpacecraftStateItem from telemetryIngestService to commandValidationGateway { doc /* @S122 */ }
        flow f18 of DopplerResidualReportItem from orbitDeterminationEngine to flightDynamicsTeam { doc /* @S131 */ }
        flow f19 of ManeuverRecommendationPackageItem from flightDynamicsTeam to spacecraftOperationsTeam { doc /* @S137 */ }
        flow f20 of StarTrackerMaskFileItem from flightDynamicsFacility to commandValidationGateway { doc /* @S139 */ }
        flow f21 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to missionControlCenter { doc /* @S141 */ }
        flow f22 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to missionPlanningSystem { doc /* @S141 */ }
        flow f23 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to payloadProcessingFacility { doc /* @S141 */ }
        flow f24 of EphemerisDeltaNoteItem from flightDynamicsTeam to missionPlanningSystem { doc /* @S144 */ }
        flow f25 of LaserRetroreflectorWindowItem from orbitDeterminationEngine to missionPlanningSystem { doc /* @S145 */ }
        flow f26 of ProductHoldListItem from productQualityService to userServicesPortal { doc /* @S168 */ }
        flow f27 of StorageWatermarkSnapshotItem from longTermArchive to backupProcessingCluster { doc /* @S174 */ }
        flow f28 of ProductPackageAssociatedQualityMetadataAndChecksumEvidenceItem from payloadProcessingFacility to longTermArchive { doc /* @S178 */ }
        flow f29 of CatalogueRecordsItem from longTermArchive to userServicesPortal { doc /* @S181 */ }
        flow f30 of OrbitQualityStateChangesItem from flightDynamicsFacility to longTermArchive { doc /* @S194 */ }
    }
    requirement def R0 { doc /* human authorization remains required for spacecraft commanding and major configuration changes @S025 */ subject s : GroundSegment; }
    requirement def R1 { doc /* operators must identify safety trends while a contact is still available @S083 */ subject s : Operators; }
    requirement def R2 { doc /* they must be reachable during planned critical activities and whenever a console operator declares an off-nominal condition @S095 */ subject s : SubsystemSpecialists; }
    requirement def R3 { doc /* Final approval requires concurrence from the Mission Control Center and the Spacecraft Operations Team before any command stack is placed in the queue for the next authorized uplink opportunity @S126 */ subject s : MissionControlCenter; }
    requirement def R4 { doc /* each flight dynamics delivery include a validity interval, coordinate frame, generation time, and operational use statement @S140 */ subject s : MissionControlCenter; }
    requirement def R5 { doc /* shall preserve the last validated routing configuration and reject unreviewed changes while payload product transfers are active @S171 */ subject s : NetworkControlSystem; }
    requirement def R6 { doc /* Retention exceptions require traceability to the approving authority, the affected product classes, and the expected operational impact @S191 */ subject s : LongTermArchive; }
    requirement def R7 { doc /* must quarantine suspect input and derived output when product lineage cannot be proven during an active anomaly investigation @S215 */ subject s : PayloadProcessingFacility; }
}
