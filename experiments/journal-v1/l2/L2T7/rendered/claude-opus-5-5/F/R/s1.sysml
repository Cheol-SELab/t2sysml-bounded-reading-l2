package L2Model {
    item def AntennaDeicingNoticeItem { doc /* @S113 */ }
    item def AntennaStatusLinkConfigurationTimingReferencesAndRoutingReadinessItem { doc /* @S079 */ }
    item def CalibrationPatchBundleItem { doc /* @S094 */ }
    item def CatalogueRecordsItem { doc /* @S181 */ }
    item def CommandPreparationPackageItem { doc /* @S118 */ }
    item def ContactStatusAndDataFlowIndicatorsItem { doc /* @S048 */ }
    item def DopplerResidualReportItem { doc /* @S131 */ }
    item def EphemerisDeltaNoteItem { doc /* @S144 */ }
    item def LaserRetroreflectorWindowItem { doc /* @S145 */ }
    item def LocalConstraintsItem { doc /* @S043 */ }
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
    item def VisibilityPredictionsAndAntennaPointingSupportProductsItem { doc /* @S040 */ }
    part def ArchiveOperationsQueue { doc /* @S194 */ }
    part def BackupProcessingCluster { doc /* @S004,S150,S173,S174,S241 */ }
    part def CommandValidationGateway { doc /* @S004,S012,S119,S121,S139,S143,S206,S242 */ }
    part def ConsoleLead { doc /* @S084 */ }
    part def CybersecurityDesk { doc /* @S023,S074,S200,S204 */ }
    part def FlightDynamicsFacility { doc /* @S004,S008,S040,S106,S132,S139,S141,S194 */ }
    part def FlightDynamicsTeam { doc /* @S131,S134,S144 */ }
    part def GroundNetworkManager { doc /* @S019,S038,S044,S060,S112,S113,S209,S234 */ }
    part def GroundSegment { doc /* @S004,S005,S025,S218,S219 */ }
    part def KirunaXBandAntenna { doc /* @S005,S030,S055 */ }
    part def LongTermArchive { doc /* @S004,S065,S149,S174,S178,S181,S243 */ }
    part def MissionControlCenter { doc /* @S004,S032,S043,S079,S099,S118,S126,S140,S141,S217 */ }
    part def MissionPlanningSystem { doc /* @S004,S011,S034,S040,S099,S101,S106,S107,S110,S114,S118,S141,S144,S145,S207,S216,S240 */ }
    part def NetworkControlSystem { doc /* @S004,S010,S033,S048,S072,S074,S079,S148,S170,S171,S205 */ }
    part def NorthSBandAntenna { doc /* @S005,S028 */ }
    part def Operators { doc /* @S083 */ }
    part def OrbitDeterminationEngine { doc /* @S004,S014,S041,S123,S128,S131,S145 */ }
    part def PayloadCalibrationTeam { doc /* @S094,S161,S193 */ }
    part def PayloadProcessingFacility { doc /* @S004,S049,S055,S110,S141,S151,S178,S215 */ }
    part def PrimaryProcessingCluster { doc /* @S004,S065,S155,S220 */ }
    part def Product { doc /* @S167 */ }
    part def ProductQualityService { doc /* @S004,S015,S094,S130,S162,S165,S168,S195 */ }
    part def RetentionExceptions { doc /* @S191 */ }
    part def SchedulingService { doc /* @S172 */ }
    part def SouthSBandAntenna { doc /* @S005 */ }
    part def SpacecraftOperationsTeam { doc /* @S072,S081,S082,S113,S137,S209 */ }
    part def SpacecraftSystemsEngineer { doc /* @S086 */ }
    part def StationOperators { doc /* @S043 */ }
    part def SubsystemSpecialists { doc /* @S095 */ }
    part def SvalbardXBandAntenna { doc /* @S005,S055 */ }
    part def TelemetryEngineer { doc /* @S085 */ }
    part def TelemetryIngestService { doc /* @S004,S013,S048,S080,S081,S153 */ }
    part def UserServicesPortal { doc /* @S004,S101,S104,S168,S181,S183,S201,S239 */ }
    part system {
        part archiveOperationsQueue : ArchiveOperationsQueue;
        part backupProcessingCluster : BackupProcessingCluster {
            perform action a0 { doc /* supports product generation @S150 */ }
            perform action a1 { doc /* writes provenance that identifies the fallback execution path @S173 */ }
            perform action a2 { doc /* verify that recovery capacity is sufficient @S241 */ }
        }
        part commandValidationGateway : CommandValidationGateway {
            perform action a0 { doc /* enforces rule checks before commands are made available for uplink @S012 */ }
            perform action a1 { doc /* performs independent validation of command stacks @S119 */ }
            perform action a2 { doc /* rejects command stacks that contain unapproved manual edits @S121 */ }
            perform action a3 { doc /* checks maneuver command parameters against the screened burn plan @S143 */ }
            perform action a4 { doc /* accepts the mask file @S206 */ }
            perform action a5 { doc /* rejects any command request that lacks the approved authorization state @S242 */ }
        }
        part consoleLead : ConsoleLead {
            perform action a0 { doc /* authorizing planned command execution through the Command Validation Gateway @S084 */ }
        }
        part cybersecurityDesk : CybersecurityDesk {
            perform action a0 { doc /* provides continuous security monitoring @S023 */ }
            perform action a1 { doc /* reviews public interface changes before deployment @S200 */ }
            perform action a2 { doc /* reviews privileged access daily @S204 */ }
        }
        part flightDynamicsFacility : FlightDynamicsFacility {
            perform action a0 { doc /* provides orbit analysis, maneuver planning support, access prediction, and navigation products @S008 */ }
            perform action a1 { doc /* maintains the authoritative orbit catalog @S132 */ }
        }
        part flightDynamicsTeam : FlightDynamicsTeam {
            perform action a0 { doc /* computes expected state change, execution tolerance, recovery strategy @S134 */ }
        }
        part groundNetworkManager : GroundNetworkManager {
            perform action a0 { doc /* coordinates availability of the antenna assets @S019 */ }
            perform action a1 { doc /* arbitrates unresolved contact conflicts @S038 */ }
            perform action a2 { doc /* issues the Antenna Deicing Notice @S044 */ }
            perform action a3 { doc /* determines that a maintenance condition could cause route oscillation @S060 */ }
            perform action a4 { doc /* confirms that planned station use is compatible with network maintenance windows @S112 */ }
            perform action a5 { doc /* leads triage for antenna, link, and site-service indicators @S209 */ }
            perform action a6 { doc /* accepts the antenna readiness baseline @S234 */ }
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
        part longTermArchive : LongTermArchive {
            perform action a0 { doc /* retains released orbit products, covariance data, maneuver records, and quality decisions @S149 */ }
            perform action a1 { doc /* preserves the accepted archive baseline @S243 */ }
        }
        part missionControlCenter : MissionControlCenter {
            perform action a0 { doc /* maintains the operational contact schedule @S032 */ }
            perform action a1 { doc /* Continuity modes are declared @S217 */ }
        }
        part missionPlanningSystem : MissionPlanningSystem {
            perform action a0 { doc /* converts approved imaging demand and spacecraft constraints into executable activity plans @S011 */ }
            perform action a1 { doc /* Contact booking requests are submitted @S034 */ }
            perform action a2 { doc /* combines request priority, instrument availability, contact opportunities into a draft activity schedule @S107 */ }
            perform action a3 { doc /* flags conflicts @S114 */ }
            perform action a4 { doc /* treats the retroreflector window as a constrained planning input @S207 */ }
            perform action a5 { doc /* suspends automatic schedule publication @S216 */ }
            perform action a6 { doc /* applies the delta note during schedule validation @S240 */ }
        }
        part networkControlSystem : NetworkControlSystem {
            perform action a0 { doc /* monitors communications availability @S010 */ }
            perform action a1 { doc /* routes operational traffic @S010 */ }
            perform action a2 { doc /* distributes station allocations @S033 */ }
            perform action a3 { doc /* records the actual start and end times of each contact @S033 */ }
            perform action a4 { doc /* prepare scheduled contacts and verify tracking readiness @S148 */ }
            perform action a5 { doc /* restrict affected transfer paths @S170 */ }
            perform action a6 { doc /* enforces approved routing paths @S205 */ }
        }
        part northSBandAntenna : NorthSBandAntenna {
            perform action a0 { doc /* provides the nominal early-pass command uplink and low-rate telemetry return @S028 */ }
        }
        part operators : Operators;
        part orbitDeterminationEngine : OrbitDeterminationEngine {
            perform action a0 { doc /* processing tracking inputs and producing controlled orbit knowledge @S014 */ }
            perform action a1 { doc /* produces the Doppler Residual Report @S041 */ }
            perform action a2 { doc /* fits dynamic orbit solutions @S128 */ }
        }
        part payloadCalibrationTeam : PayloadCalibrationTeam {
            perform action a0 { doc /* maintains the approved calibration baseline @S161 */ }
            perform action a1 { doc /* request a reprocessing campaign @S193 */ }
        }
        part payloadProcessingFacility : PayloadProcessingFacility {
            perform action a0 { doc /* coordinates with Primary Processing Cluster and Backup Processing Cluster @S049 */ }
            perform action a1 { doc /* transforming downlinked payload telemetry into image products @S151 */ }
        }
        part primaryProcessingCluster : PrimaryProcessingCluster {
            perform action a0 { doc /* generates Level 0 products @S155 */ }
            perform action a1 { doc /* pause nonessential production queues @S220 */ }
        }
        part product : Product {
            exhibit state modes {
                state s0 { doc /* delivery hold state @S167 */ }
            }
        }
        part productQualityService : ProductQualityService {
            perform action a0 { doc /* performs automated and analyst-supported checks on generated products @S015 */ }
            perform action a1 { doc /* checks each orbit solution @S130 */ }
            perform action a2 { doc /* update calibration applicability checks @S162 */ }
            perform action a3 { doc /* assigns quality flags @S165 */ }
            perform action a4 { doc /* records the reason for any reprocessing decision @S195 */ }
        }
        part retentionExceptions : RetentionExceptions;
        part schedulingService : SchedulingService {
            perform action a0 { doc /* assigns eligible jobs to the Backup Processing Cluster @S172 */ }
        }
        part southSBandAntenna : SouthSBandAntenna;
        part spacecraftOperationsTeam : SpacecraftOperationsTeam {
            perform action a0 { doc /* monitors spacecraft mode, power state, thermal margins @S082 */ }
            perform action a1 { doc /* leads triage for spacecraft safety indicators @S209 */ }
        }
        part spacecraftSystemsEngineer : SpacecraftSystemsEngineer {
            perform action a0 { doc /* interprets health telemetry @S086 */ }
        }
        part stationOperators : StationOperators;
        part subsystemSpecialists : SubsystemSpecialists;
        part svalbardXBandAntenna : SvalbardXBandAntenna;
        part telemetryEngineer : TelemetryEngineer {
            perform action a0 { doc /* verifies reception quality, frame loss, latency, and stream continuity @S085 */ }
        }
        part telemetryIngestService : TelemetryIngestService {
            perform action a0 { doc /* receives spacecraft telemetry from scheduled contacts @S013 */ }
            perform action a1 { doc /* validates basic framing and time continuity @S080 */ }
            perform action a2 { doc /* writes accepted raw data to immutable staging storage @S153 */ }
        }
        part userServicesPortal : UserServicesPortal {
            perform action a0 { doc /* records the request state @S104 */ }
            perform action a1 { doc /* provides search, preview, order, and download functions @S183 */ }
            perform action a2 { doc /* prevent release of affected products @S239 */ }
        }
        flow f0 of VisibilityPredictionsAndAntennaPointingSupportProductsItem from flightDynamicsFacility to missionPlanningSystem { doc /* @S040 */ }
        flow f1 of LocalConstraintsItem from stationOperators to missionControlCenter { doc /* @S043 */ }
        flow f2 of ContactStatusAndDataFlowIndicatorsItem from networkControlSystem to telemetryIngestService { doc /* @S048 */ }
        flow f3 of PayloadDownlinkTrafficItem from kirunaXBandAntenna to payloadProcessingFacility { doc /* @S055 */ }
        flow f4 of PayloadDownlinkTrafficItem from svalbardXBandAntenna to payloadProcessingFacility { doc /* @S055 */ }
        flow f5 of TransfersItem from primaryProcessingCluster to longTermArchive { doc /* @S065 */ }
        flow f6 of TimingAlarmsItem from networkControlSystem to spacecraftOperationsTeam { doc /* @S072 */ }
        flow f7 of SecurityExceptionTicketItem from cybersecurityDesk to networkControlSystem { doc /* @S074 */ }
        flow f8 of AntennaStatusLinkConfigurationTimingReferencesAndRoutingReadinessItem from networkControlSystem to missionControlCenter { doc /* @S079 */ }
        flow f9 of PassReplayPacketItem from telemetryIngestService to spacecraftOperationsTeam { doc /* @S081 */ }
        flow f10 of CalibrationPatchBundleItem from payloadCalibrationTeam to productQualityService { doc /* @S094 */ }
        flow f11 of OperationalConstraintsItem from missionControlCenter to missionPlanningSystem { doc /* @S099 */ }
        flow f12 of ObservationRequestsItem from userServicesPortal to missionPlanningSystem { doc /* @S101 */ }
        flow f13 of OrbitPredictionsAndVisibilityAssumptionsItem from flightDynamicsFacility to missionPlanningSystem { doc /* @S106 */ }
        flow f14 of PlanningMetadataItem from missionPlanningSystem to payloadProcessingFacility { doc /* @S110 */ }
        flow f15 of AntennaDeicingNoticeItem from groundNetworkManager to spacecraftOperationsTeam { doc /* @S113 */ }
        flow f16 of CommandPreparationPackageItem from missionPlanningSystem to missionControlCenter { doc /* @S118 */ }
        flow f17 of DopplerResidualReportItem from orbitDeterminationEngine to flightDynamicsTeam { doc /* @S131 */ }
        flow f18 of StarTrackerMaskFileItem from flightDynamicsFacility to commandValidationGateway { doc /* @S139 */ }
        flow f19 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to missionControlCenter { doc /* @S141 */ }
        flow f20 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to missionPlanningSystem { doc /* @S141 */ }
        flow f21 of RoutineEphemeridesAndEventPredictionsItem from flightDynamicsFacility to payloadProcessingFacility { doc /* @S141 */ }
        flow f22 of EphemerisDeltaNoteItem from flightDynamicsTeam to missionPlanningSystem { doc /* @S144 */ }
        flow f23 of LaserRetroreflectorWindowItem from orbitDeterminationEngine to missionPlanningSystem { doc /* @S145 */ }
        flow f24 of ProductHoldListItem from productQualityService to userServicesPortal { doc /* @S168 */ }
        flow f25 of StorageWatermarkSnapshotItem from longTermArchive to backupProcessingCluster { doc /* @S174 */ }
        flow f26 of ProductPackageAssociatedQualityMetadataAndChecksumEvidenceItem from payloadProcessingFacility to longTermArchive { doc /* @S178 */ }
        flow f27 of CatalogueRecordsItem from longTermArchive to userServicesPortal { doc /* @S181 */ }
        flow f28 of OrbitQualityStateChangesItem from flightDynamicsFacility to archiveOperationsQueue { doc /* @S194 */ }
    }
    requirement def R0 { doc /* human authorization remains required for spacecraft commanding and major configuration changes @S025 */ subject s : GroundSegment; }
    requirement def R1 { doc /* operators must identify safety trends while a contact is still available @S083 */ subject s : Operators; }
    requirement def R2 { doc /* they must be reachable during planned critical activities and whenever a console operator declares an off-nominal condition @S095 */ subject s : SubsystemSpecialists; }
    requirement def R3 { doc /* Final approval requires concurrence from the Mission Control Center and the Spacecraft Operations Team before any command stack is placed in the queue @S126 */ subject s : MissionControlCenter; }
    requirement def R4 { doc /* each flight dynamics delivery include a validity interval, coordinate frame, generation time, and operational use statement @S140 */ subject s : MissionControlCenter; }
    requirement def R5 { doc /* shall preserve the last validated routing configuration and reject unreviewed changes while payload product transfers are active @S171 */ subject s : NetworkControlSystem; }
    requirement def R6 { doc /* Retention exceptions require traceability to the approving authority, the affected product classes, and the expected operational impact @S191 */ subject s : RetentionExceptions; }
    requirement def R7 { doc /* must quarantine suspect input and derived output when product lineage cannot be proven during an active anomaly investigation @S215 */ subject s : PayloadProcessingFacility; }
}
