//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import Foundation

public struct RemotePostsLoader: PostsLoader {
    private let httpClient: HTTPClient
    
    let endpoints = PostsEndpoints()
    
    public init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
        
    func fetchPosts() async throws -> [Post] {
        let postsURL = URL(string: endpoints.baseURL + endpoints.posts)!
        let posts: [Post] = try await fetch(from: postsURL)
        return posts
    }
    
    func fetchUsers() async throws -> [User] {
        let usersURL = URL(string: endpoints.baseURL + endpoints.users)!
        let users: [User] = try await fetch(from: usersURL)
        return users
    }
    
    private func fetch<T: Decodable>(from url: URL) async throws -> [T] {
        let result = await httpClient.get(from: url)
        switch result {
        case .failure(let error): throw error
        case .success(let data):
            return try JSONDecoder().decode([T].self, from: data)
        }
    }
}
