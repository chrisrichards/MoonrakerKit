//
//  MoonrakerClient.swift
//
//
//  Created by Chris Richards on 20/10/2022.
//


import Foundation

final public class MoonrakerClient: BaseClient {
    
    private let baseURL: URL;
    
    public init(url: String, timeout: TimeInterval?) {
        baseURL = URL(string: url)!
        
        let config = URLSessionConfiguration.ephemeral
        config.timeoutIntervalForRequest = timeout ?? 30
        super.init(baseURL: baseURL, config: config)
    }

}
