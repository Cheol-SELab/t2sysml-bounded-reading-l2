package L2Model {
    item def AisleOccupancySnapshotItem { doc /* @S092,S177 */ }
    item def CraneServiceReleaseCardItem { doc /* @S140,S228 */ }
    item def DispatchWaveAmendmentItem { doc /* @S042,S105 */ }
    item def ForkliftHandoffConfirmationItem { doc /* @S115,S225 */ }
    item def GrossWeightVarianceSlipItem { doc /* @S167,S226 */ }
    item def OversizeLoadAdvisoryItem { doc /* @S070 */ }
    item def SlotReservationReceiptItem { doc /* @S057 */ }
    item def SprinklerZoneInhibitNoticeItem { doc /* @S117,S204 */ }
    item def TrailerReadyToLeaveNotificationItem { doc /* @S047 */ }
    item def TrailerSealExceptionNoteItem { doc /* @S129 */ }
    item def TransferInductionTicketItem { doc /* @S088,S200 */ }
    part def AutonomousForkliftFleet { doc /* @S013,S088,S109,S113,S114,S115,S136,S190,S200,S225,S233 */ }
    part def ChangesToSoftwareEquipmentSettingsOrOperatingProcedures { doc /* @S238 */ }
    part def ConveyorLineController { doc /* @S012,S078,S079,S080,S087,S088,S090,S098,S134,S169,S176,S200,S212,S232 */ }
    part def Drivers { doc /* @S030 */ }
    part def EastTransferConveyor { doc /* @S010,S076,S119,S135,S189,S210 */ }
    part def FireAlarmPanel { doc /* @S025,S117,S146,S170,S204 */ }
    part def InboundInspectionDesk { doc /* @S004,S033,S036,S045,S129,S131,S151,S231,S237 */ }
    part def InboundPalletBuffer { doc /* @S006,S132,S188 */ }
    part def MaintenanceReleaseTerminal { doc /* @S026,S140,S164,S191,S228,S234 */ }
    part def NorthAisleStackerCrane { doc /* @S008,S057,S063,S092,S095,S137,S140,S154,S155,S162,S163,S177,S206,S228 */ }
    part def OutboundCheckweighScale { doc /* @S016,S144,S167,S226 */ }
    part def OutboundDispatchSorter { doc /* @S015,S042,S105,S106,S107,S121,S143,S237 */ }
    part def PalletDimensionScanner { doc /* @S005,S068,S070,S133,S207 */ }
    part def ReceivingStaff { doc /* @S043,S047 */ }
    part def SafetyZoneController { doc /* @S024,S117,S146,S170,S174,S187,S204 */ }
    part def ShippingDocumentationDesk { doc /* @S017,S122,S167,S226 */ }
    part def SouthAisleStackerCrane { doc /* @S009,S064,S137,S182 */ }
    part def Trailer { doc /* @S040 */ }
    part def WarehouseManagementSystem { doc /* @S020,S021,S041,S042,S052,S057,S070,S073,S092,S101,S103,S105,S115,S124,S142,S156,S157,S177,S178,S197,S225,S230 */ }
    part def WarehouseOperationsSupervisor { doc /* @S018,S049,S074,S097,S123,S138,S159,S160,S171,S175,S192,S198,S199,S214,S222,S239 */ }
    part def WestTransferConveyor { doc /* @S011,S077,S119,S135,S189 */ }
    part def WorkRequests { doc /* @S126 */ }
    part def YardGateController { doc /* @S014,S028,S039,S127,S128,S129,S179 */ }
    part def YardPersonnel { doc /* @S047 */ }
    part system {
        part autonomousForkliftFleet : AutonomousForkliftFleet {
            perform action a0 { doc /* moves pallets only within approved travel areas @S013 */ }
            perform action a1 { doc /* accepts work @S109 */ }
            perform action a2 { doc /* limits speed and turning rates @S113 */ }
            perform action a3 { doc /* assembles the data needed to document each completed transfer @S114 */ }
            perform action a4 { doc /* receives work @S136 */ }
            perform action a5 { doc /* validates its destination against the assigned route @S200 */ }
            perform action a6 { doc /* parks its vehicles in approved locations @S233 */ }
        }
        part changesToSoftwareEquipmentSettingsOrOperatingProcedures : ChangesToSoftwareEquipmentSettingsOrOperatingProcedures;
        part conveyorLineController : ConveyorLineController {
            perform action a0 { doc /* coordinates conveyor movement @S012 */ }
            perform action a1 { doc /* sequences pallet movement across the available conveyor sections @S078 */ }
            perform action a2 { doc /* uses conveyor status and transfer-point signals to determine when a pallet can advance @S079 */ }
            perform action a3 { doc /* maintains a separate sequence for each active conveyor path @S080 */ }
            perform action a4 { doc /* grants passage to one approaching pallet at a time @S087 */ }
            perform action a5 { doc /* checks that required induction fields are present @S090 */ }
            perform action a6 { doc /* verifies transfer-point readiness @S098 */ }
            perform action a7 { doc /* stops affected equipment @S134 */ }
            perform action a8 { doc /* holds affected transfers @S169 */ }
            perform action a9 { doc /* holds transfers that could feed material into the isolated area @S176 */ }
            perform action a10 { doc /* inhibits feed @S212 */ }
            perform action a11 { doc /* verifies that conveyor zones are clear and records the completion of its assigned closing checks @S232 */ }
        }
        part drivers : Drivers {
            perform action a0 { doc /* follow the gate instructions to the designated staging lane @S030 */ }
        }
        part eastTransferConveyor : EastTransferConveyor {
            perform action a0 { doc /* carries pallets along its designated transfer route @S010 */ }
            perform action a1 { doc /* carries pallets along the eastern approach to the transfer area @S076 */ }
            perform action a2 { doc /* provide designated interfaces for moving pallets between vehicle travel and outbound staging @S119 */ }
            perform action a3 { doc /* provide separate routes for moving pallets between operating areas @S135 */ }
            perform action a4 { doc /* running empty at reduced speed for one complete cycle @S210 */ }
            exhibit state modes {
                state s0 { doc /* stopped @S189 */ }
            }
        }
        part fireAlarmPanel : FireAlarmPanel {
            perform action a0 { doc /* stop or restrict movement @S170 */ }
        }
        part inboundInspectionDesk : InboundInspectionDesk {
            perform action a0 { doc /* records inspection outcomes @S004 */ }
            perform action a1 { doc /* checks delivery paperwork against the expected shipment @S033 */ }
            perform action a2 { doc /* confirms the trailer is presented for inspection @S033 */ }
            perform action a3 { doc /* records inspection results promptly @S045 */ }
            perform action a4 { doc /* records inspection outcomes @S131 */ }
            perform action a5 { doc /* records whether the pallet can proceed, requires rework, or must remain held @S151 */ }
            perform action a6 { doc /* records governance approval @S231 */ }
            perform action a7 { doc /* confirm that their operating interfaces are available @S237 */ }
        }
        part inboundPalletBuffer : InboundPalletBuffer {
            perform action a0 { doc /* holds accepted pallets temporarily @S006 */ }
            perform action a1 { doc /* provides a controlled staging point @S132 */ }
            exhibit state modes {
                state s0 { doc /* unavailable @S188 */ }
            }
        }
        part maintenanceReleaseTerminal : MaintenanceReleaseTerminal {
            perform action a0 { doc /* records equipment availability @S026 */ }
            perform action a1 { doc /* records the inspection outcome and the identity of the person authorizing a return to operation @S164 */ }
            perform action a2 { doc /* records the inspection outcome and any repair work required @S191 */ }
            perform action a3 { doc /* records completed service work @S234 */ }
        }
        part northAisleStackerCrane : NorthAisleStackerCrane {
            perform action a0 { doc /* performs assigned storage and retrieval work @S008 */ }
            perform action a1 { doc /* serves storage positions in the north aisle @S063 */ }
            perform action a2 { doc /* updates its reported condition @S095 */ }
            perform action a3 { doc /* uses the Slot Reservation Receipt to confirm that its assigned destination remains reserved @S154 */ }
            perform action a4 { doc /* checks its current task state @S155 */ }
            perform action a5 { doc /* verifies aisle clearance @S206 */ }
            exhibit state modes {
                state s0 { doc /* unavailable @S163 */ }
            }
        }
        part outboundCheckweighScale : OutboundCheckweighScale {
            perform action a0 { doc /* verifies pallet weight @S016 */ }
            perform action a1 { doc /* verifies shipment weight @S144 */ }
        }
        part outboundDispatchSorter : OutboundDispatchSorter {
            perform action a0 { doc /* organizes eligible pallets for their assigned dispatch sequence @S015 */ }
            perform action a1 { doc /* applies its authorized changes to outbound staging @S106 */ }
            perform action a2 { doc /* preserves committed pallet order @S107 */ }
            perform action a3 { doc /* verifies that staging positions match the current outbound plan @S121 */ }
            perform action a4 { doc /* organizes completed pallets according to the current shipping plan @S143 */ }
            perform action a5 { doc /* confirm that their operating interfaces are available @S237 */ }
        }
        part palletDimensionScanner : PalletDimensionScanner {
            perform action a0 { doc /* captures dimensions @S005 */ }
            perform action a1 { doc /* measures pallet height, width, and length @S068 */ }
            perform action a2 { doc /* supplies measurements @S133 */ }
            perform action a3 { doc /* checks each pallet profile against configured dimensional limits @S207 */ }
            perform action a4 { doc /* flags measurements outside tolerance @S207 */ }
        }
        part receivingStaff : ReceivingStaff {
            perform action a0 { doc /* compare the physical pallet count with the shipment paperwork @S043 */ }
        }
        part safetyZoneController : SafetyZoneController {
            perform action a0 { doc /* enforces movement restrictions in designated protected areas @S024 */ }
            perform action a1 { doc /* stop or restrict movement @S170 */ }
            perform action a2 { doc /* establishes a controlled boundary around the affected aisle @S174 */ }
            perform action a3 { doc /* prevents new equipment from entering it @S174 */ }
            perform action a4 { doc /* maintains the boundary @S187 */ }
            perform action a5 { doc /* maintaining the specified exclusion boundary @S204 */ }
        }
        part shippingDocumentationDesk : ShippingDocumentationDesk {
            perform action a0 { doc /* prepares the records required for outbound loads @S017 */ }
            perform action a1 { doc /* prepares shipment records from the confirmed pallet and destination data @S122 */ }
            perform action a2 { doc /* reconciles the Gross Weight Variance Slip against the applicable shipment record @S226 */ }
        }
        part southAisleStackerCrane : SouthAisleStackerCrane {
            perform action a0 { doc /* performs assigned storage and retrieval work @S009 */ }
            perform action a1 { doc /* serves its assigned storage positions @S064 */ }
            perform action a2 { doc /* performs a controlled recovery maneuver at reduced speed @S182 */ }
        }
        part trailer : Trailer {
            exhibit state modes {
                state s0 { doc /* safe holding position @S040 */ }
            }
        }
        part warehouseManagementSystem : WarehouseManagementSystem {
            perform action a0 { doc /* maintains the authoritative status, location, and handling eligibility of each controlled pallet @S020 */ }
            perform action a1 { doc /* maintains the expected inbound shipment data @S041 */ }
            perform action a2 { doc /* evaluates available positions against pallet dimensions, mass, storage compatibility, and expected retrieval demand @S052 */ }
            perform action a3 { doc /* retain the measured dimensions with the pallet's inventory record @S073 */ }
            perform action a4 { doc /* establishes the intended shipment window and loading priorities @S101 */ }
            perform action a5 { doc /* checks that planned pallet moves remain consistent with outbound capacity and current inventory records @S103 */ }
            perform action a6 { doc /* issues a Dispatch Wave Amendment @S105 */ }
            perform action a7 { doc /* maintains the authoritative task state for pallet movements, inventory status, and operating priorities @S124 */ }
            perform action a8 { doc /* reconciles work across operating areas @S142 */ }
            perform action a9 { doc /* apply the required handling constraints to affected work @S156 */ }
            perform action a10 { doc /* prevents an incompatible allocation from being released @S157 */ }
            perform action a11 { doc /* reconciles its location records with available sensor data @S178 */ }
            perform action a12 { doc /* records transaction times and reconciles completed movements against the active shift plan @S197 */ }
            perform action a13 { doc /* close the applicable movement record @S225 */ }
            perform action a14 { doc /* closes the commissioning action register @S230 */ }
        }
        part warehouseOperationsSupervisor : WarehouseOperationsSupervisor {
            perform action a0 { doc /* oversees exceptions, operational priorities, and recovery decisions @S018 */ }
            perform action a1 { doc /* resolves receiving issues @S049 */ }
            perform action a2 { doc /* review unresolved allocation conditions @S074 */ }
            perform action a3 { doc /* review persistent holds @S097 */ }
            perform action a4 { doc /* reviews delayed tasks, abnormal vehicle stops, and unresolved staging constraints @S123 */ }
            perform action a5 { doc /* defer work @S138 */ }
            perform action a6 { doc /* reviews unresolved holds and assigns an escalation @S159 */ }
            perform action a7 { doc /* confirms that a delayed task will not compromise a later outbound wave or an aisle access limit @S160 */ }
            perform action a8 { doc /* releases normal work @S171 */ }
            perform action a9 { doc /* verifies that personnel are clear of the boundary @S175 */ }
            perform action a10 { doc /* reconciles outstanding exceptions, maintenance holds, and access constraints @S192 */ }
            perform action a11 { doc /* reviews open alarms, equipment status, and the previous shift's unresolved work @S198 */ }
            perform action a12 { doc /* confirms that operators understand current speed limits, exclusion boundaries, and stop-work criteria @S199 */ }
            perform action a13 { doc /* compares reported downtime with control-system event records @S214 */ }
            perform action a14 { doc /* confirms that acceptance evidence is complete @S222 */ }
            perform action a15 { doc /* reviewed emergency changes @S239 */ }
        }
        part westTransferConveyor : WestTransferConveyor {
            perform action a0 { doc /* carries pallets along its designated transfer route @S011 */ }
            perform action a1 { doc /* carries pallets along the western approach to the transfer area @S077 */ }
            perform action a2 { doc /* provide designated interfaces for moving pallets between vehicle travel and outbound staging @S119 */ }
            perform action a3 { doc /* provide separate routes for moving pallets between operating areas @S135 */ }
            exhibit state modes {
                state s0 { doc /* stopped @S189 */ }
            }
        }
        part workRequests : WorkRequests;
        part yardGateController : YardGateController {
            perform action a0 { doc /* controls vehicle access at the facility perimeter @S014 */ }
            perform action a1 { doc /* records vehicle identity, carrier, trailer number, and arrival time @S028 */ }
            perform action a2 { doc /* directs each cleared trailer from staging to its assigned receiving door @S039 */ }
            perform action a3 { doc /* validates arriving vehicle information against the active receiving plan @S127 */ }
            perform action a4 { doc /* records unresolved discrepancies for review @S128 */ }
            perform action a5 { doc /* prevents an affected vehicle from proceeding @S128 */ }
            perform action a6 { doc /* uses the exception note to manage a receiving discrepancy at the gate @S129 */ }
            perform action a7 { doc /* holding affected vehicle movements outside the recovery boundary @S179 */ }
        }
        part yardPersonnel : YardPersonnel {
            perform action a0 { doc /* notify receiving staff @S047 */ }
        }
        flow f0 of DispatchWaveAmendmentItem from warehouseManagementSystem to outboundDispatchSorter { doc /* @S042 */ }
        flow f1 of TrailerReadyToLeaveNotificationItem from yardPersonnel to receivingStaff { doc /* @S047 */ }
        flow f2 of SlotReservationReceiptItem from warehouseManagementSystem to northAisleStackerCrane { doc /* @S057 */ }
        flow f3 of OversizeLoadAdvisoryItem from palletDimensionScanner to warehouseManagementSystem { doc /* @S070 */ }
        flow f4 of TransferInductionTicketItem from conveyorLineController to autonomousForkliftFleet { doc /* @S088 */ }
        flow f5 of AisleOccupancySnapshotItem from northAisleStackerCrane to warehouseManagementSystem { doc /* @S092 */ }
        flow f7 of ForkliftHandoffConfirmationItem from autonomousForkliftFleet to warehouseManagementSystem { doc /* @S115 */ }
        flow f8 of SprinklerZoneInhibitNoticeItem from fireAlarmPanel to safetyZoneController { doc /* @S117 */ }
        flow f9 of TrailerSealExceptionNoteItem from inboundInspectionDesk to yardGateController { doc /* @S129 */ }
        flow f10 of CraneServiceReleaseCardItem from maintenanceReleaseTerminal to northAisleStackerCrane { doc /* @S140 */ }
        flow f11 of GrossWeightVarianceSlipItem from outboundCheckweighScale to shippingDocumentationDesk { doc /* @S167 */ }
    }
    requirement def R0 { doc /* No equipment may begin inventory-moving work without an authorized release from the Warehouse Management System. @S021 */ subject s : WarehouseManagementSystem; }
    requirement def R1 { doc /* Work requests should include a unique task reference, a destination, and any operating constraints needed for safe execution. @S126 */ subject s : WorkRequests; }
    requirement def R2 { doc /* Changes to software, equipment settings, or operating procedures require an impact review, approval, and a controlled implementation record. @S238 */ subject s : ChangesToSoftwareEquipmentSettingsOrOperatingProcedures; }
}
