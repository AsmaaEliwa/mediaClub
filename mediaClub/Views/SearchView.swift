//
//  SearchView.swift
//  mediaClub
//
//  Created by asmaa gamal  on 03/12/2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    input(text: $viewModel.query, placeHolder: "Search")
                    Button(action: {
                        viewModel.fetchImages {}
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }.padding()

                NavigationLink(destination: SearchResultView(searchResult: viewModel.searchResults?.results ?? []), isActive: $viewModel.isSearching) {
                    EmptyView()
                }
                .hidden()
                NavigationLink(
                    destination: CollectionSearchResultView(viewModel: viewModel),
                                 isActive: $viewModel.isCSearching
                             ) {
                                 EmptyView()
                             }
                             .hidden()
                Button{
                    viewModel.fetchImagesfirst(completion: {})
                }label: {
                    Label("Collection",systemImage: "magnifyingglass")
                }
            }
        }
    }
}

struct input: View {
    @Binding var text: String
    var placeHolder: String
    
    var body: some View {
        TextField(placeHolder, text: $text).textFieldStyle(.roundedBorder).padding()
    }
}
