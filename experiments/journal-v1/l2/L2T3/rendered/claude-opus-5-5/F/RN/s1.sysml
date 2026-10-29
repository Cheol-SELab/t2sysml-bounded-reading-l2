package L2Model {
    item def AircraftCoordinationDataLoadingStatusAndMissionNotesItem { doc /* @S047 */ }
    item def AssignedIncidentContextMapReferencesAndUpdatesItem { doc /* @S049 */ }
    item def AviationStatusViewItem { doc /* @S081 */ }
    item def BatterySwapTicketItem { doc /* @S109 */ }
    item def CameraCleaningLogItem { doc /* @S163 */ }
    item def CrewAcknowledgementsItem { doc /* @S098 */ }
    item def CrewStagingPinItem { doc /* @S209 */ }
    item def DroneCorridorPermitItem { doc /* @S192 */ }
    item def FirePerimeterIntelligenceItem { doc /* @S092 */ }
    item def ObservationContextItem { doc /* @S053,S094 */ }
    item def RestrictionBasisItem { doc /* @S078 */ }
    item def RetardantBatchSlipItem { doc /* @S141 */ }
    item def RidgeShadowMaskItem { doc /* @S162 */ }
    item def RunwayReleaseNoteItem { doc /* @S233 */ }
    item def SuppressionDropReceiptItem { doc /* @S234 */ }
    item def ThermalSpotSnippetItem { doc /* @S106 */ }
    item def VerificationTaskItem { doc /* @S062 */ }
    item def WindShiftBulletinItem { doc /* @S136 */ }
    part def AirAttackSupervisor { doc /* @S013,S047,S077,S079,S092,S094,S098,S123,S128,S136,S153,S206,S232 */ }
    part def CalderaIncidentCommandPortal { doc /* @S003,S046,S059,S069,S074,S078,S086,S098,S119,S120,S127,S149,S154,S160,S177,S178,S185,S209 */ }
    part def CalderaWildfireDetectionAndSuppressionSupportSystem { doc /* @S012,S019,S099,S151,S176,S198,S200,S224 */ }
    part def ChargingInterfaces { doc /* @S033 */ }
    part def CountyEmergencyLiaison { doc /* @S089,S124,S192,S210,S234 */ }
    part def CrewlineMobileTablet { doc /* @S016,S049,S072,S146,S155,S159,S172,S184,S231 */ }
    part def DronePilotOperator { doc /* @S015,S036,S063,S079,S109,S132,S170,S205 */ }
    part def DroneTaskingService { doc /* @S005,S035,S062,S080,S108,S129,S168,S192,S229 */ }
    part def DutyDetectionOfficer { doc /* @S011,S012,S060,S061,S078,S086,S087,S106,S179,S202,S204 */ }
    part def EastRetardantLoadingPump { doc /* @S073,S141,S142,S194,S230 */ }
    part def HelitackCrewLeader { doc /* @S015,S049,S097,S147,S156,S173,S208,S209 */ }
    part def HorizonRidgeDroneDock { doc /* @S005,S033,S034,S051,S053,S062,S109,S130,S131,S229 */ }
    part def LocalHealthMonitoring { doc /* @S033 */ }
    part def MesoWestWeatherFusionNode { doc /* @S007,S042,S043,S058,S093,S113,S114,S136,S166,S183 */ }
    part def NorthLookoutCameraMast { doc /* @S004,S026,S030,S051,S053,S094,S103,S106,S182 */ }
    part def SecureNetworkTermination { doc /* @S033 */ }
    part def SentinelFirelineAnalyticsEngine { doc /* @S006,S038,S053,S092,S096,S111,S134,S161,S162,S164,S180 */ }
    part def SmokeClassifierModule { doc /* @S006,S039,S056,S105,S162,S163,S181 */ }
    part def SouthLookoutCameraMast { doc /* @S004,S027,S051,S053,S094,S095,S104,S163,S182 */ }
    part def TalonAirTankerDispatchConsole { doc /* @S047,S081,S137,S138,S140,S148,S230,S233,S234 */ }
    part def TankerBaseManager { doc /* @S014,S047,S081,S082,S141,S144,S207,S233 */ }
    part def VHFRadioGatewayRepeater { doc /* @S008,S044,S064,S084,S085,S145,S171,S193,S231 */ }
    part def WeatherRatedEnclosures { doc /* @S033 */ }
    part def WestRetardantLoadingPump { doc /* @S142,S195,S230 */ }
    part system {
        part airAttackSupervisor : AirAttackSupervisor {
            perform action a0 { doc /* uses the system to understand fire location, smoke behavior, aircraft constraints, and resource priorities @S013 */ }
            perform action a1 { doc /* advising on aerial tactics @S013 */ }
            perform action a2 { doc /* confirms the active operating window @S077 */ }
            perform action a3 { doc /* deconflicting fixed-wing, rotary-wing, and uncrewed routes @S079 */ }
            perform action a4 { doc /* reviews each temporary restriction against current fire perimeter intelligence @S092 */ }
            perform action a5 { doc /* approving a release of air assets @S092 */ }
            perform action a6 { doc /* reviews the promoted location, the confidence history, and the current airspace status @S128 */ }
            perform action a7 { doc /* authorizing reconnaissance or retardant planning @S128 */ }
            perform action a8 { doc /* uses the Wind Shift Bulletin to reassess aircraft sequencing, holding areas, and drop approach direction @S136 */ }
            perform action a9 { doc /* selects the operational intent in the Caldera Incident Command Portal @S153 */ }
        }
        part calderaIncidentCommandPortal : CalderaIncidentCommandPortal {
            perform action a0 { doc /* presenting incident information, recommended actions, and operational status to authorized wildfire personnel @S003 */ }
            perform action a1 { doc /* displays camera views, detection history, weather context, map layers, and status transitions @S046 */ }
            perform action a2 { doc /* opens a triage case for human review @S059 */ }
            perform action a3 { doc /* records the reason for each triage decision @S069 */ }
            perform action a4 { doc /* associate the incident with the Airspace Restricted State @S074 */ }
            perform action a5 { doc /* marks the affected radio route as impaired @S086 */ }
            perform action a6 { doc /* displays crew acknowledgements beside aviation tasks @S098 */ }
            perform action a7 { doc /* renders the current perimeter, projected spread, resource positions, and decision annotations into a common operating picture @S119 */ }
            perform action a8 { doc /* produces the Crew Staging Pin @S120 */ }
            perform action a9 { doc /* promotes an accepted fire location into the operational map @S127 */ }
            perform action a10 { doc /* preserves each aviation decision @S149 */ }
            perform action a11 { doc /* records each assignment package @S154 */ }
            perform action a12 { doc /* marks affected crew assignments for review @S160 */ }
            perform action a13 { doc /* marks all displayed information with the last synchronization time @S177 */ }
            perform action a14 { doc /* allows authorized users to review cached incident data and create queued updates @S178 */ }
            perform action a15 { doc /* prevents irreversible releases @S178 */ }
            exhibit state modes {
                state s0 { doc /* disconnected operating mode @S177 */ }
            }
        }
        part calderaWildfireDetectionAndSuppressionSupportSystem : CalderaWildfireDetectionAndSuppressionSupportSystem {
            perform action a0 { doc /* supports recognition of an Airspace Restricted State @S019 */ }
            perform action a1 { doc /* keeps suppression planning visible while preventing premature aircraft dispatch @S099 */ }
            perform action a2 { doc /* holds the affected recommendation for Air Attack Supervisor review @S151 */ }
            exhibit state modes {
                state s0 { doc /* Airspace Restricted State @S019 */ }
                state s1 { doc /* Confirmed Ignition State @S012 */ }
            }
        }
        part chargingInterfaces : ChargingInterfaces;
        part countyEmergencyLiaison : CountyEmergencyLiaison {
            perform action a0 { doc /* sends the Drone Corridor Permit @S089 */ }
        }
        part crewlineMobileTablet : CrewlineMobileTablet {
            perform action a0 { doc /* provides mobile access to approved operational information @S016 */ }
            perform action a1 { doc /* provides the Helitack Crew Leader with field access to assigned incident context, map references, and updates @S049 */ }
            perform action a2 { doc /* shows approved suppression objectives, aircraft caution areas, and current assignment notes @S146 */ }
            perform action a3 { doc /* displays the current division assignment, route guidance, rally location, and assigned communications channel @S155 */ }
            perform action a4 { doc /* caches the latest accepted staging information @S159 */ }
            perform action a5 { doc /* marks any expired package as unavailable for execution @S159 */ }
            perform action a6 { doc /* presents the last verified assignment package @S172 */ }
        }
        part dronePilotOperator : DronePilotOperator {
            perform action a0 { doc /* use the system to maintain shared awareness of field conditions, mission timing, and hazards @S015 */ }
            perform action a1 { doc /* review proposed routes, current dock status, and operational constraints @S036 */ }
            perform action a2 { doc /* coordinating any field action through established procedures @S036 */ }
            perform action a3 { doc /* confirms that the proposed verification task is safe for launch conditions @S063 */ }
            perform action a4 { doc /* launches from the Horizon Ridge Drone Dock @S079 */ }
            perform action a5 { doc /* uses the swap ticket to keep imaging sorties aligned with available aircraft endurance @S109 */ }
            perform action a6 { doc /* confirms that the proposed route is consistent with field conditions @S132 */ }
            perform action a7 { doc /* confirms launch readiness @S170 */ }
        }
        part droneTaskingService : DroneTaskingService {
            perform action a0 { doc /* support directed aerial observation @S005 */ }
            perform action a1 { doc /* manages approved unmanned flight requests @S035 */ }
            perform action a2 { doc /* records mission constraints @S035 */ }
            perform action a3 { doc /* presents task status @S035 */ }
            perform action a4 { doc /* prepare a verification task for the Horizon Ridge Drone Dock @S062 */ }
            perform action a5 { doc /* packages approved imaging objectives as map footprints, altitude bands, and revisit intervals @S108 */ }
            perform action a6 { doc /* converts reconnaissance objectives into trackable missions @S129 */ }
            perform action a7 { doc /* maintains reconnaissance task status @S168 */ }
            perform action a8 { doc /* validates the corridor permit @S192 */ }
            perform action a9 { doc /* releasing an automated flight task @S192 */ }
        }
        part dutyDetectionOfficer : DutyDetectionOfficer {
            perform action a0 { doc /* monitoring detection cues @S011 */ }
            perform action a1 { doc /* requesting verification @S011 */ }
            perform action a2 { doc /* recommending whether a suspected ignition should be escalated @S011 */ }
            perform action a3 { doc /* recommend a Confirmed Ignition State @S012 */ }
            perform action a4 { doc /* reviews the triage case @S060 */ }
            perform action a5 { doc /* compares current imagery with recent frames @S060 */ }
            perform action a6 { doc /* checks whether the indication is growing, drifting, or disappearing @S060 */ }
            perform action a7 { doc /* request a fresh pan, tilt, or zoom view from the nearest fixed camera @S061 */ }
            perform action a8 { doc /* records the restriction basis in the Caldera Incident Command Portal @S078 */ }
            perform action a9 { doc /* manual acknowledgement @S086 */ }
            perform action a10 { doc /* verify that the impaired route has an alternate contact method @S087 */ }
            perform action a11 { doc /* uses the spot snippet to compare the automated classification with visible flame, smoke color, and terrain context @S106 */ }
            perform action a12 { doc /* accepting the observation into the assessment queue @S106 */ }
            perform action a13 { doc /* receives a visible warning @S179 */ }
        }
        part eastRetardantLoadingPump : EastRetardantLoadingPump {
            perform action a0 { doc /* sends the Retardant Batch Slip @S073 */ }
            exhibit state modes {
                state s0 { doc /* metered recirculation mode @S194 */ }
            }
        }
        part helitackCrewLeader : HelitackCrewLeader {
            perform action a0 { doc /* use the system to maintain shared awareness of field conditions, mission timing, and hazards @S015 */ }
            perform action a1 { doc /* acknowledge air-to-ground instructions @S097 */ }
            perform action a2 { doc /* report whether crews are inside any planned drop or reconnaissance area @S097 */ }
            perform action a3 { doc /* acknowledges nearby aircraft activity @S147 */ }
            perform action a4 { doc /* acknowledges assignment receipt @S173 */ }
            perform action a5 { doc /* reports readiness @S173 */ }
            perform action a6 { doc /* records any exception that prevents safe execution @S173 */ }
        }
        part horizonRidgeDroneDock : HorizonRidgeDroneDock {
            perform action a0 { doc /* support directed aerial observation @S005 */ }
            perform action a1 { doc /* produces the Battery Swap Ticket @S034 */ }
            perform action a2 { doc /* provides an observation @S051 */ }
            perform action a3 { doc /* keeping assigned aircraft charged, positioned, and ready for rapid launch @S130 */ }
        }
        part localHealthMonitoring : LocalHealthMonitoring;
        part mesoWestWeatherFusionNode : MesoWestWeatherFusionNode {
            perform action a0 { doc /* contributes localized weather context @S007 */ }
            perform action a1 { doc /* ingests station observations, forecast grids, and configured quality checks @S042 */ }
            perform action a2 { doc /* sends the Wind Shift Bulletin @S043 */ }
            perform action a3 { doc /* provides local wind, humidity, temperature, and stability context @S058 */ }
            perform action a4 { doc /* supplies wind and visibility context @S093 */ }
            perform action a5 { doc /* ingests station observations, forecast grids, and local quality checks @S113 */ }
            perform action a6 { doc /* publishes a time-indexed weather update @S114 */ }
            perform action a7 { doc /* provides weather-derived exposure flags @S166 */ }
        }
        part northLookoutCameraMast : NorthLookoutCameraMast {
            perform action a0 { doc /* provide fixed observation coverage over high-risk sectors @S004 */ }
            perform action a1 { doc /* provide long-range visual coverage of drainages, access roads, and known ignition corridors @S026 */ }
            perform action a2 { doc /* sends the Thermal Spot Snippet @S030 */ }
            perform action a3 { doc /* local sensor processing identifies a candidate heat signature @S030 */ }
            perform action a4 { doc /* provides an observation @S051 */ }
            perform action a5 { doc /* captures a time-stamped smoke column bearing @S103 */ }
            perform action a6 { doc /* reports the pan, tilt, zoom, and confidence values @S103 */ }
        }
        part secureNetworkTermination : SecureNetworkTermination;
        part sentinelFirelineAnalyticsEngine : SentinelFirelineAnalyticsEngine {
            perform action a0 { doc /* assist in screening imagery and other observations for potential fire activity @S006 */ }
            perform action a1 { doc /* aggregates camera detections, weather inputs, geospatial context, and operator feedback into traceable recommendations @S038 */ }
            perform action a2 { doc /* receives the observation context @S053 */ }
            perform action a3 { doc /* normalizes image, thermal, and weather attributes into a common event record @S053 */ }
            perform action a4 { doc /* temporarily down-weighted the Smoke Classifier Module @S096 */ }
            perform action a5 { doc /* identifies heat signatures, smoke edges, flame fronts, and potential spot fire indicators @S111 */ }
            perform action a6 { doc /* compares recent reconnaissance observations with camera detections and weather-driven projections @S134 */ }
            perform action a7 { doc /* updates hazard summaries @S161 */ }
            perform action a8 { doc /* applies the Ridge Shadow Mask @S162 */ }
            perform action a9 { doc /* issues a crew exposure refresh @S164 */ }
        }
        part smokeClassifierModule : SmokeClassifierModule {
            perform action a0 { doc /* assist in screening imagery and other observations for potential fire activity @S006 */ }
            perform action a1 { doc /* scores visual observations for plume likelihood @S039 */ }
            perform action a2 { doc /* passes confidence values to the broader analytics workflow @S039 */ }
            perform action a3 { doc /* produces the Ridge Shadow Mask @S056 */ }
            perform action a4 { doc /* assigns each observation a smoke likelihood, growth trend, and obscuration flag @S105 */ }
            perform action a5 { doc /* uses the Camera Cleaning Log to suppress confidence changes @S163 */ }
        }
        part southLookoutCameraMast : SouthLookoutCameraMast {
            perform action a0 { doc /* provide fixed observation coverage over high-risk sectors @S004 */ }
            perform action a1 { doc /* covers the opposing viewshed and provides overlapping observation @S027 */ }
            perform action a2 { doc /* provides an observation @S051 */ }
            perform action a3 { doc /* produces the Camera Cleaning Log @S095 */ }
            perform action a4 { doc /* supplies a separate bearing track @S104 */ }
        }
        part talonAirTankerDispatchConsole : TalonAirTankerDispatchConsole {
            perform action a0 { doc /* presenting aircraft coordination data, loading status, and mission notes @S047 */ }
            perform action a1 { doc /* provides the aviation status view @S081 */ }
            perform action a2 { doc /* maintains a planning view of tanker availability @S137 */ }
            perform action a3 { doc /* produces the Runway Release Note @S140 */ }
            perform action a4 { doc /* sends the Suppression Drop Receipt @S148 */ }
        }
        part tankerBaseManager : TankerBaseManager {
            perform action a0 { doc /* uses the system to understand mission demand, loading status, and operational tempo @S014 */ }
            perform action a1 { doc /* coordinates pump readiness for the East Retardant Loading Pump and the West Retardant Loading Pump @S082 */ }
            perform action a2 { doc /* confirming that a tanker can accept an assignment @S082 */ }
            perform action a3 { doc /* uses the batch slip to confirm that the loading record matches the aircraft assignment @S141 */ }
            perform action a4 { doc /* resolves discrepancies in loading status @S144 */ }
        }
        part vHFRadioGatewayRepeater : VHFRadioGatewayRepeater {
            perform action a0 { doc /* supports continuity between digital coordination and field radio practices @S008 */ }
            perform action a1 { doc /* provides a monitored bridge between selected radio traffic and operator workstations @S044 */ }
            perform action a2 { doc /* supports voice coordination @S064 */ }
            perform action a3 { doc /* bridges command, air-to-ground, and county liaison talk paths @S084 */ }
            perform action a4 { doc /* relaying approved aviation instructions @S145 */ }
            perform action a5 { doc /* mirrors priority assignment summaries @S171 */ }
        }
        part weatherRatedEnclosures : WeatherRatedEnclosures;
        part westRetardantLoadingPump : WestRetardantLoadingPump;
        flow f0 of AircraftCoordinationDataLoadingStatusAndMissionNotesItem from talonAirTankerDispatchConsole to airAttackSupervisor { doc /* @S047 */ }
        flow f1 of AircraftCoordinationDataLoadingStatusAndMissionNotesItem from talonAirTankerDispatchConsole to tankerBaseManager { doc /* @S047 */ }
        flow f2 of AssignedIncidentContextMapReferencesAndUpdatesItem from crewlineMobileTablet to helitackCrewLeader { doc /* @S049 */ }
        flow f3 of ObservationContextItem from northLookoutCameraMast to sentinelFirelineAnalyticsEngine { doc /* @S053 */ }
        flow f4 of ObservationContextItem from southLookoutCameraMast to sentinelFirelineAnalyticsEngine { doc /* @S053 */ }
        flow f5 of ObservationContextItem from horizonRidgeDroneDock to sentinelFirelineAnalyticsEngine { doc /* @S053 */ }
        flow f6 of VerificationTaskItem from droneTaskingService to horizonRidgeDroneDock { doc /* @S062 */ }
        flow f7 of RestrictionBasisItem from dutyDetectionOfficer to calderaIncidentCommandPortal { doc /* @S078 */ }
        flow f8 of AviationStatusViewItem from talonAirTankerDispatchConsole to tankerBaseManager { doc /* @S081 */ }
        flow f9 of FirePerimeterIntelligenceItem from sentinelFirelineAnalyticsEngine to airAttackSupervisor { doc /* @S092 */ }
        flow f10 of ObservationContextItem from northLookoutCameraMast to airAttackSupervisor { doc /* @S094 */ }
        flow f11 of ObservationContextItem from southLookoutCameraMast to airAttackSupervisor { doc /* @S094 */ }
        flow f12 of CrewAcknowledgementsItem from calderaIncidentCommandPortal to airAttackSupervisor { doc /* @S098 */ }
        flow f13 of ThermalSpotSnippetItem from northLookoutCameraMast to dutyDetectionOfficer { doc /* @S106 */ }
        flow f14 of BatterySwapTicketItem from horizonRidgeDroneDock to dronePilotOperator { doc /* @S109 */ }
        flow f15 of WindShiftBulletinItem from mesoWestWeatherFusionNode to airAttackSupervisor { doc /* @S136 */ }
        flow f16 of RetardantBatchSlipItem from eastRetardantLoadingPump to tankerBaseManager { doc /* @S141 */ }
        flow f17 of RidgeShadowMaskItem from smokeClassifierModule to sentinelFirelineAnalyticsEngine { doc /* @S162 */ }
        flow f18 of CameraCleaningLogItem from southLookoutCameraMast to smokeClassifierModule { doc /* @S163 */ }
        flow f19 of DroneCorridorPermitItem from countyEmergencyLiaison to droneTaskingService { doc /* @S192 */ }
        flow f20 of CrewStagingPinItem from calderaIncidentCommandPortal to helitackCrewLeader { doc /* @S209 */ }
        flow f21 of RunwayReleaseNoteItem from talonAirTankerDispatchConsole to tankerBaseManager { doc /* @S233 */ }
        flow f22 of SuppressionDropReceiptItem from talonAirTankerDispatchConsole to countyEmergencyLiaison { doc /* @S234 */ }
    }
    requirement def R0 { doc /* shall not issue a launch task that conflicts with an active aviation lane maintained by the Talon Air Tanker Dispatch Console @S080 */ subject s : DroneTaskingService; }
    requirement def R1 { doc /* Radio bridging shall preserve the original speaker identity when the source channel provides it @S085 */ subject s : VHFRadioGatewayRepeater; }
    requirement def R2 { doc /* must verify that the impaired route has an alternate contact method before any new aviation coordination message is accepted @S087 */ subject s : DutyDetectionOfficer; }
    requirement def R3 { doc /* is required to report launch readiness, aircraft health, and recovery availability before a reconnaissance task can be released @S131 */ subject s : HorizonRidgeDroneDock; }
    requirement def R4 { doc /* must prevent a dispatch plan from being released when required aviation approvals, airspace status, or tanker readiness fields are incomplete @S138 */ subject s : TalonAirTankerDispatchConsole; }
    requirement def R5 { doc /* shall favor continuity of command decisions over full automation when communications, power, or sensor coverage is impaired @S176 */ subject s : CalderaWildfireDetectionAndSuppressionSupportSystem; }
    requirement def R6 { doc /* shall continue using the last approved model configuration after a repository outage and shall reject unversioned rules or unsigned analytic packages @S180 */ subject s : SentinelFirelineAnalyticsEngine; }
    requirement def R7 { doc /* shall label detections as advisory when either camera mast is unavailable or when image quality falls below the validated threshold @S181 */ subject s : SmokeClassifierModule; }
    requirement def R8 { doc /* shall report heartbeat, temperature, storage, and pointing-status telemetry @S182 */ subject s : NorthLookoutCameraMast; }
    requirement def R9 { doc /* shall report heartbeat, temperature, storage, and pointing-status telemetry @S182 */ subject s : SouthLookoutCameraMast; }
    requirement def R10 { doc /* shall retain a local weather cache sufficient to support near-term fire behavior review when upstream feeds are intermittent @S183 */ subject s : MesoWestWeatherFusionNode; }
    requirement def R11 { doc /* shall queue field updates locally, encrypt the queue at rest, and reconcile conflicts by preserving the original author, device time, and server acceptance time @S184 */ subject s : CrewlineMobileTablet; }
    requirement def R12 { doc /* All interactive access requires named accounts, role-based authorization, and multifactor authentication when the authentication service is reachable @S185 */ subject s : CalderaIncidentCommandPortal; }
    requirement def R13 { doc /* shall queue outbound voice-to-data acknowledgments for at least fifteen minutes during backhaul loss and forward them when the link is restored @S193 */ subject s : VHFRadioGatewayRepeater; }
    requirement def R14 { doc /* shall enter a metered recirculation mode when pressure variance exceeds the calibrated maintenance limit @S194 */ subject s : EastRetardantLoadingPump; }
    requirement def R15 { doc /* shall be inspected at shift change for hose wear, valve position, controller alarms, and leakage before it is returned to operational availability @S195 */ subject s : WestRetardantLoadingPump; }
    requirement def R16 { doc /* shall protect retained data with encryption at rest, controlled export procedures, and deletion workflows that require documented authorization @S198 */ subject s : CalderaWildfireDetectionAndSuppressionSupportSystem; }
    requirement def R17 { doc /* Training shall be completed before each fire season and refreshed whenever operating procedures or field configurations change @S200 */ subject s : CalderaWildfireDetectionAndSuppressionSupportSystem; }
    requirement def R18 { doc /* shall be trained to operate the Caldera Incident Command Portal, review detections, validate confidence indicators, and escalate suspected ignitions @S202 */ subject s : DutyDetectionOfficer; }
    requirement def R19 { doc /* shall also learn how the Sentinel Fireline Analytics Engine and the Smoke Classifier Module present uncertainty @S204 */ subject s : DutyDetectionOfficer; }
    requirement def R20 { doc /* shall be trained on Horizon Ridge Drone Dock procedures, Drone Tasking Service mission controls, safe launch checks, recovery actions, and loss-of-link coordination @S205 */ subject s : DronePilotOperator; }
    requirement def R21 { doc /* shall be trained to interpret system status during aerial operations and to coordinate with the Talon Air Tanker Dispatch Console without bypassing airspace safety requirements @S206 */ subject s : AirAttackSupervisor; }
    requirement def R22 { doc /* shall receive practical instruction on status entry, loading coordination, and abnormal-condition reporting for the East Retardant Loading Pump and the West Retardant Loading Pump @S207 */ subject s : TankerBaseManager; }
    requirement def R23 { doc /* shall be trained on use of the Crewline Mobile Tablet, field acknowledgments, location updates, and communication discipline @S208 */ subject s : HelitackCrewLeader; }
    requirement def R24 { doc /* shall use the staging pin to confirm that the assigned crew is positioned at the exercise location @S209 */ subject s : HelitackCrewLeader; }
    requirement def R25 { doc /* shall be trained to interpret public-safety information from the Caldera Incident Command Portal and to coordinate notifications with county procedures @S210 */ subject s : CountyEmergencyLiaison; }
    requirement def R26 { doc /* Deployment governance shall be managed as a staged release process @S224 */ subject s : CalderaWildfireDetectionAndSuppressionSupportSystem; }
    requirement def R27 { doc /* shall be accepted only after controlled field validation shows that task execution, abort behavior, and status reporting remain stable @S229 */ subject s : DroneTaskingService; }
    requirement def R28 { doc /* shall be accepted only after controlled field validation shows that task execution, abort behavior, and status reporting remain stable @S229 */ subject s : HorizonRidgeDroneDock; }
    requirement def R29 { doc /* shall pass integration checks that verify operator controls, fault handling, and audit capture before activation @S230 */ subject s : TalonAirTankerDispatchConsole; }
    requirement def R30 { doc /* shall pass integration checks that verify operator controls, fault handling, and audit capture before activation @S230 */ subject s : EastRetardantLoadingPump; }
    requirement def R31 { doc /* shall pass integration checks that verify operator controls, fault handling, and audit capture before activation @S230 */ subject s : WestRetardantLoadingPump; }
    requirement def R32 { doc /* shall be validated for coverage, message persistence, authentication behavior, and degraded-network operation before release approval @S231 */ subject s : VHFRadioGatewayRepeater; }
    requirement def R33 { doc /* shall be validated for coverage, message persistence, authentication behavior, and degraded-network operation before release approval @S231 */ subject s : CrewlineMobileTablet; }
    requirement def R34 { doc /* shall confirm that deployment readiness evidence is sufficient before air operations functionality is enabled for the season @S232 */ subject s : AirAttackSupervisor; }
    requirement def R35 { doc /* shall use the Runway Release Note during acceptance review to verify that tanker-base operating constraints are documented before seasonal activation @S233 */ subject s : TankerBaseManager; }
    requirement def R36 { doc /* shall use the Suppression Drop Receipt during post-incident reconciliation to verify that reported suppression activity can be traced to county situation reporting @S234 */ subject s : CountyEmergencyLiaison; }
}
