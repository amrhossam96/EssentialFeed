//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Amr on 29/09/2024.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
