//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Amr on 30/09/2024.
//

import Foundation

internal final class FeedItemsMapper {
    
    private static var OK_200: Int { return 200 }
    
    internal static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedItem] {
        
        struct Root: Decodable {
            let items: [Item]
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
        
        guard response.statusCode == OK_200 else {
            throw RemoteFeedLoader.Error.invalidData
        }
        let root = try JSONDecoder().decode(Root.self, from: data)
        return root.items.map { $0.item }
    }
}
