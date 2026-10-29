package L2Model {
    item def AntennaStatusLinkConfigurationTimingReferencesAndRoutingReadinessItem { doc /* @S079 */ }
    item def CommandPreparationPackageItem { doc /* @S118 */ }
    item def CommandUplinkItem { doc /* @S028 */ }
    item def ConfigurationChangesItem { doc /* @S205 */ }
    item def DegradedLinkConditionsItem { doc /* @S085 */ }
    item def HighRatePayloadDataItem { doc /* @S030 */ }
    item def LatestSpacecraftStateItem { doc /* @S122 */ }
    item def LocalConstraintsNotificationItem { doc /* @S043 */ }
    item def LowRateTelemetryItem { doc /* @S028 */ }
    item def ObservationRequestsItem { doc /* @S101 */ }
    item def OperationalConstraintsItem { doc /* @S099 */ }
    item def OrbitPredictionsAndVisibilityAssumptionsItem { doc /* @S106 */ }
    item def OrbitQualityStateChangesItem { doc /* @S194 */ }
    item def PayloadDownlinkTrafficItem { doc /* @S055 */ }
    item def ProductPackageAssociatedQualityMetadataAndChecksumEvidenceItem { doc /* @S178 */ }
    item def ProvenanceItem { doc /* @S173 */ }
    item def RoutineEphemeridesAndEventPredictionsItem { doc /* @S141 */ }
    item def SpacecraftTelemetryItem { doc /* @S013 */ }
    item def TimingAlarmsItem { doc /* @S072 */ }
    item def TransfersItem { doc /* @S065 */ }
    part def AntennaSiteEquipment { doc /* @S070 */ }
    part def ArchiveOperationsQueue { doc /* @S194 */ }
    part def BackupProcessingCluster { doc /* @S004,S016,S066,S150,S173,S241 */ }
    part def CommandValidationGateway { doc /* @S004,S012,S119,S120,S121,S122,S143,S206,S242 */ }
    part def ConsoleLead { doc /* @S084,S085 */ }
    part def ConsoleOperator { doc /* @S095,S098 */ }
    part def CybersecurityDesk { doc /* @S023,S074,S076,S125,S200,S204,S212,S238 */ }
    part def DownloadServices { doc /* @S184 */ }
    part def DraftActivitySchedule { doc /* @S108,S109 */ }
    part def EngineeringTeams { doc /* @S218 */ }
    part def ExternalInterfaces { doc /* @S199 */ }
    part def FlightDynamicsFacility { doc /* @S004,S008,S040,S106,S132,S139,S141,S194,S231 */ }
    part def FlightDynamicsTeam { doc /* @S021,S071,S088,S097,S116,S131,S134,S136,S144,S210,S236 */ }
    part def GroundNetworkManager { doc /* @S019,S038,S044,S060,S067,S076,S087,S112,S209,S222,S234 */ }
    part def GroundSegment { doc /* @S002,S004,S005,S025,S218,S219 */ }
    part def HousekeepingActivities { doc /* @S108 */ }
    part def KirunaXBandAntenna { doc /* @S005,S030,S055,S078 */ }
    part def LocalStationTeams { doc /* @S042 */ }
    part def LongTermArchive { doc /* @S004,S065,S149,S174,S178,S180,S187,S196,S224,S243 */ }
    part def MissionControlCenter { doc /* @S004,S032,S043,S056,S077,S079,S093,S096,S099,S100,S118,S126,S140,S141,S175,S203,S217,S230 */ }
    part def MissionManagement { doc /* @S176,S186 */ }
    part def MissionPlanningSystem { doc /* @S004,S011,S034,S099,S101,S102,S106,S107,S114,S118,S141,S142,S207,S216,S240 */ }
    part def NetworkControlSystem { doc /* @S004,S010,S033,S056,S072,S079,S148,S170,S171,S205,S233 */ }
    part def NorthSBandAntenna { doc /* @S005,S028,S054,S078 */ }
    part def OperationalLog { doc /* @S205 */ }
    part def OperationsStaff { doc /* @S201 */ }
    part def OperatorDisplay { doc /* @S154 */ }
    part def Operators { doc /* @S083,S213 */ }
    part def OrbitDeterminationEngine { doc /* @S004,S014,S041,S089,S123,S128,S145 */ }
    part def PayloadCalibrationTeam { doc /* @S022,S094,S117,S147,S161,S193,S211,S237 */ }
    part def PayloadImaging { doc /* @S108 */ }
    part def PayloadProcessingFacility { doc /* @S004,S009,S049,S055,S110,S141,S151,S178,S215,S232 */ }
    part def PrimaryMonthlyServiceReview { doc /* @S246 */ }
    part def PrimaryProcessingCluster { doc /* @S004,S065,S150,S155,S220 */ }
    part def Product { doc /* @S167 */ }
    part def ProductQualityService { doc /* @S004,S015,S124,S130,S162,S165,S168,S173,S181,S195 */ }
    part def ProtectedAccessRouters { doc /* @S054 */ }
    part def ReadinessReviewBoard { doc /* @S228 */ }
    part def RecorderManagement { doc /* @S108 */ }
    part def RegisteredUsers { doc /* @S185 */ }
    part def SchedulingService { doc /* @S172 */ }
    part def SentinelVale { doc /* @S001 */ }
    part def SouthSBandAntenna { doc /* @S005,S029,S054,S078 */ }
    part def Spacecraft { doc /* @S013,S028,S030 */ }
    part def SpacecraftOperationsTeam { doc /* @S020,S072,S082,S097,S105,S113,S137,S146,S198,S209,S235 */ }
    part def SpacecraftSystemsEngineer { doc /* @S086 */ }
    part def StationOperators { doc /* @S043 */ }
    part def SubsystemSpecialists { doc /* @S095 */ }
    part def SvalbardXBandAntenna { doc /* @S005,S031,S055,S078 */ }
    part def TelemetryEngineer { doc /* @S085 */ }
    part def TelemetryIngestService { doc /* @S004,S013,S048,S080,S081,S122,S153 */ }
    part def UserServicesPortal { doc /* @S004,S018,S101,S104,S181,S183,S201,S225,S239 */ }
    part system {
        part antennaSiteEquipment : AntennaSiteEquipment {
            perform action a0 { doc /* validates time against independent local references @S070 */ }
        }
        part archiveOperationsQueue : ArchiveOperationsQueue;
        part backupProcessingCluster : BackupProcessingCluster {
            perform action a0 { doc /* is maintained for resilience and controlled failover @S016 */ }
            perform action a1 { doc /* receives lower routing preference during normal operations @S066 */ }
            perform action a2 { doc /* supports product generation @S150 */ }
            perform action a3 { doc /* writes provenance that identifies the fallback execution path @S173 */ }
            perform action a4 { doc /* uses the Storage Watermark Snapshot to verify that recovery capacity is sufficient @S241 */ }
            perform action a5 { doc /* accepts routine standby responsibility @S241 */ }
            exhibit state modes {
                state s0 { doc /* normal operations @S066 */ }
            }
        }
        part commandValidationGateway : CommandValidationGateway {
            perform action a0 { doc /* provides the formal barrier between planning outputs and command release @S012 */ }
            perform action a1 { doc /* enforces rule checks @S012 */ }
            perform action a2 { doc /* performs independent validation of command stacks @S119 */ }
            perform action a3 { doc /* checks syntax, timing, parameter ranges, sequencing rules, spacecraft mode compatibility, and consistency with the approved schedule baseline @S120 */ }
            perform action a4 { doc /* rejects command stacks @S121 */ }
            perform action a5 { doc /* checks maneuver command parameters against the screened burn plan @S143 */ }
            perform action a6 { doc /* allowing the command stack to proceed @S143 */ }
            perform action a7 { doc /* accepts the mask file @S206 */ }
            perform action a8 { doc /* rejects any command request @S242 */ }
        }
        part consoleLead : ConsoleLead {
            perform action a0 { doc /* declaring pass status @S084 */ }
            perform action a1 { doc /* authorizing planned command execution through the Command Validation Gateway @S084 */ }
            perform action a2 { doc /* pausing the activity @S084 */ }
        }
        part consoleOperator : ConsoleOperator {
            perform action a0 { doc /* declares an off-nominal condition @S095 */ }
            perform action a1 { doc /* preserve the command state @S098 */ }
            perform action a2 { doc /* avoid discretionary commanding @S098 */ }
            perform action a3 { doc /* request specialist review @S098 */ }
            perform action a4 { doc /* changing spacecraft configuration @S098 */ }
        }
        part cybersecurityDesk : CybersecurityDesk {
            perform action a0 { doc /* provides continuous security monitoring, operational security guidance, and escalation support @S023 */ }
            perform action a1 { doc /* sends a Security Exception Ticket @S074 */ }
            perform action a2 { doc /* coordinate before blocking traffic @S076 */ }
            perform action a3 { doc /* reviews command preparation exceptions @S125 */ }
            perform action a4 { doc /* reviews public interface changes @S200 */ }
            perform action a5 { doc /* reviews privileged access daily @S204 */ }
            perform action a6 { doc /* challenges dormant, shared, or unexplained accounts @S204 */ }
            perform action a7 { doc /* assumes coordination authority @S212 */ }
            perform action a8 { doc /* participates in the final exercise @S238 */ }
            perform action a9 { doc /* validating alert routing, privileged access review, and incident coordination @S238 */ }
        }
        part downloadServices : DownloadServices {
            perform action a0 { doc /* support resumable transfer, integrity verification, and rate controls @S184 */ }
        }
        part draftActivitySchedule : DraftActivitySchedule {
            perform action a0 { doc /* accounts for downlink opportunities through the Kiruna X-Band Antenna and Svalbard X-Band Antenna @S109 */ }
        }
        part engineeringTeams : EngineeringTeams {
            perform action a0 { doc /* focus on stabilizing observability and protecting evidence @S218 */ }
        }
        part externalInterfaces : ExternalInterfaces {
            perform action a0 { doc /* expose catalogue search, subscription notification, product ordering, and download status @S199 */ }
        }
        part flightDynamicsFacility : FlightDynamicsFacility {
            perform action a0 { doc /* provides orbit analysis, maneuver planning support, access prediction, and navigation products @S008 */ }
            perform action a1 { doc /* provides visibility predictions and antenna pointing support products to the planning process @S040 */ }
            perform action a2 { doc /* provides orbit predictions and visibility assumptions @S106 */ }
            perform action a3 { doc /* maintains the authoritative orbit catalog @S132 */ }
            perform action a4 { doc /* records the modeling assumptions applied to each accepted solution @S132 */ }
            perform action a5 { doc /* verifying predicted bright-object exclusions against the current attitude plan @S139 */ }
            perform action a6 { doc /* sends the Star Tracker Mask File @S139 */ }
            perform action a7 { doc /* distributes routine ephemerides and event predictions @S141 */ }
            perform action a8 { doc /* publishes orbit quality state changes to the archive operations queue @S194 */ }
            perform action a9 { doc /* provides readiness evidence @S231 */ }
        }
        part flightDynamicsTeam : FlightDynamicsTeam {
            perform action a0 { doc /* owns flight dynamics analysis, orbit maintenance recommendations, and operational coordination for navigation-related constraints @S021 */ }
            perform action a1 { doc /* monitors timing quality alongside orbit support metrics @S071 */ }
            perform action a2 { doc /* uses tracking measurements and validated time tags @S088 */ }
            perform action a3 { doc /* support orbit assessment @S088 */ }
            perform action a4 { doc /* coordinate closely before orbit-control activities @S097 */ }
            perform action a5 { doc /* reviews cases where orbital uncertainty or contact geometry could reduce the execution margin @S116 */ }
            perform action a6 { doc /* separate station-related tracking biases from dynamic model errors @S131 */ }
            perform action a7 { doc /* accepting an orbit solution @S131 */ }
            perform action a8 { doc /* computes expected state change, execution tolerance, recovery strategy, and the earliest time @S134 */ }
            perform action a9 { doc /* maintains screening rules @S136 */ }
            perform action a10 { doc /* produces the Ephemeris Delta Note @S144 */ }
            perform action a11 { doc /* assesses orbit and timing effects @S210 */ }
            perform action a12 { doc /* conducts a separate rehearsal for missed tracking data and late orbit update availability @S236 */ }
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
            perform action a13 { doc /* Cross-site failover is coordinated @S222 */ }
            perform action a14 { doc /* accepts the antenna readiness baseline @S234 */ }
            exhibit state modes {
                state s0 { doc /* contingency operations @S076 */ }
            }
        }
        part groundSegment : GroundSegment {
            perform action a0 { doc /* plan spacecraft activities @S002 */ }
            perform action a1 { doc /* acquire mission data @S002 */ }
            perform action a2 { doc /* maintain safe spacecraft operations @S002 */ }
            perform action a3 { doc /* generate user products @S002 */ }
            perform action a4 { doc /* preserve mission records @S002 */ }
            perform action a5 { doc /* provide controlled access to services @S002 */ }
            perform action a6 { doc /* prioritizes spacecraft safety contacts, time-critical telemetry capture, core orbit support, and protection of unrecoverable payload data @S219 */ }
            exhibit state modes {
                state s0 { doc /* essential-service mode @S219 */ }
                state s1 { doc /* monitor-only mode @S218 */ }
            }
        }
        part housekeepingActivities : HousekeepingActivities;
        part kirunaXBandAntenna : KirunaXBandAntenna {
            perform action a0 { doc /* is planned with margin for setup, carrier acquisition, and post-contact checks @S030 */ }
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
            perform action a0 { doc /* retains released orbit products, covariance data, maneuver records, and quality decisions @S149 */ }
            perform action a1 { doc /* sends the Storage Watermark Snapshot @S174 */ }
            perform action a2 { doc /* stores object content separately from searchable metadata @S180 */ }
            perform action a3 { doc /* retains raw acquisition data @S187 */ }
            perform action a4 { doc /* preserves the replaced product version @S196 */ }
            perform action a5 { doc /* remains the custody reference during degraded operations @S224 */ }
            perform action a6 { doc /* preserves the accepted archive baseline @S243 */ }
            perform action a7 { doc /* confirms that retrieval tests meet the service objective @S243 */ }
        }
        part missionControlCenter : MissionControlCenter {
            perform action a0 { doc /* maintains the operational contact schedule @S032 */ }
            perform action a1 { doc /* uses it as the controlling reference for console staffing, command readiness, and telemetry coverage @S032 */ }
            perform action a2 { doc /* hosts the primary routing policy point @S056 */ }
            perform action a3 { doc /* treats every scheduled contact as a controlled operational activity @S077 */ }
            perform action a4 { doc /* coordinates with the Payload Processing Facility @S093 */ }
            perform action a5 { doc /* begins with the console lead @S096 */ }
            perform action a6 { doc /* moves to the responsible discipline lead @S096 */ }
            perform action a7 { doc /* reaches mission management @S096 */ }
            perform action a8 { doc /* records unresolved actions, open engineering questions, and expected specialist responses @S100 */ }
            perform action a9 { doc /* maintains the authority boundary for routine spacecraft operations @S203 */ }
            perform action a10 { doc /* confirms that elevated access is tied to an approved shift role and a time-limited operational need @S203 */ }
            perform action a11 { doc /* consultation with the affected technical leads @S217 */ }
            perform action a12 { doc /* Continuity modes are declared @S217 */ }
            perform action a13 { doc /* demonstrates continuous console coverage for the agreed service hours @S230 */ }
            perform action a14 { doc /* proves that shift handover logs contain the state needed by the incoming controller @S230 */ }
        }
        part missionManagement : MissionManagement {
            perform action a0 { doc /* approves a different backlog rule @S176 */ }
            perform action a1 { doc /* approved for open dissemination @S186 */ }
        }
        part missionPlanningSystem : MissionPlanningSystem {
            perform action a0 { doc /* converts approved imaging demand and spacecraft constraints into executable activity plans @S011 */ }
            perform action a1 { doc /* receives operational constraints from mission control @S099 */ }
            perform action a2 { doc /* assembling candidate observation timelines and associated ground contact activities @S102 */ }
            perform action a3 { doc /* combines request priority, instrument availability, contact opportunities, onboard storage margin, and downlink capacity into a draft activity schedule @S107 */ }
            perform action a4 { doc /* flags conflicts @S114 */ }
            perform action a5 { doc /* exports a command preparation package @S118 */ }
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
            perform action a10 { doc /* uses the Security Exception Ticket to restrict affected transfer paths @S170 */ }
            perform action a11 { doc /* preserve the last validated routing configuration @S171 */ }
            perform action a12 { doc /* reject unreviewed changes @S171 */ }
            perform action a13 { doc /* enforces approved routing paths between ground stations, processing services, and external interfaces @S205 */ }
            perform action a14 { doc /* records configuration changes in the operational log @S205 */ }
            perform action a15 { doc /* records rehearsal outcomes @S233 */ }
        }
        part northSBandAntenna : NorthSBandAntenna {
            perform action a0 { doc /* provides the nominal early-pass command uplink and low-rate telemetry return @S028 */ }
            perform action a1 { doc /* connect to the Mission Control Center through protected access routers @S054 */ }
            perform action a2 { doc /* assigned for command and low-rate telemetry contacts @S078 */ }
        }
        part operationalLog : OperationalLog;
        part operationsStaff : OperationsStaff {
            perform action a0 { doc /* open the normal incident process @S201 */ }
        }
        part operatorDisplay : OperatorDisplay {
            perform action a0 { doc /* shows whether recovery, retransmission, or discard is required @S154 */ }
        }
        part operators : Operators {
            perform action a0 { doc /* identify safety trends @S083 */ }
            perform action a1 { doc /* preserve volatile logs, current configuration state, operator console history, and relevant message identifiers @S213 */ }
            perform action a2 { doc /* restarting services or changing routing @S213 */ }
        }
        part orbitDeterminationEngine : OrbitDeterminationEngine {
            perform action a0 { doc /* supports routine orbit maintenance @S014 */ }
            perform action a1 { doc /* processing tracking inputs @S014 */ }
            perform action a2 { doc /* producing controlled orbit knowledge for planning and product generation @S014 */ }
            perform action a3 { doc /* produces the Doppler Residual Report @S041 */ }
            perform action a4 { doc /* supports routine state updates @S089 */ }
            perform action a5 { doc /* provides the basis for predicting future visibility periods, maneuver planning constraints, and antenna pointing expectations @S089 */ }
            perform action a6 { doc /* provides the current orbital solution @S123 */ }
            perform action a7 { doc /* fits dynamic orbit solutions @S128 */ }
            perform action a8 { doc /* produces the Laser Retroreflector Window @S145 */ }
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
        part payloadImaging : PayloadImaging;
        part payloadProcessingFacility : PayloadProcessingFacility {
            perform action a0 { doc /* provides the operational environment for payload data processing, calibration control, product assessment, and distribution staging @S009 */ }
            perform action a1 { doc /* coordinates with Primary Processing Cluster and Backup Processing Cluster @S049 */ }
            perform action a2 { doc /* receives planning metadata @S110 */ }
            perform action a3 { doc /* prepare downstream processing expectations @S110 */ }
            perform action a4 { doc /* transforming downlinked payload telemetry into image products @S151 */ }
            perform action a5 { doc /* delivered the product package, associated quality metadata, and checksum evidence @S178 */ }
            perform action a6 { doc /* quarantine suspect input and derived output @S215 */ }
            perform action a7 { doc /* demonstrates that science product generation can be sustained @S232 */ }
        }
        part primaryMonthlyServiceReview : PrimaryMonthlyServiceReview {
            perform action a0 { doc /* compares actual performance against the accepted baseline @S246 */ }
            perform action a1 { doc /* records trend explanations @S246 */ }
        }
        part primaryProcessingCluster : PrimaryProcessingCluster {
            perform action a0 { doc /* generates Level 0 products @S155 */ }
            perform action a1 { doc /* pause nonessential production queues @S220 */ }
            perform action a2 { doc /* reserve compute capacity for validated recovery runs from known-good inputs @S220 */ }
            exhibit state modes {
                state s0 { doc /* unavailable @S150 */ }
            }
        }
        part product : Product {
            exhibit state modes {
                state s0 { doc /* delivery hold @S167 */ }
            }
        }
        part productQualityService : ProductQualityService {
            perform action a0 { doc /* performs automated and analyst-supported checks on generated products @S015 */ }
            perform action a1 { doc /* add planning feedback @S124 */ }
            perform action a2 { doc /* checks each orbit solution for frame consistency, covariance reasonableness, time-tag continuity, and agreement with recent contact predictions @S130 */ }
            perform action a3 { doc /* uses the patch bundle to update calibration applicability checks @S162 */ }
            perform action a4 { doc /* assigns quality flags for missing source packets, timing discontinuity, saturation, cloud screening uncertainty, geolocation residuals, and processing fallback @S165 */ }
            perform action a5 { doc /* produces the Product Hold List @S168 */ }
            perform action a6 { doc /* treats that marker as an input to its quality decision @S173 */ }
            perform action a7 { doc /* set the public quality status @S181 */ }
            perform action a8 { doc /* records the reason for any reprocessing decision @S195 */ }
        }
        part protectedAccessRouters : ProtectedAccessRouters {
            perform action a0 { doc /* keep command and telemetry traffic separate from site administration traffic @S054 */ }
        }
        part readinessReviewBoard : ReadinessReviewBoard {
            perform action a0 { doc /* verifies that each open action from launch and commissioning has an owner, a due date, and an accepted residual risk statement @S228 */ }
        }
        part recorderManagement : RecorderManagement;
        part registeredUsers : RegisteredUsers {
            perform action a0 { doc /* receive authorization scopes @S185 */ }
        }
        part schedulingService : SchedulingService {
            perform action a0 { doc /* assigns eligible jobs to the Backup Processing Cluster @S172 */ }
        }
        part sentinelVale : SentinelVale {
            perform action a0 { doc /* provide routine land, coastal, and cryosphere imaging products @S001 */ }
        }
        part southSBandAntenna : SouthSBandAntenna {
            perform action a0 { doc /* provides the alternate S-band path @S029 */ }
            perform action a1 { doc /* is kept in a compatible configuration @S029 */ }
            perform action a2 { doc /* connect to the Mission Control Center through protected access routers @S054 */ }
            perform action a3 { doc /* assigned for command and low-rate telemetry contacts @S078 */ }
        }
        part spacecraft : Spacecraft;
        part spacecraftOperationsTeam : SpacecraftOperationsTeam {
            perform action a0 { doc /* owns spacecraft safety execution, contact conduct, command authorization support, and operational decision making @S020 */ }
            perform action a1 { doc /* monitors spacecraft mode, power state, thermal margins, attitude indicators, command counters, onboard storage, and fault protection messages @S082 */ }
            perform action a2 { doc /* coordinate closely before orbit-control activities @S097 */ }
            perform action a3 { doc /* reviews late operational requests @S105 */ }
            perform action a4 { doc /* uses the Antenna Deicing Notice to assess whether planned support can proceed @S113 */ }
            perform action a5 { doc /* rehearse commanding, verify contingency actions, and coordinate contact coverage @S146 */ }
            perform action a6 { doc /* uses the Pass Replay Packet to confirm that archived downlink context can support anomaly reconstruction @S198 */ }
            perform action a7 { doc /* leads triage for spacecraft safety indicators @S209 */ }
            perform action a8 { doc /* conducts at least one integrated day-in-the-life rehearsal @S235 */ }
            exhibit state modes {
                state s0 { doc /* live operations @S082 */ }
            }
        }
        part spacecraftSystemsEngineer : SpacecraftSystemsEngineer {
            perform action a0 { doc /* interprets health telemetry @S086 */ }
            perform action a1 { doc /* confirms that subsystem states remain within flight rules @S086 */ }
            perform action a2 { doc /* records any anomaly context @S086 */ }
        }
        part stationOperators : StationOperators {
            perform action a0 { doc /* notify the Mission Control Center when local constraints could affect an approved contact @S043 */ }
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
            perform action a6 { doc /* uses the Product Hold List to prevent release of affected products @S239 */ }
            exhibit state modes {
                state s0 { doc /* accepted @S104 */ }
                state s1 { doc /* awaiting technical review @S104 */ }
            }
        }
        flow f0 of SpacecraftTelemetryItem from spacecraft to telemetryIngestService { doc /* @S013 */ }
        flow f1 of CommandUplinkItem from northSBandAntenna to spacecraft { doc /* @S028 */ }
        flow f2 of LowRateTelemetryItem from spacecraft to northSBandAntenna { doc /* @S028 */ }
        flow f3 of HighRatePayloadDataItem from spacecraft to kirunaXBandAntenna { doc /* @S030 */ }
        flow f4 of LocalConstraintsNotificationItem from stationOperators to missionControlCenter { doc /* @S043 */ }
        flow f5 of PayloadDownlinkTrafficItem from kirunaXBandAntenna to payloadProcessingFacility { doc /* @S055 */ }
        flow f6 of PayloadDownlinkTrafficItem from svalbardXBandAntenna to payloadProcessingFacility { doc /* @S055 */ }
        flow f7 of TransfersItem from primaryProcessingCluster to longTermArchive { doc /* @S065 */ }
        flow f8 of TimingAlarmsItem from networkControlSystem to spacecraftOperationsTeam { doc /* @S072 */ }
        flow f9 of AntennaStatusLinkConfigurationTimingReferencesAndRoutingReadinessItem from networkControlSystem to missionControlCenter { doc /* @S079 */ }
        flow f10 of DegradedLinkConditionsItem from telemetryEngineer to consoleLead { doc /* @S085 */ }
        flow f11 of OperationalConstraintsItem from missionControlCenter to missionPlanningSystem { doc /* @S099 */ }
        flow f12 of ObservationRequestsItem from userServicesPortal to missionPlanningSystem { doc /* @S101 */ }
        flow f13 of OrbitPredictionsAndVisibilityAssumptionsItem from flightDynamicsFacility to missionPlanningSystem { doc /* @S106 */ }
        flow f14 of CommandPreparationPackageItem from missionPlanningSystem to missionControlCenter { doc /* @S118 */ }
        flow f15 of LatestSpacecraftStateItem from telemetryIngestService to commandValidationGateway { doc /* @S122 */ }
        flow f16 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to missionControlCenter { doc /* @S141 */ }
        flow f17 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to missionPlanningSystem { doc /* @S141 */ }
        flow f18 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to payloadProcessingFacility { doc /* @S141 */ }
        flow f19 of ProvenanceItem from backupProcessingCluster to productQualityService { doc /* @S173 */ }
        flow f20 of ProductPackageAssociatedQualityMetadataAndChecksumEvidenceItem from payloadProcessingFacility to longTermArchive { doc /* @S178 */ }
        flow f21 of OrbitQualityStateChangesItem from flightDynamicsFacility to archiveOperationsQueue { doc /* @S194 */ }
        flow f22 of ConfigurationChangesItem from networkControlSystem to operationalLog { doc /* @S205 */ }
    }
    requirement def R0 { doc /* human authorization remains required for spacecraft commanding and major configuration changes @S025 */ subject s : GroundSegment; }
    requirement def R1 { doc /* operators must identify safety trends while a contact is still available @S083 */ subject s : Operators; }
    requirement def R2 { doc /* The console lead is responsible for declaring pass status, authorizing planned command execution through the Command Validation Gateway, and pausing the activity when telemetry does not match the expected configuration. @S084 */ subject s : ConsoleLead; }
    requirement def R3 { doc /* they must be reachable during planned critical activities and whenever a console operator declares an off-nominal condition @S095 */ subject s : SubsystemSpecialists; }
    requirement def R4 { doc /* Final approval requires concurrence from the Mission Control Center and the Spacecraft Operations Team before any command stack is placed in the queue for the next authorized uplink opportunity @S126 */ subject s : MissionControlCenter; }
    requirement def R5 { doc /* each flight dynamics delivery include a validity interval, coordinate frame, generation time, and operational use statement @S140 */ subject s : MissionControlCenter; }
    requirement def R6 { doc /* Lantern shall preserve the last validated routing configuration and reject unreviewed changes while payload product transfers are active. @S171 */ subject s : NetworkControlSystem; }
    requirement def R7 { doc /* Forgehouse must quarantine suspect input and derived output when product lineage cannot be proven during an active anomaly investigation. @S215 */ subject s : PayloadProcessingFacility; }
}
