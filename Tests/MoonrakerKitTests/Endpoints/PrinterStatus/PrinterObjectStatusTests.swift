//
//  PrinterObjectStatusTests.swift
//
//
//  Created by Chris Richards on 11/05/2022.
//

import XCTest
import MoonrakerKit

class PrinterObjectStatusTests: XCTestCase {

    func testDeserialization() throws {
        let pressureAdvance:Float = 0.04;
        let target:Float = 0.0
        let power:Float = 0.0
        let canExtrude = false
        let smoothTime:Float = 0.04
        let temperature:Float = 22.0
        let eventTime = 927220.114734001
        
        let json = "{\"result\": {\"status\": {\"extruder\": {\"pressure_advance\": \(pressureAdvance), \"target\": \(target), \"power\": \(power), \"can_extrude\": \(canExtrude), \"smooth_time\": \(smoothTime), \"temperature\": \(temperature)}}, \"eventtime\": \(eventTime)}}"
        let data = Data(json.utf8)
                
        let endpoint = PrinterObjectStatusEndpoint(objects: ["extruder"])
        let result = try endpoint.content(from: nil, with: data)
        XCTAssertEqual(result.eventtime, eventTime)
        
        let extruder = result.status.extruder!
        XCTAssertEqual(extruder.pressureAdvance, pressureAdvance)
        XCTAssertEqual(extruder.target, target)
        XCTAssertEqual(extruder.power, power)
        XCTAssertEqual(extruder.canExtrude, canExtrude)
        XCTAssertEqual(extruder.smoothTime, smoothTime)
        XCTAssertEqual(extruder.temperature, temperature)
    }

}
