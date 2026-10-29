package L2Model {
    item def AcceptedIntentDataItem { doc /* @S128 */ }
    item def ApronSweepCompletionNoteItem { doc /* @S678 */ }
    item def CandidatePushbackSpacingItem { doc /* @S456 */ }
    item def CapacityPictureChangeNotificationItem { doc /* @S121 */ }
    item def ConstraintsItem { doc /* @S135,S225 */ }
    item def CrewBusDelaySlipItem { doc /* @S237 */ }
    item def CrewDutyExtensionLogItem { doc /* @S726 */ }
    item def CustomsHoldReleaseNoteItem { doc /* @S679 */ }
    item def DeicingPadQueueCardItem { doc /* @S378 */ }
    item def DemandItem { doc /* @S225 */ }
    item def DemandForecastItem { doc /* @S101 */ }
    item def DepartureFixLoadSheetItem { doc /* @S598 */ }
    item def FiledFlightInformationItem { doc /* @S103 */ }
    item def FlightIntentMessageItem { doc /* @S126 */ }
    item def FuelTruckHoldAdviceItem { doc /* @S450 */ }
    item def GateReopeningMemoItem { doc /* @S472 */ }
    item def LateBaggageTagListItem { doc /* @S519 */ }
    item def MedicalDiversionNoticeItem { doc /* @S576 */ }
    item def MorningWeatherOutlookItem { doc /* @S057 */ }
    item def MovementAreaOccupancyAndEquipmentStatusIndicatorsItem { doc /* @S445 */ }
    item def MovementIndicationsItem { doc /* @S179 */ }
    item def NotificationsItem { doc /* @S614 */ }
    item def OverlappingOccupancyAlertItem { doc /* @S210 */ }
    item def PassengerMisconnectCountItem { doc /* @S851 */ }
    item def PositionUpdatesItem { doc /* @S179 */ }
    item def PushbackWindowTokenItem { doc /* @S503 */ }
    item def RemoteStandShuttleCountItem { doc /* @S648 */ }
    item def RevisedInputsItem { doc /* @S699 */ }
    item def RunwayInspectionNoteItem { doc /* @S181 */ }
    item def RunwayLightingOutageCardItem { doc /* @S693 */ }
    item def RunwaySpecificCapacityValuesItem { doc /* @S114 */ }
    item def SlotSwapPermissionEmailItem { doc /* @S795 */ }
    item def StandTowRequestFormItem { doc /* @S304 */ }
    item def StormCellSnapshotItem { doc /* @S133 */ }
    item def TemporaryRestrictionNoticeItem { doc /* @S399 */ }
    item def TowbarShortageReportItem { doc /* @S556 */ }
    item def UnresolvedAssumptionsItem { doc /* @S071 */ }
    part def AccessControl { doc /* @S786 */ }
    part def AccountableParticipant { doc /* @S168 */ }
    part def AircraftOperatorRepresentative { doc /* @S620,S726 */ }
    part def AirlineInterfaceAdapter { doc /* @S033,S126,S128,S135,S452,S519,S829 */ }
    part def AirlineOperationsCentre { doc /* @S126,S135 */ }
    part def AirlineOperationsCoordinator { doc /* @S121,S237,S260,S472,S679,S740,S795,S820,S851 */ }
    part def AirportCDMPortal { doc /* @S031,S166,S172,S179,S293,S503,S648,S793 */ }
    part def AirportDutyManager { doc /* @S181,S435,S496,S568,S576,S678,S679,S809,S816,S860,S872 */ }
    part def AirportParticipant { doc /* @S167 */ }
    part def AlertDistributionHub { doc /* @S033,S073,S121,S193,S366,S461,S588,S614,S705,S834 */ }
    part def ArrivalRegulationConsole { doc /* @S032,S407,S535,S576 */ }
    part def AuditEventLedger { doc /* @S034,S777,S779,S792 */ }
    part def BusinessRulesRegistry { doc /* @S034,S831 */ }
    part def CapacityAssessmentModule { doc /* @S014,S031,S057,S066,S114,S133,S225,S341,S853 */ }
    part def CollaborativeDecisionLog { doc /* @S071,S794 */ }
    part def CommonSituationDisplay { doc /* @S822 */ }
    part def ComplianceAssessment { doc /* @S790 */ }
    part def ContingencyOperationsConsole { doc /* @S032,S783,S908 */ }
    part def CriticalIncident { doc /* @S920 */ }
    part def DataGovernanceSteward { doc /* @S785,S806,S813,S833,S861 */ }
    part def DeicingCoordinator { doc /* @S294,S378 */ }
    part def DemandPredictionService { doc /* @S013,S031,S053,S101,S103,S216,S225,S825,S900 */ }
    part def DepartureMeteringService { doc /* @S032,S069,S426,S456,S699,S728,S851 */ }
    part def DigitalBriefingRoom { doc /* @S031,S071 */ }
    part def EastApronSensor { doc /* @S179,S578 */ }
    part def FlightDataExchange { doc /* @S033,S052,S103,S128,S278,S684,S827,S979 */ }
    part def GateConflictDetector { doc /* @S210,S386,S472 */ }
    part def GroundHandlingDispatcher { doc /* @S140,S237,S519,S523,S556 */ }
    part def HandlingResourcePlanner { doc /* @S304,S547,S648,S830 */ }
    part def HarborEastAirport { doc /* @S026 */ }
    part def HighPriorityIncident { doc /* @S921 */ }
    part def IdentityAccessService { doc /* @S034,S781,S981 */ }
    part def LakesideRegionalAirport { doc /* @S026 */ }
    part def MeridianAirportNetwork { doc /* @S026 */ }
    part def MeridianInternationalAirport { doc /* @S026 */ }
    part def MeridianRegionalAirTrafficFlowManagementAndAirportCollaborativeDecisionMakingSystem { doc /* @S863,S879 */ }
    part def MeteorologyBriefingOfficer { doc /* @S056,S085,S133,S819 */ }
    part def MilitaryAirspaceLiaison { doc /* @S325,S399 */ }
    part def NetworkOperationsLiaison { doc /* @S614 */ }
    part def NorthRunwayMeter { doc /* @S114,S454 */ }
    part def NorthValleyAirport { doc /* @S026 */ }
    part def OperationalUser { doc /* @S764 */ }
    part def PerformanceAnalyticsWarehouse { doc /* @S034,S776,S804,S836,S839,S856 */ }
    part def RampControlLead { doc /* @S202,S208,S210,S304,S378,S387,S556,S614,S647,S678,S818 */ }
    part def RampMovementBoard { doc /* @S032,S361,S427,S445,S450 */ }
    part def ReadinessGate2 { doc /* @S895 */ }
    part def RegionalFlowManager { doc /* @S010,S121,S399,S598,S614,S808,S814,S842 */ }
    part def RegionalFlowPlatform { doc /* @S031,S032,S033,S034,S047,S051,S101,S164,S268,S371,S767,S774,S775,S787,S789,S890 */ }
    part def SectorLoadMonitor { doc /* @S484,S598 */ }
    part def SecurityMonitoring { doc /* @S780 */ }
    part def SlotAllocationEngine { doc /* @S015,S031,S134,S225,S234,S355,S428,S456,S503,S699,S980 */ }
    part def SlotComplianceState { doc /* @S791 */ }
    part def SlotCoordinator { doc /* @S068,S356,S614,S672,S726,S795,S798,S815,S848,S870 */ }
    part def SouthRunwayMeter { doc /* @S114 */ }
    part def SouthportAirport { doc /* @S026 */ }
    part def SurfaceSurveillanceAdapter { doc /* @S033,S179,S445,S606,S693,S802,S828 */ }
    part def System { doc /* @S022,S023,S953 */ }
    part def SystemSupportEngineer { doc /* @S772,S807,S835,S914,S918 */ }
    part def TemporaryAccess { doc /* @S782 */ }
    part def TimeSynchronizationService { doc /* @S034,S187,S778,S824 */ }
    part def TowerSequenceManager { doc /* @S032,S334,S445,S450,S801,S844 */ }
    part def TowerSupervisor { doc /* @S060,S121,S181,S313,S614,S693,S817,S866 */ }
    part def WeatherIngestGateway { doc /* @S033,S057,S102,S111,S182 */ }
    part def WestApronSensor { doc /* @S179 */ }
    part system {
        part accessControl : AccessControl;
        part accountableParticipant : AccountableParticipant;
        part aircraftOperatorRepresentative : AircraftOperatorRepresentative {
            perform action a0 { doc /* sends the Crew Duty Extension Log @S620 */ }
        }
        part airlineInterfaceAdapter : AirlineInterfaceAdapter {
            perform action a0 { doc /* produces the Late Baggage Tag List @S452 */ }
        }
        part airlineOperationsCentre : AirlineOperationsCentre;
        part airlineOperationsCoordinator : AirlineOperationsCoordinator {
            perform action a0 { doc /* sends the Passenger Misconnect Count @S740 */ }
        }
        part airportCDMPortal : AirportCDMPortal;
        part airportDutyManager : AirportDutyManager {
            perform action a0 { doc /* declare Normal Operations, Adverse Weather Mode, Capacity Reduction State, Recovery Phase, or Contingency Fallback State @S435 */ }
            perform action a1 { doc /* sends the Medical Diversion Notice @S496 */ }
            perform action a2 { doc /* produces the Customs Hold Release Note @S568 */ }
        }
        part airportParticipant : AirportParticipant;
        part alertDistributionHub : AlertDistributionHub {
            perform action a0 { doc /* notifies participating roles that the morning plan is available @S073 */ }
            perform action a1 { doc /* highlights the affected runway queue on the Common Situation Display @S366 */ }
            perform action a2 { doc /* issues targeted alerts @S588 */ }
        }
        part arrivalRegulationConsole : ArrivalRegulationConsole {
            perform action a0 { doc /* issues alerts before predicted holding stacks form @S407 */ }
        }
        part auditEventLedger : AuditEventLedger;
        part businessRulesRegistry : BusinessRulesRegistry;
        part capacityAssessmentModule : CapacityAssessmentModule {
            perform action a0 { doc /* supports the assessment of declared and tactical capacity @S014 */ }
            perform action a1 { doc /* combines the runway declaration, weather outlook, airspace constraints, stand readiness, and ground resource assumptions into a proposed Airport Acceptance Rate by period @S066 */ }
        }
        part collaborativeDecisionLog : CollaborativeDecisionLog;
        part commonSituationDisplay : CommonSituationDisplay;
        part complianceAssessment : ComplianceAssessment;
        part contingencyOperationsConsole : ContingencyOperationsConsole;
        part criticalIncident : CriticalIncident;
        part dataGovernanceSteward : DataGovernanceSteward;
        part deicingCoordinator : DeicingCoordinator {
            perform action a0 { doc /* sends the Deicing Pad Queue Card @S294 */ }
        }
        part demandPredictionService : DemandPredictionService {
            perform action a0 { doc /* estimates expected demand from scheduled operations, Flight Intent Message data, known airline recovery plans, and near-term operational changes @S013 */ }
            perform action a1 { doc /* converts the normalized schedule into expected arrival and departure demand @S053 */ }
        }
        part departureMeteringService : DepartureMeteringService {
            perform action a0 { doc /* estimates provisional Target Off Block Time sensitivity @S069 */ }
        }
        part digitalBriefingRoom : DigitalBriefingRoom {
            perform action a0 { doc /* displays the emerging Airport Capacity Plan @S071 */ }
        }
        part eastApronSensor : EastApronSensor {
            perform action a0 { doc /* reports stand occupancy transitions, pushback lane blockage durations, and sensor confidence values @S578 */ }
        }
        part flightDataExchange : FlightDataExchange {
            perform action a0 { doc /* normalizes flight identifiers, aircraft types, routing fields, and planned operating times @S052 */ }
        }
        part gateConflictDetector : GateConflictDetector {
            perform action a0 { doc /* produces the Gate Reopening Memo @S386 */ }
        }
        part groundHandlingDispatcher : GroundHandlingDispatcher {
            perform action a0 { doc /* sends the Crew Bus Delay Slip @S140 */ }
            perform action a1 { doc /* sends the Towbar Shortage Report @S523 */ }
        }
        part handlingResourcePlanner : HandlingResourcePlanner {
            perform action a0 { doc /* produces the Remote Stand Shuttle Count @S547 */ }
        }
        part harborEastAirport : HarborEastAirport;
        part highPriorityIncident : HighPriorityIncident;
        part identityAccessService : IdentityAccessService;
        part lakesideRegionalAirport : LakesideRegionalAirport;
        part meridianAirportNetwork : MeridianAirportNetwork;
        part meridianInternationalAirport : MeridianInternationalAirport;
        part meridianRegionalAirTrafficFlowManagementAndAirportCollaborativeDecisionMakingSystem : MeridianRegionalAirTrafficFlowManagementAndAirportCollaborativeDecisionMakingSystem;
        part meteorologyBriefingOfficer : MeteorologyBriefingOfficer {
            perform action a0 { doc /* provides the morning weather outlook @S056 */ }
            perform action a1 { doc /* produces the Storm Cell Snapshot @S085 */ }
        }
        part militaryAirspaceLiaison : MilitaryAirspaceLiaison {
            perform action a0 { doc /* sends the Temporary Restriction Notice @S325 */ }
        }
        part networkOperationsLiaison : NetworkOperationsLiaison;
        part northRunwayMeter : NorthRunwayMeter {
            perform action a0 { doc /* reduces the departure release rate @S454 */ }
        }
        part northValleyAirport : NorthValleyAirport;
        part operationalUser : OperationalUser;
        part performanceAnalyticsWarehouse : PerformanceAnalyticsWarehouse;
        part rampControlLead : RampControlLead {
            perform action a0 { doc /* sends the Stand Tow Request Form @S208 */ }
            perform action a1 { doc /* sends the Apron Sweep Completion Note @S647 */ }
        }
        part rampMovementBoard : RampMovementBoard {
            perform action a0 { doc /* produces the Fuel Truck Hold Advice @S361 */ }
        }
        part readinessGate2 : ReadinessGate2;
        part regionalFlowManager : RegionalFlowManager {
            perform action a0 { doc /* balancing demand against capacity across the Meridian region @S010 */ }
        }
        part regionalFlowPlatform : RegionalFlowPlatform {
            perform action a0 { doc /* creates the initial demand picture @S051 */ }
            perform action a1 { doc /* locks the Target Off Block Time @S268 */ }
            exhibit state modes {
                state s0 { doc /* Adverse Weather Mode @S047 */ }
                state s1 { doc /* Capacity Reduction State @S047 */ }
                state s2 { doc /* Contingency Fallback State @S047 */ }
                state s3 { doc /* Normal Operations @S047 */ }
                state s4 { doc /* Recovery Phase @S047 */ }
                state s5 { doc /* Slot Compliance State @S047 */ }
                state s6 { doc /* winter operating mode @S371 */ }
            }
        }
        part sectorLoadMonitor : SectorLoadMonitor {
            perform action a0 { doc /* produces the Departure Fix Load Sheet @S484 */ }
        }
        part securityMonitoring : SecurityMonitoring;
        part slotAllocationEngine : SlotAllocationEngine {
            perform action a0 { doc /* supports fair and traceable allocation of constrained departure and arrival opportunities @S015 */ }
            perform action a1 { doc /* converts accepted constraints into Calculated Takeoff Time values and Target Off Block Time guidance @S134 */ }
            perform action a2 { doc /* produces the Pushback Window Token @S428 */ }
        }
        part slotComplianceState : SlotComplianceState;
        part slotCoordinator : SlotCoordinator {
            perform action a0 { doc /* uses the Slot Allocation Engine to prepare an initial slot feasibility view @S068 */ }
            perform action a1 { doc /* records the agreed pushback window rationale in the coordination notes @S356 */ }
            perform action a2 { doc /* sends the Slot Swap Permission Email @S672 */ }
        }
        part southRunwayMeter : SouthRunwayMeter;
        part southportAirport : SouthportAirport;
        part surfaceSurveillanceAdapter : SurfaceSurveillanceAdapter {
            perform action a0 { doc /* produces the Runway Lighting Outage Card @S606 */ }
        }
        part systemPart : System;
        part systemSupportEngineer : SystemSupportEngineer;
        part temporaryAccess : TemporaryAccess;
        part timeSynchronizationService : TimeSynchronizationService;
        part towerSequenceManager : TowerSequenceManager;
        part towerSupervisor : TowerSupervisor {
            perform action a0 { doc /* sends the Runway Inspection Note @S060 */ }
        }
        part weatherIngestGateway : WeatherIngestGateway {
            perform action a0 { doc /* normalizes external and local meteorological feeds @S102 */ }
            perform action a1 { doc /* marks the feed as degraded @S111 */ }
        }
        part westApronSensor : WestApronSensor;
        flow f0 of MorningWeatherOutlookItem from weatherIngestGateway to capacityAssessmentModule { doc /* @S057 */ }
        flow f1 of UnresolvedAssumptionsItem from digitalBriefingRoom to collaborativeDecisionLog { doc /* @S071 */ }
        flow f2 of DemandForecastItem from demandPredictionService to regionalFlowPlatform { doc /* @S101 */ }
        flow f3 of FiledFlightInformationItem from flightDataExchange to demandPredictionService { doc /* @S103 */ }
        flow f4 of RunwaySpecificCapacityValuesItem from capacityAssessmentModule to northRunwayMeter { doc /* @S114 */ }
        flow f5 of RunwaySpecificCapacityValuesItem from capacityAssessmentModule to southRunwayMeter { doc /* @S114 */ }
        flow f6 of CapacityPictureChangeNotificationItem from alertDistributionHub to regionalFlowManager { doc /* @S121 */ }
        flow f7 of CapacityPictureChangeNotificationItem from alertDistributionHub to towerSupervisor { doc /* @S121 */ }
        flow f8 of CapacityPictureChangeNotificationItem from alertDistributionHub to airlineOperationsCoordinator { doc /* @S121 */ }
        flow f9 of FlightIntentMessageItem from airlineOperationsCentre to airlineInterfaceAdapter { doc /* @S126 */ }
        flow f10 of AcceptedIntentDataItem from airlineInterfaceAdapter to flightDataExchange { doc /* @S128 */ }
        flow f11 of StormCellSnapshotItem from meteorologyBriefingOfficer to capacityAssessmentModule { doc /* @S133 */ }
        flow f12 of ConstraintsItem from airlineInterfaceAdapter to airlineOperationsCentre { doc /* @S135 */ }
        flow f13 of PositionUpdatesItem from eastApronSensor to surfaceSurveillanceAdapter { doc /* @S179 */ }
        flow f14 of PositionUpdatesItem from westApronSensor to surfaceSurveillanceAdapter { doc /* @S179 */ }
        flow f15 of MovementIndicationsItem from surfaceSurveillanceAdapter to airportCDMPortal { doc /* @S179 */ }
        flow f16 of RunwayInspectionNoteItem from towerSupervisor to airportDutyManager { doc /* @S181 */ }
        flow f17 of OverlappingOccupancyAlertItem from gateConflictDetector to rampControlLead { doc /* @S210 */ }
        flow f18 of DemandItem from demandPredictionService to slotAllocationEngine { doc /* @S225 */ }
        flow f19 of ConstraintsItem from capacityAssessmentModule to slotAllocationEngine { doc /* @S225 */ }
        flow f20 of CrewBusDelaySlipItem from groundHandlingDispatcher to airlineOperationsCoordinator { doc /* @S237 */ }
        flow f21 of StandTowRequestFormItem from rampControlLead to handlingResourcePlanner { doc /* @S304 */ }
        flow f22 of DeicingPadQueueCardItem from deicingCoordinator to rampControlLead { doc /* @S378 */ }
        flow f23 of TemporaryRestrictionNoticeItem from militaryAirspaceLiaison to regionalFlowManager { doc /* @S399 */ }
        flow f24 of MovementAreaOccupancyAndEquipmentStatusIndicatorsItem from surfaceSurveillanceAdapter to rampMovementBoard { doc /* @S445 */ }
        flow f25 of MovementAreaOccupancyAndEquipmentStatusIndicatorsItem from surfaceSurveillanceAdapter to towerSequenceManager { doc /* @S445 */ }
        flow f26 of FuelTruckHoldAdviceItem from rampMovementBoard to towerSequenceManager { doc /* @S450 */ }
        flow f27 of CandidatePushbackSpacingItem from departureMeteringService to slotAllocationEngine { doc /* @S456 */ }
        flow f28 of GateReopeningMemoItem from gateConflictDetector to airlineOperationsCoordinator { doc /* @S472 */ }
        flow f29 of PushbackWindowTokenItem from slotAllocationEngine to airportCDMPortal { doc /* @S503 */ }
        flow f30 of LateBaggageTagListItem from airlineInterfaceAdapter to groundHandlingDispatcher { doc /* @S519 */ }
        flow f31 of TowbarShortageReportItem from groundHandlingDispatcher to rampControlLead { doc /* @S556 */ }
        flow f32 of MedicalDiversionNoticeItem from airportDutyManager to arrivalRegulationConsole { doc /* @S576 */ }
        flow f33 of DepartureFixLoadSheetItem from sectorLoadMonitor to regionalFlowManager { doc /* @S598 */ }
        flow f34 of NotificationsItem from alertDistributionHub to regionalFlowManager { doc /* @S614 */ }
        flow f35 of NotificationsItem from alertDistributionHub to towerSupervisor { doc /* @S614 */ }
        flow f36 of NotificationsItem from alertDistributionHub to rampControlLead { doc /* @S614 */ }
        flow f37 of NotificationsItem from alertDistributionHub to slotCoordinator { doc /* @S614 */ }
        flow f38 of NotificationsItem from alertDistributionHub to networkOperationsLiaison { doc /* @S614 */ }
        flow f39 of RemoteStandShuttleCountItem from handlingResourcePlanner to airportCDMPortal { doc /* @S648 */ }
        flow f40 of ApronSweepCompletionNoteItem from rampControlLead to airportDutyManager { doc /* @S678 */ }
        flow f41 of CustomsHoldReleaseNoteItem from airportDutyManager to airlineOperationsCoordinator { doc /* @S679 */ }
        flow f42 of RunwayLightingOutageCardItem from surfaceSurveillanceAdapter to towerSupervisor { doc /* @S693 */ }
        flow f43 of RevisedInputsItem from departureMeteringService to slotAllocationEngine { doc /* @S699 */ }
        flow f44 of CrewDutyExtensionLogItem from aircraftOperatorRepresentative to slotCoordinator { doc /* @S726 */ }
        flow f45 of SlotSwapPermissionEmailItem from slotCoordinator to airlineOperationsCoordinator { doc /* @S795 */ }
        flow f46 of PassengerMisconnectCountItem from airlineOperationsCoordinator to departureMeteringService { doc /* @S851 */ }
    }
    requirement def R0 { doc /* During Adverse Weather Mode or Capacity Reduction State, the system must support rapid development of a Tactical Regulation Proposal and consistent communication of the resulting Ground Delay Program when one is required. @S022 */ subject s : System; }
    requirement def R1 { doc /* During Recovery Phase, the system must help stakeholders restore scheduled flow while monitoring Target Off Block Time, Calculated Takeoff Time, and Slot Compliance State performance. @S023 */ subject s : System; }
    requirement def R2 { doc /* Cedarbell shall expose the current regional demand and constraint context to the shared workspace at each publication cycle without requiring manual re-entry. @S164 */ subject s : RegionalFlowPlatform; }
    requirement def R3 { doc /* When a milestone becomes stale, the Airport CDM Portal shall highlight the affected flight and notify the role accountable for the next update through the Alert Distribution Hub. @S166 */ subject s : AirportCDMPortal; }
    requirement def R4 { doc /* Each airport participant shall update a material change within two minutes of becoming aware of it during Normal Operations and within one minute during Adverse Weather Mode or Capacity Reduction State. @S167 */ subject s : AirportParticipant; }
    requirement def R5 { doc /* If the exact value is not yet known, the accountable participant shall enter a provisional value with an uncertainty flag rather than leaving the milestone unchanged. @S168 */ subject s : AccountableParticipant; }
    requirement def R6 { doc /* During Contingency Fallback State, the Airport CDM Portal shall preserve the last synchronized milestone set and clearly mark any updates entered under degraded operating procedures. @S172 */ subject s : AirportCDMPortal; }
    requirement def R7 { doc /* Orchard shall issue time-stamped weather condition updates for use in tower and airport duty coordination. @S182 */ subject s : WeatherIngestGateway; }
    requirement def R8 { doc /* The Time Synchronization Service shall keep tower, duty desk, surveillance, and portal event times aligned so that later review can reconstruct the sequence of events. @S187 */ subject s : TimeSynchronizationService; }
    requirement def R9 { doc /* The Ramp Control Lead shall not release a pushback until the Tower Supervisor has confirmed that the movement can be integrated with the active ground route and runway plan. @S202 */ subject s : RampControlLead; }
    requirement def R10 { doc /* Marlinstone shall refresh stand demand forecasts when the Ramp Movement Board records a material change in planned off-block timing. @S216 */ subject s : DemandPredictionService; }
    requirement def R11 { doc /* The engine shall not improve one operator's position by imposing an excessive delay on another operator unless the rule basis is visible and logged. @S234 */ subject s : SlotAllocationEngine; }
    requirement def R12 { doc /* Saffron shall confirm any operator-requested Target Off Block Time revision in the Airport CDM Portal before the freeze horizon expires. @S260 */ subject s : AirlineOperationsCoordinator; }
    requirement def R13 { doc /* Foxglove shall publish tower readiness changes to authenticated airline and handling users within the configured refresh interval. @S293 */ subject s : AirportCDMPortal; }
    requirement def R14 { doc /* Brindle must confirm that any revised off-block sequence remains compatible with the Departure Metering Service before the change is released to the airport community. @S313 */ subject s : TowerSupervisor; }
    requirement def R15 { doc /* Ironleaf must refresh affected departure sequence advisories when a restriction changes the usable departure routes or expected release spacing. @S334 */ subject s : TowerSequenceManager; }
    requirement def R16 { doc /* Blueharbor shall adjust allocated departure times when metering rules require additional stand absorption to preserve the planned runway sequence. @S355 */ subject s : SlotAllocationEngine; }
    requirement def R17 { doc /* Quartzline must coordinate every pad release with the Tower Supervisor before the aircraft leaves the treated area. @S387 */ subject s : RampControlLead; }
    requirement def R18 { doc /* Skylark must refresh the apron movement layer within five seconds of each validated surface event. @S427 */ subject s : RampMovementBoard; }
    requirement def R19 { doc /* Lantern must distribute surface equipment and apron congestion advisories to subscribed operational roles within the latency target defined in the Business Rules Registry. @S461 */ subject s : AlertDistributionHub; }
    requirement def R20 { doc /* Nightjar shall suppress handler-exception annotations for arriving flights unless the exception changes the Airport Acceptance Rate or a regulated arrival sequence. @S535 */ subject s : ArrivalRegulationConsole; }
    requirement def R21 { doc /* The Departure Metering Service may remain in monitoring mode while manual slot control is active, but it must not automatically overwrite issued times. @S728 */ subject s : DepartureMeteringService; }
    requirement def R22 { doc /* Each named operational user shall authenticate with an individually assigned identity before accessing the Airport CDM Portal, Digital Briefing Room, or any operational console. @S764 */ subject s : OperationalUser; }
    requirement def R23 { doc /* Role profiles shall grant the minimum access needed to view, propose, approve, or administer operational data within the Regional Flow Platform. @S767 */ subject s : RegionalFlowPlatform; }
    requirement def R24 { doc /* Operational approval privileges shall remain separated from technical administration privileges. @S772 */ subject s : SystemSupportEngineer; }
    requirement def R25 { doc /* Operational segregation shall prevent a single user from creating, approving, and technically concealing a material change to a Ground Delay Program, Airport Acceptance Rate, or Tactical Regulation Proposal. @S774 */ subject s : RegionalFlowPlatform; }
    requirement def R26 { doc /* Where dual control is required, the Regional Flow Platform shall record the initiating user, the approving user, the affected operational object, and the effective time of the decision. @S775 */ subject s : RegionalFlowPlatform; }
    requirement def R27 { doc /* Access to the Performance Analytics Warehouse shall be restricted to authorized analytical roles and shall not allow retrospective alteration of operational records held in the Audit Event Ledger. @S776 */ subject s : PerformanceAnalyticsWarehouse; }
    requirement def R28 { doc /* The Audit Event Ledger shall capture successful and failed authentication attempts, role changes, privilege elevations, operational approvals, configuration changes, data exports, and emergency access activations. @S777 */ subject s : AuditEventLedger; }
    requirement def R29 { doc /* All audit records shall use time derived from the Time Synchronization Service so that investigations can reconstruct event order across the Airport CDM Portal, Slot Allocation Engine, and Alert Distribution Hub. @S778 */ subject s : TimeSynchronizationService; }
    requirement def R30 { doc /* Audit records shall be protected against ordinary user modification and retained for a period agreed by the airport operator, regional authority, and participating aircraft operators. @S779 */ subject s : AuditEventLedger; }
    requirement def R31 { doc /* Security monitoring shall alert the System Support Engineer and Data Governance Steward when unusual access patterns indicate possible credential compromise or inappropriate privilege use. @S780 */ subject s : SecurityMonitoring; }
    requirement def R32 { doc /* The Identity Access Service shall support rapid suspension of accounts when a user changes role, leaves an organization, or becomes subject to an operational integrity concern. @S781 */ subject s : IdentityAccessService; }
    requirement def R33 { doc /* Temporary access shall have a defined sponsor, purpose, role scope, and expiry time, and shall be reviewed after the operational need has ended. @S782 */ subject s : TemporaryAccess; }
    requirement def R34 { doc /* Silverpine shall accept emergency access activations only after the Identity Access Service records the authorizing incident reference and expiry time. @S783 */ subject s : ContingencyOperationsConsole; }
    requirement def R35 { doc /* Use of emergency access shall generate prominent audit events and shall require post-event review by the Data Governance Steward and the responsible operational authority. @S785 */ subject s : DataGovernanceSteward; }
    requirement def R36 { doc /* During Contingency Fallback State, access control shall continue to enforce role separation even when some integrations are unavailable and manual coordination becomes necessary. @S786 */ subject s : AccessControl; }
    requirement def R37 { doc /* When normal connectivity is restored, the Regional Flow Platform shall reconcile contingency actions with the Collaborative Decision Log so that accountability is preserved across the full incident timeline. @S787 */ subject s : RegionalFlowPlatform; }
    requirement def R38 { doc /* The Regional Flow Platform shall record slot compliance events in the Audit Event Ledger using the operating date, flight identifier, airport, runway direction, and applicable regulation reference. @S789 */ subject s : RegionalFlowPlatform; }
    requirement def R39 { doc /* Each compliance assessment shall compare the Calculated Takeoff Time, the Target Off Block Time, actual off-block time, and actual takeoff time against the tolerance defined in the Business Rules Registry. @S790 */ subject s : ComplianceAssessment; }
    requirement def R40 { doc /* The Slot Compliance State shall indicate whether a flight was compliant, early, late, exempted, substituted, cancelled, or pending review at the end of the traffic period. @S791 */ subject s : SlotComplianceState; }
    requirement def R41 { doc /* The Audit Event Ledger shall preserve the time source applied by the Time Synchronization Service so that later review can distinguish operational delay from data latency. @S792 */ subject s : AuditEventLedger; }
    requirement def R42 { doc /* User decisions entered through the Airport CDM Portal shall be linked to the authenticated role provided by the Identity Access Service. @S793 */ subject s : AirportCDMPortal; }
    requirement def R43 { doc /* The Collaborative Decision Log shall retain the stated reason, decision time, affected flight, and visible operational context for each material change to a slot or sequence. @S794 */ subject s : CollaborativeDecisionLog; }
    requirement def R44 { doc /* The Slot Coordinator shall review substitution activity after operations to confirm that priority rules were applied consistently across participating operators. @S798 */ subject s : SlotCoordinator; }
    requirement def R45 { doc /* The Tower Sequence Manager and Ramp Movement Board shall provide actual movement milestones that support independent verification of slot performance. @S801 */ subject s : TowerSequenceManager; }
    requirement def R46 { doc /* Surface movement evidence from the Surface Surveillance Adapter shall be retained long enough to support dispute resolution and regulatory audit requests. @S802 */ subject s : SurfaceSurveillanceAdapter; }
    requirement def R47 { doc /* The Performance Analytics Warehouse shall aggregate compliance outcomes by carrier, route group, regulation, airport operating configuration, and time band. @S804 */ subject s : PerformanceAnalyticsWarehouse; }
    requirement def R48 { doc /* The Data Governance Steward shall verify that audit fields required for slot performance reporting remain complete, immutable, and traceable to approved data definitions. @S806 */ subject s : DataGovernanceSteward; }
    requirement def R49 { doc /* The System Support Engineer shall investigate technical gaps when audit sequences show missing events, duplicate updates, or inconsistent timestamps. @S807 */ subject s : SystemSupportEngineer; }
    requirement def R50 { doc /* The Regional Flow Manager shall use the Post Operations Report to identify whether noncompliance resulted from operator choice, airport constraint, airspace constraint, weather impact, or system issue. @S808 */ subject s : RegionalFlowManager; }
    requirement def R51 { doc /* The Airport Duty Manager shall review late airport-driven changes that affected multiple flights and shall record whether the operational justification was valid. @S809 */ subject s : AirportDutyManager; }
    requirement def R52 { doc /* The Data Governance Steward shall maintain the data ownership register and shall coordinate updates through the Business Rules Registry. @S813 */ subject s : DataGovernanceSteward; }
    requirement def R53 { doc /* The Regional Flow Manager shall own flow management policy data, including Ground Delay Program parameters and Tactical Regulation Proposal status values. @S814 */ subject s : RegionalFlowManager; }
    requirement def R54 { doc /* The Slot Coordinator shall own slot allocation reference data, including Calculated Takeoff Time tolerances and Slot Compliance State definitions. @S815 */ subject s : SlotCoordinator; }
    requirement def R55 { doc /* The Airport Duty Manager shall own airport capacity declarations, including Airport Capacity Plan records and Airport Acceptance Rate values. @S816 */ subject s : AirportDutyManager; }
    requirement def R56 { doc /* The Tower Supervisor shall own tower sequence status data maintained for the Tower Sequence Manager. @S817 */ subject s : TowerSupervisor; }
    requirement def R57 { doc /* The Ramp Control Lead shall own ramp movement status data maintained for the Ramp Movement Board. @S818 */ subject s : RampControlLead; }
    requirement def R58 { doc /* The Meteorology Briefing Officer shall own operational weather classification inputs accepted by the Weather Ingest Gateway. @S819 */ subject s : MeteorologyBriefingOfficer; }
    requirement def R59 { doc /* The Airline Operations Coordinator shall be accountable for airline-supplied schedule intent, readiness status, and Target Off Block Time updates submitted through approved interfaces. @S820 */ subject s : AirlineOperationsCoordinator; }
    requirement def R60 { doc /* Freshness indicators shall be displayed on the Common Situation Display wherever stale data could affect sequencing, metering, regulation, or resource allocation decisions. @S822 */ subject s : CommonSituationDisplay; }
    requirement def R61 { doc /* The Time Synchronization Service shall provide the common time basis used for freshness calculations across the Regional Flow Platform. @S824 */ subject s : TimeSynchronizationService; }
    requirement def R62 { doc /* The Demand Prediction Service, Capacity Assessment Module, Slot Allocation Engine, and Departure Metering Service shall reject data that lacks a trusted timestamp. @S825 */ subject s : DemandPredictionService; }
    requirement def R63 { doc /* The Flight Data Exchange shall validate Flight Intent Message content before the data is made available for operational use. @S827 */ subject s : FlightDataExchange; }
    requirement def R64 { doc /* The Surface Surveillance Adapter shall apply position quality checks and shall mark uncertain observations before they are used by surface decision functions. @S828 */ subject s : SurfaceSurveillanceAdapter; }
    requirement def R65 { doc /* The Airline Interface Adapter shall apply carrier-specific format checks while preserving the common operational meaning required by the Regional Flow Platform. @S829 */ subject s : AirlineInterfaceAdapter; }
    requirement def R66 { doc /* The Handling Resource Planner shall validate resource quantities, task timing, and allocation identifiers against active operational reference data. @S830 */ subject s : HandlingResourcePlanner; }
    requirement def R67 { doc /* The Business Rules Registry shall hold the current validation thresholds, allowable reason codes, and exception rules approved for Normal Operations, Adverse Weather Mode, Capacity Reduction State, Recovery Phase, and Contingency Fallback State. @S831 */ subject s : BusinessRulesRegistry; }
    requirement def R68 { doc /* The Data Governance Steward shall coordinate discrepancy resolution with the responsible operational owner and shall record the disposition in the Audit Event Ledger. @S833 */ subject s : DataGovernanceSteward; }
    requirement def R69 { doc /* Urgent discrepancies that could change a metering, arrival regulation, or slot allocation decision shall be raised through the Alert Distribution Hub and reviewed in the Digital Briefing Room. @S834 */ subject s : AlertDistributionHub; }
    requirement def R70 { doc /* The System Support Engineer shall investigate technical causes of missing, delayed, duplicated, or transformed records and shall provide evidence needed for stewardship decisions. @S835 */ subject s : SystemSupportEngineer; }
    requirement def R71 { doc /* The Performance Analytics Warehouse shall retain data quality measures, including validation failure rates, freshness breaches, manual corrections, and recurring ownership conflicts. @S836 */ subject s : PerformanceAnalyticsWarehouse; }
    requirement def R72 { doc /* The Performance Analytics Warehouse shall calculate delay absorption as the portion of expected airborne or terminal-area delay that is converted into controlled ground delay before departure. @S839 */ subject s : PerformanceAnalyticsWarehouse; }
    requirement def R73 { doc /* The Regional Flow Manager shall use this indicator to verify that a Ground Delay Program reduced airborne holding without creating excessive departure congestion at constrained airports. @S842 */ subject s : RegionalFlowManager; }
    requirement def R74 { doc /* The Tower Sequence Manager shall provide runway sequence counts, while the Ramp Movement Board shall provide surface queue counts based on movement status and surveillance confirmation. @S844 */ subject s : TowerSequenceManager; }
    requirement def R75 { doc /* The Slot Coordinator shall review slot adherence by operator, airport, time band, and regulation identifier to detect recurring causes of noncompliance. @S848 */ subject s : SlotCoordinator; }
    requirement def R76 { doc /* The Capacity Assessment Module shall record the available Airport Acceptance Rate used in each baseline so that avoided cancellation estimates remain traceable. @S853 */ subject s : CapacityAssessmentModule; }
    requirement def R77 { doc /* The Performance Analytics Warehouse shall apply approved fuel burn and emissions factors by aircraft category, operating phase, and delay location. @S856 */ subject s : PerformanceAnalyticsWarehouse; }
    requirement def R78 { doc /* The Airport Duty Manager shall receive benefit summaries that show changes in stand occupancy, surface congestion, recovery duration, and passenger-facing disruption indicators. @S860 */ subject s : AirportDutyManager; }
    requirement def R79 { doc /* The Data Governance Steward shall ensure that published performance measures identify data sources, calculation versions, confidence limits, and known exclusions. @S861 */ subject s : DataGovernanceSteward; }
    requirement def R80 { doc /* Training shall be role based and shall cover normal coordination, constrained operations, recovery actions, and degraded system use. @S863 */ subject s : MeridianRegionalAirTrafficFlowManagementAndAirportCollaborativeDecisionMakingSystem; }
    requirement def R81 { doc /* The Tower Supervisor shall receive practical training on the Tower Sequence Manager, Departure Metering Service, Arrival Regulation Console, North Runway Meter, and South Runway Meter. @S866 */ subject s : TowerSupervisor; }
    requirement def R82 { doc /* The Slot Coordinator shall receive training on the Slot Allocation Engine, Airport CDM Portal, and applicable Business Rules Registry entries. @S870 */ subject s : SlotCoordinator; }
    requirement def R83 { doc /* The Airport Duty Manager shall be trained to recognize when an Airport Capacity Plan requires revision and when the operational state should move from Normal Operations to Adverse Weather Mode or Capacity Reduction State. @S872 */ subject s : AirportDutyManager; }
    requirement def R84 { doc /* Recurrent training shall be required at least annually and after major changes to the Regional Flow Platform, Demand Prediction Service, Capacity Assessment Module, or Flight Data Exchange. @S879 */ subject s : MeridianRegionalAirTrafficFlowManagementAndAirportCollaborativeDecisionMakingSystem; }
    requirement def R85 { doc /* This baseline shall include the Identity Access Service, Time Synchronization Service, Audit Event Ledger, Performance Analytics Warehouse, and Business Rules Registry before any airport is permitted to exchange operational data. @S890 */ subject s : RegionalFlowPlatform; }
    requirement def R86 { doc /* Readiness Gate 2 shall confirm that the Flight Data Exchange, Airline Interface Adapter, Surface Surveillance Adapter, and Weather Ingest Gateway can be connected without disrupting existing airport operations. @S895 */ subject s : ReadinessGate2; }
    requirement def R87 { doc /* The Demand Prediction Service, Capacity Assessment Module, Slot Allocation Engine, Gate Conflict Detector, Sector Load Monitor, North Runway Meter, and South Runway Meter shall be certified against agreed reference scenarios before they are used for operational recommendations. @S900 */ subject s : DemandPredictionService; }
    requirement def R88 { doc /* The Contingency Operations Console shall be available at each onboarded airport before reliance on the Regional Flow Platform is declared. @S908 */ subject s : ContingencyOperationsConsole; }
    requirement def R89 { doc /* The System Support Engineer shall provide round the clock on call coverage for production incidents affecting the Regional Flow Platform, Airport CDM Portal, Slot Allocation Engine, Departure Metering Service, Arrival Regulation Console, and Alert Distribution Hub. @S914 */ subject s : SystemSupportEngineer; }
    requirement def R90 { doc /* The System Support Engineer shall advise operational supervisors on technical status, known workarounds, data integrity concerns, and recovery options, but shall not issue traffic management instructions. @S918 */ subject s : SystemSupportEngineer; }
    requirement def R91 { doc /* A critical incident shall be acknowledged within fifteen minutes and shall have continuous technical ownership until service is restored or an agreed operational workaround is in place. @S920 */ subject s : CriticalIncident; }
    requirement def R92 { doc /* A high priority incident that degrades a major function without stopping tactical coordination shall be acknowledged within thirty minutes and shall be reviewed with the affected operational supervisor at least hourly. @S921 */ subject s : HighPriorityIncident; }
    requirement def R93 { doc /* The system should not automatically impose a Ground Delay Program, change an Airport Acceptance Rate, or alter a tactical measure without authorized human confirmation. @S953 */ subject s : System; }
    requirement def R94 { doc /* The Flight Data Exchange, Airline Interface Adapter, Surface Surveillance Adapter, and Weather Ingest Gateway must be operated with monitored data quality thresholds and clear fallback procedures. @S979 */ subject s : FlightDataExchange; }
    requirement def R95 { doc /* The Slot Allocation Engine, Departure Metering Service, Arrival Regulation Console, Tower Sequence Manager, and Ramp Movement Board must use the approved rules recorded in the Business Rules Registry. @S980 */ subject s : SlotAllocationEngine; }
    requirement def R96 { doc /* The Identity Access Service and Audit Event Ledger must support traceability, least-privilege access, and after-action accountability for all operationally significant changes. @S981 */ subject s : IdentityAccessService; }
}
