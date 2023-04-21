//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import XCTest
@testable import SocialMedia

final class RemotePostsLoaderTests: XCTestCase {
    func test_init() {
        let sut = RemotePostsLoader(httpClient: MockHTTPClient())
        XCTAssertEqual(sut.endpoints.baseURL, "https://jsonplaceholder.typicode.com")
    }
    
    func test_fetchPosts_onError() async throws {
        let httpClient = MockHTTPClient()
        let anyError = anyNSError()
        httpClient.mockedGetResult = .failure(anyError)
        let sut = RemotePostsLoader(httpClient: httpClient)
        
        do {
            _ = try await sut.fetchPosts()
            XCTFail("Should throw and not get here")
        } catch {
            XCTAssertEqual(error as NSError, anyError)
        }
    }
}

final class MockHTTPClient: HTTPClient {
    var mockedGetResult: Result<Data, Error> = .success(Data())
    
    func get(from url: URL) async -> Result<Data, Error> {
        return mockedGetResult
    }
}

func anyNSError() -> NSError { NSError(domain: "any domain", code: 0) }

extension Post: Equatable {
    public static func == (lhs: Post, rhs: Post) -> Bool {
        lhs.id == rhs.id && lhs.userId == rhs.userId && lhs.title == rhs.title && lhs.body == rhs.body
    }
}
