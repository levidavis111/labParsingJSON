//
//  Weather.swift
//  labParsingJSON
//
//  Created by Levi Davis on 8/27/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation


struct List: Codable {
    let list: [Cities]
}
struct Cities: Codable {
    let name: String
    let main: MainWrapper
    let weather: [WeatherWrapper]
    
    static func getWeatherData(from data: Data) throws -> [Cities] {
        do {
            let result = try JSONDecoder().decode(List.self, from: data)
            return result.list
        }
        catch {
            throw JSONError.decodingError(error)
        }
    }
    
}

struct MainWrapper: Codable {
    let temp: Double
}

struct WeatherWrapper: Codable {
    let main: String
    let description: String
}
