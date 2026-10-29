package L2Model {
    item def BagImageAndExceptionDetailsItem { doc /* @S156 */ }
    item def BagMatchQueryItem { doc /* @S219 */ }
    item def BagsItem { doc /* @S049,S054 */ }
    item def CarouselReleaseSlipItem { doc /* @S148 */ }
    item def DispositionItem { doc /* @S056 */ }
    item def EquipmentStateChangesAndAlarmConditionsItem { doc /* @S229 */ }
    item def ExceptionStatusBagsItem { doc /* @S064 */ }
    item def LateTransferBagCardItem { doc /* @S143 */ }
    item def NotificationItem { doc /* @S071 */ }
    item def ScheduleDataItem { doc /* @S107 */ }
    item def ScopeItem { doc /* @S198 */ }
    part def AffectedFeed { doc /* @S188 */ }
    part def AirlineRampCoordinator { doc /* @S023,S052,S128,S148,S149,S174,S219,S224 */ }
    part def Bag { doc /* @S060,S063,S071,S078,S094,S096,S110,S115,S165,S203,S210,S225,S226 */ }
    part def BagReconciliationStation { doc /* @S019,S070,S100,S101,S143,S164,S194,S218,S219,S235 */ }
    part def BagTagPrinter { doc /* @S030,S074,S151 */ }
    part def BaggageControlSystem { doc /* @S007,S012,S032,S040,S053,S064,S079,S081,S092,S107,S109,S113,S114,S121,S135,S162,S172,S191,S204,S228 */ }
    part def BaggageOperationsSupervisor { doc /* @S024,S071,S072,S090,S104,S111,S129,S132,S154,S171,S180,S184,S198,S215,S241,S249 */ }
    part def Carousel7MakeUpUnit { doc /* @S021,S076,S098,S126,S147,S148,S196,S216 */ }
    part def ConcourseZoneController { doc /* @S009,S013,S043,S082,S123,S134,S175,S229 */ }
    part def EastMakeUpConveyor { doc /* @S020,S125,S145,S195,S220 */ }
    part def ExplosivesResponseTeam { doc /* @S018,S067,S095,S120,S170,S186,S211,S244 */ }
    part def FlightDataGateway { doc /* @S011,S041,S105,S107,S133,S163,S190,S217 */ }
    part def ImageResolutionDesk { doc /* @S016,S094,S118,S141,S156,S159,S209,S234 */ }
    part def InductionTrayConveyor { doc /* @S006,S044,S049,S054,S083,S124,S137,S206 */ }
    part def Interlocks { doc /* @S045 */ }
    part def MaintenanceTechnician { doc /* @S103,S153,S176,S182,S185,S189,S193,S197,S214,S242 */ }
    part def NorthGateScanner { doc /* @S015,S046,S056,S087,S117,S139,S167,S168,S208 */ }
    part def Operations { doc /* @S248 */ }
    part def OperationsMonitoringFunction { doc /* @S227,S229 */ }
    part def Operator { doc /* @S156,S157,S158,S160,S165,S177,S200 */ }
    part def OutboundLoadControlDesk { doc /* @S022,S127,S150,S173,S223 */ }
    part def Pier4BagDropUnit { doc /* @S004,S029,S035,S136 */ }
    part def PrimaryCrossbeltSorter { doc /* @S014,S049,S055,S056,S084,S085,S122,S138,S166,S207 */ }
    part def ScreeningEquipment { doc /* @S054,S057 */ }
    part def SecondaryInspectionChute { doc /* @S017,S064,S093,S142,S169 */ }
    part def SecurityDutyManager { doc /* @S018,S073,S152,S187,S213,S243 */ }
    part def SouthGateScanner { doc /* @S015,S048,S056,S061,S087,S117,S140,S208 */ }
    part def Staff { doc /* @S026,S027,S028,S034,S036,S039,S051,S058,S059,S069,S071,S078,S192,S198,S205 */ }
    part def System { doc /* @S002,S060 */ }
    part def TransferBagFeeder { doc /* @S005,S037,S038,S077,S099,S143,S144,S222 */ }
    part def WestMakeUpConveyor { doc /* @S020,S125,S146 */ }
    part system {
        part affectedFeed : AffectedFeed;
        part airlineRampCoordinator : AirlineRampCoordinator {
            perform action a0 { doc /* coordinates acceptance of staged baggage for ramp operations @S023 */ }
            perform action a1 { doc /* sends a Carousel Release Slip @S052 */ }
            perform action a2 { doc /* reports changes to loading readiness @S128 */ }
            perform action a3 { doc /* confirms staffing, equipment availability, and the planned loading sequence @S149 */ }
            perform action a4 { doc /* accepting a build for loading @S149 */ }
            perform action a5 { doc /* confirms any flight-side constraint that could prevent the reconciled bag from being accepted @S174 */ }
            perform action a6 { doc /* uses the Bag Match Query to review unresolved bag-to-flight mismatches @S219 */ }
            perform action a7 { doc /* verifies that the bag identity is readable, the flight assignment is current, and the security disposition permits loading @S224 */ }
        }
        part bag : Bag {
            perform action a0 { doc /* retains its assigned flight @S110 */ }
            perform action a1 { doc /* proceed to flight-specific sort destinations @S115 */ }
            exhibit state modes {
                state s0 { doc /* controlled custody @S203 */ }
                state s1 { doc /* controlled hold @S210 */ }
                state s2 { doc /* controlled routing @S060 */ }
                state s3 { doc /* exception status @S063 */ }
                state s4 { doc /* hold @S165 */ }
                state s5 { doc /* isolated @S071 */ }
                state s6 { doc /* normal handling @S078,S096 */ }
                state s7 { doc /* normal sortation @S094 */ }
                state s8 { doc /* ready for departure @S226 */ }
            }
        }
        part bagReconciliationStation : BagReconciliationStation {
            perform action a0 { doc /* supports verification of bag identity and processing status @S019 */ }
            perform action a1 { doc /* verifies that the bag presented for examination matches the screening record @S070 */ }
            perform action a2 { doc /* compares bag identity with the active handling record @S100 */ }
            perform action a3 { doc /* flags unresolved discrepancies @S100 */ }
            perform action a4 { doc /* sends a Bag Match Query @S101 */ }
            perform action a5 { doc /* reconcile a transfer bag against its intended flight @S143 */ }
            perform action a6 { doc /* records whether the inspected bag matches the expected flight assignment @S164 */ }
            perform action a7 { doc /* supports verification @S194 */ }
            perform action a8 { doc /* compares scanned bag identities against the expected flight population @S218 */ }
            perform action a9 { doc /* flags missing or duplicate records for resolution @S218 */ }
            perform action a10 { doc /* reports unmatched records and count differences @S235 */ }
        }
        part bagTagPrinter : BagTagPrinter {
            perform action a0 { doc /* produces a durable tag with a unique identifier for each accepted bag @S030 */ }
            perform action a1 { doc /* produces a Calibration Witness Tag @S074 */ }
            perform action a2 { doc /* produces replacement identification @S151 */ }
        }
        part baggageControlSystem : BaggageControlSystem {
            perform action a0 { doc /* coordinates bag status, routing decisions, and operational visibility across connected equipment @S007 */ }
            perform action a1 { doc /* uses current flight and operating data to support routing decisions @S012 */ }
            perform action a2 { doc /* maintain alignment with scheduled departures @S012 */ }
            perform action a3 { doc /* checks that the flight is open for bag acceptance and that the bag record is complete @S032 */ }
            perform action a4 { doc /* compares transfer-bag data with the current routing information @S040 */ }
            perform action a5 { doc /* applies the approved screening profile to each bag @S053 */ }
            perform action a6 { doc /* routes exception-status bags to the Secondary Inspection Chute @S064 */ }
            perform action a7 { doc /* loads the approved sort plan @S079 */ }
            perform action a8 { doc /* applies its effective time window @S079 */ }
            perform action a9 { doc /* checks the plan against current flight and handling records @S081 */ }
            perform action a10 { doc /* assigning a route @S081 */ }
            perform action a11 { doc /* selects an approved alternate route @S092 */ }
            perform action a12 { doc /* evaluates flight assignments against current schedule data @S107 */ }
            perform action a13 { doc /* accepting bag routing instructions @S107 */ }
            perform action a14 { doc /* applies cutoff profiles configured for each carrier, flight, and operating condition @S109 */ }
            perform action a15 { doc /* receives the Flight Cutoff Advisory @S113 */ }
            perform action a16 { doc /* compares remaining processing time with route-specific handling estimates @S114 */ }
            perform action a17 { doc /* preserves a recoverable bag-to-flight association @S121 */ }
            perform action a18 { doc /* records each bag's screening disposition and release state @S135 */ }
            perform action a19 { doc /* checks the recorded bag identity against the current routing data @S162 */ }
            perform action a20 { doc /* authorizes the bag to rejoin its previously assigned screening and sort path @S172 */ }
            perform action a21 { doc /* records equipment alarms @S191 */ }
            perform action a22 { doc /* presents the affected route for review @S191 */ }
            perform action a23 { doc /* maintains the bag identity, assigned flight, screening disposition, and current handling status as the authoritative record @S204 */ }
            perform action a24 { doc /* records bag events @S228 */ }
            perform action a25 { doc /* reports missing, duplicate, or delayed event sequences for operational review @S228 */ }
        }
        part baggageOperationsSupervisor : BaggageOperationsSupervisor {
            perform action a0 { doc /* oversees routine flow @S024 */ }
            perform action a1 { doc /* responds to service interruptions @S024 */ }
            perform action a2 { doc /* coordinates operational recovery with the Security Duty Manager and Maintenance Technician @S024 */ }
            perform action a3 { doc /* coordinates decisions that affect flight readiness, staffing, or continued operation of a screening lane @S072 */ }
            perform action a4 { doc /* sets local congestion thresholds @S090 */ }
            perform action a5 { doc /* confirms the authorized response to sustained overload @S090 */ }
            perform action a6 { doc /* authorizes recovery to the approved sort plan @S104 */ }
            perform action a7 { doc /* reviews affected flights @S111 */ }
            perform action a8 { doc /* directs priority adjustments @S111 */ }
            perform action a9 { doc /* defer lower-priority bags @S129 */ }
            perform action a10 { doc /* authorizes release to a make-up position @S132 */ }
            perform action a11 { doc /* coordinates changes to build priority with airline ground operations @S154 */ }
            perform action a12 { doc /* communicates any resulting delivery constraints @S154 */ }
            perform action a13 { doc /* approves the operational disposition @S171 */ }
            perform action a14 { doc /* stop induction @S180 */ }
            perform action a15 { doc /* uses the occupancy note to confirm that a chute can safely accept bags @S184 */ }
            perform action a16 { doc /* controls the operational hold @S198 */ }
            perform action a17 { doc /* communicates its scope @S198 */ }
            perform action a18 { doc /* confirms that affected staff understand the restriction @S198 */ }
            perform action a19 { doc /* confirms that outstanding holds and route exceptions have an assigned owner @S215 */ }
            perform action a20 { doc /* authorizing continuation of processing @S215 */ }
            perform action a21 { doc /* reviews the operating dashboard @S241 */ }
            perform action a22 { doc /* confirms that material service degradation has been assigned an owner and response priority @S241 */ }
            perform action a23 { doc /* coordinates escalation to maintenance, security, and airline operations @S249 */ }
        }
        part carousel7MakeUpUnit : Carousel7MakeUpUnit {
            perform action a0 { doc /* supports staging of baggage for its assigned departure operation @S021 */ }
            perform action a1 { doc /* accepts only bags with a valid screening disposition and an authorized routing instruction @S076 */ }
            perform action a2 { doc /* operates within its assigned flight window @S098 */ }
            perform action a3 { doc /* reports when its usable capacity is constrained @S098 */ }
            perform action a4 { doc /* presents bags for outbound loading @S126 */ }
            perform action a5 { doc /* maintains bag order and position information @S147 */ }
            perform action a6 { doc /* receives the Carousel Release Slip @S148 */ }
            perform action a7 { doc /* is held from receiving bags @S196 */ }
            perform action a8 { doc /* release a bag to the next handling stage @S216 */ }
        }
        part concourseZoneController : ConcourseZoneController {
            perform action a0 { doc /* coordinates local equipment and conveyance within its assigned operating area @S009 */ }
            perform action a1 { doc /* produces the Recovery Route Card @S013 */ }
            perform action a2 { doc /* grants an induction permissive @S043 */ }
            perform action a3 { doc /* coordinates local conveyor availability with the active sort plan @S082 */ }
            perform action a4 { doc /* coordinates induction demand with available conveyor capacity @S123 */ }
            perform action a5 { doc /* assigns bags to active make-up lanes @S134 */ }
            perform action a6 { doc /* applies the authorized routing state without bypassing required screening controls @S175 */ }
            perform action a7 { doc /* reports equipment state changes and alarm conditions @S229 */ }
        }
        part eastMakeUpConveyor : EastMakeUpConveyor {
            perform action a0 { doc /* convey routed baggage toward the relevant loading areas @S020 */ }
            perform action a1 { doc /* receive flight groups @S125 */ }
            perform action a2 { doc /* delivers assigned bags to the designated make-up position @S145 */ }
            perform action a3 { doc /* runs @S195 */ }
            perform action a4 { doc /* moves reconciled bags toward the correct flight position @S220 */ }
        }
        part explosivesResponseTeam : ExplosivesResponseTeam {
            perform action a0 { doc /* coordinate security response and disposition for escalated screening events @S018 */ }
            perform action a1 { doc /* responds to escalated alarms @S067 */ }
            perform action a2 { doc /* coordinates any required safety controls with airport security personnel @S067 */ }
            perform action a3 { doc /* manages security holds under the applicable response procedures @S095 */ }
            perform action a4 { doc /* produces the Custody Seal Log @S120 */ }
            perform action a5 { doc /* conducts any security examination assigned under applicable procedures @S170 */ }
            perform action a6 { doc /* secures the response area @S186 */ }
            perform action a7 { doc /* directs handling of any bag referred for explosives assessment @S186 */ }
            perform action a8 { doc /* assesses security events referred for specialist action @S211 */ }
            perform action a9 { doc /* communicates the resulting disposition through approved operational channels @S211 */ }
        }
        part flightDataGateway : FlightDataGateway {
            perform action a0 { doc /* sends the Flight Cutoff Advisory @S011 */ }
            perform action a1 { doc /* supplies flight and routing records @S041 */ }
            perform action a2 { doc /* maintains scheduled flight identifiers, destinations, planned departure times, and revisions needed for baggage planning @S105 */ }
            perform action a3 { doc /* maintains the flight identity and departure timing @S133 */ }
            perform action a4 { doc /* provides the flight data used to validate the bag's assigned destination and service date @S163 */ }
            perform action a5 { doc /* supplies current flight data @S190 */ }
            perform action a6 { doc /* provides the flight and destination data @S217 */ }
        }
        part imageResolutionDesk : ImageResolutionDesk {
            perform action a0 { doc /* supports review of screening images @S016 */ }
            perform action a1 { doc /* resolves image-related holds @S094 */ }
            perform action a2 { doc /* reviews unresolved images @S118 */ }
            perform action a3 { doc /* confirm an authorized make-up position for an oversize bag @S141 */ }
            perform action a4 { doc /* presents the available bag image and exception details to the operator for review @S156 */ }
            perform action a5 { doc /* uses the rescan receipt to confirm that a second image was captured under the approved procedure @S159 */ }
            perform action a6 { doc /* reviews images that require operator assessment @S209 */ }
            perform action a7 { doc /* records a disposition @S209 */ }
            perform action a8 { doc /* reports unresolved images, review backlog, and processing time against the locally approved service target @S234 */ }
        }
        part inductionTrayConveyor : InductionTrayConveyor {
            perform action a0 { doc /* presents bags in a controlled manner to the screening and sorting equipment @S006 */ }
            perform action a1 { doc /* accepts bags through controlled feed points @S044 */ }
            perform action a2 { doc /* maintains separation between successive bags @S044 */ }
            perform action a3 { doc /* presents bags to the screening equipment @S054 */ }
            perform action a4 { doc /* presents bags at controlled spacing @S083 */ }
            perform action a5 { doc /* admits bags in priority order @S124 */ }
            perform action a6 { doc /* meters bags into the handling stream @S137 */ }
            perform action a7 { doc /* carries only bags with readable identity data and a valid route assignment into the screening process @S206 */ }
        }
        part interlocks : Interlocks {
            perform action a0 { doc /* stop feed movement @S045 */ }
        }
        part maintenanceTechnician : MaintenanceTechnician {
            perform action a0 { doc /* isolates a failed conveyor section @S103 */ }
            perform action a1 { doc /* confirms that the route is safe @S103 */ }
            perform action a2 { doc /* reports equipment restrictions @S153 */ }
            perform action a3 { doc /* uses the witness tag to verify that the applicable calibration status was witnessed @S176 */ }
            perform action a4 { doc /* isolates the relevant energy sources @S182 */ }
            perform action a5 { doc /* verifies that movement has stopped @S182 */ }
            perform action a6 { doc /* consults the Recovery Route Card @S185 */ }
            perform action a7 { doc /* checks for jammed bags, damaged belts, sensor obstruction, and signs of mechanical wear @S189 */ }
            perform action a8 { doc /* removes a jam @S193 */ }
            perform action a9 { doc /* performs corrective work @S197 */ }
            perform action a10 { doc /* reports any condition that prevents safe restart @S197 */ }
            perform action a11 { doc /* reports equipment faults @S214 */ }
            perform action a12 { doc /* investigates equipment faults that exceed the approved recovery interval @S242 */ }
            perform action a13 { doc /* records the corrective action taken @S242 */ }
        }
        part northGateScanner : NorthGateScanner {
            perform action a0 { doc /* provide screening interfaces for baggage moving through the system @S015 */ }
            perform action a1 { doc /* reads the bag identifier @S046 */ }
            perform action a2 { doc /* acquire screening images @S056 */ }
            perform action a3 { doc /* return a disposition for each bag @S056 */ }
            perform action a4 { doc /* verify bag identity at their respective route decision points @S087 */ }
            perform action a5 { doc /* record screening outcomes for inducted bags @S117 */ }
            perform action a6 { doc /* verifies readable bag identification @S139 */ }
            perform action a7 { doc /* captures a readable tag image @S167 */ }
            perform action a8 { doc /* records the tag read and image data needed to support an operator's identity check @S168 */ }
            perform action a9 { doc /* report healthy status @S208 */ }
        }
        part operations : Operations {
            perform action a0 { doc /* suspend the affected activity @S248 */ }
        }
        part operationsMonitoringFunction : OperationsMonitoringFunction {
            perform action a0 { doc /* provides a continuous view of baggage throughput, equipment availability, queue growth, screening status, and reconciliation exceptions @S227 */ }
        }
        part operator : Operator {
            perform action a0 { doc /* compares visible bag features with the recorded tag number and the handling data associated with the bag @S157 */ }
            perform action a1 { doc /* confirms that the image is legible enough to support a decision @S158 */ }
            perform action a2 { doc /* does not rely on an uncertain visual match @S158 */ }
            perform action a3 { doc /* requests a physical inspection through the established inspection process @S160 */ }
            perform action a4 { doc /* resolves the discrepancy @S165 */ }
            perform action a5 { doc /* escalates the discrepancy @S165 */ }
            perform action a6 { doc /* obtains approval @S177 */ }
            perform action a7 { doc /* obtains approval @S200 */ }
        }
        part outboundLoadControlDesk : OutboundLoadControlDesk {
            perform action a0 { doc /* provides the operational interface for confirming baggage readiness at the aircraft-loading handoff @S022 */ }
            perform action a1 { doc /* monitor whether assigned bags can be accepted @S127 */ }
            perform action a2 { doc /* reconciles the completed build against the permitted flight load @S150 */ }
            perform action a3 { doc /* confirms that the bag remains eligible for inclusion in the planned flight load @S173 */ }
            perform action a4 { doc /* confirms that the flight assignment, reconciled bag count, and operational status are consistent @S223 */ }
            perform action a5 { doc /* accepting the loading record @S223 */ }
        }
        part pier4BagDropUnit : Pier4BagDropUnit {
            perform action a0 { doc /* captures bag identification @S004 */ }
            perform action a1 { doc /* accepts baggage for processing @S004 */ }
            perform action a2 { doc /* records the accepted bag @S029 */ }
            perform action a3 { doc /* initiates its processing @S029 */ }
            perform action a4 { doc /* sends an Oversize Exception Ticket @S035 */ }
            perform action a5 { doc /* stages accepted bags for onward processing @S136 */ }
        }
        part primaryCrossbeltSorter : PrimaryCrossbeltSorter {
            perform action a0 { doc /* routes cleared bags toward the applicable make-up areas @S014 */ }
            perform action a1 { doc /* receives inducted bags @S049 */ }
            perform action a2 { doc /* directs them according to the active routing data @S049 */ }
            perform action a3 { doc /* maintains bag identity @S055 */ }
            perform action a4 { doc /* routes each bag according to the screening disposition @S055 */ }
            perform action a5 { doc /* applies the assigned destination and screening status to each identified bag @S084 */ }
            perform action a6 { doc /* sends a Chute Occupancy Note @S085 */ }
            perform action a7 { doc /* routes eligible bags according to flight assignment and current cutoff priority @S122 */ }
            perform action a8 { doc /* separates bags according to their authorized destination and current operating status @S138 */ }
            perform action a9 { doc /* holds the affected bag from automatic sorting @S166 */ }
            perform action a10 { doc /* directs cleared bags to their assigned make-up destination @S207 */ }
            perform action a11 { doc /* diverts unresolved items from normal handling @S207 */ }
        }
        part screeningEquipment : ScreeningEquipment {
            perform action a0 { doc /* records image quality and alarm status @S057 */ }
        }
        part secondaryInspectionChute : SecondaryInspectionChute {
            perform action a0 { doc /* provides a controlled path for bags selected for additional examination @S017 */ }
            perform action a1 { doc /* retains bags requiring further examination @S142 */ }
            perform action a2 { doc /* provides a controlled location for bags requiring physical examination @S169 */ }
        }
        part securityDutyManager : SecurityDutyManager {
            perform action a0 { doc /* coordinate security response and disposition for escalated screening events @S018 */ }
            perform action a1 { doc /* resolves release holds that require a security decision @S152 */ }
            perform action a2 { doc /* coordinates access control @S187 */ }
            perform action a3 { doc /* uses the seal log to verify that recorded custody seals remain accounted for @S213 */ }
            perform action a4 { doc /* assesses any condition that could compromise screening coverage, security controls, or custody continuity @S243 */ }
        }
        part southGateScanner : SouthGateScanner {
            perform action a0 { doc /* provide screening interfaces for baggage moving through the system @S015 */ }
            perform action a1 { doc /* provides an independent read point for bags routed through its assigned entry path @S048 */ }
            perform action a2 { doc /* acquire screening images @S056 */ }
            perform action a3 { doc /* return a disposition for each bag @S056 */ }
            perform action a4 { doc /* produces a Manual Rescan Receipt @S061 */ }
            perform action a5 { doc /* verify bag identity at their respective route decision points @S087 */ }
            perform action a6 { doc /* record screening outcomes for inducted bags @S117 */ }
            perform action a7 { doc /* provides the corresponding verification for bags @S140 */ }
            perform action a8 { doc /* report healthy status @S208 */ }
        }
        part staff : Staff {
            perform action a0 { doc /* resolving conditions that automated controls cannot clear @S026 */ }
            perform action a1 { doc /* confirm that the bag is eligible for carriage under the applicable airline rules @S027 */ }
            perform action a2 { doc /* verify the passenger and flight details @S028 */ }
            perform action a3 { doc /* accepting the bag into the checked-baggage process @S028 */ }
            perform action a4 { doc /* check bag dimensions and weight against the configured limits for standard conveyor handling @S034 */ }
            perform action a5 { doc /* confirm an approved handling route @S036 */ }
            perform action a6 { doc /* confirm that transfer-bag identifiers are legible and correspond to a valid onward flight record @S039 */ }
            perform action a7 { doc /* assess the available image @S051 */ }
            perform action a8 { doc /* record a disposition @S051 */ }
            perform action a9 { doc /* assess the available image @S058 */ }
            perform action a10 { doc /* record a disposition @S058 */ }
            perform action a11 { doc /* considers the full image, bag identification, and any system prompts @S059 */ }
            perform action a12 { doc /* assigning a disposition @S059 */ }
            perform action a13 { doc /* maintain physical control of an alarmed bag @S069 */ }
            perform action a14 { doc /* do not return it to the sorter @S069 */ }
            perform action a15 { doc /* secure the area @S071 */ }
            perform action a16 { doc /* notify the Baggage Operations Supervisor @S071 */ }
            perform action a17 { doc /* return a bag to normal handling @S078 */ }
            perform action a18 { doc /* prevent further bag entry @S192 */ }
            perform action a19 { doc /* keep the approach area clear @S192 */ }
            perform action a20 { doc /* keep bags in monitored areas @S205 */ }
            perform action a21 { doc /* prevent access by personnel who are not assigned to the active handling task @S205 */ }
        }
        part systemPart : System {
            perform action a0 { doc /* convey, screen, route, reconcile, and stage checked baggage @S002 */ }
            perform action a1 { doc /* prevents it from entering an outbound make-up path prematurely @S060 */ }
        }
        part transferBagFeeder : TransferBagFeeder {
            perform action a0 { doc /* provides a separate induction interface for eligible transfer baggage @S005 */ }
            perform action a1 { doc /* identifies each inbound transfer bag @S037 */ }
            perform action a2 { doc /* records its arrival into the local handling process @S037 */ }
            perform action a3 { doc /* sends a Late Transfer Bag Card @S038 */ }
            perform action a4 { doc /* holds transfer bags from release until their screening status and intended onward handling are confirmed @S077 */ }
            perform action a5 { doc /* continues to hold transfer bags until screening status and intended onward handling are confirmed @S099 */ }
            perform action a6 { doc /* meters accepted transfer bags into the active handling sequence @S144 */ }
            perform action a7 { doc /* accepts transfer bags @S222 */ }
        }
        part westMakeUpConveyor : WestMakeUpConveyor {
            perform action a0 { doc /* convey routed baggage toward the relevant loading areas @S020 */ }
            perform action a1 { doc /* receive flight groups @S125 */ }
            perform action a2 { doc /* provides the equivalent delivery function @S146 */ }
        }
        flow f0 of BagsItem from inductionTrayConveyor to primaryCrossbeltSorter { doc /* @S049 */ }
        flow f1 of BagsItem from inductionTrayConveyor to screeningEquipment { doc /* @S054 */ }
        flow f2 of DispositionItem from northGateScanner to primaryCrossbeltSorter { doc /* @S056 */ }
        flow f3 of DispositionItem from southGateScanner to primaryCrossbeltSorter { doc /* @S056 */ }
        flow f4 of ExceptionStatusBagsItem from baggageControlSystem to secondaryInspectionChute { doc /* @S064 */ }
        flow f5 of NotificationItem from staff to baggageOperationsSupervisor { doc /* @S071 */ }
        flow f6 of ScheduleDataItem from flightDataGateway to baggageControlSystem { doc /* @S107 */ }
        flow f7 of LateTransferBagCardItem from transferBagFeeder to bagReconciliationStation { doc /* @S143 */ }
        flow f8 of CarouselReleaseSlipItem from airlineRampCoordinator to carousel7MakeUpUnit { doc /* @S148 */ }
        flow f9 of BagImageAndExceptionDetailsItem from imageResolutionDesk to operator { doc /* @S156 */ }
        flow f10 of ScopeItem from baggageOperationsSupervisor to staff { doc /* @S198 */ }
        flow f11 of BagMatchQueryItem from bagReconciliationStation to airlineRampCoordinator { doc /* @S219 */ }
        flow f12 of EquipmentStateChangesAndAlarmConditionsItem from concourseZoneController to operationsMonitoringFunction { doc /* @S229 */ }
    }
    requirement def R0 { doc /* A scanner fault requires the affected feed to be held until the fault is assessed and the bag disposition is known. @S188 */ subject s : AffectedFeed; }
    requirement def R1 { doc /* must report healthy status before their screening results are relied upon for release @S208 */ subject s : NorthGateScanner; }
    requirement def R2 { doc /* must report healthy status before their screening results are relied upon for release @S208 */ subject s : SouthGateScanner; }
    requirement def R3 { doc /* shall release a bag to the next handling stage only when the recorded screening disposition and assigned destination are valid @S216 */ subject s : Carousel7MakeUpUnit; }
    requirement def R4 { doc /* The physical bags presented for loading must agree with the reconciled records, and every unexplained count or identity difference blocks acceptance. @S225 */ subject s : Bag; }
    requirement def R5 { doc /* Operations must suspend the affected activity when required controls cannot be maintained or when an unverified equipment state could misroute baggage. @S248 */ subject s : Operations; }
}
