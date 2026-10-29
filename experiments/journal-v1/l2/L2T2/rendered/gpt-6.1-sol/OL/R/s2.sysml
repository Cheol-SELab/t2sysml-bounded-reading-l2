package L2Model {
    item def ApprovedLocalWorkaroundItem { doc /* @S059 */ }
    item def CabinetDowntimeNoticeItem { doc /* @S222 */ }
    item def CompatibleDeliveriesItem { doc /* @S017 */ }
    item def ConditionItem { doc /* @S189,S212 */ }
    item def CurrentTemperatureItem { doc /* @S108 */ }
    item def DeliveryConfirmationItem { doc /* @S188 */ }
    item def DiscrepanciesItem { doc /* @S010 */ }
    item def DiscrepancyItem { doc /* @S216 */ }
    item def EquipmentLimitationsItem { doc /* @S234 */ }
    item def ExpectedDeliveryDelaysItem { doc /* @S059 */ }
    item def MedicationOrdersItem { doc /* @S029 */ }
    item def OrderStatusItem { doc /* @S008 */ }
    item def PackageItem { doc /* @S077 */ }
    item def ReadingsItem { doc /* @S173 */ }
    item def RecordedExcursionItem { doc /* @S108 */ }
    item def RepairItem { doc /* @S234 */ }
    item def SegmentStatusItem { doc /* @S188,S193 */ }
    item def TransferProgressItem { doc /* @S188 */ }
    item def TubeRouteExceptionTicketItem { doc /* @S211 */ }
    item def UrgentPatientCareConcernItem { doc /* @S132 */ }
    part def AccessEvent { doc /* @S181 */ }
    part def AccessRules { doc /* @S166 */ }
    part def AdditionalTraffic { doc /* @S053 */ }
    part def AffectedEquipment { doc /* @S142,S213,S219 */ }
    part def AffectedStock { doc /* @S042,S139,S175,S178 */ }
    part def AffectedTransaction { doc /* @S124,S159 */ }
    part def AuditRecords { doc /* @S220,S244 */ }
    part def AuthenticationFaults { doc /* @S215 */ }
    part def Authorization { doc /* @S153 */ }
    part def AuthorizedClinicalSystems { doc /* @S029 */ }
    part def AuthorizedHospitalSystems { doc /* @S008 */ }
    part def AuthorizedPharmacyProfessional { doc /* @S200 */ }
    part def AuthorizedReviewer { doc /* @S124 */ }
    part def AutomatedTransfer { doc /* @S097 */ }
    part def BiomedicalEngineer { doc /* @S024,S050,S060,S068,S142,S210,S211,S212,S214,S218,S234 */ }
    part def Cabinet { doc /* @S064,S072,S206,S209,S221,S226,S228,S230,S233,S237 */ }
    part def CabinetAccess { doc /* @S069 */ }
    part def CabinetStaff { doc /* @S106 */ }
    part def CabinetTransaction { doc /* @S131 */ }
    part def CalibratedProbes { doc /* @S173 */ }
    part def Capsule { doc /* @S091,S092 */ }
    part def Changes { doc /* @S031 */ }
    part def ChargeNurse { doc /* @S019,S059,S064,S070,S122,S134,S222 */ }
    part def ClinicalAndLabelingExceptions { doc /* @S075 */ }
    part def ClinicalPharmacist { doc /* @S009,S010,S012,S034,S044,S057,S075,S083,S129,S132,S145,S178,S196,S197,S203,S217,S232 */ }
    part def ClinicalReview { doc /* @S145 */ }
    part def Communication { doc /* @S190 */ }
    part def Comparison { doc /* @S151 */ }
    part def Concept { doc /* @S003 */ }
    part def Condition { doc /* @S212 */ }
    part def ConfigurationChecks { doc /* @S206 */ }
    part def ConfiguredMaximumAndMinimumQuantities { doc /* @S165 */ }
    part def Contents { doc /* @S115 */ }
    part def ContinuousSensors { doc /* @S039 */ }
    part def Controller { doc /* @S072 */ }
    part def Correction { doc /* @S130 */ }
    part def CustodyHistory { doc /* @S090 */ }
    part def Delivery { doc /* @S058 */ }
    part def DeliveryTiming { doc /* @S057 */ }
    part def DesignatedHospitalLocations { doc /* @S017 */ }
    part def Destination { doc /* @S185 */ }
    part def DeviceSelfTests { doc /* @S206 */ }
    part def Discrepancies { doc /* @S036,S122 */ }
    part def Discrepancy { doc /* @S216 */ }
    part def Dispatch { doc /* @S052,S062,S193 */ }
    part def DispatchData { doc /* @S239 */ }
    part def DispatchPersonnel { doc /* @S053 */ }
    part def DispenseRequests { doc /* @S226 */ }
    part def DispensingAndDeliveryWorkflows { doc /* @S073 */ }
    part def DiversionConcern { doc /* @S047 */ }
    part def EastTubeDispatchConsole { doc /* @S016,S051,S052,S094,S183,S184,S185,S187,S188,S189,S190,S192,S193,S211 */ }
    part def Evidence { doc /* @S146 */ }
    part def Excursions { doc /* @S042,S139 */ }
    part def Field { doc /* @S127 */ }
    part def FinalDisposition { doc /* @S146 */ }
    part def FinalPharmacyRelease { doc /* @S074 */ }
    part def FunctionalChecks { doc /* @S219,S237 */ }
    part def HeldTransaction { doc /* @S137 */ }
    part def HighRiskMedicationLocations { doc /* @S167 */ }
    part def HospitalCourier { doc /* @S023,S089,S090,S091,S092,S121,S241 */ }
    part def ITOperationsSpecialist { doc /* @S024,S061,S069,S141,S143,S215,S222,S223,S224,S226,S228,S231,S234,S235,S243 */ }
    part def InterfaceFaults { doc /* @S215 */ }
    part def Load { doc /* @S084,S093,S096 */ }
    part def LoadManifest { doc /* @S085 */ }
    part def LocationMapping { doc /* @S168 */ }
    part def Medication { doc /* @S022,S044,S088,S146,S195,S200,S217 */ }
    part def MedicationOrderGateway { doc /* @S008,S029,S030,S031,S032,S081,S136,S147,S227 */ }
    part def MedicationOrders { doc /* @S036,S037,S049,S229 */ }
    part def MedicationReturnKiosk { doc /* @S020,S021,S116 */ }
    part def MedicationSafetyOfficer { doc /* @S025,S046,S047,S140,S216 */ }
    part def Mismatch { doc /* @S200 */ }
    part def NorthWardCabinetController { doc /* @S066,S101,S103,S137,S161,S168,S170,S189,S212,S225 */ }
    part def ObservingStaffMember { doc /* @S144 */ }
    part def Operations { doc /* @S062,S073 */ }
    part def OperationsStaff { doc /* @S054 */ }
    part def Operator { doc /* @S189 */ }
    part def Order { doc /* @S153,S154,S155 */ }
    part def OrderStatus { doc /* @S049 */ }
    part def Package { doc /* @S083,S125 */ }
    part def PatientIdentifiers { doc /* @S197 */ }
    part def PharmacyFulfillmentRobot { doc /* @S011,S013,S037,S077,S125,S126,S149,S152,S153,S202,S230 */ }
    part def PharmacyLabel { doc /* @S197 */ }
    part def PharmacyTechnician { doc /* @S010,S035,S040,S041,S045,S056,S076,S117,S135,S148,S198 */ }
    part def PharmacyVerificationStation { doc /* @S014,S033,S048,S077,S078,S079,S127,S128,S195,S229 */ }
    part def PneumaticTubeNetwork { doc /* @S017,S055,S093,S188,S193,S240 */ }
    part def Probe { doc /* @S175 */ }
    part def QuestionableOrDamagedReturnedMedication { doc /* @S119 */ }
    part def Readings { doc /* @S175 */ }
    part def ReceivingDepartment { doc /* @S098,S216 */ }
    part def Reconciliation { doc /* @S150 */ }
    part def ReconciliationOutcome { doc /* @S160 */ }
    part def Records { doc /* @S158,S159 */ }
    part def RefrigeratedStock { doc /* @S040 */ }
    part def RegisteredNurse { doc /* @S058,S107,S114,S131,S132,S133,S207,S233 */ }
    part def Request { doc /* @S081,S082 */ }
    part def RequiredChecks { doc /* @S049,S078 */ }
    part def RequiredOperationalChecks { doc /* @S072 */ }
    part def ResponsibleTechnicalStaff { doc /* @S071 */ }
    part def ReturnBin { doc /* @S115,S120,S121 */ }
    part def Reviewers { doc /* @S043 */ }
    part def Route { doc /* @S062,S094,S185 */ }
    part def RouteFault { doc /* @S060 */ }
    part def RouteRecords { doc /* @S194 */ }
    part def RouteSelection { doc /* @S186 */ }
    part def RouteStatus { doc /* @S189 */ }
    part def Section { doc /* @S001 */ }
    part def Segment { doc /* @S055,S185,S190 */ }
    part def SensorMonitoredMedicationCooler { doc /* @S015,S038,S088,S108,S139,S171,S172,S173,S176,S177,S179 */ }
    part def SouthWardCabinetController { doc /* @S067,S102,S138,S204,S205,S208,S225 */ }
    part def Staff { doc /* @S073,S084,S096,S097,S103,S104,S108,S109,S110,S115,S118,S219,S236,S237 */ }
    part def StatusReporting { doc /* @S069 */ }
    part def Stock { doc /* @S179 */ }
    part def StorageConditions { doc /* @S057 */ }
    part def TemperatureAlarms { doc /* @S182 */ }
    part def TemperatureRecords { doc /* @S194 */ }
    part def TemperatureSensitivePackages { doc /* @S087 */ }
    part def TimeSynchronizationFaults { doc /* @S215 */ }
    part def Transaction { doc /* @S145,S236 */ }
    part def Transfer { doc /* @S192 */ }
    part def Unit { doc /* @S174 */ }
    part def UnresolvedExceptions { doc /* @S134 */ }
    part def VerificationRecord { doc /* @S201 */ }
    part def Ward { doc /* @S058,S065,S112,S163 */ }
    part def WardSpecificConfiguration { doc /* @S162,S163 */ }
    part def WardStaff { doc /* @S059,S063,S099,S105,S113 */ }
    part def WestTubeDispatchConsole { doc /* @S016,S238,S239,S242 */ }
    part def Workflow { doc /* @S002 */ }
    part system {
        part accessEvent : AccessEvent {
            perform action a0 { doc /* threatens temperature control @S181 */ }
        }
        part accessRules : AccessRules {
            perform action a0 { doc /* require an authenticated user role appropriate to the requested medication and transaction type @S166 */ }
        }
        part additionalTraffic : AdditionalTraffic {
            perform action a0 { doc /* entering a route with an unresolved fault @S053 */ }
        }
        part affectedEquipment : AffectedEquipment {
            perform action a0 { doc /* can safely return to service @S142 */ }
            perform action a1 { doc /* remains Out of Service @S219 */ }
            exhibit state modes {
                state s0 { doc /* Out of Service @S213,S219 */ }
            }
        }
        part affectedStock : AffectedStock {
            perform action a0 { doc /* remains unavailable pending assessment @S139 */ }
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
            perform action a0 { doc /* remains on hold until an authorized reviewer documents a disposition @S124 */ }
            exhibit state modes {
                state s0 { doc /* on hold @S124,S159 */ }
            }
        }
        part auditRecords : AuditRecords {
            perform action a0 { doc /* retain timestamps, equipment identifiers, and disposition details @S220 */ }
            perform action a1 { doc /* support operational review and investigation @S220 */ }
            perform action a2 { doc /* retain timestamps, equipment identifiers, recovery checks, and disposition details @S244 */ }
            perform action a3 { doc /* support operational review and investigation @S244 */ }
        }
        part authenticationFaults : AuthenticationFaults {
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
        part automatedTransfer : AutomatedTransfer {
            exhibit state modes {
                state s0 { doc /* unavailable @S097 */ }
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
            perform action a2 { doc /* reports Ready for Dispense @S206 */ }
            perform action a3 { doc /* records the user, order reference, compartment access, and transaction time for audit review @S209 */ }
            perform action a4 { doc /* stops responding @S221 */ }
            perform action a5 { doc /* reports a fault @S221 */ }
            perform action a6 { doc /* fails a dispensing check @S221 */ }
            perform action a7 { doc /* became unavailable @S228 */ }
            perform action a8 { doc /* has not passed its recovery checks @S230 */ }
            exhibit state modes {
                state s0 { doc /* Out of Service @S237 */ }
                state s1 { doc /* Ready for Dispense @S072,S206,S237 */ }
                state s2 { doc /* unavailable @S072,S226,S228,S233 */ }
            }
        }
        part cabinetAccess : CabinetAccess {
            exhibit state modes {
                state s0 { doc /* impaired @S069 */ }
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
        }
        part capsule : Capsule {
            exhibit state modes {
                state s0 { doc /* closed securely @S092 */ }
                state s1 { doc /* sealed for transfer @S091 */ }
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
        part clinicalAndLabelingExceptions : ClinicalAndLabelingExceptions {
            perform action a0 { doc /* require professional judgment @S075 */ }
        }
        part clinicalPharmacist : ClinicalPharmacist {
            perform action a0 { doc /* reviews clinical appropriateness @S009 */ }
            perform action a1 { doc /* resolves medication questions that require professional judgment @S009 */ }
            perform action a2 { doc /* produces the Dose Exception Review Slip when an order requires a documented exception review @S012 */ }
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
            perform action a18 { doc /* resolves unclear or conflicting order details through the Medication Order Gateway @S203 */ }
            perform action a19 { doc /* authorizing release @S203 */ }
            perform action a20 { doc /* keeps affected medication unavailable @S217 */ }
            perform action a21 { doc /* reviews medication orders affected by the outage when clinical validation is needed @S232 */ }
        }
        part clinicalReview : ClinicalReview {
            exhibit state modes {
                state s0 { doc /* inconclusive @S145 */ }
            }
        }
        part communication : Communication {
            perform action a0 { doc /* prevents the console from treating the affected segment as available @S190 */ }
        }
        part comparison : Comparison {
            perform action a0 { doc /* preserves the order context needed to distinguish a new request from a correction or a repeat submission @S151 */ }
        }
        part concept : Concept {
            perform action a0 { doc /* covers order intake, pharmacy preparation and verification, ward access, and the initial handling of returned medication @S003 */ }
        }
        part condition : Condition {
            perform action a0 { doc /* indicates a broader service risk @S212 */ }
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
        part controller : Controller {
            perform action a0 { doc /* reports Ready for Dispense @S072 */ }
        }
        part correction : Correction {
            perform action a0 { doc /* requires a valid authorized order @S130 */ }
        }
        part custodyHistory : CustodyHistory {
            perform action a0 { doc /* remains traceable @S090 */ }
        }
        part delivery : Delivery {
            exhibit state modes {
                state s0 { doc /* delayed @S058 */ }
            }
        }
        part deliveryTiming : DeliveryTiming {
            perform action a0 { doc /* may affect its suitability for use @S057 */ }
        }
        part designatedHospitalLocations : DesignatedHospitalLocations;
        part destination : Destination {
            exhibit state modes {
                state s0 { doc /* reachable @S185 */ }
            }
        }
        part deviceSelfTests : DeviceSelfTests {
            perform action a0 { doc /* pass @S206 */ }
        }
        part discrepancies : Discrepancies {
            perform action a0 { doc /* keep an order from advancing to preparation @S036 */ }
            perform action a1 { doc /* remain assigned for follow-up at shift handover @S122 */ }
            exhibit state modes {
                state s0 { doc /* Unresolved @S036 */ }
                state s1 { doc /* assigned for follow-up @S122 */ }
                state s2 { doc /* unresolved @S122 */ }
            }
        }
        part discrepancy : Discrepancy {
            perform action a0 { doc /* could change medication identity, access control, or patient risk @S216 */ }
        }
        part dispatch : Dispatch {
            perform action a0 { doc /* cannot follow its assigned route @S052 */ }
            perform action a1 { doc /* complete delivery within the configured interval @S052 */ }
            perform action a2 { doc /* resumes @S062 */ }
            perform action a3 { doc /* resumes @S193 */ }
        }
        part dispatchData : DispatchData;
        part dispatchPersonnel : DispatchPersonnel {
            perform action a0 { doc /* hold affected capsules @S053 */ }
            perform action a1 { doc /* prevent additional traffic from entering a route with an unresolved fault @S053 */ }
        }
        part dispenseRequests : DispenseRequests {
            perform action a0 { doc /* reaching an unavailable cabinet @S226 */ }
        }
        part dispensingAndDeliveryWorkflows : DispensingAndDeliveryWorkflows {
            perform action a0 { doc /* are functioning as intended @S073 */ }
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
            perform action a10 { doc /* checks for conflicting capsule movements @S187 */ }
            perform action a11 { doc /* confirms that required interlocks are satisfied @S187 */ }
            perform action a12 { doc /* dispatch @S187 */ }
            perform action a13 { doc /* holds the capsule @S189 */ }
            perform action a14 { doc /* displays the condition for operator review @S189 */ }
            perform action a15 { doc /* treating the affected segment as available @S190 */ }
            perform action a16 { doc /* alerts a Pharmacy Technician when a transfer stops progressing or cannot be confirmed at its destination @S192 */ }
            perform action a17 { doc /* requires refreshed segment status and an approved route decision @S193 */ }
        }
        part evidence : Evidence {
            perform action a0 { doc /* supported the decision @S146 */ }
        }
        part excursions : Excursions {
            perform action a0 { doc /* occurs @S042 */ }
            perform action a1 { doc /* could affect medication suitability @S139 */ }
        }
        part field : Field {
            perform action a0 { doc /* differs @S127 */ }
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
            perform action a0 { doc /* can require an additional confirmation before a removal is accepted @S167 */ }
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
            perform action a4 { doc /* checks access, transaction, and device logs @S141 */ }
            perform action a5 { doc /* without changing the clinical disposition @S141 */ }
            perform action a6 { doc /* investigates software or connectivity faults @S143 */ }
            perform action a7 { doc /* records the technical findings for the responsible operational team @S143 */ }
            perform action a8 { doc /* investigates authentication, interface, and time-synchronization faults that could affect transaction records @S215 */ }
            perform action a9 { doc /* uses the Cabinet Downtime Notice @S222 */ }
            perform action a10 { doc /* open a controlled incident record @S222 */ }
            perform action a11 { doc /* identify the affected cabinet @S222 */ }
            perform action a12 { doc /* checks controller status, network connectivity, and recent event logs @S223 */ }
            perform action a13 { doc /* attempting recovery @S223 */ }
            perform action a14 { doc /* records the time the fault was detected and the affected equipment identifier @S224 */ }
            perform action a15 { doc /* isolates the fault where necessary @S226 */ }
            perform action a16 { doc /* prevent repeated dispense requests from reaching an unavailable cabinet @S226 */ }
            perform action a17 { doc /* checks whether any transaction was interrupted before the cabinet became unavailable @S228 */ }
            perform action a18 { doc /* coordinates technical troubleshooting with the Biomedical Engineer when equipment inspection or repair is required @S231 */ }
            perform action a19 { doc /* verifies communications, status reporting, and cabinet transaction behavior under controlled conditions @S235 */ }
            perform action a20 { doc /* monitors cabinet and tube service status for recurrence during the recovery period @S243 */ }
        }
        part interfaceFaults : InterfaceFaults {
            perform action a0 { doc /* could affect transaction records @S215 */ }
        }
        part load : Load {
            perform action a0 { doc /* enters the delivery network @S084 */ }
            perform action a1 { doc /* meet the applicable packaging and routing requirements @S093 */ }
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
                state s0 { doc /* available for dispensing @S195 */ }
                state s1 { doc /* corrected @S146 */ }
                state s2 { doc /* hold @S200 */ }
                state s3 { doc /* released @S146 */ }
                state s4 { doc /* segregated from usable stock @S022 */ }
                state s5 { doc /* suitable for dispensing under approved procedures @S044 */ }
                state s6 { doc /* unavailable @S217 */ }
                state s7 { doc /* withheld @S146 */ }
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
            perform action a7 { doc /* produces the Order Reconciliation Snapshot for documenting detected order discrepancies @S032 */ }
            perform action a8 { doc /* documenting detected order discrepancies @S032 */ }
            perform action a9 { doc /* provides the current order status used to confirm that the request remains valid @S081 */ }
            perform action a10 { doc /* rejects incomplete or internally inconsistent order updates @S136 */ }
            perform action a11 { doc /* retains the rejection reason for review @S136 */ }
            perform action a12 { doc /* validates each medication order for patient, product, dose, route, and timing fields @S147 */ }
            perform action a13 { doc /* making it available for downstream processing @S147 */ }
            perform action a14 { doc /* retains pending requests for review @S227 */ }
            perform action a15 { doc /* rather than treating an interrupted transaction as completed @S227 */ }
        }
        part medicationOrders : MedicationOrders {
            perform action a0 { doc /* advancing to preparation @S036 */ }
            perform action a1 { doc /* have passed the required review and authorization checks @S037 */ }
            exhibit state modes {
                state s0 { doc /* unavailable for dispensing @S049 */ }
                state s1 { doc /* valid @S229 */ }
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
            perform action a4 { doc /* produces the Diversion Review Packet when a diversion concern requires documented review @S047 */ }
            perform action a5 { doc /* reviews suspected diversion, repeated high-risk exceptions, and events with potential for patient harm @S140 */ }
            perform action a6 { doc /* reviews any discrepancy that could change medication identity, access control, or patient risk @S216 */ }
        }
        part mismatch : Mismatch {
            perform action a0 { doc /* places the medication on hold @S200 */ }
        }
        part northWardCabinetController : NorthWardCabinetController {
            perform action a0 { doc /* reports cabinet availability @S066 */ }
            perform action a1 { doc /* prevents dispensing @S066 */ }
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
            perform action a12 { doc /* remains Out of Service @S225 */ }
            exhibit state modes {
                state s0 { doc /* Out of Service @S066,S225 */ }
            }
        }
        part observingStaffMember : ObservingStaffMember {
            perform action a0 { doc /* is escalated immediately by the observing staff member rather than held for routine review @S144 */ }
        }
        part operations : Operations {
            perform action a0 { doc /* has authorized its return to use @S062 */ }
            perform action a1 { doc /* closes the interruption @S073 */ }
        }
        part operationsStaff : OperationsStaff {
            perform action a0 { doc /* review queue status @S054 */ }
            perform action a1 { doc /* coordinate any approved alternate route with the affected wards @S054 */ }
        }
        part operator : Operator;
        part order : Order {
            exhibit state modes {
                state s0 { doc /* active @S153 */ }
                state s1 { doc /* cancelled @S154 */ }
                state s2 { doc /* corrected @S155 */ }
            }
        }
        part orderStatus : OrderStatus {
            exhibit state modes {
                state s0 { doc /* authorized @S049 */ }
            }
        }
        part packagePart : Package {
            perform action a0 { doc /* can proceed @S083 */ }
            exhibit state modes {
                state s0 { doc /* pending review @S125 */ }
            }
        }
        part patientIdentifiers : PatientIdentifiers {
            perform action a0 { doc /* agree with the authorized order @S197 */ }
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
            perform action a13 { doc /* remains inhibited from completing a dispense until the required pharmacy authorization is present @S202 */ }
            perform action a14 { doc /* completing a dispense @S202 */ }
            perform action a15 { doc /* supplying medication to a cabinet that has not passed its recovery checks @S230 */ }
            exhibit state modes {
                state s0 { doc /* inhibited @S202 */ }
            }
        }
        part pharmacyLabel : PharmacyLabel {
            perform action a0 { doc /* agree with the authorized order @S197 */ }
        }
        part pharmacyTechnician : PharmacyTechnician {
            perform action a0 { doc /* performs routine preparation tasks within approved procedures @S010 */ }
            perform action a1 { doc /* escalates discrepancies to the Clinical Pharmacist @S010 */ }
            perform action a2 { doc /* investigates administrative discrepancies @S035 */ }
            perform action a3 { doc /* requests clarification through approved clinical channels @S035 */ }
            perform action a4 { doc /* checks the cooler's status @S040 */ }
            perform action a5 { doc /* confirms that refrigerated stock remains within handling limits @S040 */ }
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
            perform action a8 { doc /* uses the review slip @S128 */ }
            perform action a9 { doc /* record the exception category, evidence checked, disposition, and reviewer identity @S128 */ }
            perform action a10 { doc /* serves as the final controlled checkpoint @S195 */ }
            perform action a11 { doc /* confirm that pending medication orders remain valid @S229 */ }
        }
        part pneumaticTubeNetwork : PneumaticTubeNetwork {
            perform action a0 { doc /* carries compatible deliveries between designated hospital locations under established routing procedures @S017 */ }
            perform action a1 { doc /* accepts only loads that meet the applicable packaging and routing requirements @S093 */ }
            perform action a2 { doc /* reports segment status, transfer progress, and delivery confirmation to the dispatch console @S188 */ }
            exhibit state modes {
                state s0 { doc /* unavailable @S055 */ }
                state s1 { doc /* under monitoring @S240 */ }
            }
        }
        part probe : Probe {
            perform action a0 { doc /* becomes unavailable @S175 */ }
            exhibit state modes {
                state s0 { doc /* unavailable @S175 */ }
            }
        }
        part questionableOrDamagedReturnedMedication : QuestionableOrDamagedReturnedMedication {
            exhibit state modes {
                state s0 { doc /* segregated @S119 */ }
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
            perform action a0 { doc /* compares the active order record with dispensing and cabinet records @S150 */ }
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
            exhibit state modes {
                state s0 { doc /* within handling limits @S040 */ }
            }
        }
        part registeredNurse : RegisteredNurse {
            perform action a0 { doc /* confirms whether the ward still requires the medication @S058 */ }
            perform action a1 { doc /* follows the approved contingency process if delivery is delayed @S058 */ }
            perform action a2 { doc /* checks that the load remained within the required handling conditions @S107 */ }
            perform action a3 { doc /* confirms that the contents are eligible for return and are separated from waste and non-medication items @S114 */ }
            perform action a4 { doc /* keeps the cabinet transaction locked @S131 */ }
            perform action a5 { doc /* confirms that the medication has not been administered while review is pending @S131 */ }
            perform action a6 { doc /* escalates an urgent patient-care concern to the Clinical Pharmacist @S132 */ }
            perform action a7 { doc /* follows the hospital's clinical response procedure @S132 */ }
            perform action a8 { doc /* does not bypass a hold @S133 */ }
            perform action a9 { doc /* substitute a product @S133 */ }
            perform action a10 { doc /* clear an exception @S133 */ }
            perform action a11 { doc /* authenticates at the cabinet @S207 */ }
            perform action a12 { doc /* selects the medication associated with the active patient order @S207 */ }
            perform action a13 { doc /* uses the established clinical process for urgent medication needs while the cabinet is unavailable @S233 */ }
        }
        part request : Request {
            perform action a0 { doc /* remains valid @S081 */ }
            exhibit state modes {
                state s0 { doc /* canceled @S082 */ }
                state s1 { doc /* duplicated @S082 */ }
                state s2 { doc /* held for resolution @S082 */ }
                state s3 { doc /* superseded @S082 */ }
                state s4 { doc /* valid @S081 */ }
            }
        }
        part requiredChecks : RequiredChecks {
            perform action a0 { doc /* remain incomplete @S078 */ }
            exhibit state modes {
                state s0 { doc /* complete @S049 */ }
                state s1 { doc /* incomplete @S078 */ }
            }
        }
        part requiredOperationalChecks : RequiredOperationalChecks {
            exhibit state modes {
                state s0 { doc /* complete @S072 */ }
            }
        }
        part responsibleTechnicalStaff : ResponsibleTechnicalStaff {
            perform action a0 { doc /* document the fault, corrective action, and verification results in the applicable service record @S071 */ }
        }
        part returnBin : ReturnBin {
            perform action a0 { doc /* closes securely @S115 */ }
            perform action a1 { doc /* remains secured in its designated holding location until collection is authorized @S120 */ }
            exhibit state modes {
                state s0 { doc /* closed @S121 */ }
                state s1 { doc /* ready for collection @S121 */ }
                state s2 { doc /* secured @S120 */ }
            }
        }
        part reviewers : Reviewers {
            perform action a0 { doc /* can establish the duration and extent of an excursion @S043 */ }
        }
        part route : Route {
            perform action a0 { doc /* has passed its required checks @S062 */ }
            perform action a1 { doc /* does not include a segment reported unavailable @S185 */ }
            exhibit state modes {
                state s0 { doc /* available for dispatch @S094 */ }
            }
        }
        part routeFault : RouteFault {
            perform action a0 { doc /* indicates a physical problem @S060 */ }
        }
        part routeRecords : RouteRecords {
            perform action a0 { doc /* retain timestamps and equipment identifiers @S194 */ }
            perform action a1 { doc /* support operational review and investigation @S194 */ }
        }
        part routeSelection : RouteSelection {
            perform action a0 { doc /* uses the destination identifier and the latest approved configuration version rather than an operator-entered sequence of segments @S186 */ }
        }
        part routeStatus : RouteStatus {
            exhibit state modes {
                state s0 { doc /* incomplete @S189 */ }
                state s1 { doc /* stale @S189 */ }
            }
        }
        part section : Section {
            perform action a0 { doc /* defines the mission, scope, and operating roles for automated medication dispensing and medication returns in the hospital @S001 */ }
        }
        part segment : Segment {
            exhibit state modes {
                state s0 { doc /* available @S190 */ }
                state s1 { doc /* safe for service @S055 */ }
                state s2 { doc /* unavailable @S185 */ }
            }
        }
        part sensorMonitoredMedicationCooler : SensorMonitoredMedicationCooler {
            perform action a0 { doc /* maintains monitored storage conditions for medication that requires temperature control @S015 */ }
            perform action a1 { doc /* maintains refrigerated medications within the facility's approved temperature range @S038 */ }
            perform action a2 { doc /* records temperature conditions @S088 */ }
            perform action a3 { doc /* displays the current temperature and any recorded excursion for staff review @S108 */ }
            perform action a4 { doc /* reports excursions that could affect medication suitability @S139 */ }
            perform action a5 { doc /* maintains a time-stamped temperature history for each refrigerated medication compartment @S171 */ }
            perform action a6 { doc /* raises an alarm @S171 */ }
            perform action a7 { doc /* applies approved upper and lower temperature limits to each monitored compartment @S172 */ }
            perform action a8 { doc /* records probe identity and calibration status with each reading @S173 */ }
            perform action a9 { doc /* preserves the affected stock in its current controlled environment @S176 */ }
            perform action a10 { doc /* uses the handoff card @S177 */ }
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
            perform action a7 { doc /* checks the requested selection against its local authorization rules @S208 */ }
            perform action a8 { doc /* unlocking a compartment @S208 */ }
            perform action a9 { doc /* remains Out of Service @S225 */ }
            exhibit state modes {
                state s0 { doc /* Out of Service @S225 */ }
            }
        }
        part staff : Staff {
            perform action a0 { doc /* confirm that dispensing and delivery workflows are functioning as intended @S073 */ }
            perform action a1 { doc /* can establish what was released and under which conditions @S084 */ }
            perform action a2 { doc /* resolve the condition @S096 */ }
            perform action a3 { doc /* document the outcome @S096 */ }
            perform action a4 { doc /* retain custody @S097 */ }
            perform action a5 { doc /* use an approved alternate delivery procedure @S097 */ }
            perform action a6 { doc /* accept a tote @S103 */ }
            perform action a7 { doc /* inspect the outer packaging for damage, moisture, tampering, or other signs that the load may be unsafe to handle @S104 */ }
            perform action a8 { doc /* isolate a load @S109 */ }
            perform action a9 { doc /* do not place an unresolved load into active cabinet stock @S110 */ }
            perform action a10 { doc /* check that each return bin closes securely and that its contents do not obstruct the closure @S115 */ }
            perform action a11 { doc /* reconcile the bin contents with the return entry @S118 */ }
            perform action a12 { doc /* approve its return @S219 */ }
            perform action a13 { doc /* confirm that no unresolved transaction could cause a duplicate or missed dispense @S236 */ }
            perform action a14 { doc /* approve its return to Ready for Dispense @S237 */ }
        }
        part statusReporting : StatusReporting {
            exhibit state modes {
                state s0 { doc /* impaired @S069 */ }
            }
        }
        part stock : Stock {
            exhibit state modes {
                state s0 { doc /* ineligible @S179 */ }
            }
        }
        part storageConditions : StorageConditions {
            perform action a0 { doc /* may affect its suitability for use @S057 */ }
        }
        part temperatureAlarms : TemperatureAlarms {
            perform action a0 { doc /* remain active during loss of network connectivity @S182 */ }
            exhibit state modes {
                state s0 { doc /* active @S182 */ }
            }
        }
        part temperatureRecords : TemperatureRecords {
            perform action a0 { doc /* retain timestamps and equipment identifiers @S194 */ }
            perform action a1 { doc /* support operational review and investigation @S194 */ }
        }
        part temperatureSensitivePackages : TemperatureSensitivePackages {
            perform action a0 { doc /* remain under controlled conditions @S087 */ }
        }
        part timeSynchronizationFaults : TimeSynchronizationFaults {
            perform action a0 { doc /* could affect transaction records @S215 */ }
        }
        part transaction : Transaction {
            perform action a0 { doc /* could cause a duplicate or missed dispense @S236 */ }
            exhibit state modes {
                state s0 { doc /* on hold @S145 */ }
            }
        }
        part transfer : Transfer {
            perform action a0 { doc /* stops progressing @S192 */ }
        }
        part unit : Unit {
            perform action a0 { doc /* remains traceable to its storage history @S174 */ }
            exhibit state modes {
                state s0 { doc /* traceable to its storage history @S174 */ }
            }
        }
        part unresolvedExceptions : UnresolvedExceptions {
            exhibit state modes {
                state s0 { doc /* unresolved @S134 */ }
            }
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
            perform action a7 { doc /* check return bins before use @S113 */ }
            perform action a8 { doc /* use @S113 */ }
            perform action a9 { doc /* confirm that each bin is intact, clean, and assigned to the correct return stream @S113 */ }
        }
        part westTubeDispatchConsole : WestTubeDispatchConsole {
            perform action a0 { doc /* provide controlled interfaces for routing authorized pharmacy deliveries @S016 */ }
            perform action a1 { doc /* uses the Pneumatic Capsule Seal Record to verify capsule identity and seal status before closing its dispatch-side handoff checks @S238 */ }
            perform action a2 { doc /* verify capsule identity and seal status @S238 */ }
            perform action a3 { doc /* closing its dispatch-side handoff checks @S238 */ }
            perform action a4 { doc /* records completion of its handoff checks only after the required dispatch data are consistent @S239 */ }
            perform action a5 { doc /* retains the handoff completion status for operational review @S242 */ }
        }
        part workflow : Workflow {
            perform action a0 { doc /* support timely fulfillment @S002 */ }
            perform action a1 { doc /* preserving pharmacist oversight, medication traceability, and clinical control @S002 */ }
        }
        flow f0 of OrderStatusItem from medicationOrderGateway to authorizedHospitalSystems { doc /* @S008 */ }
        flow f1 of DiscrepanciesItem from pharmacyTechnician to clinicalPharmacist { doc /* @S010 */ }
        flow f2 of CompatibleDeliveriesItem from pneumaticTubeNetwork to designatedHospitalLocations { doc /* @S017 */ }
        flow f3 of MedicationOrdersItem from authorizedClinicalSystems to medicationOrderGateway { doc /* @S029 */ }
        flow f4 of ExpectedDeliveryDelaysItem from chargeNurse to wardStaff { doc /* @S059 */ }
        flow f5 of ApprovedLocalWorkaroundItem from chargeNurse to wardStaff { doc /* @S059 */ }
        flow f6 of PackageItem from pharmacyFulfillmentRobot to pharmacyVerificationStation { doc /* @S077 */ }
        flow f7 of CurrentTemperatureItem from sensorMonitoredMedicationCooler to staff { doc /* @S108 */ }
        flow f8 of RecordedExcursionItem from sensorMonitoredMedicationCooler to staff { doc /* @S108 */ }
        flow f9 of UrgentPatientCareConcernItem from registeredNurse to clinicalPharmacist { doc /* @S132 */ }
        flow f10 of ReadingsItem from calibratedProbes to sensorMonitoredMedicationCooler { doc /* @S173 */ }
        flow f11 of SegmentStatusItem from pneumaticTubeNetwork to eastTubeDispatchConsole { doc /* @S188 */ }
        flow f12 of TransferProgressItem from pneumaticTubeNetwork to eastTubeDispatchConsole { doc /* @S188 */ }
        flow f13 of DeliveryConfirmationItem from pneumaticTubeNetwork to eastTubeDispatchConsole { doc /* @S188 */ }
        flow f14 of ConditionItem from northWardCabinetController to eastTubeDispatchConsole { doc /* @S189 */ }
        flow f15 of ConditionItem from eastTubeDispatchConsole to operator { doc /* @S189 */ }
        flow f17 of TubeRouteExceptionTicketItem from eastTubeDispatchConsole to biomedicalEngineer { doc /* @S211 */ }
        flow f18 of ConditionItem from northWardCabinetController to biomedicalEngineer { doc /* @S212 */ }
        flow f19 of DiscrepancyItem from receivingDepartment to medicationSafetyOfficer { doc /* @S216 */ }
        flow f20 of CabinetDowntimeNoticeItem from chargeNurse to iTOperationsSpecialist { doc /* @S222 */ }
        flow f21 of RepairItem from biomedicalEngineer to iTOperationsSpecialist { doc /* @S234 */ }
        flow f22 of EquipmentLimitationsItem from biomedicalEngineer to iTOperationsSpecialist { doc /* @S234 */ }
    }
    requirement def R0 { doc /* a cabinet must be taken out of service @S064 */ subject s : Cabinet; }
    requirement def R1 { doc /* A correction requires a valid authorized order and must not be inferred from prior dispensing history. @S130 */ subject s : Correction; }
    requirement def R2 { doc /* The Registered Nurse does not bypass a hold or substitute a product to clear an exception. @S133 */ subject s : RegisteredNurse; }
    requirement def R3 { doc /* The Pharmacy Technician may gather package and transaction evidence but may not make a clinical dose decision. @S135 */ subject s : PharmacyTechnician; }
    requirement def R4 { doc /* Access rules require an authenticated user role appropriate to the requested medication and transaction type. @S166 */ subject s : AccessRules; }
    requirement def R5 { doc /* After recovery, the console requires refreshed segment status and an approved route decision before dispatch resumes. @S193 */ subject s : EastTubeDispatchConsole; }
    requirement def R6 { doc /* The IT Operations Specialist coordinates technical troubleshooting with the Biomedical Engineer when equipment inspection or repair is required. @S231 */ subject s : ITOperationsSpecialist; }
    requirement def R7 { doc /* The Clinical Pharmacist reviews medication orders affected by the outage when clinical validation is needed. @S232 */ subject s : ClinicalPharmacist; }
    requirement def R8 { doc /* The cabinet remains Out of Service until required functional checks pass and the responsible staff approve its return to Ready for Dispense. @S237 */ subject s : FunctionalChecks; }
    requirement def R9 { doc /* The West Tube Dispatch Console records completion of its handoff checks only after the required dispatch data are consistent. @S239 */ subject s : DispatchData; }
}
