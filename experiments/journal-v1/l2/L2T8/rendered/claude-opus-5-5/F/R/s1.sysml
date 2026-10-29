package L2Model {
    item def AisleOccupancySnapshotItem { doc /* @S092,S177 */ }
    item def CraneServiceReleaseCardItem { doc /* @S140,S228 */ }
    item def DispatchWaveAmendmentItem { doc /* @S042,S106 */ }
    item def ForkliftHandoffConfirmationItem { doc /* @S115,S225 */ }
    item def GrossWeightVarianceSlipItem { doc /* @S167,S226 */ }
    item def OversizeLoadAdvisoryItem { doc /* @S070 */ }
    item def SlotReservationReceiptItem { doc /* @S057 */ }
    item def SprinklerZoneInhibitNoticeItem { doc /* @S117,S204 */ }
    item def TrailerSealExceptionNoteItem { doc /* @S036,S129 */ }
    item def TransferInductionTicketItem { doc /* @S088,S200 */ }
    part def AutonomousForkliftFleet { doc /* @S013,S088,S109,S113,S115,S190,S200,S225,S233 */ }
    part def ConveyorLineController { doc /* @S012,S078,S079,S080,S088,S134,S169,S176,S200,S212,S232 */ }
    part def EastTransferConveyor { doc /* @S010,S076,S210 */ }
    part def FireAlarmPanel { doc /* @S025,S117,S170,S204 */ }
    part def InboundInspectionDesk { doc /* @S004,S033,S036,S045,S070,S129,S151,S231,S237 */ }
    part def InboundPalletBuffer { doc /* @S006 */ }
    part def MaintenanceReleaseTerminal { doc /* @S026,S140,S164,S191,S228,S234 */ }
    part def NorthAisleStackerCrane { doc /* @S008,S057,S063,S092,S095,S137,S140,S154,S155,S162,S163,S177,S206,S228 */ }
    part def OutboundCheckweighScale { doc /* @S016,S144,S167,S226 */ }
    part def OutboundDispatchSorter { doc /* @S015,S042,S106,S107,S121,S237 */ }
    part def PalletDimensionScanner { doc /* @S005,S068,S070,S133,S207 */ }
    part def SafetyZoneController { doc /* @S024,S117,S170,S174,S187,S204 */ }
    part def ShippingDocumentationDesk { doc /* @S017,S122,S167,S226 */ }
    part def SouthAisleStackerCrane { doc /* @S009,S064,S137,S182 */ }
    part def WarehouseManagementSystem { doc /* @S020,S021,S041,S042,S052,S057,S070,S073,S092,S103,S105,S106,S115,S124,S142,S156,S157,S177,S178,S197,S225,S230 */ }
    part def WarehouseOperationsSupervisor { doc /* @S018,S049,S074,S123,S138,S159,S160,S171,S175,S198,S199,S214,S222,S239 */ }
    part def WestTransferConveyor { doc /* @S011,S077 */ }
    part def WorkRequests { doc /* @S126 */ }
    part def YardGateController { doc /* @S014,S028,S031,S036,S039,S127,S128,S129,S179 */ }
    part system {
        part autonomousForkliftFleet : AutonomousForkliftFleet {
            perform action a0 { doc /* moves pallets only within approved travel areas @S013 */ }
            perform action a1 { doc /* accepts work @S109 */ }
            perform action a2 { doc /* limits speed and turning rates @S113 */ }
            perform action a3 { doc /* produces the Forklift Handoff Confirmation @S115 */ }
            perform action a4 { doc /* receives a hold instruction @S190 */ }
            perform action a5 { doc /* validates its destination against the assigned route @S200 */ }
            perform action a6 { doc /* parks its vehicles in approved locations @S233 */ }
            perform action a7 { doc /* reports any remaining equipment restrictions @S233 */ }
        }
        part conveyorLineController : ConveyorLineController {
            perform action a0 { doc /* coordinates conveyor movement @S012 */ }
            perform action a1 { doc /* sequences pallet movement across the available conveyor sections @S078 */ }
            perform action a2 { doc /* uses conveyor status and transfer-point signals @S079 */ }
            perform action a3 { doc /* maintains a separate sequence for each active conveyor path @S080 */ }
            perform action a4 { doc /* produces the Transfer Induction Ticket @S088 */ }
            perform action a5 { doc /* stops affected equipment @S134 */ }
            perform action a6 { doc /* holds affected transfers @S169 */ }
            perform action a7 { doc /* holds transfers that could feed material into the isolated area @S176 */ }
            perform action a8 { doc /* inhibits feed @S212 */ }
            perform action a9 { doc /* verifies that conveyor zones are clear @S232 */ }
            perform action a10 { doc /* records the completion of its assigned closing checks @S232 */ }
        }
        part eastTransferConveyor : EastTransferConveyor {
            perform action a0 { doc /* carries pallets along its designated transfer route @S010 */ }
            perform action a1 { doc /* carries pallets along the eastern approach @S076 */ }
            perform action a2 { doc /* demonstrates a controlled restart @S210 */ }
        }
        part fireAlarmPanel : FireAlarmPanel {
            perform action a0 { doc /* provides facility alarm status @S025 */ }
            perform action a1 { doc /* produces the Sprinkler Zone Inhibit Notice @S117 */ }
            perform action a2 { doc /* stop or restrict movement @S170 */ }
        }
        part inboundInspectionDesk : InboundInspectionDesk {
            perform action a0 { doc /* records inspection outcomes @S004 */ }
            perform action a1 { doc /* checks delivery paperwork against the expected shipment @S033 */ }
            perform action a2 { doc /* sends the Trailer Seal Exception Note @S036 */ }
            perform action a3 { doc /* records inspection results promptly @S045 */ }
            perform action a4 { doc /* records whether the pallet can proceed, requires rework, or must remain held @S151 */ }
            perform action a5 { doc /* records governance approval @S231 */ }
            perform action a6 { doc /* confirm that their operating interfaces are available @S237 */ }
        }
        part inboundPalletBuffer : InboundPalletBuffer {
            perform action a0 { doc /* holds accepted pallets temporarily @S006 */ }
        }
        part maintenanceReleaseTerminal : MaintenanceReleaseTerminal {
            perform action a0 { doc /* records equipment availability @S026 */ }
            perform action a1 { doc /* produces the Crane Service Release Card @S140 */ }
            perform action a2 { doc /* records the inspection outcome and the identity of the person authorizing a return to operation @S164 */ }
            perform action a3 { doc /* records the inspection outcome and any repair work required @S191 */ }
            perform action a4 { doc /* records completed service work @S234 */ }
        }
        part northAisleStackerCrane : NorthAisleStackerCrane {
            perform action a0 { doc /* performs assigned storage and retrieval work @S008 */ }
            perform action a1 { doc /* serves storage positions in the north aisle @S063 */ }
            perform action a2 { doc /* sends the Aisle Occupancy Snapshot @S092 */ }
            perform action a3 { doc /* updates its reported condition @S095 */ }
            perform action a4 { doc /* report operating availability @S137 */ }
            perform action a5 { doc /* uses the Slot Reservation Receipt @S154 */ }
            perform action a6 { doc /* checks its current task state @S155 */ }
            perform action a7 { doc /* reports a fault @S162 */ }
            perform action a8 { doc /* verifies aisle clearance @S206 */ }
            perform action a9 { doc /* accepts the release card as authorization to return to service @S228 */ }
            exhibit state modes {
                state s0 { doc /* service @S228 */ }
                state s1 { doc /* unavailable @S163 */ }
            }
        }
        part outboundCheckweighScale : OutboundCheckweighScale {
            perform action a0 { doc /* verifies pallet weight @S016 */ }
            perform action a1 { doc /* verifies shipment weight @S144 */ }
            perform action a2 { doc /* produces the Gross Weight Variance Slip @S167 */ }
        }
        part outboundDispatchSorter : OutboundDispatchSorter {
            perform action a0 { doc /* organizes eligible pallets for their assigned dispatch sequence @S015 */ }
            perform action a1 { doc /* applies its authorized changes to outbound staging @S106 */ }
            perform action a2 { doc /* preserves committed pallet order @S107 */ }
            perform action a3 { doc /* verifies that staging positions match the current outbound plan @S121 */ }
            perform action a4 { doc /* confirm that their operating interfaces are available @S237 */ }
        }
        part palletDimensionScanner : PalletDimensionScanner {
            perform action a0 { doc /* captures dimensions @S005 */ }
            perform action a1 { doc /* measures pallet height, width, and length @S068 */ }
            perform action a2 { doc /* produces the Oversize Load Advisory @S070 */ }
            perform action a3 { doc /* supplies measurements @S133 */ }
            perform action a4 { doc /* checks each pallet profile against configured dimensional limits @S207 */ }
            perform action a5 { doc /* flags measurements outside tolerance @S207 */ }
        }
        part safetyZoneController : SafetyZoneController {
            perform action a0 { doc /* enforces movement restrictions in designated protected areas @S024 */ }
            perform action a1 { doc /* stop or restrict movement @S170 */ }
            perform action a2 { doc /* establishes a controlled boundary around the affected aisle @S174 */ }
            perform action a3 { doc /* maintains the boundary @S187 */ }
            perform action a4 { doc /* applies the Sprinkler Zone Inhibit Notice @S204 */ }
        }
        part shippingDocumentationDesk : ShippingDocumentationDesk {
            perform action a0 { doc /* prepares the records required for outbound loads @S017 */ }
            perform action a1 { doc /* prepares shipment records @S122 */ }
            perform action a2 { doc /* reconciles the Gross Weight Variance Slip against the applicable shipment record @S226 */ }
        }
        part southAisleStackerCrane : SouthAisleStackerCrane {
            perform action a0 { doc /* performs assigned storage and retrieval work @S009 */ }
            perform action a1 { doc /* serves its assigned storage positions @S064 */ }
            perform action a2 { doc /* report operating availability @S137 */ }
            perform action a3 { doc /* performs a controlled recovery maneuver at reduced speed @S182 */ }
        }
        part warehouseManagementSystem : WarehouseManagementSystem {
            perform action a0 { doc /* maintains the authoritative status, location, and handling eligibility of each controlled pallet @S020 */ }
            perform action a1 { doc /* maintains the expected inbound shipment data @S041 */ }
            perform action a2 { doc /* sends the Dispatch Wave Amendment @S042 */ }
            perform action a3 { doc /* evaluates available positions @S052 */ }
            perform action a4 { doc /* produces the Slot Reservation Receipt @S057 */ }
            perform action a5 { doc /* retain the measured dimensions @S073 */ }
            perform action a6 { doc /* checks that planned pallet moves remain consistent with outbound capacity @S103 */ }
            perform action a7 { doc /* issues a Dispatch Wave Amendment @S105 */ }
            perform action a8 { doc /* maintains the authoritative task state @S124 */ }
            perform action a9 { doc /* reconciles work across operating areas @S142 */ }
            perform action a10 { doc /* consumes the load advisory @S156 */ }
            perform action a11 { doc /* prevents an incompatible allocation from being released @S157 */ }
            perform action a12 { doc /* reconciles its location records with available sensor data @S178 */ }
            perform action a13 { doc /* records transaction times and reconciles completed movements @S197 */ }
            perform action a14 { doc /* uses the handoff confirmation to close the applicable movement record @S225 */ }
            perform action a15 { doc /* closes the commissioning action register @S230 */ }
        }
        part warehouseOperationsSupervisor : WarehouseOperationsSupervisor {
            perform action a0 { doc /* oversees exceptions, operational priorities, and recovery decisions @S018 */ }
            perform action a1 { doc /* resolves receiving issues @S049 */ }
            perform action a2 { doc /* review unresolved allocation conditions @S074 */ }
            perform action a3 { doc /* reviews delayed tasks, abnormal vehicle stops, and unresolved staging constraints @S123 */ }
            perform action a4 { doc /* defer work @S138 */ }
            perform action a5 { doc /* reviews unresolved holds and assigns an escalation @S159 */ }
            perform action a6 { doc /* confirms that a delayed task will not compromise a later outbound wave @S160 */ }
            perform action a7 { doc /* releases normal work @S171 */ }
            perform action a8 { doc /* verifies that personnel are clear of the boundary @S175 */ }
            perform action a9 { doc /* reviews open alarms, equipment status, and the previous shift's unresolved work @S198 */ }
            perform action a10 { doc /* confirms that operators understand current speed limits @S199 */ }
            perform action a11 { doc /* compares reported downtime with control-system event records @S214 */ }
            perform action a12 { doc /* confirms that acceptance evidence is complete @S222 */ }
            perform action a13 { doc /* reviewed emergency changes @S239 */ }
        }
        part westTransferConveyor : WestTransferConveyor {
            perform action a0 { doc /* carries pallets along its designated transfer route @S011 */ }
            perform action a1 { doc /* carries pallets along the western approach @S077 */ }
        }
        part workRequests : WorkRequests;
        part yardGateController : YardGateController {
            perform action a0 { doc /* controls vehicle access at the facility perimeter @S014 */ }
            perform action a1 { doc /* records vehicle identity, carrier, trailer number, and arrival time @S028 */ }
            perform action a2 { doc /* flags unscheduled arrivals for review @S031 */ }
            perform action a3 { doc /* directs each cleared trailer from staging to its assigned receiving door @S039 */ }
            perform action a4 { doc /* validates arriving vehicle information against the active receiving plan @S127 */ }
            perform action a5 { doc /* records unresolved discrepancies for review @S128 */ }
            perform action a6 { doc /* uses the exception note to manage a receiving discrepancy @S129 */ }
            perform action a7 { doc /* applies the yard exception by holding affected vehicle movements @S179 */ }
        }
        flow f0 of TrailerSealExceptionNoteItem from inboundInspectionDesk to yardGateController { doc /* @S036 */ }
        flow f1 of DispatchWaveAmendmentItem from warehouseManagementSystem to outboundDispatchSorter { doc /* @S042 */ }
        flow f2 of SlotReservationReceiptItem from warehouseManagementSystem to northAisleStackerCrane { doc /* @S057 */ }
        flow f3 of OversizeLoadAdvisoryItem from palletDimensionScanner to inboundInspectionDesk { doc /* @S070 */ }
        flow f4 of OversizeLoadAdvisoryItem from palletDimensionScanner to warehouseManagementSystem { doc /* @S070 */ }
        flow f5 of TransferInductionTicketItem from conveyorLineController to autonomousForkliftFleet { doc /* @S088 */ }
        flow f6 of AisleOccupancySnapshotItem from northAisleStackerCrane to warehouseManagementSystem { doc /* @S092 */ }
        flow f8 of ForkliftHandoffConfirmationItem from autonomousForkliftFleet to warehouseManagementSystem { doc /* @S115 */ }
        flow f9 of SprinklerZoneInhibitNoticeItem from fireAlarmPanel to safetyZoneController { doc /* @S117 */ }
        flow f11 of CraneServiceReleaseCardItem from maintenanceReleaseTerminal to northAisleStackerCrane { doc /* @S140 */ }
        flow f12 of GrossWeightVarianceSlipItem from outboundCheckweighScale to shippingDocumentationDesk { doc /* @S167 */ }
    }
    requirement def R0 { doc /* No equipment may begin inventory-moving work without an authorized release from the Warehouse Management System. @S021 */ subject s : WarehouseManagementSystem; }
    requirement def R1 { doc /* Work requests should include a unique task reference, a destination, and any operating constraints needed for safe execution. @S126 */ subject s : WorkRequests; }
}
