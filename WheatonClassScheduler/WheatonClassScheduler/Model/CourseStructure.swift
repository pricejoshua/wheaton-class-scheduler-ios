// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Courses: Codable {
    let wheaton: Wheaton

    enum CodingKeys: String, CodingKey {
        case wheaton = "wheaton"
    }
}

// MARK: - Wheaton
struct Wheaton: Codable {
    let classes: [Class]
    let sections: [Section]
    let subjects: [String: String]

    enum CodingKeys: String, CodingKey {
        case classes = "classes"
        case sections = "sections"
        case subjects = "subjects"
    }
}

// MARK: - Class
struct Class: Codable {
    let host: String
    let termID: String
    let subject: String
    let classID: String
    let classAttributes: [String]
//    let classAttributes: [ClassAttribute]
    let nupath: [JSONAny]
    let desc: String
    let prettyURL: String
    let name: String
    let url: String
    let lastUpdateTime: Int
    let maxCredits: Double
    let minCredits: Double
    let college: String?
    let feeAmount: Int?
    let feeDescription: String
    let prereqs: Prereqs
    let coreqs: Coreqs
    let optPrereqsFor: PrereqsFor
    let prereqsFor: PrereqsFor

    enum CodingKeys: String, CodingKey {
        case host = "host"
        case termID = "termId"
        case subject = "subject"
        case classID = "classId"
        case classAttributes = "classAttributes"
        case nupath = "nupath"
        case desc = "desc"
        case prettyURL = "prettyUrl"
        case name = "name"
        case url = "url"
        case lastUpdateTime = "lastUpdateTime"
        case maxCredits = "maxCredits"
        case minCredits = "minCredits"
        case college = "college"
        case feeAmount = "feeAmount"
        case feeDescription = "feeDescription"
        case prereqs = "prereqs"
        case coreqs = "coreqs"
        case optPrereqsFor = "optPrereqsFor"
        case prereqsFor = "prereqsFor"
    }
}

enum ClassAttribute: String, Codable, CaseIterable {
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



// MARK: - Coreqs
struct Coreqs: Codable {
    let type: String
    let values: [CoreqsValue]

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case values = "values"
    }
}

// MARK: - CoreqsValue
struct CoreqsValue: Codable {
    let classID: String
    let subject: String
    let missing: Bool?

    enum CodingKeys: String, CodingKey {
        case classID = "classId"
        case subject = "subject"
        case missing = "missing"
    }
}

// MARK: - PrereqsFor
struct PrereqsFor: Codable {
    let values: [OptPrereqsForValue]

    enum CodingKeys: String, CodingKey {
        case values = "values"
    }
}

// MARK: - OptPrereqsForValue
struct OptPrereqsForValue: Codable {
    let subject: String
    let classID: String

    enum CodingKeys: String, CodingKey {
        case subject = "subject"
        case classID = "classId"
    }
}

// MARK: - Prereqs
struct Prereqs: Codable {
    let type: String
    let values: [PrereqsValue]

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case values = "values"
    }
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
    let subject: String?
    let missing: Bool?
    let type: String?
    let values: [ValueValueUnion]?

    enum CodingKeys: String, CodingKey {
        case classID = "classId"
        case subject = "subject"
        case missing = "missing"
        case type = "type"
        case values = "values"
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
    let host: String
    let termID: String
    let subject: String
    let classID: String
    let crn: String
    let seatsCapacity: Int
    let seatsRemaining: Int
    let waitCapacity: Int
    let waitRemaining: Int
    let lastUpdateTime: Int
    let classType: String
    let campus: String
    let honors: Bool
    let url: String
    let profs: [String]
    let meetings: [Meeting]

    enum CodingKeys: String, CodingKey {
        case host = "host"
        case termID = "termId"
        case subject = "subject"
        case classID = "classId"
        case crn = "crn"
        case seatsCapacity = "seatsCapacity"
        case seatsRemaining = "seatsRemaining"
        case waitCapacity = "waitCapacity"
        case waitRemaining = "waitRemaining"
        case lastUpdateTime = "lastUpdateTime"
        case classType = "classType"
        case campus = "campus"
        case honors = "honors"
        case url = "url"
        case profs = "profs"
        case meetings = "meetings"
    }
}

// MARK: - Meeting
struct Meeting: Codable {
    let startDate: Int
    let endDate: Int
    let meetingWhere: String
    let type: String
    let times: [String: [Time]]

    enum CodingKeys: String, CodingKey {
        case startDate = "startDate"
        case endDate = "endDate"
        case meetingWhere = "where"
        case type = "type"
        case times = "times"
    }
}

// MARK: - Time
struct Time: Codable {
    let start: End
    let end: End

    enum CodingKeys: String, CodingKey {
        case start = "start"
        case end = "end"
    }
}

enum End: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(End.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for End"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
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
