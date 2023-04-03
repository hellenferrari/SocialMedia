//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import Foundation

public struct Service {
    
    public init() { }
        
    func fetchPosts() async throws -> [Post] {
        let (data, response) = try await URLSession.shared.data(from: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
        print(response)
        
        let posts = try JSONDecoder().decode([Post].self, from: data)
        
        print(posts)
        return posts
    }
    
}
