//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct PostWithUser {
    let post: Post
    let user: User
}

