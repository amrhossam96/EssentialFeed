//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Amr on 30/09/2024.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    /// The completion handler can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate theads if needed.
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
