//
//  Extruder.swift
//  
//
//  Created by Chris Richards on 20/10/2022.
//

import Foundation

public struct Extruder: Codable {
    public let temperature: Float
    public let target: Float
    public let power: Float
    public let pressureAdvance: Float
    public let smoothTime: Float
    public let canExtrude: Bool
}
