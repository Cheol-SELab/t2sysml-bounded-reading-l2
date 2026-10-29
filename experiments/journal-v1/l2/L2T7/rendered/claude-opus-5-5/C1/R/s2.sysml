package L2Model {
    item def AntennaStatusLinkConfigurationTimingReferencesAndRoutingReadinessItem { doc /* @S079 */ }
    item def CommandAndTelemetryTrafficItem { doc /* @S054 */ }
    item def CommandPreparationPackageItem { doc /* @S118 */ }
    item def CommandUplinkItem { doc /* @S028 */ }
    item def ConfigurationChangesItem { doc /* @S205 */ }
    item def EligibleJobsItem { doc /* @S172 */ }
    item def ExecutableActivityPlansItem { doc /* @S012 */ }
    item def HighRatePayloadDownlinkItem { doc /* @S030 */ }
    item def LocalConstraintsItem { doc /* @S043 */ }
    item def ObservationRequestsItem { doc /* @S101 */ }
    item def OperationalConstraintsItem { doc /* @S099 */ }
    item def OrbitQualityStateChangesItem { doc /* @S194 */ }
    item def PayloadDownlinkTrafficItem { doc /* @S055 */ }
    item def ProductPackageAssociatedQualityMetadataAndChecksumEvidenceItem { doc /* @S178 */ }
    item def ProvenanceItem { doc /* @S173 */ }
    item def RealTimeCommandAndTelemetryTrafficItem { doc /* @S063 */ }
    item def RoutineEphemeridesAndEventPredictionsItem { doc /* @S141 */ }
    item def SpacecraftTelemetryItem { doc /* @S013 */ }
    item def TrackingMeasurementsItem { doc /* @S129 */ }
    item def TransfersItem { doc /* @S065 */ }
    part def AntennaSiteEquipment { doc /* @S070 */ }
    part def ArchiveOperationsQueue { doc /* @S194 */ }
    part def BackupProcessingCluster { doc /* @S004,S016,S066,S150,S172,S173,S221,S241 */ }
    part def CommandValidationGateway { doc /* @S004,S012,S063,S119,S120,S121,S143,S206,S242 */ }
    part def ConsoleLead { doc /* @S084 */ }
    part def ConsoleOperator { doc /* @S095 */ }
    part def CybersecurityDesk { doc /* @S023,S074,S076,S125,S200,S204,S212,S238 */ }
    part def EngineeringTeams { doc /* @S218 */ }
    part def ExternalInterfaces { doc /* @S199 */ }
    part def FlightDynamicsFacility { doc /* @S004,S008,S040,S053,S106,S132,S139,S141,S194,S231 */ }
    part def FlightDynamicsTeam { doc /* @S021,S071,S088,S097,S116,S131,S134,S136,S144,S210,S236 */ }
    part def GroundNetworkManager { doc /* @S019,S038,S044,S060,S067,S076,S087,S112,S209,S222,S234 */ }
    part def GroundSegment { doc /* @S002,S004,S005,S025 */ }
    part def IncidentLead { doc /* @S225 */ }
    part def KirunaXBandAntenna { doc /* @S005,S030,S055,S078,S129 */ }
    part def LocalStationTeams { doc /* @S042 */ }
    part def LongTermArchive { doc /* @S004,S017,S053,S065,S149,S160,S174,S178,S180,S187,S196,S243 */ }
    part def MissionControlCenter { doc /* @S004,S007,S032,S043,S053,S054,S056,S063,S077,S079,S093,S096,S099,S100,S118,S140,S141,S175,S203,S217,S230 */ }
    part def MissionManagement { doc /* @S176 */ }
    part def MissionPlanningSystem { doc /* @S004,S011,S012,S034,S099,S101,S102,S107,S114,S118,S141,S142,S207,S216,S240 */ }
    part def NetworkControlSystem { doc /* @S004,S010,S033,S056,S072,S079,S148,S170,S171,S205,S233 */ }
    part def NorthSBandAntenna { doc /* @S005,S028,S054,S129 */ }
    part def OperationalLog { doc /* @S205 */ }
    part def OperationalReadinessReview { doc /* @S227 */ }
    part def OperationsStaff { doc /* @S201 */ }
    part def OperatorDisplay { doc /* @S154 */ }
    part def Operators { doc /* @S083,S098,S213 */ }
    part def OrbitDeterminationEngine { doc /* @S004,S014,S041,S089,S123,S128,S129,S145 */ }
    part def PayloadCalibrationTeam { doc /* @S022,S094,S117,S147,S161,S193,S211,S237 */ }
    part def PayloadProcessingFacility { doc /* @S004,S009,S049,S053,S055,S110,S141,S151,S178,S215,S232 */ }
    part def PhysicalTopology { doc /* @S053 */ }
    part def PrimaryProcessingCluster { doc /* @S004,S065,S150,S155,S220 */ }
    part def ProductQualityService { doc /* @S004,S015,S124,S130,S162,S165,S168,S173,S181,S195 */ }
    part def ProtectedAccessRouters { doc /* @S054 */ }
    part def ReadinessReviewBoard { doc /* @S228 */ }
    part def RoutineContacts { doc /* @S035 */ }
    part def SchedulingService { doc /* @S172 */ }
    part def SentinelVale { doc /* @S001 */ }
    part def SentinelValeGroundSegment { doc /* @S218,S219 */ }
    part def SouthSBandAntenna { doc /* @S005,S029,S054,S129 */ }
    part def Spacecraft { doc /* @S013,S028,S030 */ }
    part def SpacecraftOperationsTeam { doc /* @S020,S072,S082,S097,S105,S113,S137,S146,S198,S209,S235 */ }
    part def SpacecraftSystemsEngineer { doc /* @S086 */ }
    part def StationOperators { doc /* @S043 */ }
    part def SubsystemSpecialists { doc /* @S095 */ }
    part def SvalbardXBandAntenna { doc /* @S005,S031,S055,S078,S129 */ }
    part def TelemetryEngineer { doc /* @S085 */ }
    part def TelemetryIngestService { doc /* @S004,S013,S048,S063,S080,S081,S122,S153 */ }
    part def UserServicesPortal { doc /* @S004,S018,S101,S104,S181,S183,S201,S225,S239 */ }
    part system {
        part antennaSiteEquipment : AntennaSiteEquipment {
            perform action a0 { doc /* validates time against independent local references before contact start @S070 */ }
        }
        part archiveOperationsQueue : ArchiveOperationsQueue;
        part backupProcessingCluster : BackupProcessingCluster {
            perform action a0 { doc /* receives lower routing preference during normal operations @S066 */ }
            perform action a1 { doc /* supports product generation @S150 */ }
            perform action a2 { doc /* writes provenance @S173 */ }
            perform action a3 { doc /* uses the Storage Watermark Snapshot @S241 */ }
            perform action a4 { doc /* verify that recovery capacity is sufficient @S241 */ }
            perform action a5 { doc /* accepts routine standby responsibility @S241 */ }
            exhibit state modes {
                state s0 { doc /* controlled failover @S016 */ }
            }
        }
        part commandValidationGateway : CommandValidationGateway {
            perform action a0 { doc /* enforces rule checks @S012 */ }
            perform action a1 { doc /* performs independent validation of command stacks @S119 */ }
            perform action a2 { doc /* checks syntax, timing, parameter ranges, sequencing rules, spacecraft mode compatibility, and consistency with the approved schedule baseline @S120 */ }
            perform action a3 { doc /* rejects command stacks @S121 */ }
            perform action a4 { doc /* checks maneuver command parameters @S143 */ }
            perform action a5 { doc /* allowing the command stack to proceed @S143 */ }
            perform action a6 { doc /* accepts the mask file @S206 */ }
            perform action a7 { doc /* rejects any command request @S242 */ }
        }
        part consoleLead : ConsoleLead {
            perform action a0 { doc /* declaring pass status @S084 */ }
            perform action a1 { doc /* authorizing planned command execution through the Command Validation Gateway @S084 */ }
            perform action a2 { doc /* pausing the activity @S084 */ }
        }
        part consoleOperator : ConsoleOperator {
            perform action a0 { doc /* declares an off-nominal condition @S095 */ }
        }
        part cybersecurityDesk : CybersecurityDesk {
            perform action a0 { doc /* provides continuous security monitoring, operational security guidance, and escalation support @S023 */ }
            perform action a1 { doc /* sends a Security Exception Ticket @S074 */ }
            perform action a2 { doc /* coordinate before blocking traffic @S076 */ }
            perform action a3 { doc /* reviews command preparation exceptions @S125 */ }
            perform action a4 { doc /* reviews public interface changes before deployment @S200 */ }
            perform action a5 { doc /* confirm authentication, logging, and abuse-control requirements are satisfied @S200 */ }
            perform action a6 { doc /* reviews privileged access daily @S204 */ }
            perform action a7 { doc /* challenges dormant, shared, or unexplained accounts @S204 */ }
            perform action a8 { doc /* assumes coordination authority @S212 */ }
            perform action a9 { doc /* participates in the final exercise @S238 */ }
            perform action a10 { doc /* validating alert routing, privileged access review, and incident coordination @S238 */ }
        }
        part engineeringTeams : EngineeringTeams {
            perform action a0 { doc /* focus on stabilizing observability and protecting evidence @S218 */ }
        }
        part externalInterfaces : ExternalInterfaces {
            perform action a0 { doc /* expose catalogue search, subscription notification, product ordering, and download status using versioned service contracts @S199 */ }
        }
        part flightDynamicsFacility : FlightDynamicsFacility {
            perform action a0 { doc /* provides orbit analysis, maneuver planning support, access prediction, and navigation products @S008 */ }
            perform action a1 { doc /* provides visibility predictions and antenna pointing support products to the planning process @S040 */ }
            perform action a2 { doc /* provides orbit predictions and visibility assumptions @S106 */ }
            perform action a3 { doc /* maintains the authoritative orbit catalog @S132 */ }
            perform action a4 { doc /* records the modeling assumptions @S132 */ }
            perform action a5 { doc /* verifying predicted bright-object exclusions @S139 */ }
            perform action a6 { doc /* sends the Star Tracker Mask File @S139 */ }
            perform action a7 { doc /* distributes routine ephemerides and event predictions @S141 */ }
            perform action a8 { doc /* publishes orbit quality state changes to the archive operations queue @S194 */ }
            perform action a9 { doc /* provides readiness evidence @S231 */ }
        }
        part flightDynamicsTeam : FlightDynamicsTeam {
            perform action a0 { doc /* owns flight dynamics analysis, orbit maintenance recommendations, and operational coordination for navigation-related constraints @S021 */ }
            perform action a1 { doc /* monitors timing quality alongside orbit support metrics @S071 */ }
            perform action a2 { doc /* uses tracking measurements and validated time tags from the contact @S088 */ }
            perform action a3 { doc /* support orbit assessment at the Flight Dynamics Facility @S088 */ }
            perform action a4 { doc /* coordinate closely before orbit-control activities @S097 */ }
            perform action a5 { doc /* reviews cases where orbital uncertainty or contact geometry could reduce the execution margin @S116 */ }
            perform action a6 { doc /* separate station-related tracking biases from dynamic model errors @S131 */ }
            perform action a7 { doc /* accepting an orbit solution @S131 */ }
            perform action a8 { doc /* computes expected state change, execution tolerance, recovery strategy, and the earliest time @S134 */ }
            perform action a9 { doc /* maintains screening rules @S136 */ }
            perform action a10 { doc /* produces the Ephemeris Delta Note @S144 */ }
            perform action a11 { doc /* assesses orbit and timing effects @S210 */ }
            perform action a12 { doc /* conducts a separate rehearsal for missed tracking data and late orbit update availability @S236 */ }
            perform action a13 { doc /* confirm that planning products remain usable under degraded conditions @S236 */ }
        }
        part groundNetworkManager : GroundNetworkManager {
            perform action a0 { doc /* coordinates availability of the antenna assets @S019 */ }
            perform action a1 { doc /* confirms that scheduled contact opportunities are compatible with station readiness and maintenance constraints @S019 */ }
            perform action a2 { doc /* arbitrates unresolved contact conflicts @S038 */ }
            perform action a3 { doc /* verifies that station commitments remain consistent with maintenance windows and staffing limits @S038 */ }
            perform action a4 { doc /* issues the Antenna Deicing Notice @S044 */ }
            perform action a5 { doc /* determines that a maintenance condition could cause route oscillation @S060 */ }
            perform action a6 { doc /* verifies carrier performance @S067 */ }
            perform action a7 { doc /* checks routing state, packet loss, queue depth, and security inspection delays @S067 */ }
            perform action a8 { doc /* declaring a mission-impacting network condition @S067 */ }
            perform action a9 { doc /* coordinate before blocking traffic @S076 */ }
            perform action a10 { doc /* remains accountable for antenna assignment, ground link availability, and coordination with site operations @S087 */ }
            perform action a11 { doc /* confirms that planned station use is compatible with network maintenance windows @S112 */ }
            perform action a12 { doc /* leads triage for antenna, link, and site-service indicators @S209 */ }
            perform action a13 { doc /* coordinates cross-site failover @S222 */ }
            perform action a14 { doc /* accepts the antenna readiness baseline @S234 */ }
        }
        part groundSegment : GroundSegment {
            perform action a0 { doc /* plan spacecraft activities @S002 */ }
            perform action a1 { doc /* acquire mission data @S002 */ }
            perform action a2 { doc /* maintain safe spacecraft operations @S002 */ }
            perform action a3 { doc /* generate user products @S002 */ }
            perform action a4 { doc /* preserve mission records @S002 */ }
            perform action a5 { doc /* provide controlled access to services @S002 */ }
        }
        part incidentLead : IncidentLead {
            perform action a0 { doc /* approves release @S225 */ }
        }
        part kirunaXBandAntenna : KirunaXBandAntenna {
            perform action a0 { doc /* high-rate payload downlink @S030 */ }
            perform action a1 { doc /* use dual wide area paths toward the Payload Processing Facility @S055 */ }
            perform action a2 { doc /* support high-rate telemetry reception @S078 */ }
        }
        part localStationTeams : LocalStationTeams {
            perform action a0 { doc /* antenna pre-pass configuration @S042 */ }
            perform action a1 { doc /* frequency standard verification @S042 */ }
            perform action a2 { doc /* time correlation checks @S042 */ }
            perform action a3 { doc /* safety interlocks @S042 */ }
            perform action a4 { doc /* logging of any local anomalies @S042 */ }
        }
        part longTermArchive : LongTermArchive {
            perform action a0 { doc /* preserved mission data, generated products, processing records, and operational evidence @S017 */ }
            perform action a1 { doc /* retains released orbit products, covariance data, maneuver records, and quality decisions @S149 */ }
            perform action a2 { doc /* sends the Storage Watermark Snapshot @S174 */ }
            perform action a3 { doc /* daily storage assessment @S174 */ }
            perform action a4 { doc /* Archive admission begins @S178 */ }
            perform action a5 { doc /* stores object content separately from searchable metadata @S180 */ }
            perform action a6 { doc /* retains raw acquisition data @S187 */ }
            perform action a7 { doc /* preserves the replaced product version @S196 */ }
            perform action a8 { doc /* preserves the accepted archive baseline @S243 */ }
            perform action a9 { doc /* confirms that retrieval tests meet the service objective @S243 */ }
        }
        part missionControlCenter : MissionControlCenter {
            perform action a0 { doc /* release of validated command activities @S007 */ }
            perform action a1 { doc /* pass supervision @S007 */ }
            perform action a2 { doc /* anomaly response @S007 */ }
            perform action a3 { doc /* maintains the operational contact schedule @S032 */ }
            perform action a4 { doc /* uses it as the controlling reference for console staffing, command readiness, and telemetry coverage @S032 */ }
            perform action a5 { doc /* hosts the primary routing policy point @S056 */ }
            perform action a6 { doc /* treats every scheduled contact as a controlled operational activity @S077 */ }
            perform action a7 { doc /* coordinates with the Payload Processing Facility @S093 */ }
            perform action a8 { doc /* begins with the console lead @S096 */ }
            perform action a9 { doc /* moves to the responsible discipline lead @S096 */ }
            perform action a10 { doc /* reaches mission management @S096 */ }
            perform action a11 { doc /* records unresolved actions, open engineering questions, and expected specialist responses @S100 */ }
            perform action a12 { doc /* maintains the authority boundary for routine spacecraft operations @S203 */ }
            perform action a13 { doc /* confirms that elevated access is tied to an approved shift role and a time-limited operational need @S203 */ }
            perform action a14 { doc /* declares continuity modes @S217 */ }
            perform action a15 { doc /* consultation with the affected technical leads @S217 */ }
            perform action a16 { doc /* demonstrates continuous console coverage for the agreed service hours @S230 */ }
            perform action a17 { doc /* proves that shift handover logs contain the state needed by the incoming controller @S230 */ }
        }
        part missionManagement : MissionManagement {
            perform action a0 { doc /* approves a different backlog rule @S176 */ }
        }
        part missionPlanningSystem : MissionPlanningSystem {
            perform action a0 { doc /* converts approved imaging demand and spacecraft constraints into executable activity plans @S011 */ }
            perform action a1 { doc /* receives operational constraints from mission control @S099 */ }
            perform action a2 { doc /* assembling candidate observation timelines and associated ground contact activities @S102 */ }
            perform action a3 { doc /* combines request priority, instrument availability, contact opportunities, onboard storage margin, and downlink capacity into a draft activity schedule @S107 */ }
            perform action a4 { doc /* flags conflicts @S114 */ }
            perform action a5 { doc /* exports a command preparation package to the command engineering workflow @S118 */ }
            perform action a6 { doc /* align imaging requests, contact opportunities, recorder margins, and downlink windows @S142 */ }
            perform action a7 { doc /* treats the retroreflector window as a constrained planning input @S207 */ }
            perform action a8 { doc /* prevents its use outside the approved scheduling interval @S207 */ }
            perform action a9 { doc /* suspends automatic schedule publication @S216 */ }
            perform action a10 { doc /* applies the delta note during schedule validation @S240 */ }
        }
        part networkControlSystem : NetworkControlSystem {
            perform action a0 { doc /* monitors communications availability @S010 */ }
            perform action a1 { doc /* routes operational traffic @S010 */ }
            perform action a2 { doc /* provides status awareness for ground connectivity @S010 */ }
            perform action a3 { doc /* distributes station allocations @S033 */ }
            perform action a4 { doc /* confirms antenna readiness states @S033 */ }
            perform action a5 { doc /* records the actual start and end times of each contact @S033 */ }
            perform action a6 { doc /* maintains operational visibility of circuit state, path selection, and active maintenance windows @S056 */ }
            perform action a7 { doc /* confirms that the alarm is not caused by a known maintenance interval or a failed local reference check @S072 */ }
            perform action a8 { doc /* provides the Mission Control Center with antenna status, link configuration, timing references, and routing readiness @S079 */ }
            perform action a9 { doc /* prepare scheduled contacts and verify tracking readiness @S148 */ }
            perform action a10 { doc /* restrict affected transfer paths @S170 */ }
            perform action a11 { doc /* preserve the last validated routing configuration @S171 */ }
            perform action a12 { doc /* reject unreviewed changes @S171 */ }
            perform action a13 { doc /* enforces approved routing paths between ground stations, processing services, and external interfaces @S205 */ }
            perform action a14 { doc /* records configuration changes in the operational log @S205 */ }
            perform action a15 { doc /* records rehearsal outcomes @S233 */ }
        }
        part northSBandAntenna : NorthSBandAntenna {
            perform action a0 { doc /* provides the nominal early-pass command uplink and low-rate telemetry return @S028 */ }
            perform action a1 { doc /* connect to the Mission Control Center @S054 */ }
        }
        part operationalLog : OperationalLog;
        part operationalReadinessReview : OperationalReadinessReview {
            perform action a0 { doc /* confirms that ground procedures, staffing rosters, monitoring views, and escalation paths are under configuration control @S227 */ }
        }
        part operationsStaff : OperationsStaff {
            perform action a0 { doc /* open the normal incident process @S201 */ }
        }
        part operatorDisplay : OperatorDisplay {
            perform action a0 { doc /* shows whether recovery, retransmission, or discard is required @S154 */ }
        }
        part operators : Operators {
            perform action a0 { doc /* preserve the command state @S098 */ }
            perform action a1 { doc /* avoid discretionary commanding @S098 */ }
            perform action a2 { doc /* request specialist review @S098 */ }
            perform action a3 { doc /* changing spacecraft configuration @S098 */ }
            perform action a4 { doc /* preserve volatile logs, current configuration state, operator console history, and relevant message identifiers @S213 */ }
            perform action a5 { doc /* restarting services or changing routing @S213 */ }
        }
        part orbitDeterminationEngine : OrbitDeterminationEngine {
            perform action a0 { doc /* processing tracking inputs @S014 */ }
            perform action a1 { doc /* producing controlled orbit knowledge @S014 */ }
            perform action a2 { doc /* produces the Doppler Residual Report @S041 */ }
            perform action a3 { doc /* supports routine state updates @S089 */ }
            perform action a4 { doc /* provides the basis for predicting future visibility periods, maneuver planning constraints, and antenna pointing expectations @S089 */ }
            perform action a5 { doc /* provides the current orbital solution @S123 */ }
            perform action a6 { doc /* fits dynamic orbit solutions @S128 */ }
            perform action a7 { doc /* produces the Laser Retroreflector Window @S145 */ }
        }
        part payloadCalibrationTeam : PayloadCalibrationTeam {
            perform action a0 { doc /* owns payload performance monitoring, calibration parameter stewardship, and the technical assessment of product quality trends @S022 */ }
            perform action a1 { doc /* sends the Calibration Patch Bundle @S094 */ }
            perform action a2 { doc /* reviews planned calibration activities @S117 */ }
            perform action a3 { doc /* obtains predicted viewing geometry @S147 */ }
            perform action a4 { doc /* interpret instrument trends and plan calibration activities @S147 */ }
            perform action a5 { doc /* maintains the approved calibration baseline @S161 */ }
            perform action a6 { doc /* reviews trend evidence @S161 */ }
            perform action a7 { doc /* request a reprocessing campaign @S193 */ }
            perform action a8 { doc /* assesses product integrity @S211 */ }
            perform action a9 { doc /* validates that calibration operations are represented in the rehearsal schedule @S237 */ }
        }
        part payloadProcessingFacility : PayloadProcessingFacility {
            perform action a0 { doc /* provides the operational environment for payload data processing, calibration control, product assessment, and distribution staging @S009 */ }
            perform action a1 { doc /* coordinates with Primary Processing Cluster and Backup Processing Cluster @S049 */ }
            perform action a2 { doc /* receives planning metadata @S110 */ }
            perform action a3 { doc /* transforming downlinked payload telemetry into image products @S151 */ }
            perform action a4 { doc /* delivered the product package, associated quality metadata, and checksum evidence @S178 */ }
            perform action a5 { doc /* quarantine suspect input and derived output @S215 */ }
            perform action a6 { doc /* demonstrates that science product generation can be sustained @S232 */ }
            perform action a7 { doc /* science product generation @S232 */ }
        }
        part physicalTopology : PhysicalTopology;
        part primaryProcessingCluster : PrimaryProcessingCluster {
            perform action a0 { doc /* generates Level 0 products @S155 */ }
            perform action a1 { doc /* pause nonessential production queues @S220 */ }
            perform action a2 { doc /* reserve compute capacity for validated recovery runs from known-good inputs @S220 */ }
            exhibit state modes {
                state s0 { doc /* unavailable @S150 */ }
            }
        }
        part productQualityService : ProductQualityService {
            perform action a0 { doc /* performs automated and analyst-supported checks on generated products @S015 */ }
            perform action a1 { doc /* add planning feedback @S124 */ }
            perform action a2 { doc /* checks each orbit solution @S130 */ }
            perform action a3 { doc /* update calibration applicability checks @S162 */ }
            perform action a4 { doc /* assigns quality flags @S165 */ }
            perform action a5 { doc /* produces the Product Hold List @S168 */ }
            perform action a6 { doc /* set the public quality status @S181 */ }
            perform action a7 { doc /* records the reason for any reprocessing decision @S195 */ }
        }
        part protectedAccessRouters : ProtectedAccessRouters {
            perform action a0 { doc /* keep command and telemetry traffic separate from site administration traffic @S054 */ }
        }
        part readinessReviewBoard : ReadinessReviewBoard {
            perform action a0 { doc /* verifies that each open action from launch and commissioning has an owner, a due date, and an accepted residual risk statement @S228 */ }
        }
        part routineContacts : RoutineContacts {
            exhibit state modes {
                state s0 { doc /* frozen @S035 */ }
            }
        }
        part schedulingService : SchedulingService {
            perform action a0 { doc /* assigns eligible jobs to the Backup Processing Cluster @S172 */ }
        }
        part sentinelVale : SentinelVale {
            perform action a0 { doc /* provide routine land, coastal, and cryosphere imaging products @S001 */ }
        }
        part sentinelValeGroundSegment : SentinelValeGroundSegment {
            perform action a0 { doc /* prioritizes spacecraft safety contacts, time-critical telemetry capture, core orbit support, and protection of unrecoverable payload data @S219 */ }
            exhibit state modes {
                state s0 { doc /* essential-service mode @S219 */ }
                state s1 { doc /* monitor-only mode @S218 */ }
            }
        }
        part southSBandAntenna : SouthSBandAntenna {
            perform action a0 { doc /* provides the alternate S-band path @S029 */ }
            perform action a1 { doc /* connect to the Mission Control Center @S054 */ }
        }
        part spacecraft : Spacecraft;
        part spacecraftOperationsTeam : SpacecraftOperationsTeam {
            perform action a0 { doc /* owns spacecraft safety execution, contact conduct, command authorization support, and operational decision making @S020 */ }
            perform action a1 { doc /* monitors spacecraft mode, power state, thermal margins, attitude indicators, command counters, onboard storage, and fault protection messages @S082 */ }
            perform action a2 { doc /* coordinate closely before orbit-control activities @S097 */ }
            perform action a3 { doc /* reviews late operational requests @S105 */ }
            perform action a4 { doc /* uses the Antenna Deicing Notice to assess whether planned support can proceed @S113 */ }
            perform action a5 { doc /* rehearse commanding, verify contingency actions, and coordinate contact coverage @S146 */ }
            perform action a6 { doc /* confirm that archived downlink context can support anomaly reconstruction @S198 */ }
            perform action a7 { doc /* leads triage for spacecraft safety indicators @S209 */ }
            perform action a8 { doc /* conducts at least one integrated day-in-the-life rehearsal @S235 */ }
            exhibit state modes {
                state s0 { doc /* contingency @S020 */ }
                state s1 { doc /* nominal @S020 */ }
            }
        }
        part spacecraftSystemsEngineer : SpacecraftSystemsEngineer {
            perform action a0 { doc /* interprets health telemetry @S086 */ }
            perform action a1 { doc /* confirms that subsystem states remain within flight rules @S086 */ }
            perform action a2 { doc /* records any anomaly context @S086 */ }
        }
        part stationOperators : StationOperators {
            perform action a0 { doc /* notify the Mission Control Center @S043 */ }
        }
        part subsystemSpecialists : SubsystemSpecialists;
        part svalbardXBandAntenna : SvalbardXBandAntenna {
            perform action a0 { doc /* extends northern contact opportunities @S031 */ }
            perform action a1 { doc /* use dual wide area paths toward the Payload Processing Facility @S055 */ }
            perform action a2 { doc /* support high-rate telemetry reception @S078 */ }
        }
        part telemetryEngineer : TelemetryEngineer {
            perform action a0 { doc /* verifies reception quality, frame loss, latency, and stream continuity @S085 */ }
            perform action a1 { doc /* advises the console lead @S085 */ }
        }
        part telemetryIngestService : TelemetryIngestService {
            perform action a0 { doc /* receives spacecraft telemetry from scheduled contacts @S013 */ }
            perform action a1 { doc /* makes it available to operations, engineering analysis, and downstream processing functions @S013 */ }
            perform action a2 { doc /* receives contact status and data-flow indicators @S048 */ }
            perform action a3 { doc /* accepts real-time frames @S080 */ }
            perform action a4 { doc /* validates basic framing and time continuity @S080 */ }
            perform action a5 { doc /* records reception metadata @S080 */ }
            perform action a6 { doc /* produces the Pass Replay Packet @S081 */ }
            perform action a7 { doc /* writes accepted raw data to immutable staging storage @S153 */ }
            perform action a8 { doc /* records the session identifier @S153 */ }
        }
        part userServicesPortal : UserServicesPortal {
            perform action a0 { doc /* provides the controlled external interface for product search, ordering, status communication, and user support workflows @S018 */ }
            perform action a1 { doc /* records the request state @S104 */ }
            perform action a2 { doc /* provides search, preview, order, and download functions @S183 */ }
            perform action a3 { doc /* displays a service status message @S201 */ }
            perform action a4 { doc /* communicates confirmed service impacts in operational terms @S225 */ }
            perform action a5 { doc /* avoids publishing speculative root cause information @S225 */ }
            perform action a6 { doc /* uses the Product Hold List @S239 */ }
            perform action a7 { doc /* prevent release of affected products @S239 */ }
        }
        flow f0 of ExecutableActivityPlansItem from missionPlanningSystem to commandValidationGateway { doc /* @S012 */ }
        flow f1 of SpacecraftTelemetryItem from spacecraft to telemetryIngestService { doc /* @S013 */ }
        flow f2 of CommandUplinkItem from northSBandAntenna to spacecraft { doc /* @S028 */ }
        flow f3 of HighRatePayloadDownlinkItem from spacecraft to kirunaXBandAntenna { doc /* @S030 */ }
        flow f4 of LocalConstraintsItem from stationOperators to missionControlCenter { doc /* @S043 */ }
        flow f5 of CommandAndTelemetryTrafficItem from northSBandAntenna to missionControlCenter { doc /* @S054 */ }
        flow f6 of CommandAndTelemetryTrafficItem from southSBandAntenna to missionControlCenter { doc /* @S054 */ }
        flow f7 of PayloadDownlinkTrafficItem from kirunaXBandAntenna to payloadProcessingFacility { doc /* @S055 */ }
        flow f8 of PayloadDownlinkTrafficItem from svalbardXBandAntenna to payloadProcessingFacility { doc /* @S055 */ }
        flow f9 of RealTimeCommandAndTelemetryTrafficItem from missionControlCenter to commandValidationGateway { doc /* @S063 */ }
        flow f10 of RealTimeCommandAndTelemetryTrafficItem from missionControlCenter to telemetryIngestService { doc /* @S063 */ }
        flow f11 of TransfersItem from primaryProcessingCluster to longTermArchive { doc /* @S065 */ }
        flow f12 of AntennaStatusLinkConfigurationTimingReferencesAndRoutingReadinessItem from networkControlSystem to missionControlCenter { doc /* @S079 */ }
        flow f13 of OperationalConstraintsItem from missionControlCenter to missionPlanningSystem { doc /* @S099 */ }
        flow f14 of ObservationRequestsItem from userServicesPortal to missionPlanningSystem { doc /* @S101 */ }
        flow f15 of CommandPreparationPackageItem from missionPlanningSystem to missionControlCenter { doc /* @S118 */ }
        flow f16 of TrackingMeasurementsItem from northSBandAntenna to orbitDeterminationEngine { doc /* @S129 */ }
        flow f17 of TrackingMeasurementsItem from southSBandAntenna to orbitDeterminationEngine { doc /* @S129 */ }
        flow f18 of TrackingMeasurementsItem from kirunaXBandAntenna to orbitDeterminationEngine { doc /* @S129 */ }
        flow f19 of TrackingMeasurementsItem from svalbardXBandAntenna to orbitDeterminationEngine { doc /* @S129 */ }
        flow f20 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to missionControlCenter { doc /* @S141 */ }
        flow f21 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to missionPlanningSystem { doc /* @S141 */ }
        flow f22 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to payloadProcessingFacility { doc /* @S141 */ }
        flow f23 of EligibleJobsItem from schedulingService to backupProcessingCluster { doc /* @S172 */ }
        flow f24 of ProvenanceItem from backupProcessingCluster to productQualityService { doc /* @S173 */ }
        flow f25 of ProductPackageAssociatedQualityMetadataAndChecksumEvidenceItem from payloadProcessingFacility to longTermArchive { doc /* @S178 */ }
        flow f26 of OrbitQualityStateChangesItem from flightDynamicsFacility to archiveOperationsQueue { doc /* @S194 */ }
        flow f27 of ConfigurationChangesItem from networkControlSystem to operationalLog { doc /* @S205 */ }
    }
    requirement def R0 { doc /* human authorization remains required for spacecraft commanding and major configuration changes @S025 */ subject s : GroundSegment; }
    requirement def R1 { doc /* operators must identify safety trends while a contact is still available @S083 */ subject s : Operators; }
    requirement def R2 { doc /* must be reachable during planned critical activities and whenever a console operator declares an off-nominal condition @S095 */ subject s : SubsystemSpecialists; }
    requirement def R3 { doc /* each flight dynamics delivery include a validity interval, coordinate frame, generation time, and operational use statement @S140 */ subject s : MissionControlCenter; }
    requirement def R4 { doc /* release blocking defects must be tracked across scenes and processing levels @S168 */ subject s : ProductQualityService; }
    requirement def R5 { doc /* Lantern shall preserve the last validated routing configuration and reject unreviewed changes while payload product transfers are active. @S171 */ subject s : NetworkControlSystem; }
    requirement def R6 { doc /* Forgehouse must quarantine suspect input and derived output when product lineage cannot be proven during an active anomaly investigation. @S215 */ subject s : PayloadProcessingFacility; }
}
