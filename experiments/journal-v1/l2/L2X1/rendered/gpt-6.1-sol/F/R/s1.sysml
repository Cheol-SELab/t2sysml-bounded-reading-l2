package L2Model {
    item def AcceptedIntentDataItem { doc /* @S128 */ }
    item def ActiveRestrictionStatusExpectedOperationalEffectAndAnyRelatedCoordinationNotesItem { doc /* @S337 */ }
    item def AgreedTargetOffBlockTimeValuesAndStakeholderRemarksItem { doc /* @S429 */ }
    item def ApronSweepCompletionNoteItem { doc /* @S678 */ }
    item def ArrivalPlanItem { doc /* @S405 */ }
    item def CalculatedTakeoffTimeItem { doc /* @S135 */ }
    item def CombinedTacticalViewItem { doc /* @S420 */ }
    item def ConstraintsItem { doc /* @S225 */ }
    item def CrewBusDelaySlipItem { doc /* @S237 */ }
    item def CrewDutyExtensionLogItem { doc /* @S726 */ }
    item def CurrentMovementAreaOccupancyAndEquipmentStatusIndicatorsItem { doc /* @S445 */ }
    item def CurrentOperatingScheduleItem { doc /* @S103 */ }
    item def CurrentRampIntentItem { doc /* @S217 */ }
    item def CustomsHoldReleaseNoteItem { doc /* @S679 */ }
    item def DeicingPadQueueCardItem { doc /* @S378 */ }
    item def DemandItem { doc /* @S225 */ }
    item def DemandForecastItem { doc /* @S101 */ }
    item def DepartureFixLoadSheetItem { doc /* @S598 */ }
    item def FiledFlightInformationItem { doc /* @S103 */ }
    item def FlightIntentMessageItem { doc /* @S013,S126 */ }
    item def FuelTruckHoldAdviceItem { doc /* @S450 */ }
    item def GateReopeningMemoItem { doc /* @S472 */ }
    item def LateBaggageTagListItem { doc /* @S519 */ }
    item def MedicalDiversionNoticeItem { doc /* @S576 */ }
    item def MorningWeatherOutlookItem { doc /* @S057 */ }
    item def MovementIndicationsItem { doc /* @S179 */ }
    item def NormalizedScheduleItem { doc /* @S053 */ }
    item def NotificationsItem { doc /* @S614 */ }
    item def PassengerMisconnectCountItem { doc /* @S851 */ }
    item def ProposedDepartureOpportunitiesAndAssociatedCalculatedTakeoffTimeValuesItem { doc /* @S242 */ }
    item def PushbackWindowTokenItem { doc /* @S503 */ }
    item def RemoteStandShuttleCountItem { doc /* @S648 */ }
    item def ResourceDrivenFeasibilityStatusItem { doc /* @S312 */ }
    item def RunwayInspectionNoteItem { doc /* @S181 */ }
    item def RunwayLightingOutageCardItem { doc /* @S693 */ }
    item def RunwaySpecificCapacityValuesItem { doc /* @S114 */ }
    item def SlotSwapPermissionEmailItem { doc /* @S795 */ }
    item def StandTowRequestFormItem { doc /* @S304 */ }
    item def StormCellSnapshotItem { doc /* @S133 */ }
    item def TargetOffBlockTimeItem { doc /* @S135 */ }
    item def TemporaryRestrictionNoticeItem { doc /* @S399 */ }
    item def TowbarShortageReportItem { doc /* @S556 */ }
    part def AircraftOperatorRepresentative { doc /* @S055,S082,S312,S405,S620,S726 */ }
    part def AirlineInterfaceAdapter { doc /* @S033,S103,S126,S128,S452,S519,S829 */ }
    part def AirlineOperationsCentre { doc /* @S126,S135 */ }
    part def AirlineOperationsCoordinator { doc /* @S054,S081,S214,S237,S260,S312,S472,S679,S740,S795,S820,S851 */ }
    part def AirportAcceptanceRate { doc /* @S046 */ }
    part def AirportCDMPortal { doc /* @S016,S031,S150,S166,S172,S179,S264,S293,S312,S337,S405,S429,S503,S648,S793 */ }
    part def AirportCapacityPlan { doc /* @S046 */ }
    part def AirportDutyManager { doc /* @S062,S088,S181,S496,S568,S576,S678,S679,S809,S816,S860,S872 */ }
    part def AirportNetwork { doc /* @S003 */ }
    part def AirspaceSectorPlanner { doc /* @S058,S079 */ }
    part def AlertDistributionHub { doc /* @S033,S073,S121,S193,S461,S614 */ }
    part def ArrivalRegulationConsole { doc /* @S032,S070,S241,S535,S576,S980 */ }
    part def AuditEventLedger { doc /* @S021,S034,S123,S271,S777,S792,S955,S981 */ }
    part def BusinessRulesRegistry { doc /* @S034,S831 */ }
    part def CalculatedTakeoffTime { doc /* @S046 */ }
    part def CapacityAssessmentModule { doc /* @S014,S031,S057,S066,S107,S114,S120,S133,S225,S803,S825,S853,S944 */ }
    part def CollaborativeDecisionLog { doc /* @S021,S046,S169,S267,S794,S925,S955 */ }
    part def CommonServices { doc /* @S030 */ }
    part def CommonSituationDisplay { doc /* @S020,S046,S072,S165,S265,S337,S822,S974 */ }
    part def ContingencyOperationsConsole { doc /* @S032,S195,S247,S783,S908,S952 */ }
    part def DataGovernanceSteward { doc /* @S098,S170,S806,S813,S833,S861,S876,S958 */ }
    part def DeicingCoordinator { doc /* @S092,S294,S378,S875 */ }
    part def DemandPredictionService { doc /* @S013,S031,S053,S101,S103,S216,S225,S825,S941 */ }
    part def DepartureMeteringService { doc /* @S032,S069,S242,S426,S728,S825,S851,S980 */ }
    part def DigitalBriefingRoom { doc /* @S031,S071 */ }
    part def EastApronSensor { doc /* @S035,S578 */ }
    part def EmergencyResponseCoordinator { doc /* @S096,S874 */ }
    part def FlightDataExchange { doc /* @S013,S033,S052,S053,S103,S128,S827,S940 */ }
    part def FlightIntentMessage { doc /* @S046 */ }
    part def GateConflictDetector { doc /* @S035,S210,S386,S472 */ }
    part def GroundHandlingDispatcher { doc /* @S064,S091,S140,S237,S519,S523,S556 */ }
    part def HandlingResourcePlanner { doc /* @S065,S304,S547,S648,S830 */ }
    part def IdentityAccessService { doc /* @S034,S152,S194,S781,S783,S981 */ }
    part def IntegratedTacticalManagementPosition { doc /* @S420,S429 */ }
    part def MeridianRegionalAirTrafficFlowManagementAndAirportCollaborativeDecisionMakingSystem { doc /* @S838,S863 */ }
    part def MeteorologyBriefingOfficer { doc /* @S056,S085,S086,S087,S133,S819,S858,S873 */ }
    part def MilitaryAirspaceLiaison { doc /* @S059,S093,S325,S399 */ }
    part def NetworkOperationsLiaison { doc /* @S083,S084,S614 */ }
    part def NorthRunwayMeter { doc /* @S035,S114 */ }
    part def PerformanceAnalyticsWarehouse { doc /* @S034,S074,S148,S776,S804,S836,S839,S856 */ }
    part def PostOperationsReport { doc /* @S046,S862 */ }
    part def RampControlLead { doc /* @S063,S090,S202,S208,S304,S378,S387,S556,S614,S647,S678,S818 */ }
    part def RampMovementBoard { doc /* @S032,S217,S361,S427,S445,S450,S801,S844,S980 */ }
    part def ReadinessGate1 { doc /* @S894 */ }
    part def ReadinessGate2 { doc /* @S895 */ }
    part def ReadinessGate3 { doc /* @S896 */ }
    part def ReadinessGate4 { doc /* @S897 */ }
    part def RegionalFlowManager { doc /* @S010,S050,S078,S094,S117,S137,S399,S420,S598,S614,S808,S814,S842,S864 */ }
    part def RegionalFlowPlatform { doc /* @S012,S030,S031,S032,S033,S034,S035,S051,S073,S101,S147,S164,S250,S268,S371,S775,S787,S789,S812,S888,S912,S936 */ }
    part def SectorLoadMonitor { doc /* @S035,S484,S598 */ }
    part def SharedOperationalPicture { doc /* @S046 */ }
    part def SlotAllocationEngine { doc /* @S015,S031,S134,S135,S137,S225,S227,S234,S253,S355,S428,S503,S825,S949,S980 */ }
    part def SlotComplianceState { doc /* @S791,S850 */ }
    part def SlotCoordinator { doc /* @S068,S080,S229,S356,S614,S672,S726,S795,S798,S815,S848,S870 */ }
    part def SouthRunwayMeter { doc /* @S035,S114 */ }
    part def SurfaceSurveillanceAdapter { doc /* @S033,S179,S445,S606,S693,S802,S828 */ }
    part def SystemSupportEngineer { doc /* @S171,S772,S807,S835,S877,S914,S918,S923,S927 */ }
    part def TacticalRegulationProposal { doc /* @S046 */ }
    part def TargetOffBlockTime { doc /* @S046,S948 */ }
    part def TimeSynchronizationService { doc /* @S034,S110,S187,S585,S824 */ }
    part def TowerSequenceManager { doc /* @S032,S217,S242,S279,S334,S445,S450,S801,S844,S980 */ }
    part def TowerSupervisor { doc /* @S060,S061,S089,S181,S202,S313,S614,S693,S817,S866 */ }
    part def WeatherIngestGateway { doc /* @S033,S057,S102,S108,S111,S182 */ }
    part def WestApronSensor { doc /* @S035 */ }
    part system {
        part aircraftOperatorRepresentative : AircraftOperatorRepresentative {
            perform action a0 { doc /* validates that operator priorities are visible where they are allowed by the Business Rules Registry and local coordination agreements @S055 */ }
            perform action a1 { doc /* provides aircraft-specific constraints when requested @S082 */ }
            perform action a2 { doc /* sends the Crew Duty Extension Log when an approved company process extends duty availability for a specific rotation @S620 */ }
        }
        part airlineInterfaceAdapter : AirlineInterfaceAdapter {
            perform action a0 { doc /* validates message structure @S128 */ }
            perform action a1 { doc /* maps carrier codes to the Business Rules Registry @S128 */ }
            perform action a2 { doc /* forwards accepted intent data to the Flight Data Exchange @S128 */ }
            perform action a3 { doc /* produces the Late Baggage Tag List when baggage reconciliation data indicates that departure readiness may be overstated @S452 */ }
        }
        part airlineOperationsCentre : AirlineOperationsCentre {
            perform action a0 { doc /* submits a Flight Intent Message through the Airline Interface Adapter using an authenticated system account managed by the Identity Access Service @S126 */ }
        }
        part airlineOperationsCoordinator : AirlineOperationsCoordinator {
            perform action a0 { doc /* reviews material deviations from filed intent, including aircraft swaps, early cancellations, recovery flights, and known connection protection actions @S054 */ }
            perform action a1 { doc /* represents carrier operating priorities @S081 */ }
            perform action a2 { doc /* confirms that Flight Intent Message updates are complete, timely, and traceable @S081 */ }
            perform action a3 { doc /* uses the delay slip when requesting an exemption review for a crew connectivity constraint that is not already represented in the allocation data @S237 */ }
            perform action a4 { doc /* confirm any operator-requested Target Off Block Time revision in the Airport CDM Portal before the freeze horizon expires @S260 */ }
            perform action a5 { doc /* uses the Gate Reopening Memo to confirm when a previously unavailable gate can be planned again for arrival handling, boarding, and connection recovery @S472 */ }
            perform action a6 { doc /* uses the release note to confirm that a candidate substitution is eligible for customs release before requesting a slot swap @S679 */ }
            perform action a7 { doc /* sends the Passenger Misconnect Count @S740 */ }
            perform action a8 { doc /* uses the permission email to justify an approved slot substitution during post-operations review @S795 */ }
        }
        part airportAcceptanceRate : AirportAcceptanceRate;
        part airportCDMPortal : AirportCDMPortal {
            perform action a0 { doc /* provides airport stakeholders with a controlled interface for sharing operational readiness information and confirming decisions that affect the surface and terminal sequence @S016 */ }
            perform action a1 { doc /* provides the shared operational workspace where airport participants maintain a common view of departure readiness, arrival constraints, surface conditions, and slot impacts @S150 */ }
            perform action a2 { doc /* highlight the affected flight @S166 */ }
            perform action a3 { doc /* notify the role accountable for the next update through the Alert Distribution Hub @S166 */ }
            perform action a4 { doc /* preserve the last synchronized milestone set @S172 */ }
            perform action a5 { doc /* clearly mark any updates entered under degraded operating procedures @S172 */ }
            perform action a6 { doc /* presents each proposed value with its confidence status, last update time, and the reason code assigned by the proposing function or authorized user @S264 */ }
            perform action a7 { doc /* publish tower readiness changes to authenticated airline and handling users within the configured refresh interval @S293 */ }
            perform action a8 { doc /* presents the resource-driven feasibility status to the Airline Operations Coordinator and the Aircraft Operator Representative @S312 */ }
            perform action a9 { doc /* displays the active restriction status, expected operational effect, and any related coordination notes on the Common Situation Display @S337 */ }
            perform action a10 { doc /* presents the resulting arrival plan to Aircraft Operator Representative users @S405 */ }
            perform action a11 { doc /* uses the window token to preserve the agreed pushback opportunity when diversion recovery requires a protected departure movement @S503 */ }
            perform action a12 { doc /* uses the shuttle count to confirm that remote-stand passenger transfer demand is consistent with stand readiness timing @S648 */ }
        }
        part airportCapacityPlan : AirportCapacityPlan;
        part airportDutyManager : AirportDutyManager {
            perform action a0 { doc /* confirms terminal opening status, essential facility readiness, and airport service constraints that may affect the first operational waves @S062 */ }
            perform action a1 { doc /* confirms that airport-side constraints are reflected consistently across the Airport CDM Portal and the Common Situation Display @S088 */ }
            perform action a2 { doc /* uses the Runway Inspection Note to confirm that the duty desk has a current record of pavement status before endorsing any declared capacity change @S181 */ }
            perform action a3 { doc /* sends the Medical Diversion Notice when a medical priority aircraft requires airport-level coordination before landing @S496 */ }
            perform action a4 { doc /* produces the Customs Hold Release Note when border processing confirms that a held arrival may proceed to normal turnaround handling @S568 */ }
            perform action a5 { doc /* uses the Apron Sweep Completion Note to confirm that apron availability constraints do not invalidate an approved substitution @S678 */ }
        }
        part airportNetwork : AirportNetwork {
            perform action a0 { doc /* routinely operates near declared capacity during Normal Operations @S003 */ }
            exhibit state modes {
                state s0 { doc /* Normal Operations @S003 */ }
            }
        }
        part airspaceSectorPlanner : AirspaceSectorPlanner {
            perform action a0 { doc /* declares expected sector constraints, route availability assumptions, and any planned staffing limitations that could influence arrival or departure metering @S058 */ }
            perform action a1 { doc /* validating sector constraints in the Sector Load Monitor @S079 */ }
            perform action a2 { doc /* advising whether demand smoothing is required before tactical execution @S079 */ }
        }
        part alertDistributionHub : AlertDistributionHub {
            perform action a0 { doc /* notifies participating roles that the morning plan is available and that changes must be entered through controlled Regional Flow Platform functions @S073 */ }
            perform action a1 { doc /* notifies the Regional Flow Manager, Tower Supervisor, and Airline Operations Coordinator that the capacity picture may change @S121 */ }
            perform action a2 { doc /* distributes approved duty coordination alerts to affected operational roles when a local condition changes runway availability, taxi routing, or apron access @S193 */ }
            perform action a3 { doc /* distribute surface equipment and apron congestion advisories to subscribed operational roles within the latency target defined in the Business Rules Registry @S461 */ }
            perform action a4 { doc /* sends notifications to Regional Flow Manager, Tower Supervisor, Ramp Control Lead, Slot Coordinator, and Network Operations Liaison when a measure changes operational behavior @S614 */ }
        }
        part arrivalRegulationConsole : ArrivalRegulationConsole {
            perform action a0 { doc /* highlights inbound demand periods where holding, speed control, or upstream sequencing may be needed if the forecast capacity materializes @S070 */ }
            perform action a1 { doc /* presents proposed arrival opportunities with the capacity source, regulation start time, and expected delay for each affected flight @S241 */ }
            perform action a2 { doc /* suppress handler-exception annotations for arriving flights unless the exception changes the Airport Acceptance Rate or a regulated arrival sequence @S535 */ }
            perform action a3 { doc /* uses the Medical Diversion Notice to protect arrival priority, stand assignment timing, and downstream border coordination in the active arrival plan @S576 */ }
            perform action a4 { doc /* use the approved rules recorded in the Business Rules Registry @S980 */ }
        }
        part auditEventLedger : AuditEventLedger {
            perform action a0 { doc /* preserve the rationale, timing, and authorization of material operational decisions @S021 */ }
            perform action a1 { doc /* retains the trace from incoming forecast product to capacity value @S123 */ }
            perform action a2 { doc /* stores the previous value, new value, responsible user or automated function, timestamp, authority basis, and applicable operating state for every target time change @S271 */ }
            perform action a3 { doc /* capture successful and failed authentication attempts, role changes, privilege elevations, operational approvals, configuration changes, data exports, and emergency access activations @S777 */ }
            perform action a4 { doc /* preserve the time source applied by the Time Synchronization Service @S792 */ }
            perform action a5 { doc /* record each proposed option, the user response, and the final decision @S955 */ }
            perform action a6 { doc /* support traceability, least-privilege access, and after-action accountability for all operationally significant changes @S981 */ }
        }
        part businessRulesRegistry : BusinessRulesRegistry;
        part calculatedTakeoffTime : CalculatedTakeoffTime;
        part capacityAssessmentModule : CapacityAssessmentModule {
            perform action a0 { doc /* supports the assessment of declared and tactical capacity using weather, runway availability, sector loading, and airport resource conditions @S014 */ }
            perform action a1 { doc /* combines the runway declaration, weather outlook, airspace constraints, stand readiness, and ground resource assumptions into a proposed Airport Acceptance Rate by period @S066 */ }
            perform action a2 { doc /* combines demand projections with the Airport Capacity Plan to determine whether a published Airport Acceptance Rate remains feasible @S107 */ }
            perform action a3 { doc /* flags the associated capacity values as provisional @S120 */ }
            perform action a4 { doc /* uses the Storm Cell Snapshot to qualify capacity confidence during convective weather impacts @S133 */ }
            perform action a5 { doc /* reject data that lacks a trusted timestamp @S825 */ }
        }
        part collaborativeDecisionLog : CollaborativeDecisionLog {
            perform action a0 { doc /* preserve the rationale, timing, and authorization of material operational decisions @S021 */ }
            perform action a1 { doc /* records who changed a value, when the change was made, whether the change was provisional or confirmed, and what operational decision relied on it @S169 */ }
            perform action a2 { doc /* records each challenge, counterproposal, acceptance, rejection, and reason code associated with the Target Off Block Time and Calculated Takeoff Time @S267 */ }
            perform action a3 { doc /* retain the stated reason, decision time, affected flight, and visible operational context for each material change to a slot or sequence @S794 */ }
            perform action a4 { doc /* record each proposed option, the user response, and the final decision @S955 */ }
        }
        part commonServices : CommonServices;
        part commonSituationDisplay : CommonSituationDisplay {
            perform action a0 { doc /* give authorized users a shared view of demand, capacity, constraints, and active traffic management measures @S020 */ }
            perform action a1 { doc /* presents the approved pre-tactical baseline as the shared reference for Normal Operations, Adverse Weather Mode, Capacity Reduction State, and early Recovery Phase decisions @S072 */ }
            perform action a2 { doc /* distinguishes values supplied by connected services, values confirmed by users, and values that have exceeded the configured freshness threshold @S165 */ }
            perform action a3 { doc /* shows the current agreed target set @S265 */ }
        }
        part contingencyOperationsConsole : ContingencyOperationsConsole {
            perform action a0 { doc /* provides a degraded channel for recording tower and duty desk decisions until normal service is restored @S195 */ }
            perform action a1 { doc /* preserves the last valid allocation @S247 */ }
            perform action a2 { doc /* supports manual amendments @S247 */ }
            perform action a3 { doc /* marks the resulting Slot Compliance State as provisional @S247 */ }
            perform action a4 { doc /* accept emergency access activations only after the Identity Access Service records the authorizing incident reference and expiry time @S783 */ }
            perform action a5 { doc /* generated by the Contingency Operations Console @S952 */ }
        }
        part dataGovernanceSteward : DataGovernanceSteward {
            perform action a0 { doc /* verifies that operational decisions, role acknowledgements, and exception handling are captured in the Audit Event Ledger with synchronized timestamps from the Time Synchronization Service @S098 */ }
            perform action a1 { doc /* defines the mandatory fields, permissible status values, retention rules, and data quality thresholds used by the Airport CDM Portal @S170 */ }
            perform action a2 { doc /* verify that audit fields required for slot performance reporting remain complete, immutable, and traceable to approved data definitions @S806 */ }
        }
        part deicingCoordinator : DeicingCoordinator {
            perform action a0 { doc /* provides pre-tactical and tactical advice when winter operations affect departure readiness, metering stability, or achievable throughput @S092 */ }
            perform action a1 { doc /* sends the Deicing Pad Queue Card when pad demand, treatment progress, or release timing changes @S294 */ }
        }
        part demandPredictionService : DemandPredictionService {
            perform action a0 { doc /* estimates expected demand from scheduled operations, Flight Intent Message data, known airline recovery plans, and near-term operational changes @S013 */ }
            perform action a1 { doc /* converts the normalized schedule into expected arrival and departure demand by time band, runway direction, terminal area, and major traffic flow @S053 */ }
            perform action a2 { doc /* generates the demand forecast used by the Regional Flow Platform @S101 */ }
            perform action a3 { doc /* receives filed flight information through the Flight Data Exchange @S103 */ }
            perform action a4 { doc /* compares it with the current operating schedule held by the Airline Interface Adapter @S103 */ }
            perform action a5 { doc /* refresh stand demand forecasts when the Ramp Movement Board records a material change in planned off-block timing @S216 */ }
            perform action a6 { doc /* reject data that lacks a trusted timestamp @S825 */ }
        }
        part departureMeteringService : DepartureMeteringService {
            perform action a0 { doc /* estimates provisional Target Off Block Time sensitivity @S069 */ }
            perform action a1 { doc /* presents proposed departure opportunities and associated Calculated Takeoff Time values for coordination with the Tower Sequence Manager @S242 */ }
            perform action a2 { doc /* sends revised departure metering advisories when runway demand exceeds the configured queue threshold @S426 */ }
            perform action a3 { doc /* reject data that lacks a trusted timestamp @S825 */ }
            perform action a4 { doc /* uses the Passenger Misconnect Count to weight departure sequencing decisions when connection protection is an approved local objective @S851 */ }
            perform action a5 { doc /* use the approved rules recorded in the Business Rules Registry @S980 */ }
            exhibit state modes {
                state s0 { doc /* monitoring mode @S728 */ }
            }
        }
        part digitalBriefingRoom : DigitalBriefingRoom {
            perform action a0 { doc /* displays the emerging Airport Capacity Plan @S071 */ }
            perform action a1 { doc /* records unresolved assumptions in the Collaborative Decision Log for confirmation during the morning coordination briefing @S071 */ }
        }
        part eastApronSensor : EastApronSensor {
            perform action a0 { doc /* reports stand occupancy transitions, pushback lane blockage durations, and sensor confidence values at a synchronized event time @S578 */ }
        }
        part emergencyResponseCoordinator : EmergencyResponseCoordinator;
        part flightDataExchange : FlightDataExchange {
            perform action a0 { doc /* normalizes flight identifiers, aircraft types, routing fields, and planned operating times @S052 */ }
            perform action a1 { doc /* validate Flight Intent Message content before the data is made available for operational use @S827 */ }
        }
        part flightIntentMessage : FlightIntentMessage;
        part gateConflictDetector : GateConflictDetector {
            perform action a0 { doc /* alerts the Ramp Control Lead when a planned arrival, departure, or tow would create an overlapping occupancy condition at a stand or adjacent service lane @S210 */ }
            perform action a1 { doc /* produces the Gate Reopening Memo when a stand becomes usable after snow clearance and the gate occupancy constraint has been removed @S386 */ }
        }
        part groundHandlingDispatcher : GroundHandlingDispatcher {
            perform action a0 { doc /* confirms whether planned handling teams and equipment coverage are sufficient for the expected concentration of turns in each apron area @S064 */ }
            perform action a1 { doc /* confirms that handling resource assumptions are current in the Handling Resource Planner @S091 */ }
            perform action a2 { doc /* escalates material deviations through the Airport Duty Manager @S091 */ }
            perform action a3 { doc /* sends the Crew Bus Delay Slip when crew transport lateness affects an aircraft turn @S140 */ }
            perform action a4 { doc /* uses the tag list to confirm which flights require baggage reconciliation before off-block readiness is updated @S519 */ }
            perform action a5 { doc /* sends the Towbar Shortage Report when towbar availability cannot support the agreed pushback sequence @S523 */ }
        }
        part handlingResourcePlanner : HandlingResourcePlanner {
            perform action a0 { doc /* compares the demand curve with available ground resources @S065 */ }
            perform action a1 { doc /* flags time bands where aircraft turn performance is likely to reduce stand availability @S065 */ }
            perform action a2 { doc /* uses the Stand Tow Request Form to reserve towing capacity and to test whether the requested movement can be completed before the proposed Target Off Block Time @S304 */ }
            perform action a3 { doc /* produces the Remote Stand Shuttle Count at regular operating intervals to represent available passenger transfer capacity for remote stand activity @S547 */ }
        }
        part identityAccessService : IdentityAccessService {
            perform action a0 { doc /* controlled by the Identity Access Service @S152 */ }
            perform action a1 { doc /* restricts entry of duty desk confirmations to authorized airport operations staff @S194 */ }
            perform action a2 { doc /* records each transaction in the Audit Event Ledger @S194 */ }
            perform action a3 { doc /* support rapid suspension of accounts when a user changes role, leaves an organization, or becomes subject to an operational integrity concern @S781 */ }
            perform action a4 { doc /* records the authorizing incident reference and expiry time @S783 */ }
            perform action a5 { doc /* support traceability, least-privilege access, and after-action accountability for all operationally significant changes @S981 */ }
        }
        part integratedTacticalManagementPosition : IntegratedTacticalManagementPosition {
            perform action a0 { doc /* presents a combined tactical view @S420 */ }
        }
        part meridianRegionalAirTrafficFlowManagementAndAirportCollaborativeDecisionMakingSystem : MeridianRegionalAirTrafficFlowManagementAndAirportCollaborativeDecisionMakingSystem;
        part meteorologyBriefingOfficer : MeteorologyBriefingOfficer {
            perform action a0 { doc /* provides the morning weather outlook with emphasis on wind trend, ceiling, visibility, convective risk, temperature limits, and confidence over the planning horizon @S056 */ }
            perform action a1 { doc /* produces the Storm Cell Snapshot before the pre-tactical capacity review begins @S085 */ }
            perform action a2 { doc /* briefs forecast confidence, timing risk, and expected operational impact in the Digital Briefing Room using data supplied through the Weather Ingest Gateway @S086 */ }
            perform action a3 { doc /* states the trigger conditions that would justify moving from Normal Operations to Adverse Weather Mode @S087 */ }
        }
        part militaryAirspaceLiaison : MilitaryAirspaceLiaison {
            perform action a0 { doc /* confirms whether shared airspace assumptions remain valid for the morning @S059 */ }
            perform action a1 { doc /* identifies any conditional availability that must be treated as uncertain @S059 */ }
            perform action a2 { doc /* confirms military airspace availability assumptions @S093 */ }
            perform action a3 { doc /* alerts the Regional Flow Manager when civil routing options may be constrained @S093 */ }
            perform action a4 { doc /* sends the Temporary Restriction Notice after confirming the activation window, affected volume, controlling authority, and any published contingency conditions @S325 */ }
            perform action a5 { doc /* confirming the activation window, affected volume, controlling authority, and any published contingency conditions @S325 */ }
        }
        part networkOperationsLiaison : NetworkOperationsLiaison {
            perform action a0 { doc /* coordinates with adjacent network units @S083 */ }
            perform action a1 { doc /* records external coordination outcomes in the Collaborative Decision Log @S084 */ }
        }
        part northRunwayMeter : NorthRunwayMeter;
        part performanceAnalyticsWarehouse : PerformanceAnalyticsWarehouse {
            perform action a0 { doc /* retains the baseline inputs, capacity declarations, and approval timestamps @S074 */ }
            perform action a1 { doc /* compares submitted intents, issued constraints, actual off-block times, and achieved arrival outcomes to improve recovery playbooks @S148 */ }
            perform action a2 { doc /* aggregate compliance outcomes by carrier, route group, regulation, airport operating configuration, and time band @S804 */ }
        }
        part postOperationsReport : PostOperationsReport;
        part rampControlLead : RampControlLead {
            perform action a0 { doc /* reviews early stand readiness using information from the Ramp Movement Board, East Apron Sensor, West Apron Sensor, and handling coordination calls @S063 */ }
            perform action a1 { doc /* maintains the Ramp Movement Board in a state that supports reliable departure metering @S090 */ }
            perform action a2 { doc /* not release a pushback until the Tower Supervisor has confirmed that the movement can be integrated with the active ground route and runway plan @S202 */ }
            perform action a3 { doc /* sends the Stand Tow Request Form when a parked aircraft must be repositioned to release a stand, remove an apron blockage, or support a confirmed operating plan @S208 */ }
            perform action a4 { doc /* uses the queue card to verify pad entry order before authorizing a movement from the staging area @S378 */ }
            perform action a5 { doc /* coordinate every pad release with the Tower Supervisor before the aircraft leaves the treated area @S387 */ }
            perform action a6 { doc /* uses the Towbar Shortage Report to determine whether remote stand aircraft can be repositioned without creating secondary apron congestion @S556 */ }
            perform action a7 { doc /* sends the Apron Sweep Completion Note after the responsible sweep team confirms that the assigned apron area is clean, safe, and free of observed foreign object debris @S647 */ }
        }
        part rampMovementBoard : RampMovementBoard {
            perform action a0 { doc /* produces the Fuel Truck Hold Advice when metering decisions require servicing activity to remain clear of an aircraft that is being held at stand @S361 */ }
            perform action a1 { doc /* refresh the apron movement layer within five seconds of each validated surface event @S427 */ }
            perform action a2 { doc /* provide actual movement milestones that support independent verification of slot performance @S801 */ }
            perform action a3 { doc /* provide surface queue counts based on movement status and surveillance confirmation @S844 */ }
            perform action a4 { doc /* use the approved rules recorded in the Business Rules Registry @S980 */ }
        }
        part readinessGate1 : ReadinessGate1;
        part readinessGate2 : ReadinessGate2;
        part readinessGate3 : ReadinessGate3;
        part readinessGate4 : ReadinessGate4;
        part regionalFlowManager : RegionalFlowManager {
            perform action a0 { doc /* balancing demand against capacity across the Meridian region @S010 */ }
            perform action a1 { doc /* coordinating regional traffic management actions @S010 */ }
            perform action a2 { doc /* confirms that the planning horizon, cutover time, and review checkpoints are understood by the participating operational roles @S050 */ }
            perform action a3 { doc /* reviews the Airport Capacity Plan, the Ground Delay Program status, and any Tactical Regulation Proposal before they are presented for collaborative agreement @S078 */ }
            perform action a4 { doc /* chairs decision checkpoints @S094 */ }
            perform action a5 { doc /* authorizes changes to flow measures when the Capacity Assessment Module indicates that declared capacity no longer matches observed conditions @S094 */ }
            perform action a6 { doc /* uses the Common Situation Display to compare forecast demand, assessed capacity, and any active Ground Delay Program effects in one operational view @S117 */ }
            perform action a7 { doc /* confirms airline recovery priorities before the Slot Allocation Engine publishes a revised constraint set @S137 */ }
            perform action a8 { doc /* uses the restriction notice to bound the arrival regulation timeline before committing new landing-rate values in the Arrival Regulation Console @S399 */ }
            perform action a9 { doc /* uses the load sheet to confirm whether a departure fix constraint should be represented as an airport departure measure @S598 */ }
            perform action a10 { doc /* use the Post Operations Report to identify whether noncompliance resulted from operator choice, airport constraint, airspace constraint, weather impact, or system issue @S808 */ }
        }
        part regionalFlowPlatform : RegionalFlowPlatform {
            perform action a0 { doc /* integrate planning, tactical regulation, airport readiness, and post-event analysis into a single operational environment @S012 */ }
            perform action a1 { doc /* creates the initial demand picture from published schedules, approved seasonal allocations, overnight schedule changes, and received Flight Intent Message data @S051 */ }
            perform action a2 { doc /* permits more frequent intent updates while retaining the previous values needed for audit and performance review @S147 */ }
            perform action a3 { doc /* expose the current regional demand and constraint context to the shared workspace at each publication cycle without requiring manual re-entry @S164 */ }
            perform action a4 { doc /* creates the initial Target Off Block Time proposal from current flight intent, stand readiness, turnaround progress, and applicable airport capacity constraints @S250 */ }
            perform action a5 { doc /* locks the Target Off Block Time unless a rule-based exception or an authorized operational override is recorded @S268 */ }
            perform action a6 { doc /* record the initiating user, the approving user, the affected operational object, and the effective time of the decision @S775 */ }
            perform action a7 { doc /* reconcile contingency actions with the Collaborative Decision Log @S787 */ }
            perform action a8 { doc /* record slot compliance events in the Audit Event Ledger using the operating date, flight identifier, airport, runway direction, and applicable regulation reference @S789 */ }
            exhibit state modes {
                state s0 { doc /* winter operating mode @S371 */ }
            }
        }
        part sectorLoadMonitor : SectorLoadMonitor {
            perform action a0 { doc /* produces the Departure Fix Load Sheet when projected recovered departures require a consolidated view of demand by departure fix @S484 */ }
        }
        part sharedOperationalPicture : SharedOperationalPicture;
        part slotAllocationEngine : SlotAllocationEngine {
            perform action a0 { doc /* supports fair and traceable allocation of constrained departure and arrival opportunities when demand exceeds available capacity @S015 */ }
            perform action a1 { doc /* converts accepted constraints into Calculated Takeoff Time values and Target Off Block Time guidance for affected flights @S134 */ }
            perform action a2 { doc /* publishes a revised constraint set @S137 */ }
            perform action a3 { doc /* proposes regulated departure and arrival opportunities by matching demand from the Demand Prediction Service to constraints supplied by the Capacity Assessment Module @S225 */ }
            perform action a4 { doc /* derives a Calculated Takeoff Time or arrival opportunity that preserves the declared capacity envelope before local preference is applied @S227 */ }
            perform action a5 { doc /* derives the Calculated Takeoff Time by combining runway metering constraints, departure fix loading, and applicable Ground Delay Program rules @S253 */ }
            perform action a6 { doc /* adjust allocated departure times when metering rules require additional stand absorption to preserve the planned runway sequence @S355 */ }
            perform action a7 { doc /* produces the Pushback Window Token when the agreed departure window is frozen for tactical execution @S428 */ }
            perform action a8 { doc /* reject data that lacks a trusted timestamp @S825 */ }
            perform action a9 { doc /* use the approved rules recorded in the Business Rules Registry @S980 */ }
        }
        part slotComplianceState : SlotComplianceState;
        part slotCoordinator : SlotCoordinator {
            perform action a0 { doc /* uses the Slot Allocation Engine to prepare an initial slot feasibility view @S068 */ }
            perform action a1 { doc /* does not publish binding Calculated Takeoff Time values during baseline construction @S068 */ }
            perform action a2 { doc /* confirms that the Slot Allocation Engine applies the current Business Rules Registry parameters @S080 */ }
            perform action a3 { doc /* administers the allocation run @S229 */ }
            perform action a4 { doc /* reviews exceptions @S229 */ }
            perform action a5 { doc /* confirms that proposed results are ready for publication through the Airport CDM Portal @S229 */ }
            perform action a6 { doc /* records the agreed pushback window rationale in the coordination notes before the plan is released to operational users @S356 */ }
            perform action a7 { doc /* sends the Slot Swap Permission Email only after the governance checks have been completed and recorded @S672 */ }
            perform action a8 { doc /* uses the Crew Duty Extension Log to check whether manually issued slot times remain operationally achievable @S726 */ }
            perform action a9 { doc /* review substitution activity after operations to confirm that priority rules were applied consistently across participating operators @S798 */ }
        }
        part southRunwayMeter : SouthRunwayMeter;
        part surfaceSurveillanceAdapter : SurfaceSurveillanceAdapter {
            perform action a0 { doc /* consolidates position updates from the East Apron Sensor and West Apron Sensor @S179 */ }
            perform action a1 { doc /* presents movement indications to the Airport CDM Portal @S179 */ }
            perform action a2 { doc /* produces the Runway Lighting Outage Card when monitored runway lighting status affects a declared operating configuration @S606 */ }
        }
        part systemSupportEngineer : SystemSupportEngineer {
            perform action a0 { doc /* monitors portal availability, interface latency, user session faults, and synchronization status against the Time Synchronization Service @S171 */ }
            perform action a1 { doc /* investigate technical gaps when audit sequences show missing events, duplicate updates, or inconsistent timestamps @S807 */ }
        }
        part tacticalRegulationProposal : TacticalRegulationProposal;
        part targetOffBlockTime : TargetOffBlockTime;
        part timeSynchronizationService : TimeSynchronizationService {
            perform action a0 { doc /* provides the reference clock used to compare forecast issue times with operational decision times @S110 */ }
            perform action a1 { doc /* keep tower, duty desk, surveillance, and portal event times aligned @S187 */ }
            perform action a2 { doc /* provide the common time basis used for freshness calculations across the Regional Flow Platform @S824 */ }
        }
        part towerSequenceManager : TowerSequenceManager {
            perform action a0 { doc /* builds a provisional order by runway, departure fix, aircraft wake category, and locally configured spacing rule @S279 */ }
            perform action a1 { doc /* refresh affected departure sequence advisories when a restriction changes the usable departure routes or expected release spacing @S334 */ }
            perform action a2 { doc /* uses the hold advice to prevent a departure from being sequenced ahead of a fueling constraint that is still active @S450 */ }
            perform action a3 { doc /* provide actual movement milestones that support independent verification of slot performance @S801 */ }
            perform action a4 { doc /* provide runway sequence counts @S844 */ }
            perform action a5 { doc /* use the approved rules recorded in the Business Rules Registry @S980 */ }
        }
        part towerSupervisor : TowerSupervisor {
            perform action a0 { doc /* sends the Runway Inspection Note before the first planning consolidation window @S060 */ }
            perform action a1 { doc /* declares anticipated runway configuration, usable operating length assumptions, and any local sequencing constraints that affect the North Runway Meter and South Runway Meter @S061 */ }
            perform action a2 { doc /* confirms that the Tower Sequence Manager reflects the current runway configuration @S089 */ }
            perform action a3 { doc /* confirmed that the movement can be integrated with the active ground route and runway plan @S202 */ }
            perform action a4 { doc /* confirm that any revised off-block sequence remains compatible with the Departure Metering Service before the change is released to the airport community @S313 */ }
            perform action a5 { doc /* uses the Runway Lighting Outage Card to confirm which runway lighting elements are unavailable before approving the operational status shown in the Tower Sequence Manager @S693 */ }
        }
        part weatherIngestGateway : WeatherIngestGateway {
            perform action a0 { doc /* makes the outlook available to the Capacity Assessment Module @S057 */ }
            perform action a1 { doc /* preserves the forecast issue time for audit and later performance review @S057 */ }
            perform action a2 { doc /* normalizes external and local meteorological feeds before they are used in operational capacity calculations @S102 */ }
            perform action a3 { doc /* accepts aviation forecasts, radar-derived precipitation fields, lightning alerts, wind forecasts, ceiling and visibility forecasts, and runway condition weather inputs from approved sources @S108 */ }
            perform action a4 { doc /* marks the feed as degraded rather than silently excluding it from the operational picture @S111 */ }
            perform action a5 { doc /* issue time-stamped weather condition updates for use in tower and airport duty coordination @S182 */ }
        }
        part westApronSensor : WestApronSensor;
        flow f0 of FlightIntentMessageItem from flightDataExchange to demandPredictionService { doc /* @S013 */ }
        flow f1 of NormalizedScheduleItem from flightDataExchange to demandPredictionService { doc /* @S053 */ }
        flow f2 of MorningWeatherOutlookItem from weatherIngestGateway to capacityAssessmentModule { doc /* @S057 */ }
        flow f3 of DemandForecastItem from demandPredictionService to regionalFlowPlatform { doc /* @S101 */ }
        flow f4 of FiledFlightInformationItem from flightDataExchange to demandPredictionService { doc /* @S103 */ }
        flow f5 of CurrentOperatingScheduleItem from airlineInterfaceAdapter to demandPredictionService { doc /* @S103 */ }
        flow f6 of RunwaySpecificCapacityValuesItem from capacityAssessmentModule to northRunwayMeter { doc /* @S114 */ }
        flow f7 of RunwaySpecificCapacityValuesItem from capacityAssessmentModule to southRunwayMeter { doc /* @S114 */ }
        flow f8 of FlightIntentMessageItem from airlineOperationsCentre to airlineInterfaceAdapter { doc /* @S126 */ }
        flow f9 of AcceptedIntentDataItem from airlineInterfaceAdapter to flightDataExchange { doc /* @S128 */ }
        flow f10 of StormCellSnapshotItem from meteorologyBriefingOfficer to capacityAssessmentModule { doc /* @S133 */ }
        flow f11 of CalculatedTakeoffTimeItem from slotAllocationEngine to airlineOperationsCentre { doc /* @S135 */ }
        flow f12 of TargetOffBlockTimeItem from slotAllocationEngine to airlineOperationsCentre { doc /* @S135 */ }
        flow f13 of MovementIndicationsItem from surfaceSurveillanceAdapter to airportCDMPortal { doc /* @S179 */ }
        flow f14 of RunwayInspectionNoteItem from towerSupervisor to airportDutyManager { doc /* @S181 */ }
        flow f15 of CurrentRampIntentItem from rampMovementBoard to towerSequenceManager { doc /* @S217 */ }
        flow f16 of DemandItem from demandPredictionService to slotAllocationEngine { doc /* @S225 */ }
        flow f17 of ConstraintsItem from capacityAssessmentModule to slotAllocationEngine { doc /* @S225 */ }
        flow f18 of CrewBusDelaySlipItem from groundHandlingDispatcher to airlineOperationsCoordinator { doc /* @S237 */ }
        flow f19 of ProposedDepartureOpportunitiesAndAssociatedCalculatedTakeoffTimeValuesItem from departureMeteringService to towerSequenceManager { doc /* @S242 */ }
        flow f20 of StandTowRequestFormItem from rampControlLead to handlingResourcePlanner { doc /* @S304 */ }
        flow f21 of ResourceDrivenFeasibilityStatusItem from airportCDMPortal to airlineOperationsCoordinator { doc /* @S312 */ }
        flow f22 of ResourceDrivenFeasibilityStatusItem from airportCDMPortal to aircraftOperatorRepresentative { doc /* @S312 */ }
        flow f23 of ActiveRestrictionStatusExpectedOperationalEffectAndAnyRelatedCoordinationNotesItem from airportCDMPortal to commonSituationDisplay { doc /* @S337 */ }
        flow f24 of DeicingPadQueueCardItem from deicingCoordinator to rampControlLead { doc /* @S378 */ }
        flow f25 of TemporaryRestrictionNoticeItem from militaryAirspaceLiaison to regionalFlowManager { doc /* @S399 */ }
        flow f26 of ArrivalPlanItem from airportCDMPortal to aircraftOperatorRepresentative { doc /* @S405 */ }
        flow f27 of CombinedTacticalViewItem from integratedTacticalManagementPosition to regionalFlowManager { doc /* @S420 */ }
        flow f28 of AgreedTargetOffBlockTimeValuesAndStakeholderRemarksItem from airportCDMPortal to integratedTacticalManagementPosition { doc /* @S429 */ }
        flow f29 of CurrentMovementAreaOccupancyAndEquipmentStatusIndicatorsItem from surfaceSurveillanceAdapter to rampMovementBoard { doc /* @S445 */ }
        flow f30 of CurrentMovementAreaOccupancyAndEquipmentStatusIndicatorsItem from surfaceSurveillanceAdapter to towerSequenceManager { doc /* @S445 */ }
        flow f31 of FuelTruckHoldAdviceItem from rampMovementBoard to towerSequenceManager { doc /* @S450 */ }
        flow f32 of GateReopeningMemoItem from gateConflictDetector to airlineOperationsCoordinator { doc /* @S472 */ }
        flow f33 of PushbackWindowTokenItem from slotAllocationEngine to airportCDMPortal { doc /* @S503 */ }
        flow f34 of LateBaggageTagListItem from airlineInterfaceAdapter to groundHandlingDispatcher { doc /* @S519 */ }
        flow f35 of TowbarShortageReportItem from groundHandlingDispatcher to rampControlLead { doc /* @S556 */ }
        flow f36 of MedicalDiversionNoticeItem from airportDutyManager to arrivalRegulationConsole { doc /* @S576 */ }
        flow f37 of DepartureFixLoadSheetItem from sectorLoadMonitor to regionalFlowManager { doc /* @S598 */ }
        flow f38 of NotificationsItem from alertDistributionHub to regionalFlowManager { doc /* @S614 */ }
        flow f39 of NotificationsItem from alertDistributionHub to towerSupervisor { doc /* @S614 */ }
        flow f40 of NotificationsItem from alertDistributionHub to rampControlLead { doc /* @S614 */ }
        flow f41 of NotificationsItem from alertDistributionHub to slotCoordinator { doc /* @S614 */ }
        flow f42 of NotificationsItem from alertDistributionHub to networkOperationsLiaison { doc /* @S614 */ }
        flow f43 of RemoteStandShuttleCountItem from handlingResourcePlanner to airportCDMPortal { doc /* @S648 */ }
        flow f44 of ApronSweepCompletionNoteItem from rampControlLead to airportDutyManager { doc /* @S678 */ }
        flow f45 of CustomsHoldReleaseNoteItem from airportDutyManager to airlineOperationsCoordinator { doc /* @S679 */ }
        flow f46 of RunwayLightingOutageCardItem from surfaceSurveillanceAdapter to towerSupervisor { doc /* @S693 */ }
        flow f47 of CrewDutyExtensionLogItem from aircraftOperatorRepresentative to slotCoordinator { doc /* @S726 */ }
        flow f48 of SlotSwapPermissionEmailItem from slotCoordinator to airlineOperationsCoordinator { doc /* @S795 */ }
        flow f49 of PassengerMisconnectCountItem from airlineOperationsCoordinator to departureMeteringService { doc /* @S851 */ }
    }
    requirement def R0 { doc /* When the baseline is approved, the Alert Distribution Hub notifies participating roles that the morning plan is available and that changes must be entered through controlled Regional Flow Platform functions. @S073 */ subject s : RegionalFlowPlatform; }
    requirement def R1 { doc /* Escalation to the Emergency Response Coordinator is required when a safety event, security event, or emergency response activity may affect airport acceptance, surface movement, or airspace availability. @S096 */ subject s : EmergencyResponseCoordinator; }
    requirement def R2 { doc /* Cedarbell shall expose the current regional demand and constraint context to the shared workspace at each publication cycle without requiring manual re-entry. @S164 */ subject s : RegionalFlowPlatform; }
    requirement def R3 { doc /* When a milestone becomes stale, the Airport CDM Portal shall highlight the affected flight and notify the role accountable for the next update through the Alert Distribution Hub. @S166 */ subject s : AirportCDMPortal; }
    requirement def R4 { doc /* During Contingency Fallback State, the Airport CDM Portal shall preserve the last synchronized milestone set and clearly mark any updates entered under degraded operating procedures. @S172 */ subject s : AirportCDMPortal; }
    requirement def R5 { doc /* Orchard shall issue time-stamped weather condition updates for use in tower and airport duty coordination. @S182 */ subject s : WeatherIngestGateway; }
    requirement def R6 { doc /* The Time Synchronization Service shall keep tower, duty desk, surveillance, and portal event times aligned so that later review can reconstruct the sequence of events. @S187 */ subject s : TimeSynchronizationService; }
    requirement def R7 { doc /* The Ramp Control Lead shall not release a pushback until the Tower Supervisor has confirmed that the movement can be integrated with the active ground route and runway plan. @S202 */ subject s : RampControlLead; }
    requirement def R8 { doc /* Airline Operations Coordinator participation is required when a resequence would materially affect passenger boarding, connection protection, or aircraft rotation plans. @S214 */ subject s : AirlineOperationsCoordinator; }
    requirement def R9 { doc /* Marlinstone shall refresh stand demand forecasts when the Ramp Movement Board records a material change in planned off-block timing. @S216 */ subject s : DemandPredictionService; }
    requirement def R10 { doc /* The engine shall not improve one operator's position by imposing an excessive delay on another operator unless the rule basis is visible and logged. @S234 */ subject s : SlotAllocationEngine; }
    requirement def R11 { doc /* Saffron shall confirm any operator-requested Target Off Block Time revision in the Airport CDM Portal before the freeze horizon expires. @S260 */ subject s : AirlineOperationsCoordinator; }
    requirement def R12 { doc /* Foxglove shall publish tower readiness changes to authenticated airline and handling users within the configured refresh interval. @S293 */ subject s : AirportCDMPortal; }
    requirement def R13 { doc /* Brindle must confirm that any revised off-block sequence remains compatible with the Departure Metering Service before the change is released to the airport community. @S313 */ subject s : TowerSupervisor; }
    requirement def R14 { doc /* Ironleaf must refresh affected departure sequence advisories when a restriction changes the usable departure routes or expected release spacing. @S334 */ subject s : TowerSequenceManager; }
    requirement def R15 { doc /* Blueharbor shall adjust allocated departure times when metering rules require additional stand absorption to preserve the planned runway sequence. @S355 */ subject s : SlotAllocationEngine; }
    requirement def R16 { doc /* Quartzline must coordinate every pad release with the Tower Supervisor before the aircraft leaves the treated area. @S387 */ subject s : RampControlLead; }
    requirement def R17 { doc /* Skylark must refresh the apron movement layer within five seconds of each validated surface event. @S427 */ subject s : RampMovementBoard; }
    requirement def R18 { doc /* Lantern must distribute surface equipment and apron congestion advisories to subscribed operational roles within the latency target defined in the Business Rules Registry. @S461 */ subject s : AlertDistributionHub; }
    requirement def R19 { doc /* Nightjar shall suppress handler-exception annotations for arriving flights unless the exception changes the Airport Acceptance Rate or a regulated arrival sequence. @S535 */ subject s : ArrivalRegulationConsole; }
    requirement def R20 { doc /* The Time Synchronization Service is required because customs status events and apron sensor events must align with Calculated Takeoff Time and Target Off Block Time decisions. @S585 */ subject s : TimeSynchronizationService; }
    requirement def R21 { doc /* The Departure Metering Service may remain in monitoring mode while manual slot control is active, but it must not automatically overwrite issued times. @S728 */ subject s : DepartureMeteringService; }
    requirement def R22 { doc /* The System Support Engineer may maintain infrastructure components and investigate technical faults, but operational approval privileges shall remain separated from technical administration privileges. @S772 */ subject s : SystemSupportEngineer; }
    requirement def R23 { doc /* Where dual control is required, the Regional Flow Platform shall record the initiating user, the approving user, the affected operational object, and the effective time of the decision. @S775 */ subject s : RegionalFlowPlatform; }
    requirement def R24 { doc /* Access to the Performance Analytics Warehouse shall be restricted to authorized analytical roles and shall not allow retrospective alteration of operational records held in the Audit Event Ledger. @S776 */ subject s : PerformanceAnalyticsWarehouse; }
    requirement def R25 { doc /* The Audit Event Ledger shall capture successful and failed authentication attempts, role changes, privilege elevations, operational approvals, configuration changes, data exports, and emergency access activations. @S777 */ subject s : AuditEventLedger; }
    requirement def R26 { doc /* The Identity Access Service shall support rapid suspension of accounts when a user changes role, leaves an organization, or becomes subject to an operational integrity concern. @S781 */ subject s : IdentityAccessService; }
    requirement def R27 { doc /* Silverpine shall accept emergency access activations only after the Identity Access Service records the authorizing incident reference and expiry time. @S783 */ subject s : ContingencyOperationsConsole; }
    requirement def R28 { doc /* When normal connectivity is restored, the Regional Flow Platform shall reconcile contingency actions with the Collaborative Decision Log so that accountability is preserved across the full incident timeline. @S787 */ subject s : RegionalFlowPlatform; }
    requirement def R29 { doc /* The Regional Flow Platform shall record slot compliance events in the Audit Event Ledger using the operating date, flight identifier, airport, runway direction, and applicable regulation reference. @S789 */ subject s : RegionalFlowPlatform; }
    requirement def R30 { doc /* The Slot Compliance State shall indicate whether a flight was compliant, early, late, exempted, substituted, cancelled, or pending review at the end of the traffic period. @S791 */ subject s : SlotComplianceState; }
    requirement def R31 { doc /* The Audit Event Ledger shall preserve the time source applied by the Time Synchronization Service so that later review can distinguish operational delay from data latency. @S792 */ subject s : AuditEventLedger; }
    requirement def R32 { doc /* User decisions entered through the Airport CDM Portal shall be linked to the authenticated role provided by the Identity Access Service. @S793 */ subject s : AirportCDMPortal; }
    requirement def R33 { doc /* The Collaborative Decision Log shall retain the stated reason, decision time, affected flight, and visible operational context for each material change to a slot or sequence. @S794 */ subject s : CollaborativeDecisionLog; }
    requirement def R34 { doc /* The Slot Coordinator shall review substitution activity after operations to confirm that priority rules were applied consistently across participating operators. @S798 */ subject s : SlotCoordinator; }
    requirement def R35 { doc /* Surface movement evidence from the Surface Surveillance Adapter shall be retained long enough to support dispute resolution and regulatory audit requests. @S802 */ subject s : SurfaceSurveillanceAdapter; }
    requirement def R36 { doc /* Capacity changes made through the Capacity Assessment Module shall be correlated with the active Airport Capacity Plan and Airport Acceptance Rate used at the time of allocation. @S803 */ subject s : CapacityAssessmentModule; }
    requirement def R37 { doc /* The Performance Analytics Warehouse shall aggregate compliance outcomes by carrier, route group, regulation, airport operating configuration, and time band. @S804 */ subject s : PerformanceAnalyticsWarehouse; }
    requirement def R38 { doc /* The Data Governance Steward shall verify that audit fields required for slot performance reporting remain complete, immutable, and traceable to approved data definitions. @S806 */ subject s : DataGovernanceSteward; }
    requirement def R39 { doc /* The System Support Engineer shall investigate technical gaps when audit sequences show missing events, duplicate updates, or inconsistent timestamps. @S807 */ subject s : SystemSupportEngineer; }
    requirement def R40 { doc /* The Regional Flow Manager shall use the Post Operations Report to identify whether noncompliance resulted from operator choice, airport constraint, airspace constraint, weather impact, or system issue. @S808 */ subject s : RegionalFlowManager; }
    requirement def R41 { doc /* The Airport Duty Manager shall review late airport-driven changes that affected multiple flights and shall record whether the operational justification was valid. @S809 */ subject s : AirportDutyManager; }
    requirement def R42 { doc /* Data governance for the Regional Flow Platform shall assign accountable owners to each operational data domain and shall make those assignments visible in the Airport CDM Portal. @S812 */ subject s : RegionalFlowPlatform; }
    requirement def R43 { doc /* The Data Governance Steward shall maintain the data ownership register and shall coordinate updates through the Business Rules Registry. @S813 */ subject s : DataGovernanceSteward; }
    requirement def R44 { doc /* The Regional Flow Manager shall own flow management policy data, including Ground Delay Program parameters and Tactical Regulation Proposal status values. @S814 */ subject s : RegionalFlowManager; }
    requirement def R45 { doc /* The Slot Coordinator shall own slot allocation reference data, including Calculated Takeoff Time tolerances and Slot Compliance State definitions. @S815 */ subject s : SlotCoordinator; }
    requirement def R46 { doc /* The Airport Duty Manager shall own airport capacity declarations, including Airport Capacity Plan records and Airport Acceptance Rate values. @S816 */ subject s : AirportDutyManager; }
    requirement def R47 { doc /* The Tower Supervisor shall own tower sequence status data maintained for the Tower Sequence Manager. @S817 */ subject s : TowerSupervisor; }
    requirement def R48 { doc /* The Ramp Control Lead shall own ramp movement status data maintained for the Ramp Movement Board. @S818 */ subject s : RampControlLead; }
    requirement def R49 { doc /* The Meteorology Briefing Officer shall own operational weather classification inputs accepted by the Weather Ingest Gateway. @S819 */ subject s : MeteorologyBriefingOfficer; }
    requirement def R50 { doc /* The Airline Operations Coordinator shall be accountable for airline-supplied schedule intent, readiness status, and Target Off Block Time updates submitted through approved interfaces. @S820 */ subject s : AirlineOperationsCoordinator; }
    requirement def R51 { doc /* Freshness indicators shall be displayed on the Common Situation Display wherever stale data could affect sequencing, metering, regulation, or resource allocation decisions. @S822 */ subject s : CommonSituationDisplay; }
    requirement def R52 { doc /* The Time Synchronization Service shall provide the common time basis used for freshness calculations across the Regional Flow Platform. @S824 */ subject s : TimeSynchronizationService; }
    requirement def R53 { doc /* The Flight Data Exchange shall validate Flight Intent Message content before the data is made available for operational use. @S827 */ subject s : FlightDataExchange; }
    requirement def R54 { doc /* The Surface Surveillance Adapter shall apply position quality checks and shall mark uncertain observations before they are used by surface decision functions. @S828 */ subject s : SurfaceSurveillanceAdapter; }
    requirement def R55 { doc /* The Airline Interface Adapter shall apply carrier-specific format checks while preserving the common operational meaning required by the Regional Flow Platform. @S829 */ subject s : AirlineInterfaceAdapter; }
    requirement def R56 { doc /* The Handling Resource Planner shall validate resource quantities, task timing, and allocation identifiers against active operational reference data. @S830 */ subject s : HandlingResourcePlanner; }
    requirement def R57 { doc /* The Business Rules Registry shall hold the current validation thresholds, allowable reason codes, and exception rules approved for Normal Operations, Adverse Weather Mode, Capacity Reduction State, Recovery Phase, and Contingency Fallback State. @S831 */ subject s : BusinessRulesRegistry; }
    requirement def R58 { doc /* The Data Governance Steward shall coordinate discrepancy resolution with the responsible operational owner and shall record the disposition in the Audit Event Ledger. @S833 */ subject s : DataGovernanceSteward; }
    requirement def R59 { doc /* The System Support Engineer shall investigate technical causes of missing, delayed, duplicated, or transformed records and shall provide evidence needed for stewardship decisions. @S835 */ subject s : SystemSupportEngineer; }
    requirement def R60 { doc /* The Performance Analytics Warehouse shall retain data quality measures, including validation failure rates, freshness breaches, manual corrections, and recurring ownership conflicts. @S836 */ subject s : PerformanceAnalyticsWarehouse; }
    requirement def R61 { doc /* Performance measurement for the Meridian Regional Air Traffic Flow Management and Airport Collaborative Decision-Making System shall convert operational events into repeatable indicators that can be reviewed after each operating day. @S838 */ subject s : MeridianRegionalAirTrafficFlowManagementAndAirportCollaborativeDecisionMakingSystem; }
    requirement def R62 { doc /* The Performance Analytics Warehouse shall calculate delay absorption as the portion of expected airborne or terminal-area delay that is converted into controlled ground delay before departure. @S839 */ subject s : PerformanceAnalyticsWarehouse; }
    requirement def R63 { doc /* The Regional Flow Manager shall use this indicator to verify that a Ground Delay Program reduced airborne holding without creating excessive departure congestion at constrained airports. @S842 */ subject s : RegionalFlowManager; }
    requirement def R64 { doc /* The Slot Coordinator shall review slot adherence by operator, airport, time band, and regulation identifier to detect recurring causes of noncompliance. @S848 */ subject s : SlotCoordinator; }
    requirement def R65 { doc /* The Slot Compliance State shall be used to identify periods when adherence monitoring has operational priority over advisory optimization. @S850 */ subject s : SlotComplianceState; }
    requirement def R66 { doc /* The Capacity Assessment Module shall record the available Airport Acceptance Rate used in each baseline so that avoided cancellation estimates remain traceable. @S853 */ subject s : CapacityAssessmentModule; }
    requirement def R67 { doc /* The Performance Analytics Warehouse shall apply approved fuel burn and emissions factors by aircraft category, operating phase, and delay location. @S856 */ subject s : PerformanceAnalyticsWarehouse; }
    requirement def R68 { doc /* The Meteorology Briefing Officer shall support interpretation of emissions results by identifying periods when weather routing or convective avoidance dominated fuel performance. @S858 */ subject s : MeteorologyBriefingOfficer; }
    requirement def R69 { doc /* The Airport Duty Manager shall receive benefit summaries that show changes in stand occupancy, surface congestion, recovery duration, and passenger-facing disruption indicators. @S860 */ subject s : AirportDutyManager; }
    requirement def R70 { doc /* The Data Governance Steward shall ensure that published performance measures identify data sources, calculation versions, confidence limits, and known exclusions. @S861 */ subject s : DataGovernanceSteward; }
    requirement def R71 { doc /* The Post Operations Report shall present regional benefits alongside operational trade-offs so that decision makers can see whether delay, queue, slot, cancellation, and emissions objectives were balanced in practice. @S862 */ subject s : PostOperationsReport; }
    requirement def R72 { doc /* Training for the Meridian Regional Air Traffic Flow Management and Airport Collaborative Decision-Making System shall be role based and shall cover normal coordination, constrained operations, recovery actions, and degraded system use. @S863 */ subject s : MeridianRegionalAirTrafficFlowManagementAndAirportCollaborativeDecisionMakingSystem; }
    requirement def R73 { doc /* The Regional Flow Manager shall receive advanced instruction on interpreting demand and capacity information, leading collaborative decisions, and authorizing operational measures in the Regional Flow Platform. @S864 */ subject s : RegionalFlowManager; }
    requirement def R74 { doc /* The Tower Supervisor shall receive practical training on the Tower Sequence Manager, Departure Metering Service, Arrival Regulation Console, North Runway Meter, and South Runway Meter. @S866 */ subject s : TowerSupervisor; }
    requirement def R75 { doc /* The Slot Coordinator shall receive training on the Slot Allocation Engine, Airport CDM Portal, and applicable Business Rules Registry entries so that slot actions are applied consistently and transparently. @S870 */ subject s : SlotCoordinator; }
    requirement def R76 { doc /* The Airport Duty Manager shall be trained to recognize when an Airport Capacity Plan requires revision and when the operational state should move from Normal Operations to Adverse Weather Mode or Capacity Reduction State. @S872 */ subject s : AirportDutyManager; }
    requirement def R77 { doc /* The Meteorology Briefing Officer shall be trained to explain weather uncertainty in operational terms and to verify that the Weather Ingest Gateway supports the assumptions used during briefings. @S873 */ subject s : MeteorologyBriefingOfficer; }
    requirement def R78 { doc /* The Emergency Response Coordinator shall participate in recurrent training so that emergency priorities are integrated into flow management decisions without obscuring command authority or safety responsibilities. @S874 */ subject s : EmergencyResponseCoordinator; }
    requirement def R79 { doc /* The Deicing Coordinator shall receive seasonal refresher training on how deicing capacity assumptions are represented in demand and departure metering tools. @S875 */ subject s : DeicingCoordinator; }
    requirement def R80 { doc /* The Data Governance Steward shall train operational users on data quality responsibilities, privacy expectations, and the correct interpretation of audit records in the Audit Event Ledger. @S876 */ subject s : DataGovernanceSteward; }
    requirement def R81 { doc /* The System Support Engineer shall train superusers on service status checks, access fault escalation, and safe use of the Contingency Operations Console during partial outages. @S877 */ subject s : SystemSupportEngineer; }
    requirement def R82 { doc /* Deployment of the Regional Flow Platform shall proceed through phased increments that limit operational exposure while progressively adding airports, interfaces, and decision support functions. @S888 */ subject s : RegionalFlowPlatform; }
    requirement def R83 { doc /* Readiness Gate 1 shall confirm that governance, security approvals, user role definitions, operating hours, and support escalation paths are documented and accepted by local stakeholders. @S894 */ subject s : ReadinessGate1; }
    requirement def R84 { doc /* Readiness Gate 2 shall confirm that the Flight Data Exchange, Airline Interface Adapter, Surface Surveillance Adapter, and Weather Ingest Gateway can be connected without disrupting existing airport operations. @S895 */ subject s : ReadinessGate2; }
    requirement def R85 { doc /* Readiness Gate 3 shall confirm that local procedures have been mapped to the Airport CDM Portal, Tower Sequence Manager, Ramp Movement Board, Departure Metering Service, and Arrival Regulation Console. @S896 */ subject s : ReadinessGate3; }
    requirement def R86 { doc /* Readiness Gate 4 shall confirm that training, shadow operations, contingency procedures, and operational acceptance criteria have been completed before live collaborative decisions are made through the Regional Flow Platform. @S897 */ subject s : ReadinessGate4; }
    requirement def R87 { doc /* The Contingency Operations Console shall be available at each onboarded airport before reliance on the Regional Flow Platform is declared for Normal Operations, Adverse Weather Mode, Capacity Reduction State, Recovery Phase, or Contingency Fallback State. @S908 */ subject s : ContingencyOperationsConsole; }
    requirement def R88 { doc /* Operational service management for the Regional Flow Platform shall begin when a deployed airport is accepted into steady state support after the regional stabilization period. @S912 */ subject s : RegionalFlowPlatform; }
    requirement def R89 { doc /* The System Support Engineer shall provide round the clock on call coverage for production incidents affecting the Regional Flow Platform, Airport CDM Portal, Slot Allocation Engine, Departure Metering Service, Arrival Regulation Console, and Alert Distribution Hub. @S914 */ subject s : SystemSupportEngineer; }
    requirement def R90 { doc /* The System Support Engineer shall advise operational supervisors on technical status, known workarounds, data integrity concerns, and recovery options, but shall not issue traffic management instructions. @S918 */ subject s : SystemSupportEngineer; }
    requirement def R91 { doc /* The System Support Engineer shall maintain an incident record that captures the initial symptom, affected components, operational state, timeline, mitigation actions, data corrections, and supervisor decisions. @S923 */ subject s : SystemSupportEngineer; }
    requirement def R92 { doc /* The Collaborative Decision Log shall be used to preserve the operational context of major incidents when traffic management decisions are made while a technical degradation is present. @S925 */ subject s : CollaborativeDecisionLog; }
    requirement def R93 { doc /* The System Support Engineer shall verify that fallback tools, exported operational data, and restoration checkpoints are available before advising that normal technical service can resume. @S927 */ subject s : SystemSupportEngineer; }
    requirement def R94 { doc /* Future enhancement of the Regional Flow Platform should be treated as an incremental extension of the operational service rather than as a replacement of the current concept. @S936 */ subject s : RegionalFlowPlatform; }
    requirement def R95 { doc /* The Flight Data Exchange should be enhanced to accept richer intent data, including improved route options, expected cruise profiles, and updated departure readiness information. @S940 */ subject s : FlightDataExchange; }
    requirement def R96 { doc /* The Demand Prediction Service should use this data to create more stable demand pictures across longer planning horizons while still preserving tactical responsiveness. @S941 */ subject s : DemandPredictionService; }
    requirement def R97 { doc /* The Capacity Assessment Module should evolve from a mainly rules-based assessment into a service that can compare planned capacity, observed throughput, and predicted constraint persistence. @S944 */ subject s : CapacityAssessmentModule; }
    requirement def R98 { doc /* Predicted changes to Target Off Block Time should be presented with confidence levels rather than as unconditional system corrections. @S948 */ subject s : TargetOffBlockTime; }
    requirement def R99 { doc /* The Slot Allocation Engine should use improved turnaround predictions to protect feasible Calculated Takeoff Time assignments and to reduce avoidable re-sequencing. @S949 */ subject s : SlotAllocationEngine; }
    requirement def R100 { doc /* Data governance should remain under the Data Governance Steward, with clear rules for retention, consent, quality thresholds, and permitted operational use. @S958 */ subject s : DataGovernanceSteward; }
    requirement def R101 { doc /* The Common Situation Display is the shared baseline for time-critical coordination and should be kept consistent with the Regional Flow Platform and Airport CDM Portal. @S974 */ subject s : CommonSituationDisplay; }
}
