//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import XCTest
@testable import SocialMedia

final class RemotePostsLoaderTests: XCTestCase {
    func test_init() {
        let session = MockURLSession()
        let sut = RemotePostsLoader(session: session)
        XCTAssertEqual(sut.endpoints.baseURL, "https://jsonplaceholder.typicode.com")
    }
    
    func test_fetchPosts_onError() {
        let session = MockURLSession()
        let sut = RemotePostsLoader(session: session)
        
        // TODO
    }
}

final class MockURLSession: URLSession {}
