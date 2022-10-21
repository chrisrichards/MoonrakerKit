//
//  PrinterObjectsEndpoint.swift
//  
//
//  Created by Chris Richards on 20/10/2022.
//

import Foundation

public struct PrinterObjectsEndpoint: BaseEndpoint {
    
    public typealias Content = [String]

    public init() {}
    
    func content(from root: PrinterObjectsResponse) -> [String] {
        return root.result.objects
    }

    public func makeRequest(baseURL: URL) -> URLRequest {
        let url = baseURL.appendingPathComponent("printer/objects/list")
        return URLRequest(url: url)
    }
}

// MARK: - Response
struct PrinterObjectsResponse: Codable {
    let result: PrinterObjectsResult
}

struct PrinterObjectsResult: Codable {
    let objects: [String]
}
