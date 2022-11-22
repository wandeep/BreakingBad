//
//  Character.swift
//  BreakingBad
//
//  Created by Wandeep Basra on 21/11/2022.
//

import Foundation

struct Character: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let imageUrl: String
    let status: String
    let nickname: String
    let appearance: [Int]
    let portrayed: String
    let category: String
    let betterCallSaulAppearance: [Int]

    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name
        case birthday
        case occupation
        case imageUrl = "img"
        case status
        case nickname
        case appearance
        case portrayed
        case category
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
}

extension Character {
    static let sample = Character(id: 1, name: "Saul", birthday: "25-12-1950", occupation: [], imageUrl: "", status: "", nickname: "", appearance: [], portrayed: "", category: "", betterCallSaulAppearance: [])
}
