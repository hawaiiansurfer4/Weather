//
//  Weather.swift
//  JPMCChallengeTable
//
//  Created by Sean Murphy on 8/11/22.
//

import Foundation

struct Weather: Codable {
    let product: String
//    let dataseries: [Dataseries]
}
//
//struct Dataseries: Codable {
//    let timepoint: Int
//    let cloudCover: Int
//    let transparency: Int
//    let wind10m: WindDirection
//}
//
//struct WindDirection: Codable {
//    let direction: String?
//}

//struct Weather: Codable {
//    struct Dataseries: Codable {
//        let timepoint: Int
//        let cloudCover: Int
//        let transparency: Int
//
//        struct Wind10m: Codable {
//            let direction: String?
//        }
//
//        let wind10m: Wind10m
//    }
//
//    let dataseries: [Dataseries]
//}

/*

struct WeatherModel: Codable {
    let product: String
    let dataseries: [Dataseries]
}
struct Dataseries: Codable {
    let timepoint, cloudcover, seeing, transparency: Int
    let liftedIndex, rh2M: Int
    let wind10M: Wind10M
    let temp2M: Int
}

struct Wind10M: Codable {
    let direction: String
    let speed: Int
}

*/

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

