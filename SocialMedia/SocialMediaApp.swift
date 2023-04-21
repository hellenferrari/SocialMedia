//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import SwiftUI

@main
struct SocialMediaApp: App {
    private let loader: PostsLoader = RemotePostsLoader(httpClient: URLSessionHTTPClient())
    
    var body: some Scene {
        WindowGroup {
            PostsList(viewModel: PostsViewModel(service: loader))
        }
    }
}
