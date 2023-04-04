//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import Foundation

public struct RemotePostsLoader {
    
    public init() { }
        
    func fetchPosts() async throws -> [Post] {
        let (data, response) = try await URLSession.shared.data(from: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
        print(response)
        
        let posts = try JSONDecoder().decode([Post].self, from: data)
        
        print(posts)
        return posts
    }
    
    func fetchUsers() async throws -> [User] {
        let (data, response) = try await URLSession.shared.data(from: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        
        let users = try JSONDecoder().decode([User].self, from: data)
        return users
    }
    
}
