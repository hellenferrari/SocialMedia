//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import Foundation

class PostsViewModel: ObservableObject {
    private let service: PostsLoader
    var posts = [Post]()
    var users = [User]()
    @Published var postsWithUser = [PostWithUser]()

    init(service: PostsLoader) {
        self.service = service
    }
    
    func getPosts() async {
        posts = try! await service.fetchPosts()
        await getUsers()
        postsWithUser = try! await getPostsWithUsers()
    }
    
    func getUsers() async {
        users = try! await service.fetchUsers()
    }
    

    //let user = viewModel.users.filter { $0.id == post.userId }.first
    func getPostsWithUsers() async throws -> [PostWithUser] {
        let postsWithUsers = posts.map { post in
            let user = users.first { $0.id == post.userId }

            return PostWithUser(post: post, user: user ?? User(id: 0, name: "", email: ""))
        }

        return postsWithUsers
    }
    
}

// PostsViewModel -> RemotePostsLoader
// PostsViewModel -> PostsLoader <|--- RemotePostsLoader
// PostsViewModel -> PostsLoader <|--- LocalPostsLoader
// PostsViewModel -> PostsLoader <|--- RemoteWithLocalFallbackPostsLoader
