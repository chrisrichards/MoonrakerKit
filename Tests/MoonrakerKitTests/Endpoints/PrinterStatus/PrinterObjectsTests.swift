//
//  PrinterObjectsTests.swift
//  
//
//  Created by Chris Richards on 11/05/2022.
//

import XCTest
import MoonrakerKit

class PrinterObjectsEndpointTests: XCTestCase {
    
    func testDeserialization() throws {
        let expectedObjects = [
            "webhooks",
            "heater_bed",
            "heater_fan hotend_fan",
            "toolhead",
            "extruder"
        ]
        let json = "{\"result\": {\"objects\": \(expectedObjects)}}"
        let data = Data(json.utf8)
        
        let endpoint = PrinterObjectsEndpoint()
        let objects = try endpoint.content(from: nil, with: data)
        AssertEqual(objects, expectedObjects)
    }
    
}
