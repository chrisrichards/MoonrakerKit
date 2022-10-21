//
//  Client.swift
//  
//
//  Created by Chris Richards on 20/10/2022.
//

import Foundation

public typealias APIResult<Value> = Swift.Result<Value, Error>

public protocol Client {
    
    func request<T>(_ endpoint: T) throws -> T.Content where T: Endpoint
    
    func request<T>(
        _ endpoint: T,
        completion: @escaping (APIResult<T.Content>) -> Void ) -> URLSessionTask where T: Endpoint
}
