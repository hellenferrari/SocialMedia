//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import Foundation

public struct RemotePostsLoader: PostsLoader {
    
    let endpoints = PostsEndpoints()
    
    public init() { }
        
    func fetchPosts() async throws -> [Post] {
        let postsURL = endpoints.baseURL + endpoints.posts
        let (data, response) = try await URLSession.shared.data(from: URL(string: postsURL)!)
        
        let posts = try JSONDecoder().decode([Post].self, from: data)
        return posts
    }
    
    func fetchUsers() async throws -> [User] {
        let usersURL = endpoints.baseURL + endpoints.users
        let (data, response) = try await URLSession.shared.data(from: URL(string: usersURL)!)
        
        let users = try JSONDecoder().decode([User].self, from: data)
        return users
    }
    
}
