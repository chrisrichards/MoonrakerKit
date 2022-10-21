//
//  MoonrakerClientError.swift
//  
//
//  Created by Chris Richards on 20/10/2022.
//

import Foundation

struct MoonrakerClientError: Decodable, LocalizedError {
    let status: Int
    let err: String
    
    var errorDescription: String? {
        switch err {
        case "Not found":
            return "Not found. Check ???."
        default:
            return "Moonraker API: \(err)"
        }
    }
}
