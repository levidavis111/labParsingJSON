


import Foundation


enum JSONError: Error {
    case decodingError(Error)
}

struct Results: Codable {
    let results: [RandomUser]
}

struct RandomUser: Codable {
    let name: NameWrapper
    let location: LocationWrapper
    let phone: String
    let dob: DOBWrapper
    
    static func getRandomUsers(from data: Data) throws -> [RandomUser] {
        do {
            let result = try JSONDecoder().decode(Results.self, from: data)
            return result.results
        } catch {
            print(error)
            throw JSONError.decodingError(error)
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
