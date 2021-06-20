//
//  CreatorPostList.swift
//  TravelApp
//
//  Created by Will Wang on 6/20/21.
//

import SwiftUI
import Kingfisher

struct CreatorPostList: View {
    
    var posts: [Post]
    
    var body: some View {
        ForEach(posts, id: \.self) { post in
            VStack(alignment: .leading) {
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                HStack {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 44)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.caption.bold())
                        Text("\(post.views) views")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }.padding(.horizontal, 12)
                
                HStack {
                    ForEach(post.hashtags, id: \.self) { tag in
                        Text("#\(tag)")
                            .font(.footnote.bold())
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .foregroundColor(.blue)
                            .background(Color(.secondarySystemFill))
                            .cornerRadius(20)
                    }
                }.padding(.bottom)
                .padding(.horizontal, 12)
             
            }
//                    .frame(height: 200)
            .background(Color.white)
            .cornerRadius(12)
            .niceShadow()
        }
    }
}
