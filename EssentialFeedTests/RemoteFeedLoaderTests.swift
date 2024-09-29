//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Amr on 29/09/2024.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        let sut = RemoteFeedLoader()
        
        
        XCTAssertNil(client.requestedURL)
        
    }

}
