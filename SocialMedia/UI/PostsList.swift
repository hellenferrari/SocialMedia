//
// Copyright (c) Hellen Ferrari. All rights reserved.
//

import SwiftUI

struct PostsList: View {
    let service = Service()
    @State var posts = [Post]()
    
    
    var body: some View {
        VStack {
            List(posts, id: \.id) { post in
                Section {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "")
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .backgroundStyle(.gray)
                            
                            Text("user")
                        }

                        Text(post.title)
                            .font(Font.subheadline).bold()
                            .padding(.top, 1)
                        Text(post.body)
                            .font(Font.body)
                            .padding(.top, 1)
                    }
                }
                
            }
            .navigationBarTitle("Posts", displayMode: .inline)
        }
        .onAppear {
            Task {
                posts = try await service.fetchPosts()
            }
            
        }
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
