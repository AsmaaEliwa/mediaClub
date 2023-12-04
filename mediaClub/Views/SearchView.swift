//
//  SearchView.swift
//  mediaClub
//
//  Created by asmaa gamal  on 03/12/2023.
//

import SwiftUI

struct SearchView: View {
    @State var query:String = ""
    @State var searchResults: SearchResponse?
    @State var isSearching: Bool = false // To control navigation

       var body: some View {
           NavigationView {
               VStack {
                   HStack {
                       input(text: $query, placeHolder: "Search")
                       Button(action: {
                           fetchImages()
                       }) {
                           Image(systemName: "magnifyingglass")
                       }
                   }.padding()

                   // Conditional NavigationLink
                   NavigationLink(destination: SearchResultView(searchResult: searchResults?.results ?? []), isActive: $isSearching) {
                       EmptyView()
                   }
                   .hidden()
               }
           }
       }

       func fetchImages() {
           APIDataManger.shared.searchForImages(query: query) { images in
               if let result = images {
                   self.searchResults = result
                   self.isSearching = true // Activate NavigationLink
               }
           }
       }
   }

struct input:View {
    @Binding var text:String
     var placeHolder:String
    var body: some View {
        TextField(placeHolder, text: $text).textFieldStyle(.roundedBorder).padding()
    }
}
