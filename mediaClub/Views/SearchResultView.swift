//
//  SearchResultView.swift
//  mediaClub
//
//  Created by asmaa gamal  on 04/12/2023.
//

import SwiftUI

struct SearchResultView: View {
    var searchResult: [searchModel]
    
    var body: some View {
        VStack {
            List {
                ForEach(searchResult, id: \.id) { image in
                    
                    AsyncImage(url: URL(string: image.urls.small)) { phase in
                        switch phase {
                        case .empty:
                            // Placeholder or loading view if needed
                            ProgressView()
                        case .success(let image):
                            // Display the loaded image
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100) // Adjust the size as needed
                        case .failure:
                            // Placeholder or error view if loading fails
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100) // Adjust the size as needed
                        @unknown default:
                            // Handle other states if necessary
                            EmptyView()
                        }
                    }
                }
            }
        }
    }
}


//#Preview {
//    SearchResultView()
//}
