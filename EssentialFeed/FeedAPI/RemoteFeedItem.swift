//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Amr on 07/10/2024.
//

import Foundation

 struct RemoteFeedItem: Decodable {
     let id: UUID
     let description: String?
     let location: String?
     let image: URL
}
