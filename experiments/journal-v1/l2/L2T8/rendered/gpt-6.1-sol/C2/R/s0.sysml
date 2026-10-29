package L2Model {
    item def AisleOccupancySnapshotItem { doc /* @S177 */ }
    item def AuthorizedReleaseItem { doc /* @S021 */ }
    item def CraneServiceReleaseCardItem { doc /* @S228 */ }
    item def DispatchWaveAmendmentItem { doc /* @S106 */ }
    item def EquipmentRestrictionsItem { doc /* @S233 */ }
    item def ForkliftHandoffConfirmationItem { doc /* @S225 */ }
    item def MeasuredDimensionsItem { doc /* @S073 */ }
    item def MeasurementsItem { doc /* @S133 */ }
    item def OperatingAvailabilityItem { doc /* @S137 */ }
    item def OversizeLoadAdvisoryItem { doc /* @S151,S156 */ }
    item def PalletsItem { doc /* @S076,S077 */ }
    item def SafetyStatusItem { doc /* @S146 */ }
    item def SlotReservationReceiptItem { doc /* @S154 */ }
    item def SprinklerZoneInhibitNoticeItem { doc /* @S204 */ }
    item def TrailerReadinessToLeaveTheDoorAndReturnToTheYardRouteItem { doc /* @S047 */ }
    item def TrailerSealExceptionNoteItem { doc /* @S129 */ }
    item def TransferInductionTicketItem { doc /* @S200 */ }
    item def WorkItem { doc /* @S136 */ }
    part def AcceptedOperatingConfiguration { doc /* @S231 */ }
    part def AccessPath { doc /* @S188 */ }
    part def AccumulationZones { doc /* @S085 */ }
    part def ActiveSafetyControls { doc /* @S118 */ }
    part def AdjacentEquipment { doc /* @S163 */ }
    part def Aisle { doc /* @S180,S194 */ }
    part def AlarmResponse { doc /* @S211 */ }
    part def AllocationLogic { doc /* @S055 */ }
    part def AssignedDestination { doc /* @S154 */ }
    part def AudibleWarnings { doc /* @S203 */ }
    part def AutonomousForkliftFleet { doc /* @S013,S109,S113,S114,S115,S136,S190,S200,S225,S233 */ }
    part def Change { doc /* @S242 */ }
    part def ControlRecord { doc /* @S158 */ }
    part def ControlledRecoveryManeuver { doc /* @S183 */ }
    part def ControlledTest { doc /* @S193,S194 */ }
    part def ConveyorLineController { doc /* @S012,S078,S079,S080,S087,S088,S090,S098,S099,S100,S134,S169,S176,S200,S212,S232 */ }
    part def ConveyorPath { doc /* @S084 */ }
    part def ConveyorSection { doc /* @S086 */ }
    part def Crane { doc /* @S229 */ }
    part def CraneCommands { doc /* @S066 */ }
    part def CraneOperations { doc /* @S060 */ }
    part def CrossAisleMovement { doc /* @S065 */ }
    part def CycleResult { doc /* @S211 */ }
    part def DelayedTask { doc /* @S160 */ }
    part def Destination { doc /* @S105 */ }
    part def DispatchWaveAmendment { doc /* @S107 */ }
    part def DocumentedReview { doc /* @S168 */ }
    part def DownstreamCondition { doc /* @S134 */ }
    part def Drivers { doc /* @S030 */ }
    part def DuplicateInductionRequests { doc /* @S091 */ }
    part def EastTransferConveyor { doc /* @S010,S076,S119,S135,S189,S210 */ }
    part def EmergencyStops { doc /* @S203 */ }
    part def Equipment { doc /* @S021,S055,S141,S174,S191,S193,S213 */ }
    part def Exception { doc /* @S169 */ }
    part def ExceptionHandling { doc /* @S148 */ }
    part def FailedTest { doc /* @S165 */ }
    part def FastMovingInventory { doc /* @S053 */ }
    part def Fault { doc /* @S162 */ }
    part def FireAlarmPanel { doc /* @S025,S117,S146,S170,S173 */ }
    part def FunctionalChecks { doc /* @S229 */ }
    part def GateProcess { doc /* @S031 */ }
    part def GrossWeightVarianceSlip { doc /* @S168 */ }
    part def InboundInspectionDesk { doc /* @S004,S033,S036,S045,S129,S131,S151,S231,S237 */ }
    part def InboundPalletBuffer { doc /* @S006,S132,S153,S188 */ }
    part def InboundPallets { doc /* @S075 */ }
    part def IncomingShift { doc /* @S218,S243 */ }
    part def Induction { doc /* @S094 */ }
    part def InductionPath { doc /* @S096 */ }
    part def InitiatingAuthorization { doc /* @S211 */ }
    part def Interlocks { doc /* @S082 */ }
    part def Load { doc /* @S120 */ }
    part def LoadSequence { doc /* @S105 */ }
    part def LossOfPositionConfidence { doc /* @S186 */ }
    part def MaintenanceReleaseTerminal { doc /* @S026,S140,S141,S164,S191,S228,S234 */ }
    part def MaterialDefect { doc /* @S224 */ }
    part def MeasuredPalletWeight { doc /* @S167 */ }
    part def MeasuredProfile { doc /* @S069 */ }
    part def Measurements { doc /* @S133 */ }
    part def MismatchBetweenExpectedAndObservedPalletAttributes { doc /* @S149 */ }
    part def Motion { doc /* @S185 */ }
    part def Movement { doc /* @S146 */ }
    part def NULL { doc /* @S195,S196,S201,S202,S204,S205,S206,S208,S209,S213,S215,S216 */ }
    part def NextShift { doc /* @S233 */ }
    part def NormalOperation { doc /* @S239 */ }
    part def NormalTransfers { doc /* @S195 */ }
    part def NorthAisleStackerCrane { doc /* @S008,S063,S092,S095,S137,S154,S155,S162,S163,S165,S177,S206,S228 */ }
    part def ObservedSpeed { doc /* @S211 */ }
    part def Obstruction { doc /* @S172 */ }
    part def OperatingArea { doc /* @S125 */ }
    part def OperatingRecord { doc /* @S150 */ }
    part def OperatingTeam { doc /* @S159 */ }
    part def Operators { doc /* @S199 */ }
    part def OutboundCheckweighScale { doc /* @S016,S144,S167 */ }
    part def OutboundDispatchSorter { doc /* @S015,S106,S107,S121,S143,S237 */ }
    part def OutboundPreparation { doc /* @S101 */ }
    part def OutgoingShift { doc /* @S217,S243 */ }
    part def OversizeLoadAdvisory { doc /* @S071,S072 */ }
    part def Pallet { doc /* @S079,S083,S087,S151,S152 */ }
    part def PalletDimensionScanner { doc /* @S005,S068,S070,S073,S133,S151,S156,S207 */ }
    part def PalletDimensionScannerMeasurements { doc /* @S120 */ }
    part def Pallets { doc /* @S002,S004,S131,S148 */ }
    part def PalletsWithRestrictedHandlingRequirements { doc /* @S054 */ }
    part def PersonAuthorizingAReturnToOperation { doc /* @S164 */ }
    part def Personnel { doc /* @S163,S184 */ }
    part def PersonnelDetection { doc /* @S203 */ }
    part def PositionDiscrepancy { doc /* @S172 */ }
    part def Positions { doc /* @S056 */ }
    part def PresenceSensors { doc /* @S083 */ }
    part def Priority { doc /* @S105 */ }
    part def ProductionMovement { doc /* @S203 */ }
    part def ProtectiveDevice { doc /* @S212 */ }
    part def ReceivingException { doc /* @S130 */ }
    part def ReceivingProcess { doc /* @S050 */ }
    part def ReceivingStaff { doc /* @S043,S047 */ }
    part def RecoveryPlan { doc /* @S181 */ }
    part def RecoveryResponse { doc /* @S172 */ }
    part def RenewedAlarm { doc /* @S186 */ }
    part def ReportedPosition { doc /* @S193 */ }
    part def RequiredSafetyChecks { doc /* @S229 */ }
    part def ReservationRecord { doc /* @S059 */ }
    part def RestartRecord { doc /* @S211 */ }
    part def Review { doc /* @S241 */ }
    part def Routes { doc /* @S190 */ }
    part def RoutineWarehouseOperation { doc /* @S219 */ }
    part def SafetyAlarm { doc /* @S172 */ }
    part def SafetyChecks { doc /* @S203 */ }
    part def SafetyStatus { doc /* @S146 */ }
    part def SafetyZoneController { doc /* @S024,S146,S170,S173,S174,S187,S204 */ }
    part def Section { doc /* @S082 */ }
    part def ShiftCheck { doc /* @S205 */ }
    part def ShippingDocumentationDesk { doc /* @S017,S122,S145,S226 */ }
    part def SouthAisleStackerCrane { doc /* @S009,S064,S137,S182,S183 */ }
    part def Spotter { doc /* @S185 */ }
    part def StackerCrane { doc /* @S061 */ }
    part def Staff { doc /* @S034 */ }
    part def StagingPositions { doc /* @S102 */ }
    part def StorageAllocation { doc /* @S051 */ }
    part def StoragePositions { doc /* @S093 */ }
    part def StorageSuitability { doc /* @S068 */ }
    part def SuccessfulTest { doc /* @S166 */ }
    part def Task { doc /* @S158 */ }
    part def TaskAllocation { doc /* @S137 */ }
    part def TestPlan { doc /* @S220 */ }
    part def Trailer { doc /* @S038,S047 */ }
    part def TransferArea { doc /* @S076,S077 */ }
    part def TransferInductionTicket { doc /* @S089 */ }
    part def TransferPoint { doc /* @S084 */ }
    part def Transfers { doc /* @S176 */ }
    part def UnexpectedMovement { doc /* @S186 */ }
    part def UnresolvedDiscrepancies { doc /* @S128 */ }
    part def UnscheduledArrivals { doc /* @S031 */ }
    part def Vehicle { doc /* @S110,S112,S118,S128 */ }
    part def Vehicles { doc /* @S201 */ }
    part def WarehouseManagementSystem { doc /* @S020,S021,S041,S042,S052,S057,S073,S101,S103,S105,S106,S124,S142,S154,S156,S157,S177,S178,S197,S225,S230 */ }
    part def WarehouseOperationsSupervisor { doc /* @S018,S049,S074,S097,S123,S138,S147,S159,S160,S171,S175,S192,S198,S199,S214,S222 */ }
    part def WavePlanning { doc /* @S102 */ }
    part def WavePreparation { doc /* @S105 */ }
    part def WestTransferConveyor { doc /* @S011,S077,S119,S135,S189 */ }
    part def WorkRequests { doc /* @S126 */ }
    part def YardGateController { doc /* @S014,S028,S039,S127,S128,S129,S179 */ }
    part def YardPersonnel { doc /* @S047 */ }
    part def YardTraffic { doc /* @S180 */ }
    part system {
        part acceptedOperatingConfiguration : AcceptedOperatingConfiguration {
            exhibit state modes {
                state s0 { doc /* under change control @S231 */ }
            }
        }
        part accessPath : AccessPath {
            perform action a0 { doc /* intersects the isolated area @S188 */ }
        }
        part accumulationZones : AccumulationZones {
            perform action a0 { doc /* provide controlled spacing between pallets @S085 */ }
        }
        part activeSafetyControls : ActiveSafetyControls {
            perform action a0 { doc /* prevent entry to an assigned travel area @S118 */ }
        }
        part adjacentEquipment : AdjacentEquipment {
            perform action a0 { doc /* can continue safely @S163 */ }
        }
        part aisle : Aisle {
            exhibit state modes {
                state s0 { doc /* clear of personnel and loose material @S194 */ }
                state s1 { doc /* safe for normal operations @S180 */ }
            }
        }
        part alarmResponse : AlarmResponse;
        part allocationLogic : AllocationLogic {
            perform action a0 { doc /* preserves clearances for the pallet and the equipment needed to access it @S055 */ }
        }
        part assignedDestination : AssignedDestination {
            exhibit state modes {
                state s0 { doc /* reserved @S154 */ }
            }
        }
        part audibleWarnings : AudibleWarnings {
            perform action a0 { doc /* respond @S203 */ }
        }
        part autonomousForkliftFleet : AutonomousForkliftFleet {
            perform action a0 { doc /* moves pallets only within approved travel areas and under authorized tasking @S013 */ }
            perform action a1 { doc /* accepts work only when its vehicle status, assigned operating area, and required travel path are valid @S109 */ }
            perform action a2 { doc /* limits speed and turning rates @S113 */ }
            perform action a3 { doc /* protect pallet stability @S113 */ }
            perform action a4 { doc /* maintain safe clearance from warehouse structures @S113 */ }
            perform action a5 { doc /* assembles the data needed to document each completed transfer and its receiving position @S114 */ }
            perform action a6 { doc /* document each completed transfer and its receiving position @S114 */ }
            perform action a7 { doc /* produces the Forklift Handoff Confirmation @S115 */ }
            perform action a8 { doc /* receives work only when a route and destination are available for the assigned vehicle @S136 */ }
            perform action a9 { doc /* receives a hold instruction for routes that approach the recovery area @S190 */ }
            perform action a10 { doc /* receives the Transfer Induction Ticket @S200 */ }
            perform action a11 { doc /* validates its destination against the assigned route @S200 */ }
            perform action a12 { doc /* parks its vehicles in approved locations @S233 */ }
            perform action a13 { doc /* reports any remaining equipment restrictions for the next shift @S233 */ }
        }
        part change : Change {
            perform action a0 { doc /* affects operator duties, alarm response, or equipment recovery procedures @S242 */ }
        }
        part controlRecord : ControlRecord {
            perform action a0 { doc /* identifies the hold reason @S158 */ }
            perform action a1 { doc /* retains the pallet's last confirmed location @S158 */ }
        }
        part controlledRecoveryManeuver : ControlledRecoveryManeuver {
            perform action a0 { doc /* uses only the travel needed to reach a stable position or clear the obstruction under review @S183 */ }
        }
        part controlledTest : ControlledTest {
            perform action a0 { doc /* confirms that the equipment responds correctly to stop commands and that its reported position is stable @S193 */ }
            perform action a1 { doc /* passes @S194 */ }
        }
        part conveyorLineController : ConveyorLineController {
            perform action a0 { doc /* coordinates conveyor movement within its assigned operating scope @S012 */ }
            perform action a1 { doc /* sequences pallet movement across the available conveyor sections @S078 */ }
            perform action a2 { doc /* uses conveyor status and transfer-point signals @S079 */ }
            perform action a3 { doc /* determine when a pallet can advance @S079 */ }
            perform action a4 { doc /* maintains a separate sequence for each active conveyor path @S080 */ }
            perform action a5 { doc /* grants passage to one approaching pallet at a time @S087 */ }
            perform action a6 { doc /* produces the Transfer Induction Ticket for each accepted induction @S088 */ }
            perform action a7 { doc /* checks that required induction fields are present @S090 */ }
            perform action a8 { doc /* releasing the pallet from the transfer point @S090 */ }
            perform action a9 { doc /* verifies transfer-point readiness @S098 */ }
            perform action a10 { doc /* resuming the held sequence @S098 */ }
            perform action a11 { doc /* resumes without changing the order of pallets already committed to a transfer path @S099 */ }
            perform action a12 { doc /* without changing the order of pallets already committed to a transfer path @S099 */ }
            perform action a13 { doc /* resumes without changing the order of pallets already committed to a transfer path @S100 */ }
            perform action a14 { doc /* without changing the order of pallets already committed to a transfer path @S100 */ }
            perform action a15 { doc /* coordinates conveyor movement @S134 */ }
            perform action a16 { doc /* stops affected equipment @S134 */ }
            perform action a17 { doc /* holds affected transfers @S169 */ }
            perform action a18 { doc /* holds transfers that could feed material into the isolated area @S176 */ }
            perform action a19 { doc /* inhibits feed if the restart cycle is incomplete or a protective device changes state @S212 */ }
            perform action a20 { doc /* verifies that conveyor zones are clear @S232 */ }
            perform action a21 { doc /* records the completion of its assigned closing checks @S232 */ }
        }
        part conveyorPath : ConveyorPath {
            perform action a0 { doc /* may continue operating @S084 */ }
        }
        part conveyorSection : ConveyorSection {
            perform action a0 { doc /* reports ready @S086 */ }
            exhibit state modes {
                state s0 { doc /* ready @S086 */ }
            }
        }
        part crane : Crane {
            exhibit state modes {
                state s0 { doc /* unavailable for automated assignments @S229 */ }
            }
        }
        part craneCommands : CraneCommands {
            perform action a0 { doc /* are issued only when the target position and the required aisle conditions are valid @S066 */ }
        }
        part craneOperations : CraneOperations {
            perform action a0 { doc /* are divided into aisle zones to limit conflicting equipment movement @S060 */ }
        }
        part crossAisleMovement : CrossAisleMovement {
            perform action a0 { doc /* is controlled so that crane travel does not extend beyond authorized operating zones @S065 */ }
        }
        part cycleResult : CycleResult;
        part delayedTask : DelayedTask {
            perform action a0 { doc /* will not compromise a later outbound wave or an aisle access limit @S160 */ }
        }
        part destination : Destination {
            perform action a0 { doc /* changes @S105 */ }
        }
        part dispatchWaveAmendment : DispatchWaveAmendment {
            perform action a0 { doc /* explicitly authorizes a change @S107 */ }
        }
        part documentedReview : DocumentedReview {
            perform action a0 { doc /* establishes a safe disposition @S168 */ }
        }
        part downstreamCondition : DownstreamCondition {
            perform action a0 { doc /* prevents safe transfer @S134 */ }
        }
        part drivers : Drivers {
            perform action a0 { doc /* follow the gate instructions to the designated staging lane @S030 */ }
        }
        part duplicateInductionRequests : DuplicateInductionRequests {
            exhibit state modes {
                state s0 { doc /* held @S091 */ }
            }
        }
        part eastTransferConveyor : EastTransferConveyor {
            perform action a0 { doc /* carries pallets along its designated transfer route @S010 */ }
            perform action a1 { doc /* carries pallets along the eastern approach to the transfer area @S076 */ }
            perform action a2 { doc /* provide designated interfaces for moving pallets between vehicle travel and outbound staging @S119 */ }
            perform action a3 { doc /* provide separate routes for moving pallets between operating areas @S135 */ }
            perform action a4 { doc /* could compromise the boundary @S189 */ }
            perform action a5 { doc /* demonstrates a controlled restart @S210 */ }
            perform action a6 { doc /* running empty at reduced speed for one complete cycle @S210 */ }
            perform action a7 { doc /* accepting a pallet @S210 */ }
            exhibit state modes {
                state s0 { doc /* stopped @S189 */ }
            }
        }
        part emergencyStops : EmergencyStops {
            perform action a0 { doc /* respond @S203 */ }
        }
        part equipment : Equipment {
            perform action a0 { doc /* may begin inventory-moving work without an authorized release from the Warehouse Management System @S021 */ }
            perform action a1 { doc /* access it @S055 */ }
            perform action a2 { doc /* entering it @S174 */ }
            perform action a3 { doc /* can return to service @S191 */ }
            perform action a4 { doc /* responds correctly to stop commands @S193 */ }
            exhibit state modes {
                state s0 { doc /* automatic service @S213 */ }
                state s1 { doc /* operational service @S141 */ }
                state s2 { doc /* service @S191 */ }
            }
        }
        part exception : Exception {
            perform action a0 { doc /* would make the next movement uncertain @S169 */ }
        }
        part exceptionHandling : ExceptionHandling {
            perform action a0 { doc /* preserves a traceable hold state @S148 */ }
        }
        part failedTest : FailedTest {
            perform action a0 { doc /* keeps the equipment inhibited @S165 */ }
            perform action a1 { doc /* returns the fault to the maintenance queue for further diagnosis @S165 */ }
        }
        part fastMovingInventory : FastMovingInventory {
            perform action a0 { doc /* is generally assigned to positions that support short travel paths to its next handling step @S053 */ }
        }
        part fault : Fault {
            perform action a0 { doc /* could affect positioning, load retention, braking, or travel @S162 */ }
        }
        part fireAlarmPanel : FireAlarmPanel {
            perform action a0 { doc /* provides facility alarm status for operational response @S025 */ }
            perform action a1 { doc /* produces the Sprinkler Zone Inhibit Notice @S117 */ }
            perform action a2 { doc /* provide safety status @S146 */ }
            perform action a3 { doc /* retain authority to stop or restrict movement whenever their safety status requires it @S170 */ }
            perform action a4 { doc /* stop @S170 */ }
            perform action a5 { doc /* restrict movement @S170 */ }
            perform action a6 { doc /* retain authority to stop or restrict movement whenever their safety status requires it @S173 */ }
            perform action a7 { doc /* stop or restrict movement @S173 */ }
        }
        part functionalChecks : FunctionalChecks {
            perform action a0 { doc /* have passed @S229 */ }
        }
        part gateProcess : GateProcess {
            perform action a0 { doc /* flags unscheduled arrivals for review @S031 */ }
        }
        part grossWeightVarianceSlip : GrossWeightVarianceSlip {
            exhibit state modes {
                state s0 { doc /* unresolved @S168 */ }
            }
        }
        part inboundInspectionDesk : InboundInspectionDesk {
            perform action a0 { doc /* records inspection outcomes @S004 */ }
            perform action a1 { doc /* checks delivery paperwork against the expected shipment @S033 */ }
            perform action a2 { doc /* confirms the trailer is presented for inspection @S033 */ }
            perform action a3 { doc /* sends the Trailer Seal Exception Note @S036 */ }
            perform action a4 { doc /* records inspection results promptly @S045 */ }
            perform action a5 { doc /* records inspection outcomes @S131 */ }
            perform action a6 { doc /* consumes its inspection-stage advisory @S151 */ }
            perform action a7 { doc /* records whether the pallet can proceed, requires rework, or must remain held @S151 */ }
            perform action a8 { doc /* records governance approval @S231 */ }
            perform action a9 { doc /* confirms that the accepted operating configuration is under change control @S231 */ }
            perform action a10 { doc /* confirm that their operating interfaces are available and that exceptions can be held safely @S237 */ }
        }
        part inboundPalletBuffer : InboundPalletBuffer {
            perform action a0 { doc /* holds accepted pallets temporarily @S006 */ }
            perform action a1 { doc /* provides a controlled staging point @S132 */ }
            perform action a2 { doc /* provides temporary staging @S153 */ }
            exhibit state modes {
                state s0 { doc /* unavailable to new receipts @S188 */ }
            }
        }
        part inboundPallets : InboundPallets {
            perform action a0 { doc /* enter the conveyor area only after the preceding inspection and identification steps are complete @S075 */ }
        }
        part incomingShift : IncomingShift {
            perform action a0 { doc /* acknowledges those conditions @S218 */ }
            perform action a1 { doc /* authorizing routine movements @S218 */ }
            perform action a2 { doc /* acknowledges them @S243 */ }
            perform action a3 { doc /* authorizing routine movements @S243 */ }
        }
        part induction : Induction {
            perform action a0 { doc /* can proceed @S094 */ }
        }
        part inductionPath : InductionPath {
            exhibit state modes {
                state s0 { doc /* held @S096 */ }
            }
        }
        part initiatingAuthorization : InitiatingAuthorization;
        part interlocks : Interlocks {
            perform action a0 { doc /* prevent movement into a section that is occupied or unavailable @S082 */ }
        }
        part load : Load {
            perform action a0 { doc /* exceed standard pallet envelopes @S120 */ }
        }
        part loadSequence : LoadSequence {
            perform action a0 { doc /* changes @S105 */ }
        }
        part lossOfPositionConfidence : LossOfPositionConfidence {
            perform action a0 { doc /* causes an immediate stop and reassessment @S186 */ }
        }
        part maintenanceReleaseTerminal : MaintenanceReleaseTerminal {
            perform action a0 { doc /* records equipment availability for operational planning @S026 */ }
            perform action a1 { doc /* produces the Crane Service Release Card @S140 */ }
            perform action a2 { doc /* have been completed @S140 */ }
            perform action a3 { doc /* is recorded @S141 */ }
            perform action a4 { doc /* is returned to operational service @S141 */ }
            perform action a5 { doc /* records the inspection outcome and the identity of the person authorizing a return to operation @S164 */ }
            perform action a6 { doc /* records the inspection outcome and any repair work required before equipment can return to service @S191 */ }
            perform action a7 { doc /* records completed service work @S234 */ }
            perform action a8 { doc /* confirms that equipment restrictions remain visible until formally cleared @S234 */ }
        }
        part materialDefect : MaterialDefect {
            perform action a0 { doc /* could compromise personnel safety, inventory control, or shipment accuracy @S224 */ }
        }
        part measuredPalletWeight : MeasuredPalletWeight {
            perform action a0 { doc /* falls outside the configured tolerance @S167 */ }
        }
        part measuredProfile : MeasuredProfile {
            perform action a0 { doc /* is checked against configured dimensional limits and the declared pallet profile @S069 */ }
        }
        part measurements : Measurements {
            perform action a0 { doc /* used to identify pallets that require a different handling path @S133 */ }
            perform action a1 { doc /* identify pallets that require a different handling path @S133 */ }
        }
        part mismatchBetweenExpectedAndObservedPalletAttributes : MismatchBetweenExpectedAndObservedPalletAttributes {
            perform action a0 { doc /* prevents automatic allocation @S149 */ }
            perform action a1 { doc /* directs the load to controlled review @S149 */ }
        }
        part motion : Motion {
            exhibit state modes {
                state s0 { doc /* enabled @S185 */ }
            }
        }
        part movement : Movement {
            perform action a0 { doc /* stop @S146 */ }
            perform action a1 { doc /* be restricted @S146 */ }
        }
        part nULLPart : NULL {
            perform action a0 { doc /* observed for unexpected interference or renewed alarms @S195 */ }
            perform action a1 { doc /* is assessed against transfer throughput, task completion time, equipment availability, and the rate of safely resolved exceptions @S196 */ }
            perform action a2 { doc /* is measured as the proportion of scheduled operating time during which vehicles are ready for service @S201 */ }
            perform action a3 { doc /* is reviewed using completed tasks, travel time, and the number of blocked or delayed movements @S202 */ }
            perform action a4 { doc /* are met @S204 */ }
            perform action a5 { doc /* enforced by the applicable control logic @S205 */ }
            perform action a6 { doc /* is detected @S206 */ }
            perform action a7 { doc /* are held for review rather than passed forward on an assumed measurement @S208 */ }
            perform action a8 { doc /* passed forward on an assumed measurement @S208 */ }
            perform action a9 { doc /* is checked with a known reference load at the start of the shift and after maintenance @S209 */ }
            perform action a10 { doc /* is checked @S213 */ }
            perform action a11 { doc /* is returned to automatic service @S213 */ }
            perform action a12 { doc /* is investigated @S215 */ }
            perform action a13 { doc /* is accepted @S215 */ }
            perform action a14 { doc /* are reviewed for corrective action and accountable ownership @S216 */ }
        }
        part nextShift : NextShift;
        part normalOperation : NormalOperation {
            perform action a0 { doc /* resumes @S239 */ }
        }
        part normalTransfers : NormalTransfers {
            perform action a0 { doc /* resume in stages @S195 */ }
        }
        part northAisleStackerCrane : NorthAisleStackerCrane {
            perform action a0 { doc /* performs assigned storage and retrieval work in its designated aisle @S008 */ }
            perform action a1 { doc /* serves storage positions in the north aisle @S063 */ }
            perform action a2 { doc /* follows the aisle's configured travel limits @S063 */ }
            perform action a3 { doc /* sends the Aisle Occupancy Snapshot @S092 */ }
            perform action a4 { doc /* updates its reported condition @S095 */ }
            perform action a5 { doc /* report operating availability @S137 */ }
            perform action a6 { doc /* uses the Slot Reservation Receipt @S154 */ }
            perform action a7 { doc /* confirm that its assigned destination remains reserved @S154 */ }
            perform action a8 { doc /* checks its current task state @S155 */ }
            perform action a9 { doc /* stops if the destination or access path is no longer valid @S155 */ }
            perform action a10 { doc /* reports a fault that could affect positioning, load retention, braking, or travel @S162 */ }
            perform action a11 { doc /* verifies aisle clearance @S206 */ }
            perform action a12 { doc /* resuming a stored-pallet movement @S206 */ }
            perform action a13 { doc /* stops if an obstruction is detected @S206 */ }
            perform action a14 { doc /* accepts the release card as authorization @S228 */ }
            perform action a15 { doc /* return to service @S228 */ }
            exhibit state modes {
                state s0 { doc /* inhibited @S165 */ }
                state s1 { doc /* unavailable @S163 */ }
            }
        }
        part observedSpeed : ObservedSpeed;
        part obstruction : Obstruction {
            perform action a0 { doc /* makes continued automatic movement uncertain @S172 */ }
        }
        part operatingArea : OperatingArea {
            perform action a0 { doc /* can act on current work without duplicating assignments @S125 */ }
            perform action a1 { doc /* duplicating assignments @S125 */ }
        }
        part operatingRecord : OperatingRecord {
            perform action a0 { doc /* retains the scan result, location, and time of detection @S150 */ }
            perform action a1 { doc /* can be reconstructed @S150 */ }
        }
        part operatingTeam : OperatingTeam {
            perform action a0 { doc /* cannot clear them locally @S159 */ }
        }
        part operators : Operators {
            perform action a0 { doc /* understand current speed limits, exclusion boundaries, and stop-work criteria @S199 */ }
        }
        part outboundCheckweighScale : OutboundCheckweighScale {
            perform action a0 { doc /* verifies pallet weight before shipment completion @S016 */ }
            perform action a1 { doc /* verifies shipment weight @S144 */ }
            perform action a2 { doc /* is finalized @S144 */ }
            perform action a3 { doc /* produces the Gross Weight Variance Slip @S167 */ }
        }
        part outboundDispatchSorter : OutboundDispatchSorter {
            perform action a0 { doc /* organizes eligible pallets for their assigned dispatch sequence @S015 */ }
            perform action a1 { doc /* receives the Dispatch Wave Amendment @S106 */ }
            perform action a2 { doc /* applies its authorized changes to outbound staging @S106 */ }
            perform action a3 { doc /* preserves committed pallet order @S107 */ }
            perform action a4 { doc /* verifies that staging positions match the current outbound plan @S121 */ }
            perform action a5 { doc /* organizes completed pallets according to the current shipping plan @S143 */ }
            perform action a6 { doc /* confirm that their operating interfaces are available and that exceptions can be held safely @S237 */ }
        }
        part outboundPreparation : OutboundPreparation {
            perform action a0 { doc /* starts when the Warehouse Management System establishes the intended shipment window and loading priorities @S101 */ }
        }
        part outgoingShift : OutgoingShift {
            perform action a0 { doc /* records equipment restrictions, pending checks, and unresolved safety concerns @S217 */ }
            perform action a1 { doc /* records remaining restrictions and unresolved concerns @S243 */ }
        }
        part oversizeLoadAdvisory : OversizeLoadAdvisory {
            perform action a0 { doc /* identifies a measured profile that exceeds an applicable storage or handling limit @S071 */ }
            perform action a1 { doc /* does not by itself authorize placement in a position that fails the storage rules @S072 */ }
        }
        part pallet : Pallet {
            perform action a0 { doc /* can advance @S079 */ }
            perform action a1 { doc /* has reached the expected position @S083 */ }
            perform action a2 { doc /* approaching @S087 */ }
            perform action a3 { doc /* can proceed @S151 */ }
            perform action a4 { doc /* requires rework @S151 */ }
            exhibit state modes {
                state s0 { doc /* held @S151 */ }
                state s1 { doc /* separated from available stock @S152 */ }
            }
        }
        part palletDimensionScanner : PalletDimensionScanner {
            perform action a0 { doc /* captures dimensions @S005 */ }
            perform action a1 { doc /* measures pallet height, width, and length @S068 */ }
            perform action a2 { doc /* produces the Oversize Load Advisory @S070 */ }
            perform action a3 { doc /* supplies measurements @S133 */ }
            perform action a4 { doc /* checks each pallet profile against configured dimensional limits @S207 */ }
            perform action a5 { doc /* flags measurements outside tolerance @S207 */ }
        }
        part palletDimensionScannerMeasurements : PalletDimensionScannerMeasurements {
            perform action a0 { doc /* support route and handling decisions for loads that exceed standard pallet envelopes @S120 */ }
        }
        part pallets : Pallets {
            perform action a0 { doc /* remain within this boundary @S002 */ }
            perform action a1 { doc /* enter storage operations @S004 */ }
            perform action a2 { doc /* enter routine warehouse handling @S131 */ }
            perform action a3 { doc /* is understood @S148 */ }
            perform action a4 { doc /* can be safely routed @S148 */ }
            exhibit state modes {
                state s0 { doc /* hold state @S148 */ }
            }
        }
        part palletsWithRestrictedHandlingRequirements : PalletsWithRestrictedHandlingRequirements {
            perform action a0 { doc /* are assigned only to positions approved for those conditions @S054 */ }
        }
        part personAuthorizingAReturnToOperation : PersonAuthorizingAReturnToOperation {
            perform action a0 { doc /* authorizing a return to operation @S164 */ }
        }
        part personnel : Personnel {
            perform action a0 { doc /* inspect the fault @S163 */ }
            perform action a1 { doc /* verify that adjacent equipment can continue safely @S163 */ }
            perform action a2 { doc /* remain outside the crane travel envelope throughout the maneuver @S184 */ }
        }
        part personnelDetection : PersonnelDetection {
            perform action a0 { doc /* respond @S203 */ }
        }
        part positionDiscrepancy : PositionDiscrepancy {
            perform action a0 { doc /* makes continued automatic movement uncertain @S172 */ }
        }
        part positions : Positions {
            perform action a0 { doc /* is excluded when its capacity, status, or operating restrictions conflict with the pallet profile @S056 */ }
        }
        part presenceSensors : PresenceSensors {
            perform action a0 { doc /* confirm that a pallet has reached the expected position @S083 */ }
        }
        part priority : Priority {
            perform action a0 { doc /* changes @S105 */ }
        }
        part productionMovement : ProductionMovement {
            perform action a0 { doc /* begins @S203 */ }
        }
        part protectiveDevice : ProtectiveDevice {
            perform action a0 { doc /* changes state @S212 */ }
        }
        part receivingException : ReceivingException {
            perform action a0 { doc /* remains visible to the Warehouse Operations Supervisor @S130 */ }
            perform action a1 { doc /* has been assessed @S130 */ }
            perform action a2 { doc /* resolved @S130 */ }
        }
        part receivingProcess : ReceivingProcess {
            perform action a0 { doc /* closes @S050 */ }
        }
        part receivingStaff : ReceivingStaff {
            perform action a0 { doc /* compare the physical pallet count with the shipment paperwork @S043 */ }
        }
        part recoveryPlan : RecoveryPlan {
            perform action a0 { doc /* identifies the permitted travel envelope, the expected stopping point, and the conditions that require an immediate stop @S181 */ }
        }
        part recoveryResponse : RecoveryResponse {
            perform action a0 { doc /* begins when a position discrepancy, obstruction, or safety alarm makes continued automatic movement uncertain @S172 */ }
        }
        part renewedAlarm : RenewedAlarm {
            perform action a0 { doc /* causes an immediate stop and reassessment @S186 */ }
        }
        part reportedPosition : ReportedPosition {
            exhibit state modes {
                state s0 { doc /* stable @S193 */ }
            }
        }
        part requiredSafetyChecks : RequiredSafetyChecks {
            perform action a0 { doc /* have passed @S229 */ }
        }
        part reservationRecord : ReservationRecord {
            perform action a0 { doc /* identifies the selected position and the conditions used to validate its suitability @S059 */ }
        }
        part restartRecord : RestartRecord;
        part review : Review {
            perform action a0 { doc /* assigns corrective actions with accountable owners, target dates, and evidence of closure @S241 */ }
        }
        part routes : Routes {
            perform action a0 { doc /* approach the recovery area @S190 */ }
        }
        part routineWarehouseOperation : RoutineWarehouseOperation {
            perform action a0 { doc /* begins @S219 */ }
        }
        part safetyAlarm : SafetyAlarm {
            perform action a0 { doc /* makes continued automatic movement uncertain @S172 */ }
        }
        part safetyChecks : SafetyChecks {
            perform action a0 { doc /* verify that personnel detection, audible warnings, and emergency stops respond before production movement begins @S203 */ }
        }
        part safetyStatus : SafetyStatus {
            perform action a0 { doc /* can require movement to stop or be restricted @S146 */ }
        }
        part safetyZoneController : SafetyZoneController {
            perform action a0 { doc /* enforces movement restrictions in designated protected areas @S024 */ }
            perform action a1 { doc /* provide safety status @S146 */ }
            perform action a2 { doc /* retain authority to stop or restrict movement whenever their safety status requires it @S170 */ }
            perform action a3 { doc /* stop @S170 */ }
            perform action a4 { doc /* restrict movement @S170 */ }
            perform action a5 { doc /* retain authority to stop or restrict movement whenever their safety status requires it @S173 */ }
            perform action a6 { doc /* stop or restrict movement @S173 */ }
            perform action a7 { doc /* establishes a controlled boundary around the affected aisle @S174 */ }
            perform action a8 { doc /* prevents new equipment from entering it @S174 */ }
            perform action a9 { doc /* maintains the boundary until the cause of the stop has been understood and the recovery plan has been checked again @S187 */ }
            perform action a10 { doc /* applies the Sprinkler Zone Inhibit Notice @S204 */ }
            perform action a11 { doc /* maintaining the specified exclusion boundary until release criteria are met @S204 */ }
        }
        part section : Section {
            exhibit state modes {
                state s0 { doc /* occupied @S082 */ }
                state s1 { doc /* unavailable @S082 */ }
            }
        }
        part shiftCheck : ShiftCheck {
            perform action a0 { doc /* confirms that the active boundary is visible to operators and enforced by the applicable control logic @S205 */ }
        }
        part shippingDocumentationDesk : ShippingDocumentationDesk {
            perform action a0 { doc /* prepares the records required for outbound loads @S017 */ }
            perform action a1 { doc /* prepares shipment records from the confirmed pallet and destination data @S122 */ }
            perform action a2 { doc /* prepares shipment records from confirmed pallet and destination data @S145 */ }
            perform action a3 { doc /* receives the Gross Weight Variance Slip @S226 */ }
            perform action a4 { doc /* reconciles the Gross Weight Variance Slip against the applicable shipment record @S226 */ }
            perform action a5 { doc /* completing its paperwork @S226 */ }
        }
        part southAisleStackerCrane : SouthAisleStackerCrane {
            perform action a0 { doc /* performs assigned storage and retrieval work in its designated aisle @S009 */ }
            perform action a1 { doc /* serves its assigned storage positions under equivalent travel and access controls @S064 */ }
            perform action a2 { doc /* report operating availability @S137 */ }
            perform action a3 { doc /* performs a controlled recovery maneuver at reduced speed within the isolated aisle @S182 */ }
            perform action a4 { doc /* reach a stable position @S183 */ }
            perform action a5 { doc /* clear the obstruction under review @S183 */ }
            exhibit state modes {
                state s0 { doc /* stable position @S183 */ }
            }
        }
        part spotter : Spotter {
            perform action a0 { doc /* may observe from a protected location @S185 */ }
            perform action a1 { doc /* does not enter the isolated aisle while motion is enabled @S185 */ }
        }
        part stackerCrane : StackerCrane {
            perform action a0 { doc /* normally retrieves and stores pallets within its assigned aisle boundaries @S061 */ }
        }
        part staff : Staff {
            perform action a0 { doc /* verify trailer identification @S034 */ }
            perform action a1 { doc /* inspect accessible seals @S034 */ }
        }
        part stagingPositions : StagingPositions {
            exhibit state modes {
                state s0 { doc /* available @S102 */ }
            }
        }
        part storageAllocation : StorageAllocation {
            perform action a0 { doc /* begins @S051 */ }
        }
        part storagePositions : StoragePositions {
            exhibit state modes {
                state s0 { doc /* available @S093 */ }
                state s1 { doc /* occupied @S093 */ }
            }
        }
        part storageSuitability : StorageSuitability {
            perform action a0 { doc /* is finalized @S068 */ }
        }
        part successfulTest : SuccessfulTest {
            perform action a0 { doc /* does not by itself release the crane until required interlocks and operating limits have been checked @S166 */ }
        }
        part task : Task {
            exhibit state modes {
                state s0 { doc /* blocked @S158 */ }
            }
        }
        part taskAllocation : TaskAllocation {
            perform action a0 { doc /* can account for equipment status @S137 */ }
        }
        part testPlan : TestPlan {
            perform action a0 { doc /* defines expected behavior, safety limits, evidence requirements, and criteria for blocking release @S220 */ }
        }
        part trailer : Trailer {
            perform action a0 { doc /* do not obstruct active traffic routes @S038 */ }
            perform action a1 { doc /* leave the door @S047 */ }
            perform action a2 { doc /* return to the yard route @S047 */ }
        }
        part transferArea : TransferArea;
        part transferInductionTicket : TransferInductionTicket {
            perform action a0 { doc /* carries the identifiers and routing details needed to associate the induction with its pallet @S089 */ }
        }
        part transferPoint : TransferPoint {
            perform action a0 { doc /* holds the affected pallet upstream @S084 */ }
            exhibit state modes {
                state s0 { doc /* blocked @S084 */ }
            }
        }
        part transfers : Transfers {
            perform action a0 { doc /* could feed material into the isolated area @S176 */ }
        }
        part unexpectedMovement : UnexpectedMovement {
            perform action a0 { doc /* causes an immediate stop and reassessment @S186 */ }
        }
        part unresolvedDiscrepancies : UnresolvedDiscrepancies {
            perform action a0 { doc /* creates an operating risk @S128 */ }
        }
        part unscheduledArrivals : UnscheduledArrivals {
            perform action a0 { doc /* enter the receiving area @S031 */ }
        }
        part vehicle : Vehicle {
            perform action a0 { doc /* selects an available task according to dispatch priority, battery condition, and proximity to the pickup point @S110 */ }
            perform action a1 { doc /* confirm pallet identity and pickup location @S112 */ }
            perform action a2 { doc /* lifting a load @S112 */ }
            perform action a3 { doc /* stop @S118 */ }
            perform action a4 { doc /* reroute @S118 */ }
            perform action a5 { doc /* proceeding @S128 */ }
        }
        part vehicles : Vehicles {
            exhibit state modes {
                state s0 { doc /* ready for service @S201 */ }
            }
        }
        part warehouseManagementSystem : WarehouseManagementSystem {
            perform action a0 { doc /* maintains the authoritative status, location, and handling eligibility of each controlled pallet @S020 */ }
            perform action a1 { doc /* maintains the expected inbound shipment data used during receiving checks @S041 */ }
            perform action a2 { doc /* sends the Dispatch Wave Amendment @S042 */ }
            perform action a3 { doc /* evaluates available positions against pallet dimensions, mass, storage compatibility, and expected retrieval demand @S052 */ }
            perform action a4 { doc /* produces the Slot Reservation Receipt @S057 */ }
            perform action a5 { doc /* can retain the measured dimensions with the pallet's inventory record for later allocation decisions @S073 */ }
            perform action a6 { doc /* establishes the intended shipment window and loading priorities @S101 */ }
            perform action a7 { doc /* checks that planned pallet moves remain consistent with outbound capacity and current inventory records @S103 */ }
            perform action a8 { doc /* issues a Dispatch Wave Amendment @S105 */ }
            perform action a9 { doc /* maintains the authoritative task state for pallet movements, inventory status, and operating priorities @S124 */ }
            perform action a10 { doc /* reconciles work across operating areas @S142 */ }
            perform action a11 { doc /* preserves a consistent view of task status and outstanding constraints @S142 */ }
            perform action a12 { doc /* consumes the load advisory @S156 */ }
            perform action a13 { doc /* apply the required handling constraints to affected work @S156 */ }
            perform action a14 { doc /* prevents an incompatible allocation from being released while the advisory remains applicable @S157 */ }
            perform action a15 { doc /* receives the occupancy snapshot for recovery planning @S177 */ }
            perform action a16 { doc /* reconciles its location records with available sensor data @S178 */ }
            perform action a17 { doc /* presents a recovery plan @S178 */ }
            perform action a18 { doc /* records transaction times @S197 */ }
            perform action a19 { doc /* reconciles completed movements against the active shift plan @S197 */ }
            perform action a20 { doc /* uses the handoff confirmation @S225 */ }
            perform action a21 { doc /* close the applicable movement record @S225 */ }
            perform action a22 { doc /* closes the commissioning action register @S230 */ }
        }
        part warehouseOperationsSupervisor : WarehouseOperationsSupervisor {
            perform action a0 { doc /* oversees exceptions, operational priorities, and recovery decisions @S018 */ }
            perform action a1 { doc /* resolves receiving issues that exceed the desk's routine authority @S049 */ }
            perform action a2 { doc /* can review unresolved allocation conditions through established operational procedures @S074 */ }
            perform action a3 { doc /* can review persistent holds through established operational procedures @S097 */ }
            perform action a4 { doc /* reviews delayed tasks, abnormal vehicle stops, and unresolved staging constraints @S123 */ }
            perform action a5 { doc /* releasing the next outbound wave @S123 */ }
            perform action a6 { doc /* can defer work @S138 */ }
            perform action a7 { doc /* reviews delayed tasks, abnormal vehicle stops, and unresolved staging constraints @S147 */ }
            perform action a8 { doc /* releasing the next outbound wave @S147 */ }
            perform action a9 { doc /* reviews unresolved holds @S159 */ }
            perform action a10 { doc /* assigns an escalation @S159 */ }
            perform action a11 { doc /* confirms that a delayed task will not compromise a later outbound wave or an aisle access limit @S160 */ }
            perform action a12 { doc /* releases normal work @S171 */ }
            perform action a13 { doc /* verifies that personnel are clear of the boundary @S175 */ }
            perform action a14 { doc /* authorizing recovery work @S175 */ }
            perform action a15 { doc /* reconciles outstanding exceptions, maintenance holds, and access constraints @S192 */ }
            perform action a16 { doc /* releasing normal work @S192 */ }
            perform action a17 { doc /* reviews open alarms, equipment status, and the previous shift's unresolved work @S198 */ }
            perform action a18 { doc /* confirms that operators understand current speed limits, exclusion boundaries, and stop-work criteria @S199 */ }
            perform action a19 { doc /* compares reported downtime with control-system event records at each shift review @S214 */ }
            perform action a20 { doc /* confirms that acceptance evidence is complete and that any remaining limitations are documented @S222 */ }
        }
        part wavePlanning : WavePlanning {
            perform action a0 { doc /* accounts for pallet identity, destination, due time, and the available staging positions @S102 */ }
        }
        part wavePreparation : WavePreparation {
            perform action a0 { doc /* has begun @S105 */ }
        }
        part westTransferConveyor : WestTransferConveyor {
            perform action a0 { doc /* carries pallets along its designated transfer route @S011 */ }
            perform action a1 { doc /* carries pallets along the western approach to the transfer area @S077 */ }
            perform action a2 { doc /* provide designated interfaces for moving pallets between vehicle travel and outbound staging @S119 */ }
            perform action a3 { doc /* provide separate routes for moving pallets between operating areas @S135 */ }
            perform action a4 { doc /* moving pallets between operating areas @S135 */ }
            perform action a5 { doc /* moving pallets between operating areas @S135 */ }
            perform action a6 { doc /* could compromise the boundary @S189 */ }
            exhibit state modes {
                state s0 { doc /* stopped @S189 */ }
            }
        }
        part workRequests : WorkRequests {
            perform action a0 { doc /* should include a unique task reference, a destination, and any operating constraints needed for safe execution @S126 */ }
        }
        part yardGateController : YardGateController {
            perform action a0 { doc /* controls vehicle access at the facility perimeter @S014 */ }
            perform action a1 { doc /* records vehicle identity, carrier, trailer number, and arrival time @S028 */ }
            perform action a2 { doc /* directs each cleared trailer from staging to its assigned receiving door @S039 */ }
            perform action a3 { doc /* validates arriving vehicle information against the active receiving plan @S127 */ }
            perform action a4 { doc /* directing a vehicle onward @S127 */ }
            perform action a5 { doc /* records unresolved discrepancies for review @S128 */ }
            perform action a6 { doc /* prevents an affected vehicle from proceeding @S128 */ }
            perform action a7 { doc /* uses the exception note @S129 */ }
            perform action a8 { doc /* manage a receiving discrepancy at the gate @S129 */ }
            perform action a9 { doc /* applies the yard exception by holding affected vehicle movements outside the recovery boundary @S179 */ }
            perform action a10 { doc /* holding affected vehicle movements outside the recovery boundary @S179 */ }
        }
        part yardPersonnel : YardPersonnel {
            perform action a0 { doc /* notify receiving staff when a trailer is ready to leave the door and return to the yard route @S047 */ }
        }
        part yardTraffic : YardTraffic {
            exhibit state modes {
                state s0 { doc /* controlled access @S180 */ }
            }
        }
        flow f0 of AuthorizedReleaseItem from warehouseManagementSystem to equipment { doc /* @S021 */ }
        flow f1 of TrailerReadinessToLeaveTheDoorAndReturnToTheYardRouteItem from yardPersonnel to receivingStaff { doc /* @S047 */ }
        flow f2 of MeasuredDimensionsItem from palletDimensionScanner to warehouseManagementSystem { doc /* @S073 */ }
        flow f3 of PalletsItem from eastTransferConveyor to transferArea { doc /* @S076 */ }
        flow f4 of PalletsItem from westTransferConveyor to transferArea { doc /* @S077 */ }
        flow f5 of DispatchWaveAmendmentItem from warehouseManagementSystem to outboundDispatchSorter { doc /* @S106 */ }
        flow f6 of TrailerSealExceptionNoteItem from inboundInspectionDesk to yardGateController { doc /* @S129 */ }
        flow f7 of MeasurementsItem from palletDimensionScanner to measurements { doc /* @S133 */ }
        flow f8 of WorkItem from autonomousForkliftFleet to autonomousForkliftFleet { doc /* @S136 */ }
        flow f9 of OperatingAvailabilityItem from northAisleStackerCrane to southAisleStackerCrane { doc /* @S137 */ }
        flow f10 of OperatingAvailabilityItem from southAisleStackerCrane to southAisleStackerCrane { doc /* @S137 */ }
        flow f11 of SafetyStatusItem from fireAlarmPanel to safetyZoneController { doc /* @S146 */ }
        flow f12 of SafetyStatusItem from safetyZoneController to safetyZoneController { doc /* @S146 */ }
        flow f13 of OversizeLoadAdvisoryItem from palletDimensionScanner to inboundInspectionDesk { doc /* @S151 */ }
        flow f14 of SlotReservationReceiptItem from warehouseManagementSystem to northAisleStackerCrane { doc /* @S154 */ }
        flow f15 of OversizeLoadAdvisoryItem from palletDimensionScanner to warehouseManagementSystem { doc /* @S156 */ }
        flow f16 of AisleOccupancySnapshotItem from northAisleStackerCrane to warehouseManagementSystem { doc /* @S177 */ }
        flow f17 of TransferInductionTicketItem from conveyorLineController to autonomousForkliftFleet { doc /* @S200 */ }
        flow f18 of SprinklerZoneInhibitNoticeItem from nULLPart to safetyZoneController { doc /* @S204 */ }
        flow f19 of ForkliftHandoffConfirmationItem from autonomousForkliftFleet to warehouseManagementSystem { doc /* @S225 */ }
        flow f20 of CraneServiceReleaseCardItem from maintenanceReleaseTerminal to northAisleStackerCrane { doc /* @S228 */ }
        flow f21 of EquipmentRestrictionsItem from autonomousForkliftFleet to nextShift { doc /* @S233 */ }
    }
    requirement def R0 { doc /* No equipment may begin inventory-moving work without an authorized release from the Warehouse Management System. @S021 */ subject s : Equipment; }
    requirement def R1 { doc /* Work requests should include a unique task reference, a destination, and any operating constraints needed for safe execution. @S126 */ subject s : WorkRequests; }
    requirement def R2 { doc /* the pallet can proceed, requires rework, or must remain held @S151 */ subject s : Pallet; }
    requirement def R3 { doc /* a delayed task will not compromise a later outbound wave or an aisle access limit @S160 */ subject s : DelayedTask; }
    requirement def R4 { doc /* any repair work required before equipment can return to service @S191 */ subject s : Equipment; }
}
