//
//  CreatorDetailView.swift
//  TravelApp
//
//  Created by Will Wang on 6/19/21.
//

import SwiftUI
import Kingfisher

struct CreatorDetailView: View {
    
    let creator: Creator
    
    @ObservedObject var vm: CreatorDetailViewModel
    
    init(creator: Creator) {
        self.creator = creator
        self.vm = CreatorDetailViewModel(id: creator.id)
    }
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 8) {
                KFImage(URL(string: vm.creatorDetail?.profileImage ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                    .niceShadow()
                    .padding(.top)
                
                Text("\(vm.creatorDetail?.firstName ?? "") \(vm.creatorDetail?.lastName ?? "")")
                    .font(.callout.bold())
                HStack {
                    Text("\(vm.creatorDetail?.username ?? "") •")
                    Image(systemName: "hand.thumbsup.fill")
                    Text("23424")
                }
                .font(.caption)
                
                Text("Youtuber, Vlogger, Travel Creator")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 12) {
                    VStack {
                        Text("\(vm.creatorDetail?.followers ?? 0)")
                            .font(.callout.bold())
                        Text("Followers")
                            .font(.caption)
                    }
                    
                    Divider()
                        .frame(height: 40)
                    
                    VStack {
                        Text("\(vm.creatorDetail?.following ?? 0)")
                            .font(.callout.bold())
                        Text("Following")
                            .font(.caption)
                    }
                }
                
                HStack(spacing: 12) {
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Follow")
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                    }).padding(.vertical, 8)
                    .background(Color.orange)
                    .cornerRadius(100)
                    
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Contact")
                                .foregroundColor(Color(.label))
                            Spacer()
                        }
                    }).padding(.vertical, 8)
                    .background(Color(.systemFill))
                    .cornerRadius(100)
                }.font(.callout.bold())
                .padding(.bottom)
                
                CreatorPostList(posts: vm.creatorDetail?.posts ?? [])
               
            }.padding(.horizontal)
            
        }.navigationBarTitle(creator.name, displayMode: .inline)
    }
}

struct CreatorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreatorDetailView(creator: .init(name: "Amy", imageName: "creator0", id: 0))
        }
    }
}
