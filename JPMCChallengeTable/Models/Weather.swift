//
//  Weather.swift
//  JPMCChallengeTable
//
//  Created by Sean Murphy on 8/11/22.
//

import Foundation

struct WeatherModel: Codable {
    let product, welcomeInit: String
    let dataseries: [Dataseries]

    enum CodingKeys: String, CodingKey {
        case product
        case welcomeInit = "init"
        case dataseries
    }
}

// MARK: - Datasery
struct Dataseries: Codable {
    let timepoint, cloudcover, seeing, transparency: Int
    let liftedIndex, rh2M: Int
    let wind10M: Wind10M
    let temp2M: Int

    enum CodingKeys: String, CodingKey {
        case timepoint, cloudcover, seeing, transparency
        case liftedIndex = "lifted_index"
        case rh2M = "rh2m"
        case wind10M = "wind10m"
        case temp2M = "temp2m"
    }
}


// MARK: - Wind10M
struct Wind10M: Codable {
    let direction: String
    let speed: Int
}

