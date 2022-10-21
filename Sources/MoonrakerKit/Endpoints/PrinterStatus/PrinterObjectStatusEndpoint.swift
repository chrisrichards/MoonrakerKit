//
//  PrinterObjectStatusEndpoint.swift
//  
//
//  Created by Chris Richards on 20/10/2022.
//

import Foundation

public struct PrinterObjectStatusEndpoint: BaseEndpoint {
    
    public typealias Content = PrinterObjectStatusResult

    private let objects: [String]
    
    public init(objects: [String]) {
        self.objects = objects
    }
    
    func content(from root: PrinterObjectStatusResponse) -> PrinterObjectStatusResult {
        return root.result
    }

    public func makeRequest(baseURL: URL) -> URLRequest {
        let url = baseURL.appendingPathComponent("printer/objects/query")
        
        var comps = URLComponents(url: url, resolvingAgainstBaseURL: false)
        comps?.queryItems = objects.map({ URLQueryItem(name: $0, value: nil) })
        
        return URLRequest(url: comps!.url!)
    }
}

// MARK: - Response
struct PrinterObjectStatusResponse: Codable {
    let result: PrinterObjectStatusResult
}

public struct PrinterObjectStatusResult: Codable {
    public let eventtime: Double
    public let status: PrinterObjects
}

public struct PrinterObjects: Codable {
    public let extruder: Extruder?
}
