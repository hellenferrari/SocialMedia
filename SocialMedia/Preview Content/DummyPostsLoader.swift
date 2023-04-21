//
//  DummyPostsLoader.swift
//  SocialMedia
//
//  Created by Bogdan on 21.04.2023.
//

import Foundation

final class DummyPostsLoader: PostsLoader {
    private let posts: [Post]
    
    init(posts: [Post] = dummyPosts) {
        self.posts = posts
    }
    
    func fetchPosts() async throws -> [Post] { posts }
    
    func fetchUsers() async throws -> [User] {
        [
            User(id: 100, name: "User name", email: "User email")
        ]
    }
    
    static var dummyPosts: [Post] = [
        Post(userId: 0, id: 10, title: "Post 1", body: "Post 1 body"),
        Post(userId: 1, id: 11, title: "Post 2", body: "Post 2 body")
    ]
    
    static var longListOfPosts: [Post] = Array(0..<100).map {
        Post(userId: $0, id: $0, title: "Post \($0)", body: "Long body \($0)")
    }
}
