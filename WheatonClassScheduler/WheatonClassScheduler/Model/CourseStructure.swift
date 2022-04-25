// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Courses: Codable {
    let wheaton: Wheaton
}

// MARK: - Wheaton
struct Wheaton: Codable {
    let classes: [Class]
    let sections: [Section]
    let subjects: [String: String]
}

// MARK: - Class
struct Class: Codable {
    let host: Host
    let termID, subject, classID: String
    let classAttributes: [ClassAttribute]
    let nupath: [JSONAny]
    let desc: Desc
    let prettyURL: String
    let name: String
    let url: String
    let lastUpdateTime: Int
    let maxCredits, minCredits: Double
    let college: College?
    let feeAmount: Int?
    let feeDescription: FeeDescription
    let prereqs: Prereqs
    let coreqs: Coreqs
    let optPrereqsFor, prereqsFor: PrereqsFor

    enum CodingKeys: String, CodingKey {
        case host
        case termID = "termId"
        case subject
        case classID = "classId"
        case classAttributes, nupath, desc
        case prettyURL = "prettyUrl"
        case name, url, lastUpdateTime, maxCredits, minCredits, college, feeAmount, feeDescription, prereqs, coreqs, optPrereqsFor, prereqsFor
    }
}

enum ClassAttribute: String, Codable {
    case advancedIntegrativeSeminarAIS = "Advanced Integrative Seminar  AIS"
    case appAbstractQuantReasAAQRAAQR = "App Abstract/Quant Reas (AAQR)  AAQR"
    case capstoneCAP = "Capstone  CAP"
    case christianThoughtCT = "Christian Thought  CT"
    case competencyRequirementCOMP = "Competency Requirement  COMP"
    case diversityInTheUSDUSDUS = "Diversity in the U.S. (DUS)  DUS"
    case envStudiesBiologyCourseEVSB = "Env Studies: Biology Course  EVSB"
    case envStudiesGeologyCourseEVSG = "Env Studies: Geology Course  EVSG"
    case envStudiesSocialSciCourseEVSS = "Env Studies: Social Sci Course  EVSS"
    case firstYearSeminarFYS = "First Year Seminar  FYS"
    case generalEducationCourseGNED = "General Education Course  GNED"
    case globalPerspecHalfGPB = "Global Perspec-Half  GPB"
    case globalPerspectHalfGPA = "Global Perspect-Half  GPA"
    case globalPerspectivesGPGP = "Global Perspectives (GP)  GP"
    case historicalPerspectivesHPHP = "Historical Perspectives (HP)  HP"
    case historyAmericanHAMR = "History American  HAMR"
    case languageRequirementLANG = "Language Requirement  LANG"
    case legacyDiversityCourseDVRS = "Legacy Diversity Course  DVRS"
    case literaryExplorationsLELE = "Literary Explorations (LE)  LE"
    case newTestamentNT = "New Testament  NT"
    case noAttributeInformationAvailable = "No Attribute information available."
    case oldTestamentOT = "Old Testament  OT"
    case oralCompetencyORAL = "Oral Competency  ORAL"
    case partOfSciGEUDExemptionSUPX = "Part of Sci GE UD Exemption  SUPX"
    case philosophyRationalityClusterPRAT = "Philosophy Rationality Cluster  PRAT"
    case philosophyReligionClusterPREL = "Philosophy Religion Cluster  PREL"
    case philosophyValuesClusterPVAL = "Philosophy Values Cluster  PVAL"
    case philosphclInvestigationsPIPI = "Philosphcl Investigations (PI)  PI"
    case scienceIssuesPerspectSIPSIP = "Science Issues/Perspect (SIP)  SIP"
    case scienceLabGenEdSLAB = "Science Lab Gen Ed  SLAB"
    case scienceUpperDivisionGenEdSUPR = "Science Upper Division Gen Ed  SUPR"
    case scientificPracticeSPSP = "Scientific Practice (SP)  SP"
    case sharedCoreSHAR = "Shared Core  SHAR"
    case socialInquirySISI = "Social Inquiry (SI)  SI"
    case thematicCoreTHEM = "Thematic Core  THEM"
    case visualPerformArtsMusicVPAM = "Visual & Perform Arts-Music  VPAM"
    case visualPerformArtsTheaterVPAT = "Visual & Perform Arts-Theater  VPAT"
    case visualPerformArtsVisualVPAV = "Visual & Perform Arts-Visual  VPAV"
    case visualPerformingArtsVPAVPA = "Visual & Performing Arts (VPA)  VPA"
    case wellnessCompetencyWELL = "Wellness Competency  WELL"
    case writingCompetencyWRT = "Writing Competency  WRT"
}

