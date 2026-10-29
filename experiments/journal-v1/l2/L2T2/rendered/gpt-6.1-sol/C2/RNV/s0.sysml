package L2Model {
    item def BatchReleaseNoteItem { doc /* @S204 */ }
    item def CabinetDowntimeNoticeItem { doc /* @S222 */ }
    item def ColdChainHandoffCardItem { doc /* @S177 */ }
    item def CompatibleDeliveriesItem { doc /* @S017 */ }
    item def CompletedPackageItem { doc /* @S077 */ }
    item def CompletedRepairsItem { doc /* @S234 */ }
    item def CurrentTemperatureItem { doc /* @S108 */ }
    item def DeliveryConfirmationItem { doc /* @S188 */ }
    item def DiscrepanciesItem { doc /* @S010 */ }
    item def DiversionReviewPacketItem { doc /* @S141 */ }
    item def DoseExceptionReviewSlipItem { doc /* @S128 */ }
    item def EquipmentLimitationsItem { doc /* @S234 */ }
    item def ExpectedDeliveryDelaysAndAnyApprovedLocalWorkaroundItem { doc /* @S059 */ }
    item def MedicationOrdersItem { doc /* @S029,S030 */ }
    item def OrderReconciliationSnapshotItem { doc /* @S149 */ }
    item def OrderStatusItem { doc /* @S008 */ }
    item def PneumaticCapsuleSealRecordItem { doc /* @S238 */ }
    item def PriorityRefillToteTagItem { doc /* @S103 */ }
    item def ReadingsItem { doc /* @S173 */ }
    item def RecordedExcursionItem { doc /* @S108 */ }
    item def ReturnBinAuditLabelItem { doc /* @S117 */ }
    item def RouteStatusItem { doc /* @S189 */ }
    item def SegmentStatusItem { doc /* @S188,S193 */ }
    item def TransferProgressItem { doc /* @S188 */ }
    item def TransferStopsProgressingOrCannotBeConfirmedAtItsDestinationItem { doc /* @S192 */ }
    item def TubeRouteExceptionTicketItem { doc /* @S211 */ }
    item def UrgentPatientCareConcernItem { doc /* @S132 */ }
    part def AccessEvent { doc /* @S181 */ }
    part def AffectedEquipment { doc /* @S142 */ }
    part def AffectedMedication { doc /* @S044 */ }
    part def AffectedStock { doc /* @S042,S139,S175,S178 */ }
    part def AffectedTransaction { doc /* @S124 */ }
    part def AuditRecords { doc /* @S220,S244 */ }
    part def AuthenticationInterfaceAndTimeSynchronizationFaults { doc /* @S215 */ }
    part def Authorization { doc /* @S153 */ }
    part def AuthorizedClinicalSystems { doc /* @S029 */ }
    part def AuthorizedHospitalSystems { doc /* @S008 */ }
    part def AuthorizedPharmacyProfessional { doc /* @S200 */ }
    part def AuthorizedReviewer { doc /* @S124 */ }
    part def AutomatedRoutes { doc /* @S023 */ }
    part def BiomedicalEngineer { doc /* @S024,S050,S060,S068,S142,S210,S211,S212,S214,S218,S234 */ }
    part def Cabinet { doc /* @S064,S072 */ }
    part def CabinetStaff { doc /* @S106 */ }
    part def CabinetTransaction { doc /* @S131 */ }
    part def CalibratedProbes { doc /* @S173,S175 */ }
    part def Changes { doc /* @S031 */ }
    part def ChargeNurse { doc /* @S019,S059,S064,S070,S122,S134,S222 */ }
    part def ClinicalPharmacist { doc /* @S009,S010,S012,S030,S034,S044,S057,S075,S083,S128,S129,S132,S145,S178,S196,S197,S199,S203,S217,S232 */ }
    part def ClinicalReview { doc /* @S145 */ }
    part def Communication { doc /* @S182 */ }
    part def Comparison { doc /* @S151 */ }
    part def ConfigurationChecks { doc /* @S206 */ }
    part def ConfiguredMaximumAndMinimumQuantities { doc /* @S165 */ }
    part def Contents { doc /* @S115 */ }
    part def ContinuousSensors { doc /* @S039 */ }
    part def Correction { doc /* @S130 */ }
    part def DesignatedHospitalLocations { doc /* @S017 */ }
    part def DestinationCabinet { doc /* @S185 */ }
    part def DeviceSelfTests { doc /* @S206 */ }
    part def Discrepancy { doc /* @S216 */ }
    part def DispatchPersonnel { doc /* @S053 */ }
    part def DispensingAndDeliveryWorkflows { doc /* @S073 */ }
    part def DispensingService { doc /* @S019 */ }
    part def DiversionConcern { doc /* @S047 */ }
    part def EastTubeDispatchConsole { doc /* @S016,S051,S052,S094,S183,S184,S185,S186,S187,S188,S189,S190,S191,S192,S193,S211 */ }
    part def Equipment { doc /* @S231 */ }
    part def Evidence { doc /* @S146 */ }
    part def Excursions { doc /* @S042,S139 */ }
    part def Fault { doc /* @S060 */ }
    part def FinalDisposition { doc /* @S146 */ }
    part def FinalPharmacyRelease { doc /* @S074 */ }
    part def FunctionalChecks { doc /* @S219,S237 */ }
    part def HeldTransaction { doc /* @S137 */ }
    part def HighRiskMedicationLocations { doc /* @S167 */ }
    part def HospitalCourier { doc /* @S023,S089,S090,S091,S092,S121,S238,S241 */ }
    part def ITOperationsSpecialist { doc /* @S024,S061,S069,S141,S143,S215,S222,S223,S224,S226,S228,S231,S234,S235,S243 */ }
    part def Load { doc /* @S084,S096 */ }
    part def LoadManifest { doc /* @S085 */ }
    part def LocationMapping { doc /* @S168 */ }
    part def Medication { doc /* @S088,S146,S200 */ }
    part def MedicationOrder { doc /* @S153,S154,S155 */ }
    part def MedicationOrderGateway { doc /* @S008,S029,S030,S031,S032,S081,S136,S147,S149,S227 */ }
    part def MedicationOrders { doc /* @S036,S037,S049 */ }
    part def MedicationReturnKiosk { doc /* @S020,S021,S116,S117 */ }
    part def MedicationSafetyOfficer { doc /* @S025,S046,S047,S140,S141,S216 */ }
    part def Mismatch { doc /* @S200 */ }
    part def NorthWardCabinetController { doc /* @S066,S101,S103,S137,S161,S168,S170,S225 */ }
    part def NorthWardMedicationAccessRules { doc /* @S166 */ }
    part def OperationsStaff { doc /* @S054,S062,S073 */ }
    part def Operator { doc /* @S189 */ }
    part def OtherAuthorizedWardStaffMember { doc /* @S100 */ }
    part def Package { doc /* @S083 */ }
    part def PendingMedicationOrders { doc /* @S229 */ }
    part def PharmacyFulfillmentRobot { doc /* @S011,S013,S037,S077,S103,S125,S126,S149,S152,S153,S202,S230 */ }
    part def PharmacyTechnician { doc /* @S010,S035,S040,S041,S045,S056,S076,S117,S135,S148,S177,S192,S198 */ }
    part def PharmacyVerificationStation { doc /* @S014,S033,S048,S077,S078,S079,S127,S128,S195,S204,S229 */ }
    part def PneumaticTubeNetwork { doc /* @S017,S055,S093,S185,S188,S192,S193,S240 */ }
    part def Readings { doc /* @S175 */ }
    part def ReceivingDepartment { doc /* @S098 */ }
    part def Reconciliation { doc /* @S150 */ }
    part def ReconciliationOutcome { doc /* @S160 */ }
    part def Records { doc /* @S158,S159 */ }
    part def RefrigeratedStock { doc /* @S040,S174 */ }
    part def RegisteredNurse { doc /* @S058,S100,S107,S114,S131,S132,S133,S207,S233 */ }
    part def RepeatedDispenseRequests { doc /* @S226 */ }
    part def ReportedCondition { doc /* @S212 */ }
    part def Request { doc /* @S082 */ }
    part def RequiredChecks { doc /* @S049 */ }
    part def RequiredInterlocks { doc /* @S187 */ }
    part def ResponsibleStaff { doc /* @S219,S236,S237 */ }
    part def ReturnBin { doc /* @S115,S118,S120,S121 */ }
    part def ReturnedMedication { doc /* @S022,S119 */ }
    part def Reviewers { doc /* @S043 */ }
    part def Route { doc /* @S062 */ }
    part def RouteAndTemperatureRecords { doc /* @S194 */ }
    part def RouteStatus { doc /* @S189 */ }
    part def SensorMonitoredMedicationCooler { doc /* @S015,S038,S088,S108,S139,S171,S172,S173,S176,S177,S179 */ }
    part def SouthWardCabinetController { doc /* @S067,S102,S138,S204,S205,S206,S208,S209,S225 */ }
    part def Staff { doc /* @S096,S097,S103,S104,S108,S109,S110,S115,S118 */ }
    part def SupportedPneumaticSegments { doc /* @S185,S190 */ }
    part def TechnicalStaff { doc /* @S071 */ }
    part def TemperatureAlarms { doc /* @S182 */ }
    part def TemperatureSensitivePackages { doc /* @S087 */ }
    part def Transaction { doc /* @S145,S159 */ }
    part def UnresolvedDiscrepancies { doc /* @S036 */ }
    part def UnresolvedReceiptOrReturnDiscrepancies { doc /* @S122 */ }
    part def UnresolvedTransaction { doc /* @S236 */ }
    part def VerificationRecord { doc /* @S201 */ }
    part def Ward { doc /* @S058,S065,S112,S163 */ }
    part def WardSpecificConfiguration { doc /* @S162,S163 */ }
    part def WardStaff { doc /* @S059,S063,S099,S105,S113 */ }
    part def WestTubeDispatchConsole { doc /* @S016,S238,S239,S240,S242 */ }
    part system {
        part accessEvent : AccessEvent {
            perform action a0 { doc /* threatens temperature control @S181 */ }
        }
        part affectedEquipment : AffectedEquipment {
            perform action a0 { doc /* can safely return to service @S142 */ }
        }
        part affectedMedication : AffectedMedication {
            perform action a0 { doc /* remains suitable for dispensing under approved procedures @S044 */ }
        }
        part affectedStock : AffectedStock {
            exhibit state modes {
                state s0 { doc /* discarded @S178 */ }
                state s1 { doc /* ineligible for routine dispensing @S175 */ }
                state s2 { doc /* quarantined @S178 */ }
                state s3 { doc /* released @S178 */ }
                state s4 { doc /* segregated @S042 */ }
                state s5 { doc /* unavailable @S139 */ }
            }
        }
        part affectedTransaction : AffectedTransaction {
            exhibit state modes {
                state s0 { doc /* on hold @S124 */ }
            }
        }
        part auditRecords : AuditRecords {
            perform action a0 { doc /* retain timestamps, equipment identifiers, and disposition details @S220 */ }
            perform action a1 { doc /* support operational review and investigation @S220 */ }
            perform action a2 { doc /* retain timestamps, equipment identifiers, recovery checks, and disposition details @S244 */ }
            perform action a3 { doc /* support operational review and investigation @S244 */ }
        }
        part authenticationInterfaceAndTimeSynchronizationFaults : AuthenticationInterfaceAndTimeSynchronizationFaults {
            perform action a0 { doc /* could affect transaction records @S215 */ }
        }
        part authorization : Authorization {
            exhibit state modes {
                state s0 { doc /* valid @S153 */ }
            }
        }
        part authorizedClinicalSystems : AuthorizedClinicalSystems;
        part authorizedHospitalSystems : AuthorizedHospitalSystems;
        part authorizedPharmacyProfessional : AuthorizedPharmacyProfessional {
            perform action a0 { doc /* is resolved by an authorized pharmacy professional @S200 */ }
        }
        part authorizedReviewer : AuthorizedReviewer {
            perform action a0 { doc /* documents a disposition @S124 */ }
        }
        part automatedRoutes : AutomatedRoutes {
            exhibit state modes {
                state s0 { doc /* unavailable @S023 */ }
                state s1 { doc /* unsuitable @S023 */ }
            }
        }
        part biomedicalEngineer : BiomedicalEngineer {
            perform action a0 { doc /* maintains supported equipment @S024 */ }
            perform action a1 { doc /* supports technical recovery for dispensing and transport equipment @S050 */ }
            perform action a2 { doc /* inspects tube hardware, switches, and sensors @S060 */ }
            perform action a3 { doc /* evaluates cabinet hardware @S068 */ }
            perform action a4 { doc /* verifies safe operation after repair or component replacement @S068 */ }
            perform action a5 { doc /* evaluates a suspected mechanical or sensor fault @S142 */ }
            perform action a6 { doc /* advises whether the affected equipment can safely return to service @S142 */ }
            perform action a7 { doc /* reviews the received operational record @S210 */ }
            perform action a8 { doc /* correlates its equipment identifiers and timestamps with local telemetry @S210 */ }
            perform action a9 { doc /* records an engineering disposition @S210 */ }
            perform action a10 { doc /* uses the exception ticket @S211 */ }
            perform action a11 { doc /* identify the affected path @S211 */ }
            perform action a12 { doc /* compare reported symptoms with equipment telemetry @S211 */ }
            perform action a13 { doc /* checks whether the reported condition is isolated to one device or indicates a broader service risk @S212 */ }
            perform action a14 { doc /* isolates the affected subsystem @S214 */ }
            perform action a15 { doc /* performs only the diagnostic steps approved for that equipment @S214 */ }
            perform action a16 { doc /* records the corrective action, test evidence, and approvals required to return the equipment to operation @S218 */ }
            perform action a17 { doc /* reports completed repairs and any equipment limitations to the IT Operations Specialist @S234 */ }
        }
        part cabinet : Cabinet {
            perform action a0 { doc /* cannot support normal dispensing @S064 */ }
            perform action a1 { doc /* remains unavailable until its controller reports Ready for Dispense and required operational checks are complete @S072 */ }
            exhibit state modes {
                state s0 { doc /* Ready for Dispense @S072 */ }
                state s1 { doc /* unavailable @S072 */ }
            }
        }
        part cabinetStaff : CabinetStaff {
            perform action a0 { doc /* verify the quantity and medication descriptions against the expected receipt record @S106 */ }
        }
        part cabinetTransaction : CabinetTransaction {
            exhibit state modes {
                state s0 { doc /* locked @S131 */ }
            }
        }
        part calibratedProbes : CalibratedProbes {
            perform action a0 { doc /* report readings at configured intervals @S173 */ }
            perform action a1 { doc /* becomes unavailable @S175 */ }
            exhibit state modes {
                state s0 { doc /* unavailable @S175 */ }
            }
        }
        part changes : Changes {
            perform action a0 { doc /* conflict with the active order record @S031 */ }
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
            perform action a5 { doc /* determines whether affected medication remains suitable for dispensing under approved procedures @S044 */ }
            perform action a6 { doc /* reviews any medication whose storage conditions or delivery timing may affect its suitability for use @S057 */ }
            perform action a7 { doc /* reviews clinical and labeling exceptions that require professional judgment @S075 */ }
            perform action a8 { doc /* authorizing release @S075 */ }
            perform action a9 { doc /* documents the disposition of any clinical concern @S083 */ }
            perform action a10 { doc /* assesses dose, route, timing, and patient-specific clinical concerns @S129 */ }
            perform action a11 { doc /* approving a correction @S129 */ }
            perform action a12 { doc /* rejecting the order @S129 */ }
            perform action a13 { doc /* seeks a higher-level clinical decision @S145 */ }
            perform action a14 { doc /* reviews excursion details @S178 */ }
            perform action a15 { doc /* determines whether affected stock may be released, quarantined, or discarded under pharmacy policy @S178 */ }
            perform action a16 { doc /* compares the active medication order with the product, strength, dosage form, dose, route, and scheduled time @S196 */ }
            perform action a17 { doc /* confirms that the patient identifiers and pharmacy label agree with the authorized order @S197 */ }
            perform action a18 { doc /* is completed @S199 */ }
            perform action a19 { doc /* recorded @S199 */ }
            perform action a20 { doc /* resolves unclear or conflicting order details through the Medication Order Gateway @S203 */ }
            perform action a21 { doc /* authorizing release @S203 */ }
            perform action a22 { doc /* keeps affected medication unavailable until the relevant order and product checks are repeated successfully @S217 */ }
            perform action a23 { doc /* reviews medication orders affected by the outage when clinical validation is needed @S232 */ }
        }
        part clinicalReview : ClinicalReview {
            exhibit state modes {
                state s0 { doc /* inconclusive @S145 */ }
            }
        }
        part communication : Communication {
            exhibit state modes {
                state s0 { doc /* restored @S182 */ }
            }
        }
        part comparison : Comparison {
            perform action a0 { doc /* preserves the order context needed to distinguish a new request from a correction or a repeat submission @S151 */ }
        }
        part configurationChecks : ConfigurationChecks {
            perform action a0 { doc /* pass @S206 */ }
        }
        part configuredMaximumAndMinimumQuantities : ConfiguredMaximumAndMinimumQuantities {
            perform action a0 { doc /* guide replenishment decisions @S165 */ }
            perform action a1 { doc /* without overriding an active clinical restriction @S165 */ }
        }
        part contents : Contents {
            perform action a0 { doc /* do not obstruct the closure @S115 */ }
        }
        part continuousSensors : ContinuousSensors {
            perform action a0 { doc /* record temperature readings @S039 */ }
            perform action a1 { doc /* report excursions or loss of monitoring connectivity @S039 */ }
        }
        part correction : Correction;
        part designatedHospitalLocations : DesignatedHospitalLocations;
        part destinationCabinet : DestinationCabinet {
            exhibit state modes {
                state s0 { doc /* reachable @S185 */ }
            }
        }
        part deviceSelfTests : DeviceSelfTests {
            perform action a0 { doc /* pass @S206 */ }
        }
        part discrepancy : Discrepancy {
            perform action a0 { doc /* could change medication identity, access control, or patient risk @S216 */ }
        }
        part dispatchPersonnel : DispatchPersonnel {
            perform action a0 { doc /* hold affected capsules @S053 */ }
            perform action a1 { doc /* prevent additional traffic from entering a route with an unresolved fault @S053 */ }
        }
        part dispensingAndDeliveryWorkflows : DispensingAndDeliveryWorkflows {
            perform action a0 { doc /* are functioning as intended @S073 */ }
        }
        part dispensingService : DispensingService {
            exhibit state modes {
                state s0 { doc /* disrupted @S019 */ }
            }
        }
        part diversionConcern : DiversionConcern {
            perform action a0 { doc /* requires documented review @S047 */ }
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
            perform action a10 { doc /* uses the destination identifier and the latest approved configuration version rather than an operator-entered sequence of segments @S186 */ }
            perform action a11 { doc /* checks for conflicting capsule movements @S187 */ }
            perform action a12 { doc /* confirms that required interlocks are satisfied @S187 */ }
            perform action a13 { doc /* holds the capsule @S189 */ }
            perform action a14 { doc /* displays the condition for operator review @S189 */ }
            perform action a15 { doc /* treating the affected segment as available @S190 */ }
            perform action a16 { doc /* is recorded with the capsule identifier, last confirmed location, and time of the interruption @S191 */ }
            perform action a17 { doc /* alerts a Pharmacy Technician when a transfer stops progressing or cannot be confirmed at its destination @S192 */ }
            perform action a18 { doc /* cannot be confirmed at its destination @S192 */ }
            perform action a19 { doc /* requires refreshed segment status and an approved route decision @S193 */ }
            perform action a20 { doc /* resumes @S193 */ }
        }
        part equipment : Equipment;
        part evidence : Evidence {
            perform action a0 { doc /* supported the decision @S146 */ }
        }
        part excursions : Excursions {
            perform action a0 { doc /* occurs @S042 */ }
            perform action a1 { doc /* could affect medication suitability @S139 */ }
        }
        part fault : Fault {
            perform action a0 { doc /* indicates a physical problem @S060 */ }
        }
        part finalDisposition : FinalDisposition {
            perform action a0 { doc /* records who reviewed the exception, what evidence supported the decision, and whether the medication was released, corrected, or withheld @S146 */ }
        }
        part finalPharmacyRelease : FinalPharmacyRelease {
            perform action a0 { doc /* occurs @S074 */ }
        }
        part functionalChecks : FunctionalChecks {
            perform action a0 { doc /* pass @S219 */ }
            perform action a1 { doc /* pass @S237 */ }
        }
        part heldTransaction : HeldTransaction {
            exhibit state modes {
                state s0 { doc /* held @S137 */ }
            }
        }
        part highRiskMedicationLocations : HighRiskMedicationLocations {
            perform action a0 { doc /* can require an additional confirmation @S167 */ }
        }
        part hospitalCourier : HospitalCourier {
            perform action a0 { doc /* supports authorized movement of medication and returns when automated routes are unavailable or unsuitable @S023 */ }
            perform action a1 { doc /* checks package count, packaging integrity, destination information, and any special handling instructions @S089 */ }
            perform action a2 { doc /* records the time and identity associated with acceptance @S090 */ }
            perform action a3 { doc /* produces the Pneumatic Capsule Seal Record @S091 */ }
            perform action a4 { doc /* verifies that the capsule is closed securely and that its contents are not exposed during handling @S092 */ }
            perform action a5 { doc /* collects only bins that are closed and recorded as ready for collection @S121 */ }
            perform action a6 { doc /* confirms physical receipt through the established delivery process @S241 */ }
        }
        part iTOperationsSpecialist : ITOperationsSpecialist {
            perform action a0 { doc /* monitors system connectivity and service availability @S024 */ }
            perform action a1 { doc /* checks console connectivity, interface health, and relevant system logs @S061 */ }
            perform action a2 { doc /* checks controller communications and application health @S069 */ }
            perform action a3 { doc /* receives the Diversion Review Packet @S141 */ }
            perform action a4 { doc /* checks access, transaction, and device logs without changing the clinical disposition @S141 */ }
            perform action a5 { doc /* investigates software or connectivity faults @S143 */ }
            perform action a6 { doc /* records the technical findings for the responsible operational team @S143 */ }
            perform action a7 { doc /* investigates authentication, interface, and time-synchronization faults that could affect transaction records @S215 */ }
            perform action a8 { doc /* uses the Cabinet Downtime Notice @S222 */ }
            perform action a9 { doc /* open a controlled incident record @S222 */ }
            perform action a10 { doc /* identify the affected cabinet @S222 */ }
            perform action a11 { doc /* checks controller status, network connectivity, and recent event logs @S223 */ }
            perform action a12 { doc /* attempting recovery @S223 */ }
            perform action a13 { doc /* records the time the fault was detected and the affected equipment identifier @S224 */ }
            perform action a14 { doc /* isolates the fault where necessary @S226 */ }
            perform action a15 { doc /* prevent repeated dispense requests from reaching an unavailable cabinet @S226 */ }
            perform action a16 { doc /* checks whether any transaction was interrupted before the cabinet became unavailable @S228 */ }
            perform action a17 { doc /* was interrupted @S228 */ }
            perform action a18 { doc /* became unavailable @S228 */ }
            perform action a19 { doc /* coordinates technical troubleshooting with the Biomedical Engineer when equipment inspection or repair is required @S231 */ }
            perform action a20 { doc /* verifies communications, status reporting, and cabinet transaction behavior under controlled conditions @S235 */ }
            perform action a21 { doc /* monitors cabinet and tube service status for recurrence during the recovery period @S243 */ }
        }
        part load : Load {
            perform action a0 { doc /* enters the delivery network @S084 */ }
            exhibit state modes {
                state s0 { doc /* on hold @S096 */ }
            }
        }
        part loadManifest : LoadManifest {
            perform action a0 { doc /* identifies each package, its intended destination, handling requirements, and the time it was assembled @S085 */ }
        }
        part locationMapping : LocationMapping {
            perform action a0 { doc /* does not match the reconciled medication identity @S168 */ }
        }
        part medication : Medication {
            perform action a0 { doc /* awaits transfer @S088 */ }
            exhibit state modes {
                state s0 { doc /* corrected @S146 */ }
                state s1 { doc /* on hold @S200 */ }
                state s2 { doc /* released @S146 */ }
                state s3 { doc /* withheld @S146 */ }
            }
        }
        part medicationOrder : MedicationOrder {
            exhibit state modes {
                state s0 { doc /* active @S153 */ }
                state s1 { doc /* cancelled @S154 */ }
                state s2 { doc /* corrected @S155 */ }
            }
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
            perform action a8 { doc /* documenting detected order discrepancies @S032 */ }
            perform action a9 { doc /* provides the current order status used to confirm that the request remains valid @S081 */ }
            perform action a10 { doc /* rejects incomplete or internally inconsistent order updates @S136 */ }
            perform action a11 { doc /* retains the rejection reason for review @S136 */ }
            perform action a12 { doc /* validates each medication order for patient, product, dose, route, and timing fields @S147 */ }
            perform action a13 { doc /* making it available for downstream processing @S147 */ }
            perform action a14 { doc /* retains pending requests for review @S227 */ }
            perform action a15 { doc /* treating an interrupted transaction as completed @S227 */ }
        }
        part medicationOrders : MedicationOrders {
            perform action a0 { doc /* advancing to preparation @S036 */ }
            perform action a1 { doc /* have passed the required review and authorization checks @S037 */ }
            perform action a2 { doc /* remain unavailable for dispensing until required checks are complete and their status is authorized @S049 */ }
            exhibit state modes {
                state s0 { doc /* authorized @S049 */ }
                state s1 { doc /* unavailable for dispensing @S049 */ }
            }
        }
        part medicationReturnKiosk : MedicationReturnKiosk {
            perform action a0 { doc /* provides a controlled point for recording medication returns and capturing return details @S020 */ }
            perform action a1 { doc /* recording medication returns @S020 */ }
            perform action a2 { doc /* capturing return details @S020 */ }
            perform action a3 { doc /* produces the Return Bin Audit Label for a recorded return transaction @S021 */ }
            perform action a4 { doc /* guides ward staff through return-bin checks @S116 */ }
            perform action a5 { doc /* records each check outcome for follow-up @S116 */ }
        }
        part medicationSafetyOfficer : MedicationSafetyOfficer {
            perform action a0 { doc /* oversees safety concerns @S025 */ }
            perform action a1 { doc /* reviews relevant trends @S025 */ }
            perform action a2 { doc /* supports updates to medication handling procedures @S025 */ }
            perform action a3 { doc /* reviews patterns of discrepancies and handling events for potential safety concerns @S046 */ }
            perform action a4 { doc /* produces the Diversion Review Packet @S047 */ }
            perform action a5 { doc /* reviews suspected diversion, repeated high-risk exceptions, and events with potential for patient harm @S140 */ }
            perform action a6 { doc /* reviews any discrepancy that could change medication identity, access control, or patient risk @S216 */ }
        }
        part mismatch : Mismatch {
            perform action a0 { doc /* places the medication on hold @S200 */ }
        }
        part northWardCabinetController : NorthWardCabinetController {
            perform action a0 { doc /* reports cabinet availability @S066 */ }
            perform action a1 { doc /* prevents dispensing when its recorded state is Out of Service @S066 */ }
            perform action a2 { doc /* records the arrival time and the destination cabinet for loads assigned to the north ward @S101 */ }
            perform action a3 { doc /* uses the Priority Refill Tote Tag @S103 */ }
            perform action a4 { doc /* confirm the intended ward @S103 */ }
            perform action a5 { doc /* prevents access to a held transaction until an authorized disposition is recorded @S137 */ }
            perform action a6 { doc /* applies the North Ward medication access rules @S161 */ }
            perform action a7 { doc /* evaluating a cabinet transaction @S161 */ }
            perform action a8 { doc /* rejects a transaction @S168 */ }
            perform action a9 { doc /* has not received a current approved configuration @S170 */ }
            perform action a10 { doc /* prevents routine dispensing @S170 */ }
            perform action a11 { doc /* reports the condition for investigation @S170 */ }
            perform action a12 { doc /* remains Out of Service while the cause is assessed @S225 */ }
            exhibit state modes {
                state s0 { doc /* Out of Service @S066,S225 */ }
            }
        }
        part northWardMedicationAccessRules : NorthWardMedicationAccessRules {
            perform action a0 { doc /* require an authenticated user role appropriate to the requested medication and transaction type @S166 */ }
        }
        part operationsStaff : OperationsStaff {
            perform action a0 { doc /* review queue status @S054 */ }
            perform action a1 { doc /* coordinate any approved alternate route with the affected wards @S054 */ }
            perform action a2 { doc /* has authorized its return to use @S062 */ }
            perform action a3 { doc /* closes the interruption @S073 */ }
        }
        part operator : Operator;
        part otherAuthorizedWardStaffMember : OtherAuthorizedWardStaffMember {
            perform action a0 { doc /* verifies that the load is intended for the ward @S100 */ }
        }
        part packagePart : Package {
            perform action a0 { doc /* can proceed @S083 */ }
        }
        part pendingMedicationOrders : PendingMedicationOrders {
            perform action a0 { doc /* remain valid @S229 */ }
        }
        part pharmacyFulfillmentRobot : PharmacyFulfillmentRobot {
            perform action a0 { doc /* produces the Priority Refill Tote Tag for eligible refill work @S011 */ }
            perform action a1 { doc /* prepares eligible medication against the active order @S013 */ }
            perform action a2 { doc /* records its handling actions @S013 */ }
            perform action a3 { doc /* prepares only orders that have passed the required review and authorization checks @S037 */ }
            perform action a4 { doc /* presents the completed package at the Pharmacy Verification Station for the final check @S077 */ }
            perform action a5 { doc /* stops the affected pick sequence @S125 */ }
            perform action a6 { doc /* keeps the package in a controlled hold location pending review @S125 */ }
            perform action a7 { doc /* preserves the scanned product and quantity data associated with the exception @S126 */ }
            perform action a8 { doc /* uses the Order Reconciliation Snapshot @S149 */ }
            perform action a9 { doc /* compare requested quantities with completed dispense events and current cabinet balances @S149 */ }
            perform action a10 { doc /* retains the patient, medication, dose, route, and timing details associated with each order @S152 */ }
            perform action a11 { doc /* preparing a dispense transaction @S152 */ }
            perform action a12 { doc /* checks whether the order is active and whether its authorization remains valid at the time of processing @S153 */ }
            perform action a13 { doc /* completing a dispense @S202 */ }
            perform action a14 { doc /* is held from supplying medication to a cabinet that has not passed its recovery checks @S230 */ }
            perform action a15 { doc /* supplying medication to a cabinet that has not passed its recovery checks @S230 */ }
            perform action a16 { doc /* has not passed its recovery checks @S230 */ }
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
            perform action a7 { doc /* document custody and handling conditions @S041 */ }
            perform action a8 { doc /* checks packaging, product identity, lot details, and expiry information during routine stock handling @S045 */ }
            perform action a9 { doc /* verifies capsule contents and order identifiers @S056 */ }
            perform action a10 { doc /* confirms that the package contents and patient identifiers match the verified order @S076 */ }
            perform action a11 { doc /* uses the audit label @S117 */ }
            perform action a12 { doc /* identify a return bin for the scheduled collection @S117 */ }
            perform action a13 { doc /* may gather package and transaction evidence @S135 */ }
            perform action a14 { doc /* may not make a clinical dose decision @S135 */ }
            perform action a15 { doc /* confirms that the reconciliation queue has no unresolved discrepancy @S148 */ }
            perform action a16 { doc /* authorizing routine cabinet replenishment @S148 */ }
            perform action a17 { doc /* checks package integrity, lot identification, and expiry @S198 */ }
            perform action a18 { doc /* presenting the medication for verification @S198 */ }
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
            perform action a9 { doc /* record the exception category, evidence checked, disposition, and reviewer identity @S128 */ }
            perform action a10 { doc /* serves as the final controlled checkpoint @S195 */ }
            perform action a11 { doc /* is made available for dispensing @S195 */ }
            perform action a12 { doc /* is used to confirm that pending medication orders remain valid before they are re-presented @S229 */ }
            perform action a13 { doc /* confirm that pending medication orders remain valid @S229 */ }
            perform action a14 { doc /* are re-presented @S229 */ }
        }
        part pneumaticTubeNetwork : PneumaticTubeNetwork {
            perform action a0 { doc /* carries compatible deliveries between designated hospital locations under established routing procedures @S017 */ }
            perform action a1 { doc /* accepts only loads that meet the applicable packaging and routing requirements @S093 */ }
            perform action a2 { doc /* reported unavailable @S185 */ }
            perform action a3 { doc /* reports segment status, transfer progress, and delivery confirmation to the dispatch console @S188 */ }
            perform action a4 { doc /* stops progressing @S192 */ }
            perform action a5 { doc /* remains under monitoring while dispatch service is being restored @S240 */ }
            exhibit state modes {
                state s0 { doc /* unavailable @S055 */ }
            }
        }
        part readings : Readings {
            perform action a0 { doc /* exceed a limit @S175 */ }
        }
        part receivingDepartment : ReceivingDepartment {
            perform action a0 { doc /* confirms arrival @S098 */ }
            perform action a1 { doc /* reports any discrepancy through the established operational process @S098 */ }
        }
        part reconciliation : Reconciliation {
            perform action a0 { doc /* compares the active order record with dispensing and cabinet records using a stable order identifier @S150 */ }
            perform action a1 { doc /* using a stable order identifier @S150 */ }
        }
        part reconciliationOutcome : ReconciliationOutcome {
            perform action a0 { doc /* records the matched values, unresolved differences, and disposition for subsequent audit @S160 */ }
        }
        part records : Records {
            perform action a0 { doc /* arrive at different times @S158 */ }
            perform action a1 { doc /* disagree on patient, medication, or quantity @S159 */ }
        }
        part refrigeratedStock : RefrigeratedStock {
            perform action a0 { doc /* remains within handling limits @S040 */ }
            exhibit state modes {
                state s0 { doc /* traceable to its storage history @S174 */ }
            }
        }
        part registeredNurse : RegisteredNurse {
            perform action a0 { doc /* confirms whether the ward still requires the medication @S058 */ }
            perform action a1 { doc /* follows the approved contingency process if delivery is delayed @S058 */ }
            perform action a2 { doc /* verifies that the load is intended for the ward @S100 */ }
            perform action a3 { doc /* checks that the load remained within the required handling conditions @S107 */ }
            perform action a4 { doc /* confirms that the contents are eligible for return and are separated from waste and non-medication items @S114 */ }
            perform action a5 { doc /* keeps the cabinet transaction locked @S131 */ }
            perform action a6 { doc /* confirms that the medication has not been administered while review is pending @S131 */ }
            perform action a7 { doc /* escalates an urgent patient-care concern to the Clinical Pharmacist @S132 */ }
            perform action a8 { doc /* follows the hospital's clinical response procedure @S132 */ }
            perform action a9 { doc /* does not bypass a hold @S133 */ }
            perform action a10 { doc /* substitute a product @S133 */ }
            perform action a11 { doc /* clear an exception @S133 */ }
            perform action a12 { doc /* authenticates at the cabinet @S207 */ }
            perform action a13 { doc /* selects the medication associated with the active patient order @S207 */ }
            perform action a14 { doc /* uses the established clinical process for urgent medication needs while the cabinet is unavailable @S233 */ }
        }
        part repeatedDispenseRequests : RepeatedDispenseRequests {
            perform action a0 { doc /* reaching an unavailable cabinet @S226 */ }
        }
        part reportedCondition : ReportedCondition {
            perform action a0 { doc /* indicates a broader service risk @S212 */ }
        }
        part request : Request {
            exhibit state modes {
                state s0 { doc /* canceled @S082 */ }
                state s1 { doc /* duplicated @S082 */ }
                state s2 { doc /* superseded @S082 */ }
            }
        }
        part requiredChecks : RequiredChecks {
            exhibit state modes {
                state s0 { doc /* complete @S049 */ }
            }
        }
        part requiredInterlocks : RequiredInterlocks {
            exhibit state modes {
                state s0 { doc /* satisfied @S187 */ }
            }
        }
        part responsibleStaff : ResponsibleStaff {
            perform action a0 { doc /* approve its return @S219 */ }
            perform action a1 { doc /* confirm that no unresolved transaction could cause a duplicate or missed dispense @S236 */ }
            perform action a2 { doc /* remains Out of Service until required functional checks pass and the responsible staff approve its return to Ready for Dispense @S237 */ }
            perform action a3 { doc /* approve its return to Ready for Dispense @S237 */ }
            exhibit state modes {
                state s0 { doc /* Out of Service @S237 */ }
                state s1 { doc /* Ready for Dispense @S237 */ }
            }
        }
        part returnBin : ReturnBin {
            perform action a0 { doc /* closes securely @S115 */ }
            exhibit state modes {
                state s0 { doc /* closed @S118,S121 */ }
                state s1 { doc /* ready for collection @S121 */ }
                state s2 { doc /* secured @S120 */ }
            }
        }
        part returnedMedication : ReturnedMedication {
            exhibit state modes {
                state s0 { doc /* segregated @S119 */ }
                state s1 { doc /* segregated from usable stock @S022 */ }
            }
        }
        part reviewers : Reviewers {
            perform action a0 { doc /* can establish the duration and extent of an excursion @S043 */ }
        }
        part route : Route {
            perform action a0 { doc /* has passed its required checks @S062 */ }
        }
        part routeAndTemperatureRecords : RouteAndTemperatureRecords {
            perform action a0 { doc /* retain timestamps and equipment identifiers @S194 */ }
            perform action a1 { doc /* support operational review and investigation @S194 */ }
        }
        part routeStatus : RouteStatus {
            exhibit state modes {
                state s0 { doc /* incomplete @S189 */ }
                state s1 { doc /* stale @S189 */ }
            }
        }
        part sensorMonitoredMedicationCooler : SensorMonitoredMedicationCooler {
            perform action a0 { doc /* maintains monitored storage conditions for medication that requires temperature control @S015 */ }
            perform action a1 { doc /* maintains refrigerated medications within the facility's approved temperature range @S038 */ }
            perform action a2 { doc /* records temperature conditions while medication awaits transfer @S088 */ }
            perform action a3 { doc /* displays the current temperature and any recorded excursion for staff review @S108 */ }
            perform action a4 { doc /* reports excursions that could affect medication suitability @S139 */ }
            perform action a5 { doc /* maintains a time-stamped temperature history for each refrigerated medication compartment @S171 */ }
            perform action a6 { doc /* raises an alarm @S171 */ }
            perform action a7 { doc /* applies approved upper and lower temperature limits to each monitored compartment @S172 */ }
            perform action a8 { doc /* records probe identity and calibration status with each reading @S173 */ }
            perform action a9 { doc /* preserves the affected stock in its current controlled environment @S176 */ }
            perform action a10 { doc /* uses the handoff card to compare a transfer’s recorded custody time with its temperature history @S177 */ }
            perform action a11 { doc /* compare a transfer’s recorded custody time with its temperature history @S177 */ }
            perform action a12 { doc /* retains the disposition status against the affected lot @S179 */ }
            perform action a13 { doc /* prevents stock marked ineligible from being selected for routine dispensing @S179 */ }
        }
        part southWardCabinetController : SouthWardCabinetController {
            perform action a0 { doc /* applies the same availability controls for its assigned ward @S067 */ }
            perform action a1 { doc /* records the arrival time and the destination cabinet for loads assigned to the south ward @S102 */ }
            perform action a2 { doc /* reports a failed lock or an unrecognized access attempt for immediate operational review @S138 */ }
            perform action a3 { doc /* receives the release note @S204 */ }
            perform action a4 { doc /* applies its own approved cabinet configuration @S204 */ }
            perform action a5 { doc /* enabling any compartment @S204 */ }
            perform action a6 { doc /* checks its local compartment mapping, access rules, and supported medication classes against that configuration @S205 */ }
            perform action a7 { doc /* reports Ready for Dispense @S206 */ }
            perform action a8 { doc /* checks the requested selection against its local authorization rules @S208 */ }
            perform action a9 { doc /* unlocking a compartment @S208 */ }
            perform action a10 { doc /* records the user, order reference, compartment access, and transaction time for audit review @S209 */ }
            perform action a11 { doc /* remains Out of Service while the cause is assessed @S225 */ }
            exhibit state modes {
                state s0 { doc /* Out of Service @S225 */ }
                state s1 { doc /* Ready for Dispense @S206 */ }
            }
        }
        part staff : Staff {
            perform action a0 { doc /* resolve the condition @S096 */ }
            perform action a1 { doc /* document the outcome @S096 */ }
            perform action a2 { doc /* retain custody @S097 */ }
            perform action a3 { doc /* use an approved alternate delivery procedure @S097 */ }
            perform action a4 { doc /* accept a tote @S103 */ }
            perform action a5 { doc /* inspect the outer packaging for damage, moisture, tampering, or other signs that the load may be unsafe to handle @S104 */ }
            perform action a6 { doc /* isolate a load when its identity, quantity, packaging, or temperature condition does not match the expected receipt @S109 */ }
            perform action a7 { doc /* do not place an unresolved load into active cabinet stock @S110 */ }
            perform action a8 { doc /* check that each return bin closes securely and that its contents do not obstruct the closure @S115 */ }
            perform action a9 { doc /* reconcile the bin contents with the return entry @S118 */ }
        }
        part supportedPneumaticSegments : SupportedPneumaticSegments {
            exhibit state modes {
                state s0 { doc /* available @S190 */ }
                state s1 { doc /* unavailable @S185 */ }
            }
        }
        part technicalStaff : TechnicalStaff {
            perform action a0 { doc /* document the fault, corrective action, and verification results in the applicable service record @S071 */ }
        }
        part temperatureAlarms : TemperatureAlarms {
            exhibit state modes {
                state s0 { doc /* active @S182 */ }
            }
        }
        part temperatureSensitivePackages : TemperatureSensitivePackages {
            perform action a0 { doc /* remain under controlled conditions until their custody is formally transferred @S087 */ }
        }
        part transaction : Transaction {
            exhibit state modes {
                state s0 { doc /* on hold @S145,S159 */ }
            }
        }
        part unresolvedDiscrepancies : UnresolvedDiscrepancies {
            perform action a0 { doc /* keep an order from advancing to preparation @S036 */ }
        }
        part unresolvedReceiptOrReturnDiscrepancies : UnresolvedReceiptOrReturnDiscrepancies {
            exhibit state modes {
                state s0 { doc /* assigned for follow-up @S122 */ }
            }
        }
        part unresolvedTransaction : UnresolvedTransaction {
            perform action a0 { doc /* could cause a duplicate or missed dispense @S236 */ }
        }
        part verificationRecord : VerificationRecord {
            perform action a0 { doc /* captures the approving staff identity, time, and medication identifiers for later review @S201 */ }
        }
        part ward : Ward {
            perform action a0 { doc /* still requires the medication @S058 */ }
            perform action a1 { doc /* follows its approved contingency procedure @S065 */ }
            perform action a2 { doc /* confirms access to an authorized dispensing location @S065 */ }
            perform action a3 { doc /* records receipt completion and any discrepancy through the established operational process @S112 */ }
            perform action a4 { doc /* used by the ward @S163 */ }
        }
        part wardSpecificConfiguration : WardSpecificConfiguration {
            perform action a0 { doc /* defines permitted medication locations, access roles, and transaction limits for each cabinet @S162 */ }
            perform action a1 { doc /* associates each medication location with the product identifiers and quantity thresholds used by the ward @S163 */ }
        }
        part wardStaff : WardStaff {
            perform action a0 { doc /* can use an approved alternative without losing medication accountability @S063 */ }
            perform action a1 { doc /* losing medication accountability @S063 */ }
            perform action a2 { doc /* perform a receipt check on each arriving load @S099 */ }
            perform action a3 { doc /* placing medication in a cabinet @S099 */ }
            perform action a4 { doc /* transferring custody @S099 */ }
            perform action a5 { doc /* compare package identifiers with the cabinet task list @S105 */ }
            perform action a6 { doc /* confirm that the identifiers are legible @S105 */ }
            perform action a7 { doc /* check return bins @S113 */ }
            perform action a8 { doc /* confirm that each bin is intact, clean, and assigned to the correct return stream @S113 */ }
        }
        part westTubeDispatchConsole : WestTubeDispatchConsole {
            perform action a0 { doc /* provide controlled interfaces for routing authorized pharmacy deliveries @S016 */ }
            perform action a1 { doc /* uses the Pneumatic Capsule Seal Record to verify capsule identity and seal status before closing its dispatch-side handoff checks @S238 */ }
            perform action a2 { doc /* verify capsule identity and seal status @S238 */ }
            perform action a3 { doc /* closing its dispatch-side handoff checks @S238 */ }
            perform action a4 { doc /* records completion of its handoff checks only after the required dispatch data are consistent @S239 */ }
            perform action a5 { doc /* is being restored @S240 */ }
            perform action a6 { doc /* retains the handoff completion status for operational review @S242 */ }
        }
        flow f0 of OrderStatusItem from medicationOrderGateway to authorizedHospitalSystems { doc /* @S008 */ }
        flow f1 of DiscrepanciesItem from pharmacyTechnician to clinicalPharmacist { doc /* @S010 */ }
        flow f2 of CompatibleDeliveriesItem from pneumaticTubeNetwork to designatedHospitalLocations { doc /* @S017 */ }
        flow f3 of MedicationOrdersItem from authorizedClinicalSystems to medicationOrderGateway { doc /* @S029 */ }
        flow f4 of MedicationOrdersItem from medicationOrderGateway to clinicalPharmacist { doc /* @S030 */ }
        flow f5 of ExpectedDeliveryDelaysAndAnyApprovedLocalWorkaroundItem from chargeNurse to wardStaff { doc /* @S059 */ }
        flow f6 of CompletedPackageItem from pharmacyFulfillmentRobot to pharmacyVerificationStation { doc /* @S077 */ }
        flow f7 of PriorityRefillToteTagItem from pharmacyFulfillmentRobot to northWardCabinetController { doc /* @S103 */ }
        flow f8 of CurrentTemperatureItem from sensorMonitoredMedicationCooler to staff { doc /* @S108 */ }
        flow f9 of RecordedExcursionItem from sensorMonitoredMedicationCooler to staff { doc /* @S108 */ }
        flow f10 of ReturnBinAuditLabelItem from medicationReturnKiosk to pharmacyTechnician { doc /* @S117 */ }
        flow f11 of DoseExceptionReviewSlipItem from clinicalPharmacist to pharmacyVerificationStation { doc /* @S128 */ }
        flow f12 of UrgentPatientCareConcernItem from registeredNurse to clinicalPharmacist { doc /* @S132 */ }
        flow f13 of DiversionReviewPacketItem from medicationSafetyOfficer to iTOperationsSpecialist { doc /* @S141 */ }
        flow f14 of OrderReconciliationSnapshotItem from medicationOrderGateway to pharmacyFulfillmentRobot { doc /* @S149 */ }
        flow f15 of ReadingsItem from calibratedProbes to sensorMonitoredMedicationCooler { doc /* @S173 */ }
        flow f16 of ColdChainHandoffCardItem from pharmacyTechnician to sensorMonitoredMedicationCooler { doc /* @S177 */ }
        flow f17 of SegmentStatusItem from pneumaticTubeNetwork to eastTubeDispatchConsole { doc /* @S188 */ }
        flow f18 of TransferProgressItem from pneumaticTubeNetwork to eastTubeDispatchConsole { doc /* @S188 */ }
        flow f19 of DeliveryConfirmationItem from pneumaticTubeNetwork to eastTubeDispatchConsole { doc /* @S188 */ }
        flow f20 of RouteStatusItem from eastTubeDispatchConsole to operator { doc /* @S189 */ }
        flow f21 of TransferStopsProgressingOrCannotBeConfirmedAtItsDestinationItem from eastTubeDispatchConsole to pharmacyTechnician { doc /* @S192 */ }
        flow f23 of BatchReleaseNoteItem from pharmacyVerificationStation to southWardCabinetController { doc /* @S204 */ }
        flow f24 of TubeRouteExceptionTicketItem from eastTubeDispatchConsole to biomedicalEngineer { doc /* @S211 */ }
        flow f25 of CabinetDowntimeNoticeItem from chargeNurse to iTOperationsSpecialist { doc /* @S222 */ }
        flow f26 of CompletedRepairsItem from biomedicalEngineer to iTOperationsSpecialist { doc /* @S234 */ }
        flow f27 of EquipmentLimitationsItem from biomedicalEngineer to iTOperationsSpecialist { doc /* @S234 */ }
        flow f28 of PneumaticCapsuleSealRecordItem from hospitalCourier to westTubeDispatchConsole { doc /* @S238 */ }
    }
    requirement def R0 { doc /* a diversion concern requires documented review @S047 */ subject s : DiversionConcern; }
    requirement def R1 { doc /* a cabinet must be taken out of service @S064 */ subject s : Cabinet; }
    requirement def R2 { doc /* A correction requires a valid authorized order and must not be inferred from prior dispensing history. @S130 */ subject s : Correction; }
    requirement def R3 { doc /* Access rules require an authenticated user role appropriate to the requested medication and transaction type. @S166 */ subject s : NorthWardMedicationAccessRules; }
    requirement def R4 { doc /* After recovery, the console requires refreshed segment status and an approved route decision before dispatch resumes. @S193 */ subject s : EastTubeDispatchConsole; }
    requirement def R5 { doc /* equipment inspection or repair is required @S231 */ subject s : Equipment; }
}
