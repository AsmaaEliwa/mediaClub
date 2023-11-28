//
//  mediaClubApp.swift
//  mediaClub
//
//  Created by asmaa gamal  on 28/11/2023.
//

import SwiftUI

@main
struct mediaClubApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ImmagesSwiftUIView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