enum College: String, Codable {
    case hr2 = "HR2"
    case law = "LAW"
}

// MARK: - Coreqs
struct Coreqs: Codable {
    let type: CoreqsType
    let values: [CoreqsValue]
}

enum CoreqsType: String, Codable {
    case and = "and"
    case or = "or"
}

// MARK: - CoreqsValue
struct CoreqsValue: Codable {
    let classID: String
    let subject: Subject
    let missing: Bool?

    enum CodingKeys: String, CodingKey {
        case classID = "classId"
        case subject, missing
    }
}

enum Subject: String, Codable {
    case ahs = "AHS"
    case anth = "ANTH"
    case arch = "ARCH"
    case art = "ART"
    case bEc = "B EC"
    case biol = "BIOL"
    case bith = "BITH"
    case cE = "C E"
    case cfm = "CFM"
    case chem = "CHEM"
    case chin = "CHIN"
    case cmhc = "CMHC"
    case comm = "COMM"
    case core = "CORE"
    case csci = "CSCI"
    case econ = "ECON"
    case educ = "EDUC"
    case engr = "ENGR"
    case engw = "ENGW"
    case envr = "ENVR"
    case flng = "FLNG"
    case fren = "FREN"
    case geol = "GEOL"
    case germ = "GERM"
    case gps = "GPS"
    case grek = "GREK"
    case hdi = "HDI"
    case hebr = "HEBR"
    case hesd = "HESD"
    case hist = "HIST"
    case hngr = "HNGR"
    case ids = "IDS"
    case intr = "INTR"
    case ir = "IR"
    case latn = "LATN"
    case lead = "LEAD"
    case maft = "MAFT"
    case math = "MATH"
    case msci = "MSCI"
    case mucs = "MUCS"
    case muep = "MUEP"
    case mums = "MUMS"
    case mutc = "MUTC"
    case neur = "NEUR"
    case phil = "PHIL"
    case phys = "PHYS"
    case psci = "PSCI"
    case psyc = "PSYC"
    case reli = "RELI"
    case sci = "SCI"
    case soc = "SOC"
    case span = "SPAN"
    case ssci = "SSCI"
    case swel = "SWEL"
}

enum Desc: String, Codable {
    case noCourseDescriptionIsAvailable = "No course description is available."
}

enum FeeDescription: String, Codable {
    case anatomyPhysCourse = "Anatomy/Phys Course"
    case artCourseFee = "Art Course Fee"
    case biologyLabFee = "Biology Lab Fee"
    case chemistryLabFee = "Chemistry Lab Fee"
    case communicationsCourseFee = "Communications Course Fee"
    case communicationsFieldTrip = "Communications Field Trip"
    case dissertationFee = "Dissertation Fee"
    case educInstructSupplies = "Educ Instruct Supplies"
    case educationCourseFee = "Education Course Fee"
    case educationFieldTrip = "Education Field Trip"
    case elemMethodsPracticum = "Elem Methods Practicum"
    case empty = ""
    case evangelismCourseFee = "Evangelism Course Fee"
    case foreignLanguageFee = "Foreign Language Fee"
    case geologyFieldTrip = "Geology Field Trip"
    case geologyLabFee = "Geology Lab Fee"
    case gradBibleCompExam = "Grad Bible Comp Exam"
    case hngrCourseFee = "HNGR Course Fee"
    case intercultEvangFee = "Intercult/Evang Fee"
    case maHoneyRockFee = "MA Honey Rock Fee"
    case mucsCourseFee = "MUCS Course Fee"
    case muepChamber = "MUEP Chamber"
    case muepCourseFee = "MUEP Course Fee"
    case muepLargeEnsemble = "MUEP Large Ensemble"
    case muipCourseFee = "MUIP Course Fee"
    case muipLessons101122 = "MUIP Lessons 101-122"
    case muipLessons201222 = "MUIP Lessons 201-222"
    case muipLessons401422 = "MUIP Lessons 401-422"
    case mumsCourseFee = "MUMS Course Fee"
    case mutcCourseFee = "MUTC Course Fee"
    case operaMusicTheater = "Opera Music Theater"
    case physicsLabFee = "Physics Lab Fee"
    case psychologyCourseFeeDOC = "Psychology Course Fee - DOC"
    case psychologyCourseFeeMA = "Psychology Course Fee - MA"
    case psychologyCourseFeeUG = "Psychology Course Fee -UG"
    case studentTeaching = "Student Teaching"
    case teacherAidingPracticum = "Teacher Aiding Practicum"
    case theoriesOfOriginsField = "Theories of Origins Field"
    case thesisFee = "Thesis Fee"
    case ugHoneyRockFees = "UG Honey Rock Fees"
}

