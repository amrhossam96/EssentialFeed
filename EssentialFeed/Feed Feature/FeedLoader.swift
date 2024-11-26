//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Amr on 29/09/2024.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    func load(completion: @escaping (Result) -> Void)
}
