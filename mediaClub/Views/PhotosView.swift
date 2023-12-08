//
//  PhotosView.swift
//  mediaClub
//
//  Created by asmaa gamal  on 07/12/2023.
//

import SwiftUI

struct PhotosView: View {
    var collection:CollectionModel?
    @State var photos: [PhotoModel?] = []
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(photos, id: \.self) { photo in
                        VStack(alignment: .leading, spacing: 8) {
                            let imag = photo?.urls?.small
                            RemoteImage(urlString: imag ?? "")
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .cornerRadius(8)
                                .clipped()
                              
                        
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
        }.onAppear(){
            if let url = collection?.user.links.photos {
                
                APIDataManger.shared.searchCollectionOfPhotos(url: url) { data in
                    
                    photos = data ?? []
                    
                    
                }
            }
           
        }
       
    }
}

#Preview {
    PhotosView()
}