enum Host: String, Codable {
    case wheatonEdu = "wheaton.edu"
}

// MARK: - PrereqsFor
struct PrereqsFor: Codable {
    let values: [OptPrereqsForValue]
}

// MARK: - OptPrereqsForValue
struct OptPrereqsForValue: Codable {
    let subject: Subject
    let classID: String

    enum CodingKeys: String, CodingKey {
        case subject
        case classID = "classId"
    }
}

// MARK: - Prereqs
struct Prereqs: Codable {
    let type: CoreqsType
    let values: [PrereqsValue]
}

enum PrereqsValue: Codable {
    case purpleValue(PurpleValue)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(PurpleValue.self) {
            self = .purpleValue(x)
            return
        }
        throw DecodingError.typeMismatch(PrereqsValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PrereqsValue"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .purpleValue(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - PurpleValue
struct PurpleValue: Codable {
    let classID: String?
    let subject: Subject?
    let missing: Bool?
    let type: CoreqsType?
    let values: [ValueValueUnion]?

    enum CodingKeys: String, CodingKey {
        case classID = "classId"
        case subject, missing, type, values
    }
}

enum ValueValueUnion: Codable {
    case coreqsValue(CoreqsValue)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(CoreqsValue.self) {
            self = .coreqsValue(x)
            return
        }
        throw DecodingError.typeMismatch(ValueValueUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ValueValueUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .coreqsValue(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Section
struct Section: Codable {
    let host: Host
    let termID, subject, classID, crn: String
    let seatsCapacity, seatsRemaining, waitCapacity, waitRemaining: Int
    let lastUpdateTime: Int
    let classType: ClassType
    let campus: Campus
    let honors: Bool
    let url: String
    let profs: [String]
    let meetings: [Meeting]

    enum CodingKeys: String, CodingKey {
        case host
        case termID = "termId"
        case subject
        case classID = "classId"
        case crn, seatsCapacity, seatsRemaining, waitCapacity, waitRemaining, lastUpdateTime, classType, campus, honors, url, profs, meetings
    }
}

enum Campus: String, Codable {
    case blackHillsScienceStation = "Black Hills Science Station"
    case eliInColorado = "ELI in Colorado"
    case excavationInIsrael = "Excavation in Israel"
    case honeyRock = "HoneyRock"
    case offCampus = "Off-Campus"
    case onLine = "On-line"
    case pilgrimageInSantiago = "Pilgrimage in Santiago"
    case semesterInJerusalem = "Semester in Jerusalem"
    case wheatonCollege = "Wheaton College"
    case wheatonInBiblicalLands = "Wheaton in Biblical Lands"
    case wheatonInChicago = "Wheaton in Chicago"
    case wheatonInEngland = "Wheaton in England"
    case wheatonInEurope = "Wheaton in Europe"
    case wheatonInMexico = "Wheaton in Mexico"
    case wheatonInSpainLatinAmerica = "Wheaton in Spain/Latin America"
}

enum ClassType: String, Codable {
    case comprehensiveExam = "Comprehensive Exam"
    case crossListedClass = "Cross-listed class"
    case independStudy = "Independ. Study"
    case individInstrucLessons = "Individ. Instruc./Lessons"
    case intensive = "Intensive"
    case internship = "Internship"
    case lab = "Lab"
    case lecture = "Lecture"
    case lectureLab = "Lecture/Lab"
    case lectureStudio = "Lecture/Studio"
    case practicum = "Practicum"
    case remote = "Remote"
    case selfPacedTutorial = "Self paced (Tutorial)"
    case seminar = "Seminar"
    case studioCourse = "Studio Course"
    case the2HourSeminar = "2 hour seminar"
    case the4HourSeminar = "4 hour seminar"
    case thesis = "Thesis"
}

// MARK: - Meeting
struct Meeting: Codable {
    let startDate, endDate: Int
    let meetingWhere: String
    let type: MeetingType
    let times: [String: [Time]]

    enum CodingKeys: String, CodingKey {
        case startDate, endDate
        case meetingWhere = "where"
        case type, times
    }
}

// MARK: - Time
struct Time: Codable {
    let start, end: EndUnion
}

enum EndUnion: Codable {
    case enumeration(EndEnum)
    case integer(Int)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(EndEnum.self) {
            self = .enumeration(x)
            return
        }
        throw DecodingError.typeMismatch(EndUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for EndUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumeration(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        }
    }
}

enum EndEnum: String, Codable {
    case tbd = "TBD"
}

enum MeetingType: String, Codable {
    case typeClass = "Class"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
