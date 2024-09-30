//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Amr on 29/09/2024.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
