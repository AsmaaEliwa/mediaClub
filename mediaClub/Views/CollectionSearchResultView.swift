//
//  CollectionSearchResultView.swift
//  mediaClub
//
//  Created by asmaa gamal  on 07/12/2023.
//
import SwiftUI
struct CollectionSearchResultView: View {
    @ObservedObject var viewModel: SearchViewModel 

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(viewModel.CollectionsearchResults, id: \.id) { collection in
                    VStack(alignment: .leading, spacing: 8) {
                         let coverPhoto = collection.cover_photo
                            RemoteImage(urlString: coverPhoto.urls.regular)
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .cornerRadius(8)
                                .clipped()
                        
                        Text(collection.title)
                            .font(.headline)
                        // Other content related to the collection
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
            }
            .padding()
            Button(action: {
                viewModel.fetchMoreImages()
            }) {
                Text("More")
            }
        }
    }
}
