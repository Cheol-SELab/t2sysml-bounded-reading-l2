package L2Model {
    item def AlertItem { doc /* @S192 */ }
    item def BatchReleaseNoteItem { doc /* @S204 */ }
    item def CabinetDowntimeNoticeItem { doc /* @S222 */ }
    item def ColdChainHandoffCardItem { doc /* @S177 */ }
    item def CompletedPackageItem { doc /* @S077 */ }
    item def CompletedRepairsAndAnyEquipmentLimitationsItem { doc /* @S234 */ }
    item def DiscrepanciesItem { doc /* @S010 */ }
    item def DiversionReviewPacketItem { doc /* @S141 */ }
    item def DoseExceptionReviewSlipItem { doc /* @S128 */ }
    item def OrderReconciliationSnapshotItem { doc /* @S149 */ }
    item def PneumaticCapsuleSealRecordItem { doc /* @S238 */ }
    item def PriorityRefillToteTagItem { doc /* @S103 */ }
    item def ReadingsItem { doc /* @S173 */ }
    item def ReturnBinAuditLabelItem { doc /* @S117 */ }
    item def SegmentStatusTransferProgressAndDeliveryConfirmationItem { doc /* @S188 */ }
    item def TubeRouteExceptionTicketItem { doc /* @S211 */ }
    item def UrgentPatientCareConcernItem { doc /* @S132 */ }
    part def BiomedicalEngineer { doc /* @S024,S050,S060,S068,S142,S210,S211,S214,S218,S234 */ }
    part def Cabinet { doc /* @S072 */ }
    part def CalibratedProbes { doc /* @S173 */ }
    part def ChargeNurse { doc /* @S019,S059,S064,S070,S122,S134,S222 */ }
    part def ClinicalPharmacist { doc /* @S009,S010,S012,S034,S044,S057,S075,S083,S128,S129,S132,S145,S178,S196,S197,S203,S217,S232 */ }
    part def ContinuousSensors { doc /* @S039 */ }
    part def Correction { doc /* @S130 */ }
    part def DispatchPersonnel { doc /* @S053 */ }
    part def EastTubeDispatchConsole { doc /* @S016,S051,S052,S094,S183,S184,S185,S187,S188,S189,S192,S211 */ }
    part def HospitalCourier { doc /* @S023,S089,S090,S091,S092,S121,S238,S241 */ }
    part def ITOperationsSpecialist { doc /* @S024,S061,S069,S141,S143,S215,S222,S223,S224,S226,S228,S231,S234,S235,S243 */ }
    part def MedicationOrderGateway { doc /* @S008,S029,S030,S031,S032,S081,S136,S147,S149,S227 */ }
    part def MedicationReturnKiosk { doc /* @S020,S021,S116,S117 */ }
    part def MedicationSafetyOfficer { doc /* @S025,S046,S047,S140,S141,S216 */ }
    part def NorthWardCabinetController { doc /* @S066,S101,S103,S137,S161,S168,S170 */ }
    part def OperationsStaff { doc /* @S054 */ }
    part def PharmacyFulfillmentRobot { doc /* @S011,S013,S037,S077,S103,S125,S126,S149,S152,S153 */ }
    part def PharmacyTechnician { doc /* @S010,S035,S040,S041,S045,S056,S076,S117,S135,S148,S177,S192,S198 */ }
    part def PharmacyVerificationStation { doc /* @S014,S033,S048,S077,S078,S079,S127,S128,S195,S204 */ }
    part def PneumaticTubeNetwork { doc /* @S017,S093,S188 */ }
    part def ReceivingDepartment { doc /* @S098 */ }
    part def RegisteredNurse { doc /* @S058,S100,S107,S114,S131,S132,S207 */ }
    part def SensorMonitoredMedicationCooler { doc /* @S015,S038,S088,S108,S139,S171,S172,S173,S176,S177,S179 */ }
    part def SouthWardCabinetController { doc /* @S067,S102,S138,S204,S205,S208,S225 */ }
    part def WardStaff { doc /* @S099 */ }
    part def WestTubeDispatchConsole { doc /* @S016,S238,S239,S242 */ }
    part system {
        part biomedicalEngineer : BiomedicalEngineer {
            perform action a0 { doc /* maintains supported equipment @S024 */ }
            perform action a1 { doc /* supports technical recovery for dispensing and transport equipment @S050 */ }
            perform action a2 { doc /* inspects tube hardware, switches, and sensors @S060 */ }
            perform action a3 { doc /* evaluates cabinet hardware @S068 */ }
            perform action a4 { doc /* verifies safe operation @S068 */ }
            perform action a5 { doc /* evaluates a suspected mechanical or sensor fault @S142 */ }
            perform action a6 { doc /* reviews the received operational record @S210 */ }
            perform action a7 { doc /* records an engineering disposition @S210 */ }
            perform action a8 { doc /* uses the exception ticket to identify the affected path @S211 */ }
            perform action a9 { doc /* isolates the affected subsystem @S214 */ }
            perform action a10 { doc /* records the corrective action, test evidence, and approvals @S218 */ }
        }
        part cabinet : Cabinet {
            exhibit state modes {
                state s0 { doc /* Ready for Dispense @S072 */ }
            }
        }
        part calibratedProbes : CalibratedProbes;
        part chargeNurse : ChargeNurse {
            perform action a0 { doc /* coordinates ward readiness @S019 */ }
            perform action a1 { doc /* communicates operational constraints @S019 */ }
            perform action a2 { doc /* keeps ward staff informed about expected delivery delays @S059 */ }
            perform action a3 { doc /* sends a Cabinet Downtime Notice @S064 */ }
            perform action a4 { doc /* confirms that clinical staff have been notified @S070 */ }
            perform action a5 { doc /* ensures that unresolved receipt or return discrepancies remain assigned for follow-up @S122 */ }
            perform action a6 { doc /* assigns unresolved exceptions to a named role @S134 */ }
        }
        part clinicalPharmacist : ClinicalPharmacist {
            perform action a0 { doc /* reviews clinical appropriateness @S009 */ }
            perform action a1 { doc /* resolves medication questions @S009 */ }
            perform action a2 { doc /* produces the Dose Exception Review Slip @S012 */ }
            perform action a3 { doc /* evaluates clinical appropriateness, dose limits, allergies, and relevant interactions @S034 */ }
            perform action a4 { doc /* approving an order @S034 */ }
            perform action a5 { doc /* determines whether affected medication remains suitable for dispensing @S044 */ }
            perform action a6 { doc /* reviews any medication whose storage conditions or delivery timing may affect its suitability @S057 */ }
            perform action a7 { doc /* reviews clinical and labeling exceptions @S075 */ }
            perform action a8 { doc /* authorizing release @S075 */ }
            perform action a9 { doc /* documents the disposition of any clinical concern @S083 */ }
            perform action a10 { doc /* assesses dose, route, timing, and patient-specific clinical concerns @S129 */ }
            perform action a11 { doc /* approving a correction or rejecting the order @S129 */ }
            perform action a12 { doc /* seeks a higher-level clinical decision @S145 */ }
            perform action a13 { doc /* reviews excursion details @S178 */ }
            perform action a14 { doc /* compares the active medication order with the product, strength, dosage form, dose, route, and scheduled time @S196 */ }
            perform action a15 { doc /* confirms that the patient identifiers and pharmacy label agree @S197 */ }
            perform action a16 { doc /* resolves unclear or conflicting order details @S203 */ }
            perform action a17 { doc /* keeps affected medication unavailable @S217 */ }
            perform action a18 { doc /* reviews medication orders affected by the outage @S232 */ }
        }
        part continuousSensors : ContinuousSensors {
            perform action a0 { doc /* record temperature readings @S039 */ }
        }
        part correction : Correction;
        part dispatchPersonnel : DispatchPersonnel {
            perform action a0 { doc /* hold affected capsules @S053 */ }
        }
        part eastTubeDispatchConsole : EastTubeDispatchConsole {
            perform action a0 { doc /* provide controlled interfaces for routing authorized pharmacy deliveries @S016 */ }
            perform action a1 { doc /* monitors capsule movement @S051 */ }
            perform action a2 { doc /* records route, timing, and equipment status @S051 */ }
            perform action a3 { doc /* sends a Tube Route Exception Ticket @S052 */ }
            perform action a4 { doc /* checks the requested route @S094 */ }
            perform action a5 { doc /* maintains the approved route map @S183 */ }
            perform action a6 { doc /* checks the selected route @S184 */ }
            perform action a7 { doc /* releasing a capsule @S184 */ }
            perform action a8 { doc /* confirms that the destination is reachable @S185 */ }
            perform action a9 { doc /* checks for conflicting capsule movements @S187 */ }
            perform action a10 { doc /* holds the capsule @S189 */ }
            perform action a11 { doc /* displays the condition @S189 */ }
        }
        part hospitalCourier : HospitalCourier {
            perform action a0 { doc /* supports authorized movement of medication and returns @S023 */ }
            perform action a1 { doc /* checks package count, packaging integrity, destination information, and any special handling instructions @S089 */ }
            perform action a2 { doc /* records the time and identity associated with acceptance @S090 */ }
            perform action a3 { doc /* produces the Pneumatic Capsule Seal Record @S091 */ }
            perform action a4 { doc /* verifies that the capsule is closed securely @S092 */ }
            perform action a5 { doc /* collects only bins that are closed and recorded as ready for collection @S121 */ }
            perform action a6 { doc /* confirms physical receipt @S241 */ }
        }
        part iTOperationsSpecialist : ITOperationsSpecialist {
            perform action a0 { doc /* monitors system connectivity and service availability @S024 */ }
            perform action a1 { doc /* checks console connectivity, interface health, and relevant system logs @S061 */ }
            perform action a2 { doc /* checks controller communications and application health @S069 */ }
            perform action a3 { doc /* checks access, transaction, and device logs @S141 */ }
            perform action a4 { doc /* investigates software or connectivity faults @S143 */ }
            perform action a5 { doc /* records the technical findings @S143 */ }
            perform action a6 { doc /* investigates authentication, interface, and time-synchronization faults @S215 */ }
            perform action a7 { doc /* uses the Cabinet Downtime Notice to open a controlled incident record @S222 */ }
            perform action a8 { doc /* checks controller status, network connectivity, and recent event logs @S223 */ }
            perform action a9 { doc /* attempting recovery @S223 */ }
            perform action a10 { doc /* records the time the fault was detected @S224 */ }
            perform action a11 { doc /* isolates the fault @S226 */ }
            perform action a12 { doc /* checks whether any transaction was interrupted @S228 */ }
            perform action a13 { doc /* coordinates technical troubleshooting with the Biomedical Engineer @S231 */ }
            perform action a14 { doc /* verifies communications, status reporting, and cabinet transaction behavior @S235 */ }
            perform action a15 { doc /* monitors cabinet and tube service status @S243 */ }
        }
        part medicationOrderGateway : MedicationOrderGateway {
            perform action a0 { doc /* provides the controlled entry point for medication orders @S008 */ }
            perform action a1 { doc /* accepts medication orders from authorized clinical systems @S029 */ }
            perform action a2 { doc /* records their arrival times @S029 */ }
            perform action a3 { doc /* checks required order fields @S030 */ }
            perform action a4 { doc /* routing an order for pharmacy review @S030 */ }
            perform action a5 { doc /* flags missing data, duplicate submissions, and changes @S031 */ }
            perform action a6 { doc /* produces the Order Reconciliation Snapshot @S032 */ }
            perform action a7 { doc /* rejects incomplete or internally inconsistent order updates @S136 */ }
            perform action a8 { doc /* retains the rejection reason @S136 */ }
            perform action a9 { doc /* validates each medication order for patient, product, dose, route, and timing fields @S147 */ }
            perform action a10 { doc /* retains pending requests for review @S227 */ }
        }
        part medicationReturnKiosk : MedicationReturnKiosk {
            perform action a0 { doc /* recording medication returns and capturing return details @S020 */ }
            perform action a1 { doc /* produces the Return Bin Audit Label @S021 */ }
            perform action a2 { doc /* guides ward staff through return-bin checks @S116 */ }
            perform action a3 { doc /* records each check outcome @S116 */ }
        }
        part medicationSafetyOfficer : MedicationSafetyOfficer {
            perform action a0 { doc /* oversees safety concerns @S025 */ }
            perform action a1 { doc /* reviews relevant trends @S025 */ }
            perform action a2 { doc /* reviews patterns of discrepancies and handling events @S046 */ }
            perform action a3 { doc /* produces the Diversion Review Packet @S047 */ }
            perform action a4 { doc /* reviews suspected diversion, repeated high-risk exceptions, and events with potential for patient harm @S140 */ }
            perform action a5 { doc /* reviews any discrepancy @S216 */ }
        }
        part northWardCabinetController : NorthWardCabinetController {
            perform action a0 { doc /* reports cabinet availability @S066 */ }
            perform action a1 { doc /* prevents dispensing @S066 */ }
            perform action a2 { doc /* records the arrival time and the destination cabinet @S101 */ }
            perform action a3 { doc /* uses the Priority Refill Tote Tag to confirm the intended ward @S103 */ }
            perform action a4 { doc /* prevents access to a held transaction @S137 */ }
            perform action a5 { doc /* applies the North Ward medication access rules @S161 */ }
            perform action a6 { doc /* rejects a transaction @S168 */ }
            perform action a7 { doc /* prevents routine dispensing @S170 */ }
            exhibit state modes {
                state s0 { doc /* Out of Service @S066 */ }
            }
        }
        part operationsStaff : OperationsStaff {
            perform action a0 { doc /* review queue status @S054 */ }
        }
        part pharmacyFulfillmentRobot : PharmacyFulfillmentRobot {
            perform action a0 { doc /* produces the Priority Refill Tote Tag @S011 */ }
            perform action a1 { doc /* prepares eligible medication against the active order @S013 */ }
            perform action a2 { doc /* records its handling actions @S013 */ }
            perform action a3 { doc /* prepares only orders that have passed the required review and authorization checks @S037 */ }
            perform action a4 { doc /* presents the completed package at the Pharmacy Verification Station @S077 */ }
            perform action a5 { doc /* stops the affected pick sequence @S125 */ }
            perform action a6 { doc /* keeps the package in a controlled hold location @S125 */ }
            perform action a7 { doc /* preserves the scanned product and quantity data @S126 */ }
            perform action a8 { doc /* uses the Order Reconciliation Snapshot to compare requested quantities @S149 */ }
            perform action a9 { doc /* retains the patient, medication, dose, route, and timing details @S152 */ }
            perform action a10 { doc /* checks whether the order is active @S153 */ }
        }
        part pharmacyTechnician : PharmacyTechnician {
            perform action a0 { doc /* performs routine preparation tasks @S010 */ }
            perform action a1 { doc /* investigates administrative discrepancies @S035 */ }
            perform action a2 { doc /* requests clarification @S035 */ }
            perform action a3 { doc /* checks the cooler's status @S040 */ }
            perform action a4 { doc /* confirms that refrigerated stock remains within handling limits @S040 */ }
            perform action a5 { doc /* produces the Cold Chain Handoff Card @S041 */ }
            perform action a6 { doc /* checks packaging, product identity, lot details, and expiry information @S045 */ }
            perform action a7 { doc /* verifies capsule contents and order identifiers @S056 */ }
            perform action a8 { doc /* confirms that the package contents and patient identifiers match the verified order @S076 */ }
            perform action a9 { doc /* uses the audit label to identify a return bin @S117 */ }
            perform action a10 { doc /* gather package and transaction evidence @S135 */ }
            perform action a11 { doc /* confirms that the reconciliation queue has no unresolved discrepancy @S148 */ }
            perform action a12 { doc /* authorizing routine cabinet replenishment @S148 */ }
            perform action a13 { doc /* checks package integrity, lot identification, and expiry @S198 */ }
            perform action a14 { doc /* presenting the medication for verification @S198 */ }
        }
        part pharmacyVerificationStation : PharmacyVerificationStation {
            perform action a0 { doc /* supports a final verification step @S014 */ }
            perform action a1 { doc /* displays queued orders and their validation results @S033 */ }
            perform action a2 { doc /* preserves review decisions and order status changes @S048 */ }
            perform action a3 { doc /* records the verification outcome @S078 */ }
            perform action a4 { doc /* prevents release @S078 */ }
            perform action a5 { doc /* produces the Batch Release Note @S079 */ }
            perform action a6 { doc /* compares the active order with the scanned product, strength, and measured quantity @S127 */ }
            perform action a7 { doc /* blocks verification @S127 */ }
            perform action a8 { doc /* uses the review slip to record the exception category, evidence checked, disposition, and reviewer identity @S128 */ }
            perform action a9 { doc /* serves as the final controlled checkpoint @S195 */ }
        }
        part pneumaticTubeNetwork : PneumaticTubeNetwork {
            perform action a0 { doc /* carries compatible deliveries @S017 */ }
            perform action a1 { doc /* accepts only loads that meet the applicable packaging and routing requirements @S093 */ }
        }
        part receivingDepartment : ReceivingDepartment {
            perform action a0 { doc /* confirms arrival @S098 */ }
        }
        part registeredNurse : RegisteredNurse {
            perform action a0 { doc /* confirms whether the ward still requires the medication @S058 */ }
            perform action a1 { doc /* verifies that the load is intended for the ward @S100 */ }
            perform action a2 { doc /* checks that the load remained within the required handling conditions @S107 */ }
            perform action a3 { doc /* confirms that the contents are eligible for return @S114 */ }
            perform action a4 { doc /* keeps the cabinet transaction locked @S131 */ }
            perform action a5 { doc /* confirms that the medication has not been administered @S131 */ }
            perform action a6 { doc /* escalates an urgent patient-care concern to the Clinical Pharmacist @S132 */ }
            perform action a7 { doc /* authenticates at the cabinet @S207 */ }
            perform action a8 { doc /* selects the medication @S207 */ }
        }
        part sensorMonitoredMedicationCooler : SensorMonitoredMedicationCooler {
            perform action a0 { doc /* maintains monitored storage conditions @S015 */ }
            perform action a1 { doc /* maintains refrigerated medications within the facility's approved temperature range @S038 */ }
            perform action a2 { doc /* records temperature conditions @S088 */ }
            perform action a3 { doc /* displays the current temperature and any recorded excursion @S108 */ }
            perform action a4 { doc /* reports excursions @S139 */ }
            perform action a5 { doc /* maintains a time-stamped temperature history @S171 */ }
            perform action a6 { doc /* raises an alarm @S171 */ }
            perform action a7 { doc /* applies approved upper and lower temperature limits @S172 */ }
            perform action a8 { doc /* records probe identity and calibration status @S173 */ }
            perform action a9 { doc /* preserves the affected stock in its current controlled environment @S176 */ }
            perform action a10 { doc /* uses the handoff card to compare a transfer's recorded custody time @S177 */ }
            perform action a11 { doc /* retains the disposition status @S179 */ }
            perform action a12 { doc /* prevents stock marked ineligible from being selected @S179 */ }
        }
        part southWardCabinetController : SouthWardCabinetController {
            perform action a0 { doc /* applies the same availability controls @S067 */ }
            perform action a1 { doc /* records the arrival time and the destination cabinet @S102 */ }
            perform action a2 { doc /* reports a failed lock or an unrecognized access attempt @S138 */ }
            perform action a3 { doc /* applies its own approved cabinet configuration @S204 */ }
            perform action a4 { doc /* checks its local compartment mapping, access rules, and supported medication classes @S205 */ }
            perform action a5 { doc /* checks the requested selection against its local authorization rules @S208 */ }
            perform action a6 { doc /* unlocking a compartment @S208 */ }
            exhibit state modes {
                state s0 { doc /* Out of Service @S225 */ }
            }
        }
        part wardStaff : WardStaff {
            perform action a0 { doc /* perform a receipt check on each arriving load @S099 */ }
        }
        part westTubeDispatchConsole : WestTubeDispatchConsole {
            perform action a0 { doc /* provide controlled interfaces for routing authorized pharmacy deliveries @S016 */ }
            perform action a1 { doc /* uses the Pneumatic Capsule Seal Record to verify capsule identity and seal status @S238 */ }
            perform action a2 { doc /* records completion of its handoff checks @S239 */ }
            perform action a3 { doc /* retains the handoff completion status @S242 */ }
        }
        flow f0 of DiscrepanciesItem from pharmacyTechnician to clinicalPharmacist { doc /* @S010 */ }
        flow f1 of CompletedPackageItem from pharmacyFulfillmentRobot to pharmacyVerificationStation { doc /* @S077 */ }
        flow f2 of PriorityRefillToteTagItem from pharmacyFulfillmentRobot to northWardCabinetController { doc /* @S103 */ }
        flow f3 of ReturnBinAuditLabelItem from medicationReturnKiosk to pharmacyTechnician { doc /* @S117 */ }
        flow f4 of DoseExceptionReviewSlipItem from clinicalPharmacist to pharmacyVerificationStation { doc /* @S128 */ }
        flow f5 of UrgentPatientCareConcernItem from registeredNurse to clinicalPharmacist { doc /* @S132 */ }
        flow f6 of DiversionReviewPacketItem from medicationSafetyOfficer to iTOperationsSpecialist { doc /* @S141 */ }
        flow f7 of OrderReconciliationSnapshotItem from medicationOrderGateway to pharmacyFulfillmentRobot { doc /* @S149 */ }
        flow f8 of ReadingsItem from calibratedProbes to sensorMonitoredMedicationCooler { doc /* @S173 */ }
        flow f9 of ColdChainHandoffCardItem from pharmacyTechnician to sensorMonitoredMedicationCooler { doc /* @S177 */ }
        flow f10 of SegmentStatusTransferProgressAndDeliveryConfirmationItem from pneumaticTubeNetwork to eastTubeDispatchConsole { doc /* @S188 */ }
        flow f11 of AlertItem from eastTubeDispatchConsole to pharmacyTechnician { doc /* @S192 */ }
        flow f12 of BatchReleaseNoteItem from pharmacyVerificationStation to southWardCabinetController { doc /* @S204 */ }
        flow f13 of TubeRouteExceptionTicketItem from eastTubeDispatchConsole to biomedicalEngineer { doc /* @S211 */ }
        flow f14 of CabinetDowntimeNoticeItem from chargeNurse to iTOperationsSpecialist { doc /* @S222 */ }
        flow f15 of CompletedRepairsAndAnyEquipmentLimitationsItem from biomedicalEngineer to iTOperationsSpecialist { doc /* @S234 */ }
        flow f16 of PneumaticCapsuleSealRecordItem from hospitalCourier to westTubeDispatchConsole { doc /* @S238 */ }
    }
    requirement def R0 { doc /* A correction requires a valid authorized order and must not be inferred from prior dispensing history. @S130 */ subject s : Correction; }
}
