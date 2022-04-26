// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Courses {
    let wheaton: Wheaton
}

// MARK: - Wheaton
struct Wheaton {
    let classes: [Class]
    let sections: [Section]
    let subjects: [String: String]
}

// MARK: - Class
struct Class {
    let host: String
    let termID: String
    let subject: String
    let classID: String
    let classAttributes: [String]
    let nupath: [Any?]
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
}

// MARK: - Coreqs
struct Coreqs {
    let type: String
    let values: [CoreqsValue]
}

// MARK: - CoreqsValue
struct CoreqsValue {
    let classID: String
    let subject: String
    let missing: Bool?
}

// MARK: - PrereqsFor
struct PrereqsFor {
    let values: [OptPrereqsForValue]
}

// MARK: - OptPrereqsForValue
struct OptPrereqsForValue {
    let subject: String
    let classID: String
}

// MARK: - Prereqs
struct Prereqs {
    let type: String
    let values: [PrereqsValue]
}

enum PrereqsValue {
    case purpleValue(PurpleValue)
    case string(String)
}

// MARK: - PurpleValue
struct PurpleValue {
    let classID: String?
    let subject: String?
    let missing: Bool?
    let type: String?
    let values: [ValueValueUnion]?
}

enum ValueValueUnion {
    case coreqsValue(CoreqsValue)
    case string(String)
}

// MARK: - Section
struct Section {
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
}

// MARK: - Meeting
struct Meeting {
    let startDate: Int
    let endDate: Int
    let meetingWhere: String
    let type: String
    let times: [String: [Time]]
}

// MARK: - Time
struct Time {
    let start: End
    let end: End
}

enum End {
    case integer(Int)
    case string(String)
}
