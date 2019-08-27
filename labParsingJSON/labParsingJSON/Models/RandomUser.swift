//
//  RandomUser.swift
//  labParsingJSON
//
//  Created by Levi Davis on 8/27/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation

struct RandomUser: Codable {
    let name: NameWrapper
    let location: LocationWrapper
    let phone: String
    let dob: DOBWrapper
    
    static func getRandomUsers(from data: Data) throws -> [RandomUser] {
        do {
            let randomUsers = try JSONDecoder().decode([RandomUser].self, from: data)
            return randomUsers
        } catch {
            throw fatalError("\(error)")
        }
    }
    
}

struct NameWrapper: Codable {
    let first: String
    let last: String
}

struct LocationWrapper: Codable {
    let street: String
}

struct DOBWrapper: Codable {
    let date: String
}
