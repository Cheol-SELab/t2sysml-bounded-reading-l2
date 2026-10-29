package L2Model {
    item def AlertItem { doc /* @S192 */ }
    item def BatchReleaseNoteItem { doc /* @S204 */ }
    item def ColdChainHandoffCardItem { doc /* @S177 */ }
    item def CompletedPackageItem { doc /* @S077 */ }
    item def CompletedRepairsAndEquipmentLimitationsItem { doc /* @S234 */ }
    item def CurrentTemperatureAndRecordedExcursionItem { doc /* @S108 */ }
    item def DeliveryConfirmationItem { doc /* @S188 */ }
    item def DiscrepanciesItem { doc /* @S010 */ }
    item def DiversionReviewPacketItem { doc /* @S141 */ }
    item def DoseExceptionReviewSlipItem { doc /* @S128 */ }
    item def ExcursionDetailsItem { doc /* @S178 */ }
    item def ExpectedDeliveryDelaysAndAnyApprovedLocalWorkaroundItem { doc /* @S059 */ }
    item def FaultCorrectiveActionAndVerificationResultsItem { doc /* @S071 */ }
    item def MedicationOrderItem { doc /* @S029 */ }
    item def OrderReconciliationSnapshotItem { doc /* @S149 */ }
    item def OrderStatusItem { doc /* @S008 */ }
    item def PriorityRefillToteTagItem { doc /* @S103 */ }
    item def ReadingsItem { doc /* @S173 */ }
    item def ReturnBinAuditLabelItem { doc /* @S117 */ }
    item def SegmentStatusItem { doc /* @S188 */ }
    item def TransferProgressItem { doc /* @S188 */ }
    item def UrgentPatientCareConcernItem { doc /* @S132 */ }
    part def AffectedStock { doc /* @S139 */ }
    part def AuditRecords { doc /* @S220,S244 */ }
    part def AuthorizedClinicalSystems { doc /* @S029 */ }
    part def AuthorizedHospitalSystems { doc /* @S008 */ }
    part def AuthorizedReviewer { doc /* @S124 */ }
    part def BiomedicalEngineer { doc /* @S024,S050,S060,S068,S142,S210,S211,S212,S214,S218,S234 */ }
    part def CabinetStaff { doc /* @S106 */ }
    part def CalibratedProbe { doc /* @S173 */ }
    part def ChargeNurse { doc /* @S019,S059,S064,S070,S122,S134 */ }
    part def ClinicalPharmacist { doc /* @S009,S010,S012,S034,S044,S057,S075,S083,S128,S129,S132,S145,S178,S196,S197,S203,S217,S232 */ }
    part def ContinuousSensors { doc /* @S039 */ }
    part def DispatchPersonnel { doc /* @S053 */ }
    part def EastTubeDispatchConsole { doc /* @S016,S051,S052,S094,S183,S184,S185,S186,S187,S188,S189,S192,S193 */ }
    part def HospitalCourier { doc /* @S023,S089,S090,S091,S092,S121,S241 */ }
    part def ITOperationsSpecialist { doc /* @S024,S061,S069,S141,S143,S215,S222,S223,S224,S226,S228,S231,S234,S235,S243 */ }
    part def Load { doc /* @S096 */ }
    part def LoadManifest { doc /* @S085 */ }
    part def MedicationOrderGateway { doc /* @S008,S029,S030,S031,S032,S081,S136,S147,S149,S227 */ }
    part def MedicationReturnKiosk { doc /* @S020,S021,S116,S117 */ }
    part def MedicationSafetyOfficer { doc /* @S025,S046,S047,S140,S141,S216 */ }
    part def NorthWardCabinetController { doc /* @S066,S101,S103,S137,S161,S166,S168,S170,S225 */ }
    part def Operations { doc /* @S073 */ }
    part def OperationsStaff { doc /* @S054 */ }
    part def PharmacyFulfillmentRobot { doc /* @S011,S013,S037,S077,S103,S125,S126,S149,S152,S153,S202 */ }
    part def PharmacyTechnician { doc /* @S010,S035,S040,S041,S045,S056,S076,S117,S135,S148,S177,S192,S198 */ }
    part def PharmacyVerificationStation { doc /* @S014,S033,S048,S077,S078,S079,S127,S128,S195,S204,S229 */ }
    part def PneumaticTubeNetwork { doc /* @S017,S055,S093,S188,S240 */ }
    part def ReceivingDepartment { doc /* @S098 */ }
    part def RegisteredNurse { doc /* @S058,S100,S107,S114,S131,S132,S207,S233 */ }
    part def ResponsibleStaff { doc /* @S236,S237 */ }
    part def ReturnBin { doc /* @S120 */ }
    part def ReturnedMedication { doc /* @S022 */ }
    part def SensorMonitoredMedicationCooler { doc /* @S015,S038,S039,S042,S088,S108,S139,S171,S172,S173,S176,S177,S178,S179 */ }
    part def ServiceRecord { doc /* @S071 */ }
    part def SouthWardCabinetController { doc /* @S067,S102,S138,S204,S205,S206,S208,S209,S225 */ }
    part def Staff { doc /* @S073,S096,S097,S103,S104,S108,S109,S110,S115,S118 */ }
    part def TechnicalStaff { doc /* @S071 */ }
    part def Transaction { doc /* @S124 */ }
    part def Ward { doc /* @S065,S112 */ }
    part def WardStaff { doc /* @S059,S063,S099,S105,S113 */ }
    part def WestTubeDispatchConsole { doc /* @S016,S238,S239,S242 */ }
    part system {
        part affectedStock : AffectedStock {
            exhibit state modes {
                state s0 { doc /* unavailable pending assessment @S139 */ }
            }
        }
        part auditRecords : AuditRecords {
            perform action a0 { doc /* retain timestamps, equipment identifiers, and disposition details @S220 */ }
            perform action a1 { doc /* retain timestamps, equipment identifiers, recovery checks, and disposition details @S244 */ }
        }
        part authorizedClinicalSystems : AuthorizedClinicalSystems;
        part authorizedHospitalSystems : AuthorizedHospitalSystems;
        part authorizedReviewer : AuthorizedReviewer {
            perform action a0 { doc /* documents a disposition @S124 */ }
        }
        part biomedicalEngineer : BiomedicalEngineer {
            perform action a0 { doc /* maintains supported equipment @S024 */ }
            perform action a1 { doc /* supports technical recovery for dispensing and transport equipment @S050 */ }
            perform action a2 { doc /* inspects tube hardware, switches, and sensors @S060 */ }
            perform action a3 { doc /* evaluates cabinet hardware @S068 */ }
            perform action a4 { doc /* verifies safe operation @S068 */ }
            perform action a5 { doc /* evaluates a suspected mechanical or sensor fault @S142 */ }
            perform action a6 { doc /* advises whether the affected equipment can safely return to service @S142 */ }
            perform action a7 { doc /* reviews the received operational record @S210 */ }
            perform action a8 { doc /* correlates its equipment identifiers and timestamps with local telemetry @S210 */ }
            perform action a9 { doc /* records an engineering disposition @S210 */ }
            perform action a10 { doc /* uses the exception ticket to identify the affected path @S211 */ }
            perform action a11 { doc /* compare reported symptoms with equipment telemetry @S211 */ }
            perform action a12 { doc /* checks whether the reported condition is isolated to one device or indicates a broader service risk @S212 */ }
            perform action a13 { doc /* isolates the affected subsystem @S214 */ }
            perform action a14 { doc /* performs only the diagnostic steps approved for that equipment @S214 */ }
            perform action a15 { doc /* records the corrective action, test evidence, and approvals required to return the equipment to operation @S218 */ }
            perform action a16 { doc /* reports completed repairs and any equipment limitations @S234 */ }
        }
        part cabinetStaff : CabinetStaff {
            perform action a0 { doc /* verify the quantity and medication descriptions against the expected receipt record @S106 */ }
        }
        part calibratedProbe : CalibratedProbe {
            perform action a0 { doc /* report readings @S173 */ }
        }
        part chargeNurse : ChargeNurse {
            perform action a0 { doc /* coordinates ward readiness @S019 */ }
            perform action a1 { doc /* communicates operational constraints @S019 */ }
            perform action a2 { doc /* supports escalation when dispensing service is disrupted @S019 */ }
            perform action a3 { doc /* keeps ward staff informed about expected delivery delays and any approved local workaround @S059 */ }
            perform action a4 { doc /* sends a Cabinet Downtime Notice @S064 */ }
            perform action a5 { doc /* confirms that clinical staff have been notified @S070 */ }
            perform action a6 { doc /* ensures that unresolved receipt or return discrepancies remain assigned for follow-up at shift handover @S122 */ }
            perform action a7 { doc /* assigns unresolved exceptions to a named role @S134 */ }
            perform action a8 { doc /* confirms that ownership is maintained at shift handover @S134 */ }
        }
        part clinicalPharmacist : ClinicalPharmacist {
            perform action a0 { doc /* reviews clinical appropriateness @S009 */ }
            perform action a1 { doc /* resolves medication questions that require professional judgment @S009 */ }
            perform action a2 { doc /* produces the Dose Exception Review Slip @S012 */ }
            perform action a3 { doc /* evaluates clinical appropriateness, dose limits, allergies, and relevant interactions @S034 */ }
            perform action a4 { doc /* approving an order @S034 */ }
            perform action a5 { doc /* determines whether affected medication remains suitable for dispensing @S044 */ }
            perform action a6 { doc /* reviews any medication whose storage conditions or delivery timing may affect its suitability for use @S057 */ }
            perform action a7 { doc /* reviews clinical and labeling exceptions that require professional judgment @S075 */ }
            perform action a8 { doc /* authorizing release @S075 */ }
            perform action a9 { doc /* documents the disposition of any clinical concern @S083 */ }
            perform action a10 { doc /* assesses dose, route, timing, and patient-specific clinical concerns @S129 */ }
            perform action a11 { doc /* approving a correction or rejecting the order @S129 */ }
            perform action a12 { doc /* seeks a higher-level clinical decision @S145 */ }
            perform action a13 { doc /* reviews excursion details @S178 */ }
            perform action a14 { doc /* determines whether affected stock may be released, quarantined, or discarded @S178 */ }
            perform action a15 { doc /* compares the active medication order with the product, strength, dosage form, dose, route, and scheduled time @S196 */ }
            perform action a16 { doc /* confirms that the patient identifiers and pharmacy label agree with the authorized order @S197 */ }
            perform action a17 { doc /* resolves unclear or conflicting order details through the Medication Order Gateway @S203 */ }
            perform action a18 { doc /* authorizing release @S203 */ }
            perform action a19 { doc /* keeps affected medication unavailable until the relevant order and product checks are repeated successfully @S217 */ }
            perform action a20 { doc /* reviews medication orders affected by the outage @S232 */ }
        }
        part continuousSensors : ContinuousSensors {
            perform action a0 { doc /* record temperature readings @S039 */ }
            perform action a1 { doc /* report excursions or loss of monitoring connectivity @S039 */ }
        }
        part dispatchPersonnel : DispatchPersonnel {
            perform action a0 { doc /* hold affected capsules @S053 */ }
            perform action a1 { doc /* prevent additional traffic from entering a route with an unresolved fault @S053 */ }
        }
        part eastTubeDispatchConsole : EastTubeDispatchConsole {
            perform action a0 { doc /* provide controlled interfaces for routing authorized pharmacy deliveries @S016 */ }
            perform action a1 { doc /* monitors capsule movement @S051 */ }
            perform action a2 { doc /* records route, timing, and equipment status for each dispatch @S051 */ }
            perform action a3 { doc /* sends a Tube Route Exception Ticket @S052 */ }
            perform action a4 { doc /* checks the requested route @S094 */ }
            perform action a5 { doc /* reports whether the route is available for dispatch @S094 */ }
            perform action a6 { doc /* maintains the approved route map and the current availability status of supported pneumatic segments @S183 */ }
            perform action a7 { doc /* checks the selected route against the destination cabinet, current network availability, and approved routing configuration @S184 */ }
            perform action a8 { doc /* releasing a capsule @S184 */ }
            perform action a9 { doc /* confirms that the destination is reachable and that the route does not include a segment reported unavailable @S185 */ }
            perform action a10 { doc /* uses the destination identifier and the latest approved configuration version @S186 */ }
            perform action a11 { doc /* checks for conflicting capsule movements @S187 */ }
            perform action a12 { doc /* confirms that required interlocks are satisfied @S187 */ }
            perform action a13 { doc /* dispatch @S187 */ }
            perform action a14 { doc /* holds the capsule @S189 */ }
            perform action a15 { doc /* displays the condition for operator review @S189 */ }
            perform action a16 { doc /* alerts a Pharmacy Technician @S192 */ }
            perform action a17 { doc /* requires refreshed segment status and an approved route decision @S193 */ }
            perform action a18 { doc /* dispatch resumes @S193 */ }
        }
        part hospitalCourier : HospitalCourier {
            perform action a0 { doc /* supports authorized movement of medication and returns @S023 */ }
            perform action a1 { doc /* checks package count, packaging integrity, destination information, and any special handling instructions @S089 */ }
            perform action a2 { doc /* records the time and identity associated with acceptance @S090 */ }
            perform action a3 { doc /* produces the Pneumatic Capsule Seal Record @S091 */ }
            perform action a4 { doc /* verifies that the capsule is closed securely and that its contents are not exposed during handling @S092 */ }
            perform action a5 { doc /* collects only bins that are closed and recorded as ready for collection @S121 */ }
            perform action a6 { doc /* confirms physical receipt @S241 */ }
        }
        part iTOperationsSpecialist : ITOperationsSpecialist {
            perform action a0 { doc /* monitors system connectivity and service availability @S024 */ }
            perform action a1 { doc /* checks console connectivity, interface health, and relevant system logs @S061 */ }
            perform action a2 { doc /* checks controller communications and application health @S069 */ }
            perform action a3 { doc /* receives the Diversion Review Packet @S141 */ }
            perform action a4 { doc /* checks access, transaction, and device logs without changing the clinical disposition @S141 */ }
            perform action a5 { doc /* investigates software or connectivity faults @S143 */ }
            perform action a6 { doc /* records the technical findings for the responsible operational team @S143 */ }
            perform action a7 { doc /* investigates authentication, interface, and time-synchronization faults @S215 */ }
            perform action a8 { doc /* uses the Cabinet Downtime Notice to open a controlled incident record @S222 */ }
            perform action a9 { doc /* identify the affected cabinet @S222 */ }
            perform action a10 { doc /* checks controller status, network connectivity, and recent event logs @S223 */ }
            perform action a11 { doc /* attempting recovery @S223 */ }
            perform action a12 { doc /* records the time the fault was detected and the affected equipment identifier @S224 */ }
            perform action a13 { doc /* isolates the fault where necessary @S226 */ }
            perform action a14 { doc /* checks whether any transaction was interrupted before the cabinet became unavailable @S228 */ }
            perform action a15 { doc /* coordinates technical troubleshooting with the Biomedical Engineer @S231 */ }
            perform action a16 { doc /* verifies communications, status reporting, and cabinet transaction behavior @S235 */ }
            perform action a17 { doc /* monitors cabinet and tube service status for recurrence @S243 */ }
        }
        part load : Load {
            exhibit state modes {
                state s0 { doc /* on hold @S096 */ }
            }
        }
        part loadManifest : LoadManifest {
            perform action a0 { doc /* identifies each package, its intended destination, handling requirements, and the time it was assembled @S085 */ }
        }
        part medicationOrderGateway : MedicationOrderGateway {
            perform action a0 { doc /* provides the controlled entry point for medication orders @S008 */ }
            perform action a1 { doc /* communicates order status to authorized hospital systems @S008 */ }
            perform action a2 { doc /* accepts medication orders from authorized clinical systems @S029 */ }
            perform action a3 { doc /* records their arrival times @S029 */ }
            perform action a4 { doc /* checks required order fields, patient identifiers, medication codes, quantities, and destination details @S030 */ }
            perform action a5 { doc /* routing an order for pharmacy review @S030 */ }
            perform action a6 { doc /* flags missing data, duplicate submissions, and changes that conflict with the active order record @S031 */ }
            perform action a7 { doc /* produces the Order Reconciliation Snapshot @S032 */ }
            perform action a8 { doc /* provides the current order status @S081 */ }
            perform action a9 { doc /* rejects incomplete or internally inconsistent order updates @S136 */ }
            perform action a10 { doc /* retains the rejection reason for review @S136 */ }
            perform action a11 { doc /* validates each medication order for patient, product, dose, route, and timing fields @S147 */ }
            perform action a12 { doc /* making it available for downstream processing @S147 */ }
            perform action a13 { doc /* retains pending requests for review @S227 */ }
        }
        part medicationReturnKiosk : MedicationReturnKiosk {
            perform action a0 { doc /* recording medication returns @S020 */ }
            perform action a1 { doc /* capturing return details @S020 */ }
            perform action a2 { doc /* produces the Return Bin Audit Label for a recorded return transaction @S021 */ }
            perform action a3 { doc /* guides ward staff through return-bin checks @S116 */ }
            perform action a4 { doc /* records each check outcome @S116 */ }
        }
        part medicationSafetyOfficer : MedicationSafetyOfficer {
            perform action a0 { doc /* oversees safety concerns @S025 */ }
            perform action a1 { doc /* reviews relevant trends @S025 */ }
            perform action a2 { doc /* supports updates to medication handling procedures @S025 */ }
            perform action a3 { doc /* reviews patterns of discrepancies and handling events @S046 */ }
            perform action a4 { doc /* produces the Diversion Review Packet @S047 */ }
            perform action a5 { doc /* reviews suspected diversion, repeated high-risk exceptions, and events with potential for patient harm @S140 */ }
            perform action a6 { doc /* reviews any discrepancy that could change medication identity, access control, or patient risk @S216 */ }
        }
        part northWardCabinetController : NorthWardCabinetController {
            perform action a0 { doc /* reports cabinet availability @S066 */ }
            perform action a1 { doc /* prevents dispensing when its recorded state is Out of Service @S066 */ }
            perform action a2 { doc /* records the arrival time and the destination cabinet @S101 */ }
            perform action a3 { doc /* uses the Priority Refill Tote Tag to confirm the intended ward @S103 */ }
            perform action a4 { doc /* prevents access to a held transaction @S137 */ }
            perform action a5 { doc /* applies the North Ward medication access rules @S161 */ }
            perform action a6 { doc /* rejects a transaction @S168 */ }
            perform action a7 { doc /* prevents routine dispensing @S170 */ }
            perform action a8 { doc /* reports the condition for investigation @S170 */ }
            exhibit state modes {
                state s0 { doc /* Out of Service @S066,S225 */ }
            }
        }
        part operations : Operations {
            perform action a0 { doc /* closes the interruption @S073 */ }
        }
        part operationsStaff : OperationsStaff {
            perform action a0 { doc /* review queue status @S054 */ }
            perform action a1 { doc /* coordinate any approved alternate route with the affected wards @S054 */ }
        }
        part pharmacyFulfillmentRobot : PharmacyFulfillmentRobot {
            perform action a0 { doc /* produces the Priority Refill Tote Tag for eligible refill work @S011 */ }
            perform action a1 { doc /* prepares eligible medication against the active order @S013 */ }
            perform action a2 { doc /* records its handling actions @S013 */ }
            perform action a3 { doc /* prepares only orders that have passed the required review and authorization checks @S037 */ }
            perform action a4 { doc /* presents the completed package at the Pharmacy Verification Station @S077 */ }
            perform action a5 { doc /* stops the affected pick sequence @S125 */ }
            perform action a6 { doc /* keeps the package in a controlled hold location pending review @S125 */ }
            perform action a7 { doc /* preserves the scanned product and quantity data associated with the exception @S126 */ }
            perform action a8 { doc /* uses the Order Reconciliation Snapshot @S149 */ }
            perform action a9 { doc /* compare requested quantities with completed dispense events and current cabinet balances @S149 */ }
            perform action a10 { doc /* retains the patient, medication, dose, route, and timing details associated with each order @S152 */ }
            perform action a11 { doc /* preparing a dispense transaction @S152 */ }
            perform action a12 { doc /* checks whether the order is active and whether its authorization remains valid at the time of processing @S153 */ }
            exhibit state modes {
                state s0 { doc /* inhibited @S202 */ }
            }
        }
        part pharmacyTechnician : PharmacyTechnician {
            perform action a0 { doc /* performs routine preparation tasks within approved procedures @S010 */ }
            perform action a1 { doc /* escalates discrepancies to the Clinical Pharmacist @S010 */ }
            perform action a2 { doc /* investigates administrative discrepancies @S035 */ }
            perform action a3 { doc /* requests clarification through approved clinical channels @S035 */ }
            perform action a4 { doc /* checks the cooler's status @S040 */ }
            perform action a5 { doc /* confirms that refrigerated stock remains within handling limits before use @S040 */ }
            perform action a6 { doc /* produces the Cold Chain Handoff Card @S041 */ }
            perform action a7 { doc /* checks packaging, product identity, lot details, and expiry information @S045 */ }
            perform action a8 { doc /* verifies capsule contents and order identifiers @S056 */ }
            perform action a9 { doc /* confirms that the package contents and patient identifiers match the verified order @S076 */ }
            perform action a10 { doc /* uses the audit label to identify a return bin @S117 */ }
            perform action a11 { doc /* gather package and transaction evidence @S135 */ }
            perform action a12 { doc /* confirms that the reconciliation queue has no unresolved discrepancy @S148 */ }
            perform action a13 { doc /* authorizing routine cabinet replenishment @S148 */ }
            perform action a14 { doc /* checks package integrity, lot identification, and expiry @S198 */ }
            perform action a15 { doc /* presenting the medication for verification @S198 */ }
        }
        part pharmacyVerificationStation : PharmacyVerificationStation {
            perform action a0 { doc /* supports a final verification step @S014 */ }
            perform action a1 { doc /* displays queued orders and their validation results for review @S033 */ }
            perform action a2 { doc /* preserves review decisions and order status changes in an auditable record @S048 */ }
            perform action a3 { doc /* records the verification outcome @S078 */ }
            perform action a4 { doc /* prevents release while required checks remain incomplete @S078 */ }
            perform action a5 { doc /* produces the Batch Release Note @S079 */ }
            perform action a6 { doc /* compares the active order with the scanned product, strength, and measured quantity @S127 */ }
            perform action a7 { doc /* blocks verification when a field differs @S127 */ }
            perform action a8 { doc /* uses the review slip to record the exception category, evidence checked, disposition, and reviewer identity @S128 */ }
            perform action a9 { doc /* serves as the final controlled checkpoint @S195 */ }
            perform action a10 { doc /* confirm that pending medication orders remain valid @S229 */ }
        }
        part pneumaticTubeNetwork : PneumaticTubeNetwork {
            perform action a0 { doc /* carries compatible deliveries between designated hospital locations @S017 */ }
            perform action a1 { doc /* accepts only loads that meet the applicable packaging and routing requirements @S093 */ }
            perform action a2 { doc /* reports segment status, transfer progress, and delivery confirmation @S188 */ }
            exhibit state modes {
                state s0 { doc /* unavailable @S055 */ }
                state s1 { doc /* under monitoring @S240 */ }
            }
        }
        part receivingDepartment : ReceivingDepartment {
            perform action a0 { doc /* confirms arrival @S098 */ }
            perform action a1 { doc /* reports any discrepancy through the established operational process @S098 */ }
        }
        part registeredNurse : RegisteredNurse {
            perform action a0 { doc /* confirms whether the ward still requires the medication @S058 */ }
            perform action a1 { doc /* follows the approved contingency process if delivery is delayed @S058 */ }
            perform action a2 { doc /* verifies that the load is intended for the ward @S100 */ }
            perform action a3 { doc /* checks that the load remained within the required handling conditions @S107 */ }
            perform action a4 { doc /* confirms that the contents are eligible for return and are separated from waste and non-medication items @S114 */ }
            perform action a5 { doc /* keeps the cabinet transaction locked @S131 */ }
            perform action a6 { doc /* confirms that the medication has not been administered @S131 */ }
            perform action a7 { doc /* escalates an urgent patient-care concern to the Clinical Pharmacist @S132 */ }
            perform action a8 { doc /* follows the hospital's clinical response procedure @S132 */ }
            perform action a9 { doc /* authenticates at the cabinet @S207 */ }
            perform action a10 { doc /* selects the medication associated with the active patient order @S207 */ }
            perform action a11 { doc /* uses the established clinical process for urgent medication needs @S233 */ }
        }
        part responsibleStaff : ResponsibleStaff {
            perform action a0 { doc /* confirm that no unresolved transaction could cause a duplicate or missed dispense @S236 */ }
            perform action a1 { doc /* approve its return to Ready for Dispense @S237 */ }
        }
        part returnBin : ReturnBin {
            exhibit state modes {
                state s0 { doc /* secured in its designated holding location @S120 */ }
            }
        }
        part returnedMedication : ReturnedMedication {
            exhibit state modes {
                state s0 { doc /* segregated @S022 */ }
            }
        }
        part sensorMonitoredMedicationCooler : SensorMonitoredMedicationCooler {
            perform action a0 { doc /* maintains monitored storage conditions for medication that requires temperature control @S015 */ }
            perform action a1 { doc /* maintains refrigerated medications within the facility's approved temperature range @S038 */ }
            perform action a2 { doc /* records temperature conditions @S088 */ }
            perform action a3 { doc /* displays the current temperature and any recorded excursion @S108 */ }
            perform action a4 { doc /* reports excursions that could affect medication suitability @S139 */ }
            perform action a5 { doc /* maintains a time-stamped temperature history @S171 */ }
            perform action a6 { doc /* raises an alarm @S171 */ }
            perform action a7 { doc /* applies approved upper and lower temperature limits @S172 */ }
            perform action a8 { doc /* records probe identity and calibration status @S173 */ }
            perform action a9 { doc /* preserves the affected stock @S176 */ }
            perform action a10 { doc /* uses the handoff card to compare a transfer's recorded custody time with its temperature history @S177 */ }
            perform action a11 { doc /* retains the disposition status against the affected lot @S179 */ }
            perform action a12 { doc /* prevents stock marked ineligible from being selected for routine dispensing @S179 */ }
            exhibit state modes {
                state s0 { doc /* excursion @S042 */ }
            }
        }
        part serviceRecord : ServiceRecord;
        part southWardCabinetController : SouthWardCabinetController {
            perform action a0 { doc /* applies the same availability controls for its assigned ward @S067 */ }
            perform action a1 { doc /* records the arrival time and the destination cabinet @S102 */ }
            perform action a2 { doc /* reports a failed lock or an unrecognized access attempt @S138 */ }
            perform action a3 { doc /* receives the release note @S204 */ }
            perform action a4 { doc /* applies its own approved cabinet configuration @S204 */ }
            perform action a5 { doc /* enabling any compartment @S204 */ }
            perform action a6 { doc /* checks its local compartment mapping, access rules, and supported medication classes against that configuration @S205 */ }
            perform action a7 { doc /* reports Ready for Dispense @S206 */ }
            perform action a8 { doc /* checks the requested selection against its local authorization rules @S208 */ }
            perform action a9 { doc /* unlocking a compartment @S208 */ }
            perform action a10 { doc /* records the user, order reference, compartment access, and transaction time for audit review @S209 */ }
            exhibit state modes {
                state s0 { doc /* Out of Service @S225 */ }
                state s1 { doc /* Ready for Dispense @S206 */ }
            }
        }
        part staff : Staff {
            perform action a0 { doc /* confirm that dispensing and delivery workflows are functioning as intended @S073 */ }
            perform action a1 { doc /* resolve the condition @S096 */ }
            perform action a2 { doc /* document the outcome @S096 */ }
            perform action a3 { doc /* retain custody @S097 */ }
            perform action a4 { doc /* use an approved alternate delivery procedure @S097 */ }
            perform action a5 { doc /* accept a tote @S103 */ }
            perform action a6 { doc /* inspect the outer packaging for damage, moisture, tampering, or other signs @S104 */ }
            perform action a7 { doc /* isolate a load @S109 */ }
            perform action a8 { doc /* do not place an unresolved load into active cabinet stock @S110 */ }
            perform action a9 { doc /* check that each return bin closes securely @S115 */ }
            perform action a10 { doc /* reconcile the bin contents with the return entry @S118 */ }
        }
        part technicalStaff : TechnicalStaff {
            perform action a0 { doc /* document the fault, corrective action, and verification results in the applicable service record @S071 */ }
        }
        part transaction : Transaction {
            exhibit state modes {
                state s0 { doc /* on hold @S124 */ }
            }
        }
        part ward : Ward {
            perform action a0 { doc /* follows its approved contingency procedure @S065 */ }
            perform action a1 { doc /* confirms access to an authorized dispensing location @S065 */ }
            perform action a2 { doc /* records receipt completion and any discrepancy @S112 */ }
        }
        part wardStaff : WardStaff {
            perform action a0 { doc /* use an approved alternative without losing medication accountability @S063 */ }
            perform action a1 { doc /* perform a receipt check on each arriving load @S099 */ }
            perform action a2 { doc /* placing medication in a cabinet or transferring custody @S099 */ }
            perform action a3 { doc /* compare package identifiers with the cabinet task list @S105 */ }
            perform action a4 { doc /* confirm that the identifiers are legible @S105 */ }
            perform action a5 { doc /* check return bins before use @S113 */ }
        }
        part westTubeDispatchConsole : WestTubeDispatchConsole {
            perform action a0 { doc /* provide controlled interfaces for routing authorized pharmacy deliveries @S016 */ }
            perform action a1 { doc /* verify capsule identity and seal status @S238 */ }
            perform action a2 { doc /* closing its dispatch-side handoff checks @S238 */ }
            perform action a3 { doc /* records completion of its handoff checks @S239 */ }
            perform action a4 { doc /* retains the handoff completion status @S242 */ }
        }
        flow f0 of OrderStatusItem from medicationOrderGateway to authorizedHospitalSystems { doc /* @S008 */ }
        flow f1 of DiscrepanciesItem from pharmacyTechnician to clinicalPharmacist { doc /* @S010 */ }
        flow f2 of MedicationOrderItem from authorizedClinicalSystems to medicationOrderGateway { doc /* @S029 */ }
        flow f3 of ExpectedDeliveryDelaysAndAnyApprovedLocalWorkaroundItem from chargeNurse to wardStaff { doc /* @S059 */ }
        flow f4 of FaultCorrectiveActionAndVerificationResultsItem from technicalStaff to serviceRecord { doc /* @S071 */ }
        flow f5 of CompletedPackageItem from pharmacyFulfillmentRobot to pharmacyVerificationStation { doc /* @S077 */ }
        flow f6 of PriorityRefillToteTagItem from pharmacyFulfillmentRobot to northWardCabinetController { doc /* @S103 */ }
        flow f7 of CurrentTemperatureAndRecordedExcursionItem from sensorMonitoredMedicationCooler to staff { doc /* @S108 */ }
        flow f8 of ReturnBinAuditLabelItem from medicationReturnKiosk to pharmacyTechnician { doc /* @S117 */ }
        flow f9 of DoseExceptionReviewSlipItem from clinicalPharmacist to pharmacyVerificationStation { doc /* @S128 */ }
        flow f10 of UrgentPatientCareConcernItem from registeredNurse to clinicalPharmacist { doc /* @S132 */ }
        flow f11 of DiversionReviewPacketItem from medicationSafetyOfficer to iTOperationsSpecialist { doc /* @S141 */ }
        flow f12 of OrderReconciliationSnapshotItem from medicationOrderGateway to pharmacyFulfillmentRobot { doc /* @S149 */ }
        flow f13 of ReadingsItem from calibratedProbe to sensorMonitoredMedicationCooler { doc /* @S173 */ }
        flow f14 of ColdChainHandoffCardItem from pharmacyTechnician to sensorMonitoredMedicationCooler { doc /* @S177 */ }
        flow f15 of ExcursionDetailsItem from sensorMonitoredMedicationCooler to clinicalPharmacist { doc /* @S178 */ }
        flow f16 of SegmentStatusItem from pneumaticTubeNetwork to eastTubeDispatchConsole { doc /* @S188 */ }
        flow f17 of TransferProgressItem from pneumaticTubeNetwork to eastTubeDispatchConsole { doc /* @S188 */ }
        flow f18 of DeliveryConfirmationItem from pneumaticTubeNetwork to eastTubeDispatchConsole { doc /* @S188 */ }
        flow f19 of AlertItem from eastTubeDispatchConsole to pharmacyTechnician { doc /* @S192 */ }
        flow f20 of BatchReleaseNoteItem from pharmacyVerificationStation to southWardCabinetController { doc /* @S204 */ }
        flow f21 of CompletedRepairsAndEquipmentLimitationsItem from biomedicalEngineer to iTOperationsSpecialist { doc /* @S234 */ }
    }
    requirement def R0 { doc /* Access rules require an authenticated user role appropriate to the requested medication and transaction type. @S166 */ subject s : NorthWardCabinetController; }
}
