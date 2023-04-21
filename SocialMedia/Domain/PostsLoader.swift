//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import Foundation

protocol PostsLoader {
    func fetchPosts() async throws -> [Post]
    func fetchUsers() async throws -> [User]
}
