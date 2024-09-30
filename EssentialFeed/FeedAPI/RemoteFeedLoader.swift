//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Amr on 29/09/2024.
//

import Foundation

public final class RemoteFeedLoader {
    
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result: Equatable {
        case success([FeedItem])
        case failure(Error)
        
    }
    
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { result in
            switch result {
            case .success(let data, let response):
                do {
                    let items = try FeedItemsMapper.map(data, response)
                    completion(.success(items))
                } catch {
                    completion(.failure(.invalidData))
                }
                
            case .failure:
                completion(.failure(.connectivity))
                
            }
        }
    }
}

private class FeedItemsMapper {
    
    static var OK_200: Int { return 200 }
    
    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedItem] {
        
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
