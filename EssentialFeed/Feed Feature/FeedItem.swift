//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Amr on 29/09/2024.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL?
    
    public init(id: UUID, description: String?, location: String?, imageURL: URL?) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
}
