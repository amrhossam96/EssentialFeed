//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Amr on 30/09/2024.
//

import Foundation

internal final class FeedItemsMapper {
    
    struct Root: Decodable {
        let items: [Item]
        var feed: [FeedItem] {
            return items.map { $0.item }
        }
    }

    struct Item: Equatable, Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL?
        
        var item: FeedItem {
            FeedItem(
                id: id,
                description: description,
                location: location,
                imageURL: image
            )
        }
    }
    
    private static var OK_200: Int { return 200 }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(Root.self, from: data) else {
              return .failure(.invalidData)
        }
        return .success(root.feed)
        
    }
}
