//
//  SearchViewModel.swift
//  mediaClub
//
//  Created by asmaa gamal  on 06/12/2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var searchResults: SearchResponse?
    @Published var CollectionsearchResults: [CollectionModel] = []
    @Published var isSearching: Bool = false
    @Published var isCSearching: Bool = false
    @Published var page = 1
    func fetchImages(completion: @escaping () -> Void) {
        APIDataManger.shared.searchForImages(query: query) { images in
            DispatchQueue.main.async { // Ensure updates happen on the main thread
                if let result = images {
                    self.searchResults = result
                    self.isSearching = true // Activate NavigationLink
                }
                completion()
            }
        }
    }
    
    func fetchImagesfirst(completion: @escaping () -> Void) {
        page = 1
        APIDataManger.shared.searchCollectionOfImages(query: query, page: page) { images in
            DispatchQueue.main.async {
                // Reset CollectionsearchResults when initiating a new search
                if self.page == 1 {
                    self.CollectionsearchResults = []
                }
                
                // Filter out nil elements and append to CollectionsearchResults
                self.CollectionsearchResults.append(contentsOf: images.compactMap { $0 })
                
                self.isCSearching = true // Activate NavigationLink

                completion()
            }
        }
       }
    func fetchCollectionImages(completion: @escaping () -> Void) {
            APIDataManger.shared.searchCollectionOfImages(query: query, page: page) { images in
                DispatchQueue.main.async {
                    // Reset CollectionsearchResults when initiating a new search
                    if self.page == 1 {
                        self.CollectionsearchResults = []
                    }
                    
                    // Filter out nil elements and append to CollectionsearchResults
                    self.CollectionsearchResults.append(contentsOf: images.compactMap { $0 })
                    
                    self.isCSearching = true // Activate NavigationLink

                    completion()
                }
            }
        }
        
    func fetchMoreImages() {
           // Increment the page
           page += 1
           
           // Fetch more images with the updated page
           fetchCollectionImages {
               // Handle completion if needed
           }
       }
    
    
    
    
}
