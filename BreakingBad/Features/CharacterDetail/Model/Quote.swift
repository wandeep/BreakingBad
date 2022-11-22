//
//  Quote.swift
//  BreakingBad
//
//  Created by Wandeep Basra on 21/11/2022.
//

import Foundation

struct Quote: Decodable, Identifiable, Hashable  {
    let id: Int
    let quote: String
    let author: String
    let series: String

    enum CodingKeys: String, CodingKey {
        case id = "quote_id"
        case quote
        case author
        case series
    }
}

