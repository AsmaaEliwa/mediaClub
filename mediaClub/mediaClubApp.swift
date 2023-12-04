//
//  mediaClubApp.swift
//  mediaClub
//
//  Created by asmaa gamal  on 28/11/2023.
//

import SwiftUI

@main
struct mediaClubApp: App {
    let persistenceController = DataManger.shared.persistentContainer

    var body: some Scene {
        WindowGroup {
            HomeSwiftUIView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
