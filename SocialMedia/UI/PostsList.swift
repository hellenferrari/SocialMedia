//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import SwiftUI

struct PostsList: View {
    @ObservedObject var viewModel = PostsViewModel()
    
    var body: some View {
        VStack {
            NavigationView {
                List(viewModel.postsWithUser, id: \.post.id) { postDetail in
                    Section {
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
                .navigationBarTitle("Posts", displayMode: .inline)
                .listStyle(InsetListStyle())
            }
        }
        .onAppear {
            Task { @MainActor in
                await viewModel.getPosts()
            }
        }
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
