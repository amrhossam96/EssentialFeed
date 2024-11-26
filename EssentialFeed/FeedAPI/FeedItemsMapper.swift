//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Amr on 30/09/2024.
//

import Foundation

 final class FeedItemsMapper {
    
    struct Root: Decodable {
        let items: [RemoteFeedItem]
    }

    private static var OK_200: Int { return 200 }
    
     static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteFeedLoader.Error.invalidData
        }
        return root.items
        
    }
}
