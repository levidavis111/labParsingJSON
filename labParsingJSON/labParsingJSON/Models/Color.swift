//
//  Color.swift
//  labParsingJSON
//
//  Created by Levi Davis on 8/27/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation
import UIKit

struct Mode: Codable {
    let colors: [Color]
}

struct Color: Codable {
    let name: ColorNameWrapper
    let rgb: RGBWrapper
    let hex: HexWrapper
    
    static func getColorData(from data: Data) throws -> [Color] {
        do {
            let result = try JSONDecoder().decode(Mode.self, from: data)
            return result.colors
        }
        catch {
            throw JSONError.decodingError(error)
        }
    }
    
}

struct ColorNameWrapper: Codable {
    let value: String
    let closest_named_hex: String
    
}

struct RGBWrapper: Codable {
    let fraction: RGBWrapperWrapper
}

struct RGBWrapperWrapper: Codable {
    let r: CGFloat
    let g: CGFloat
    let b: CGFloat
}

struct HexWrapper: Codable {
    let value: String
    let clean: String
}
