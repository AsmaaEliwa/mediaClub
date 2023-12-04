//
//  HomeSwiftUIView.swift
//  mediaClub
//
//  Created by asmaa gamal  on 03/12/2023.
//

import SwiftUI

struct HomeSwiftUIView: View {
    @State var selectedView = 1
    var body: some View {
        TabView(selection: $selectedView) {
            ImmagesSwiftUIView()
                .tabItem {
                    Image(systemName: "photo.artframe")
                    Text("Image")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
            
        }
    }
}
#Preview {
    HomeSwiftUIView()
}
