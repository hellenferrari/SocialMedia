//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import SwiftUI

struct PostsList: View {
    @ObservedObject private var viewModel: PostsViewModel
    
    init(viewModel: PostsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            NavigationView {
                if viewModel.postsWithUser.isEmpty {
                    VStack {
                        Text("No posts available")
                        Button("Reload", action: {})
                    }
                } else {
                    listView()
                }
            }
        }
        .onAppear {
            Task { @MainActor in
                await viewModel.getPosts()
            }
        }
    }
    
    private func listView() -> some View {
        List(viewModel.postsWithUser, id: \.post.id) { postDetail in
            Section {
                postView(postDetail: postDetail)
            }
            
        }
        .navigationBarTitle("Posts", displayMode: .inline)
        .listStyle(InsetListStyle())
    }
    
    private func postView(postDetail: PostWithUser) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .fill(.gray)
                    .frame(width: 50, height: 50)
                
                Text(postDetail.user.name)
            }
            
            Text(postDetail.post.title)
                .font(Font.subheadline).bold()
                .padding(.top, 1)
            Text(postDetail.post.body)
                .font(Font.body)
                .padding(.top, 1)
        }
    }
}

#if DEBUG

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostsList(viewModel: PostsViewModel(service: DummyPostsLoader()))
                .previewDisplayName("List")
                        
            PostsList(viewModel: PostsViewModel(service: DummyPostsLoader(posts: [])))
                .previewDisplayName("Empty List")
            
            PostsList(viewModel: PostsViewModel(service: DummyPostsLoader(
                posts: DummyPostsLoader.longListOfPosts)))
                .previewDisplayName("Long List")
        }
    }
}

#endif
