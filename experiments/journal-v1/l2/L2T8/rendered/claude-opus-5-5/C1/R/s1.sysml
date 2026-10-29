package L2Model {
    item def DispatchWaveAmendmentItem { doc /* @S106 */ }
    item def TrailerReadyNotificationItem { doc /* @S047 */ }
    part def AutonomousForkliftFleet { doc /* @S013,S109,S113,S114,S115,S136,S190,S200,S233 */ }
    part def ControlRecord { doc /* @S158 */ }
    part def ConveyorLineController { doc /* @S012,S078,S079,S080,S087,S088,S090,S098,S134,S169,S176,S212,S232 */ }
    part def Drivers { doc /* @S030 */ }
    part def EastTransferConveyor { doc /* @S010,S076,S119,S135,S189,S210 */ }
    part def FireAlarmPanel { doc /* @S025,S117,S146,S170,S173 */ }
    part def HeldPallet { doc /* @S152 */ }
    part def InboundInspectionDesk { doc /* @S004,S033,S036,S045,S131,S151,S231,S237 */ }
    part def InboundPalletBuffer { doc /* @S006,S132,S153,S188 */ }
    part def IncomingShift { doc /* @S243 */ }
    part def MaintenanceReleaseTerminal { doc /* @S026,S140,S164,S191,S234 */ }
    part def NorthAisleStackerCrane { doc /* @S008,S063,S092,S095,S137,S154,S155,S162,S163,S165,S206,S228 */ }
    part def OutboundCheckweighScale { doc /* @S016,S144,S167 */ }
    part def OutboundDispatchSorter { doc /* @S015,S106,S107,S121,S143,S237 */ }
    part def OutgoingShift { doc /* @S243 */ }
    part def OversizeLoadAdvisory { doc /* @S071 */ }
    part def Pallet { doc /* @S075 */ }
    part def PalletDimensionScanner { doc /* @S005,S068,S070,S120,S133,S207 */ }
    part def Personnel { doc /* @S163,S184 */ }
    part def PresenceSensors { doc /* @S083 */ }
    part def ReceivingStaff { doc /* @S043,S047 */ }
    part def RecoveryPlan { doc /* @S181 */ }
    part def SafetyZoneController { doc /* @S024,S146,S170,S173,S174,S187,S204 */ }
    part def ServiceReadiness { doc /* @S161 */ }
    part def ShippingDocumentationDesk { doc /* @S017,S122,S145,S226 */ }
    part def SlotReservationReceipt { doc /* @S059 */ }
    part def SouthAisleStackerCrane { doc /* @S009,S064,S137,S182,S183 */ }
    part def Spotter { doc /* @S185 */ }
    part def StackerCrane { doc /* @S061 */ }
    part def Staff { doc /* @S034 */ }
    part def TransferInductionTicket { doc /* @S089 */ }
    part def Variance { doc /* @S168 */ }
    part def Vehicle { doc /* @S110,S112,S118 */ }
    part def WarehouseManagementSystem { doc /* @S020,S041,S042,S052,S057,S073,S101,S103,S105,S106,S124,S142,S156,S157,S177,S178,S197,S225,S230 */ }
    part def WarehouseOperationsSupervisor { doc /* @S018,S049,S074,S097,S123,S138,S147,S159,S160,S171,S175,S192,S198,S199,S214,S222,S239 */ }
    part def WestTransferConveyor { doc /* @S011,S077,S119,S135,S189 */ }
    part def YardGateController { doc /* @S014,S028,S039,S127,S128,S129,S179 */ }
    part def YardPersonnel { doc /* @S047 */ }
    part def YardTraffic { doc /* @S180 */ }
    part system {
        part autonomousForkliftFleet : AutonomousForkliftFleet {
            perform action a0 { doc /* moves pallets @S013 */ }
            perform action a1 { doc /* accepts work @S109 */ }
            perform action a2 { doc /* limits speed and turning rates @S113 */ }
            perform action a3 { doc /* assembles the data needed to document each completed transfer and its receiving position @S114 */ }
            perform action a4 { doc /* produces the Forklift Handoff Confirmation @S115 */ }
            perform action a5 { doc /* receives work @S136 */ }
            perform action a6 { doc /* receives a hold instruction for routes that approach the recovery area @S190 */ }
            perform action a7 { doc /* receives the Transfer Induction Ticket @S200 */ }
            perform action a8 { doc /* validates its destination against the assigned route @S200 */ }
            perform action a9 { doc /* parks its vehicles in approved locations @S233 */ }
            perform action a10 { doc /* reports any remaining equipment restrictions for the next shift @S233 */ }
        }
        part controlRecord : ControlRecord {
            perform action a0 { doc /* identifies the hold reason @S158 */ }
            perform action a1 { doc /* retains the pallet's last confirmed location @S158 */ }
        }
        part conveyorLineController : ConveyorLineController {
            perform action a0 { doc /* coordinates conveyor movement @S012 */ }
            perform action a1 { doc /* sequences pallet movement across the available conveyor sections @S078 */ }
            perform action a2 { doc /* uses conveyor status and transfer-point signals @S079 */ }
            perform action a3 { doc /* maintains a separate sequence for each active conveyor path @S080 */ }
            perform action a4 { doc /* grants passage to one approaching pallet at a time @S087 */ }
            perform action a5 { doc /* produces the Transfer Induction Ticket @S088 */ }
            perform action a6 { doc /* checks that required induction fields are present @S090 */ }
            perform action a7 { doc /* releasing the pallet from the transfer point @S090 */ }
            perform action a8 { doc /* verifies transfer-point readiness @S098 */ }
            perform action a9 { doc /* resuming the held sequence @S098 */ }
            perform action a10 { doc /* coordinates conveyor movement @S134 */ }
            perform action a11 { doc /* stops affected equipment @S134 */ }
            perform action a12 { doc /* holds affected transfers @S169 */ }
            perform action a13 { doc /* holds transfers that could feed material into the isolated area @S176 */ }
            perform action a14 { doc /* inhibits feed if the restart cycle is incomplete or a protective device changes state @S212 */ }
            perform action a15 { doc /* verifies that conveyor zones are clear @S232 */ }
            perform action a16 { doc /* records the completion of its assigned closing checks @S232 */ }
        }
        part drivers : Drivers {
            perform action a0 { doc /* follow the gate instructions to the designated staging lane @S030 */ }
        }
        part eastTransferConveyor : EastTransferConveyor {
            perform action a0 { doc /* carries pallets @S010 */ }
            perform action a1 { doc /* carries pallets along the eastern approach to the transfer area @S076 */ }
            perform action a2 { doc /* provide designated interfaces for moving pallets between vehicle travel and outbound staging @S119 */ }
            perform action a3 { doc /* provide separate routes for moving pallets between operating areas @S135 */ }
            perform action a4 { doc /* demonstrates a controlled restart by running empty at reduced speed for one complete cycle @S210 */ }
            perform action a5 { doc /* accepting a pallet @S210 */ }
            exhibit state modes {
                state s0 { doc /* stopped @S189 */ }
            }
        }
        part fireAlarmPanel : FireAlarmPanel {
            perform action a0 { doc /* provides facility alarm status @S025 */ }
            perform action a1 { doc /* produces the Sprinkler Zone Inhibit Notice @S117 */ }
            perform action a2 { doc /* provide safety status @S146 */ }
            perform action a3 { doc /* stop or restrict movement @S170 */ }
            perform action a4 { doc /* stop or restrict movement @S173 */ }
        }
        part heldPallet : HeldPallet {
            exhibit state modes {
                state s0 { doc /* separated from available stock @S152 */ }
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
        part incomingShift : IncomingShift {
            perform action a0 { doc /* acknowledges remaining restrictions and unresolved concerns @S243 */ }
            perform action a1 { doc /* authorizing routine movements @S243 */ }
        }
        part maintenanceReleaseTerminal : MaintenanceReleaseTerminal {
            perform action a0 { doc /* records equipment availability @S026 */ }
            perform action a1 { doc /* produces the Crane Service Release Card @S140 */ }
            perform action a2 { doc /* records the inspection outcome and the identity of the person authorizing a return to operation @S164 */ }
            perform action a3 { doc /* records the inspection outcome and any repair work required @S191 */ }
            perform action a4 { doc /* records completed service work @S234 */ }
            perform action a5 { doc /* confirms that equipment restrictions remain visible until formally cleared @S234 */ }
        }
        part northAisleStackerCrane : NorthAisleStackerCrane {
            perform action a0 { doc /* performs assigned storage and retrieval work @S008 */ }
            perform action a1 { doc /* serves storage positions in the north aisle @S063 */ }
            perform action a2 { doc /* follows the aisle's configured travel limits @S063 */ }
            perform action a3 { doc /* sends the Aisle Occupancy Snapshot @S092 */ }
            perform action a4 { doc /* updates its reported condition @S095 */ }
            perform action a5 { doc /* report operating availability @S137 */ }
            perform action a6 { doc /* uses the Slot Reservation Receipt to confirm that its assigned destination remains reserved @S154 */ }
            perform action a7 { doc /* checks its current task state @S155 */ }
            perform action a8 { doc /* stops if the destination or access path is no longer valid @S155 */ }
            perform action a9 { doc /* reports a fault @S162 */ }
            perform action a10 { doc /* verifies aisle clearance @S206 */ }
            perform action a11 { doc /* resuming a stored-pallet movement @S206 */ }
            perform action a12 { doc /* stops if an obstruction is detected @S206 */ }
            perform action a13 { doc /* accepts the release card as authorization to return to service @S228 */ }
            exhibit state modes {
                state s0 { doc /* inhibited @S165 */ }
                state s1 { doc /* unavailable @S163 */ }
            }
        }
        part outboundCheckweighScale : OutboundCheckweighScale {
            perform action a0 { doc /* verifies pallet weight @S016 */ }
            perform action a1 { doc /* verifies shipment weight @S144 */ }
            perform action a2 { doc /* produces the Gross Weight Variance Slip @S167 */ }
        }
        part outboundDispatchSorter : OutboundDispatchSorter {
            perform action a0 { doc /* organizes eligible pallets @S015 */ }
            perform action a1 { doc /* receives the Dispatch Wave Amendment @S106 */ }
            perform action a2 { doc /* applies its authorized changes to outbound staging @S106 */ }
            perform action a3 { doc /* preserves committed pallet order @S107 */ }
            perform action a4 { doc /* verifies that staging positions match the current outbound plan @S121 */ }
            perform action a5 { doc /* organizes completed pallets @S143 */ }
            perform action a6 { doc /* confirm that their operating interfaces are available and that exceptions can be held safely @S237 */ }
        }
        part outgoingShift : OutgoingShift {
            perform action a0 { doc /* records remaining restrictions and unresolved concerns @S243 */ }
        }
        part oversizeLoadAdvisory : OversizeLoadAdvisory {
            perform action a0 { doc /* identifies a measured profile that exceeds an applicable storage or handling limit @S071 */ }
        }
        part pallet : Pallet {
            perform action a0 { doc /* enter the conveyor area @S075 */ }
        }
        part palletDimensionScanner : PalletDimensionScanner {
            perform action a0 { doc /* captures dimensions @S005 */ }
            perform action a1 { doc /* measures pallet height, width, and length @S068 */ }
            perform action a2 { doc /* produces the Oversize Load Advisory @S070 */ }
            perform action a3 { doc /* support route and handling decisions @S120 */ }
            perform action a4 { doc /* supplies measurements @S133 */ }
            perform action a5 { doc /* checks each pallet profile against configured dimensional limits @S207 */ }
            perform action a6 { doc /* flags measurements outside tolerance @S207 */ }
        }
        part personnel : Personnel {
            perform action a0 { doc /* inspect the fault @S163 */ }
            perform action a1 { doc /* verify that adjacent equipment can continue safely @S163 */ }
            exhibit state modes {
                state s0 { doc /* outside the crane travel envelope @S184 */ }
            }
        }
        part presenceSensors : PresenceSensors {
            perform action a0 { doc /* confirm that a pallet has reached the expected position @S083 */ }
        }
        part receivingStaff : ReceivingStaff {
            perform action a0 { doc /* compare the physical pallet count with the shipment paperwork @S043 */ }
        }
        part recoveryPlan : RecoveryPlan {
            perform action a0 { doc /* identifies the permitted travel envelope, the expected stopping point, and the conditions that require an immediate stop @S181 */ }
        }
        part safetyZoneController : SafetyZoneController {
            perform action a0 { doc /* enforces movement restrictions @S024 */ }
            perform action a1 { doc /* provide safety status @S146 */ }
            perform action a2 { doc /* stop or restrict movement @S170 */ }
            perform action a3 { doc /* stop or restrict movement @S173 */ }
            perform action a4 { doc /* establishes a controlled boundary around the affected aisle @S174 */ }
            perform action a5 { doc /* prevents new equipment from entering it @S174 */ }
            perform action a6 { doc /* maintains the boundary @S187 */ }
            perform action a7 { doc /* applies the Sprinkler Zone Inhibit Notice @S204 */ }
            perform action a8 { doc /* maintaining the specified exclusion boundary until release criteria are met @S204 */ }
        }
        part serviceReadiness : ServiceReadiness;
        part shippingDocumentationDesk : ShippingDocumentationDesk {
            perform action a0 { doc /* prepares the records required for outbound loads @S017 */ }
            perform action a1 { doc /* prepares shipment records @S122 */ }
            perform action a2 { doc /* prepares shipment records @S145 */ }
            perform action a3 { doc /* receives and reconciles the Gross Weight Variance Slip against the applicable shipment record @S226 */ }
            perform action a4 { doc /* completing its paperwork @S226 */ }
        }
        part slotReservationReceipt : SlotReservationReceipt {
            perform action a0 { doc /* identifies the selected position and the conditions @S059 */ }
        }
        part southAisleStackerCrane : SouthAisleStackerCrane {
            perform action a0 { doc /* performs assigned storage and retrieval work @S009 */ }
            perform action a1 { doc /* serves its assigned storage positions @S064 */ }
            perform action a2 { doc /* report operating availability @S137 */ }
            perform action a3 { doc /* performs a controlled recovery maneuver at reduced speed within the isolated aisle @S182 */ }
            perform action a4 { doc /* uses only the travel needed to reach a stable position or clear the obstruction under review @S183 */ }
        }
        part spotter : Spotter {
            perform action a0 { doc /* observe from a protected location @S185 */ }
        }
        part stackerCrane : StackerCrane {
            perform action a0 { doc /* retrieves and stores pallets within its assigned aisle boundaries @S061 */ }
        }
        part staff : Staff {
            perform action a0 { doc /* verify trailer identification @S034 */ }
            perform action a1 { doc /* inspect accessible seals @S034 */ }
        }
        part transferInductionTicket : TransferInductionTicket {
            perform action a0 { doc /* carries the identifiers and routing details @S089 */ }
        }
        part variance : Variance {
            exhibit state modes {
                state s0 { doc /* unresolved @S168 */ }
            }
        }
        part vehicle : Vehicle {
            perform action a0 { doc /* selects an available task @S110 */ }
            perform action a1 { doc /* confirm pallet identity and pickup location @S112 */ }
            perform action a2 { doc /* lifting a load @S112 */ }
            perform action a3 { doc /* stop or reroute @S118 */ }
        }
        part warehouseManagementSystem : WarehouseManagementSystem {
            perform action a0 { doc /* maintains the authoritative status, location, and handling eligibility of each controlled pallet @S020 */ }
            perform action a1 { doc /* maintains the expected inbound shipment data @S041 */ }
            perform action a2 { doc /* sends the Dispatch Wave Amendment @S042 */ }
            perform action a3 { doc /* evaluates available positions against pallet dimensions, mass, storage compatibility, and expected retrieval demand @S052 */ }
            perform action a4 { doc /* produces the Slot Reservation Receipt @S057 */ }
            perform action a5 { doc /* retain the measured dimensions with the pallet's inventory record @S073 */ }
            perform action a6 { doc /* establishes the intended shipment window and loading priorities @S101 */ }
            perform action a7 { doc /* checks that planned pallet moves remain consistent with outbound capacity and current inventory records @S103 */ }
            perform action a8 { doc /* issues a Dispatch Wave Amendment @S105 */ }
            perform action a9 { doc /* maintains the authoritative task state @S124 */ }
            perform action a10 { doc /* reconciles work across operating areas @S142 */ }
            perform action a11 { doc /* preserves a consistent view of task status and outstanding constraints @S142 */ }
            perform action a12 { doc /* consumes the load advisory @S156 */ }
            perform action a13 { doc /* apply the required handling constraints to affected work @S156 */ }
            perform action a14 { doc /* prevents an incompatible allocation from being released @S157 */ }
            perform action a15 { doc /* receives the occupancy snapshot for recovery planning @S177 */ }
            perform action a16 { doc /* reconciles its location records with available sensor data @S178 */ }
            perform action a17 { doc /* presents a recovery plan @S178 */ }
            perform action a18 { doc /* records transaction times @S197 */ }
            perform action a19 { doc /* reconciles completed movements against the active shift plan @S197 */ }
            perform action a20 { doc /* uses the handoff confirmation to close the applicable movement record @S225 */ }
            perform action a21 { doc /* closes the commissioning action register @S230 */ }
        }
        part warehouseOperationsSupervisor : WarehouseOperationsSupervisor {
            perform action a0 { doc /* oversees exceptions, operational priorities, and recovery decisions @S018 */ }
            perform action a1 { doc /* resolves receiving issues @S049 */ }
            perform action a2 { doc /* review unresolved allocation conditions @S074 */ }
            perform action a3 { doc /* review persistent holds @S097 */ }
            perform action a4 { doc /* reviews delayed tasks, abnormal vehicle stops, and unresolved staging constraints @S123 */ }
            perform action a5 { doc /* releasing the next outbound wave @S123 */ }
            perform action a6 { doc /* defer work @S138 */ }
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
            perform action a19 { doc /* compares reported downtime with control-system event records @S214 */ }
            perform action a20 { doc /* confirms that acceptance evidence is complete and that any remaining limitations are documented @S222 */ }
            perform action a21 { doc /* Emergency changes are documented promptly and reviewed @S239 */ }
        }
        part westTransferConveyor : WestTransferConveyor {
            perform action a0 { doc /* carries pallets @S011 */ }
            perform action a1 { doc /* carries pallets along the western approach to the transfer area @S077 */ }
            perform action a2 { doc /* provide designated interfaces for moving pallets between vehicle travel and outbound staging @S119 */ }
            perform action a3 { doc /* provide separate routes for moving pallets between operating areas @S135 */ }
            exhibit state modes {
                state s0 { doc /* stopped @S189 */ }
            }
        }
        part yardGateController : YardGateController {
            perform action a0 { doc /* controls vehicle access @S014 */ }
            perform action a1 { doc /* records vehicle identity, carrier, trailer number, and arrival time @S028 */ }
            perform action a2 { doc /* directs each cleared trailer from staging to its assigned receiving door @S039 */ }
            perform action a3 { doc /* validates arriving vehicle information against the active receiving plan @S127 */ }
            perform action a4 { doc /* directing a vehicle onward @S127 */ }
            perform action a5 { doc /* records unresolved discrepancies for review @S128 */ }
            perform action a6 { doc /* prevents an affected vehicle from proceeding @S128 */ }
            perform action a7 { doc /* uses the exception note to manage a receiving discrepancy at the gate @S129 */ }
            perform action a8 { doc /* applies the yard exception @S179 */ }
            perform action a9 { doc /* holding affected vehicle movements outside the recovery boundary @S179 */ }
        }
        part yardPersonnel : YardPersonnel {
            perform action a0 { doc /* notify receiving staff @S047 */ }
        }
        part yardTraffic : YardTraffic {
            exhibit state modes {
                state s0 { doc /* controlled access @S180 */ }
            }
        }
        flow f0 of TrailerReadyNotificationItem from yardPersonnel to receivingStaff { doc /* @S047 */ }
        flow f1 of DispatchWaveAmendmentItem from warehouseManagementSystem to outboundDispatchSorter { doc /* @S106 */ }
    }
    requirement def R0 { doc /* Service readiness requires a recorded fault state, a controlled work area, and a clear separation between maintenance activity and live movement. @S161 */ subject s : ServiceReadiness; }
}
