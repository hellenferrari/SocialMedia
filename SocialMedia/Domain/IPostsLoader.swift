//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import Foundation

protocol IPostsLoader {
    func fetchPosts() async throws -> [Post]
    func fetchUsers() async throws -> [User]
}
